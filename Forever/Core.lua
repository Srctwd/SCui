-- ScUI (WoW Forever) - minimal dark skin for the modern Blizzard UI.
--
-- Forever uses the Mainline (retail) UI: Edit Mode owns frame positions and
-- sizes, so this addon only recolors, crops and hides art. Use Edit Mode to
-- move/scale bars and frames.
--
-- Frame paths were cross-checked against a Forever (16001) build of
-- BetterBlizzFrames. Every lookup is still nil-safe; `/scui debug` lists any
-- path not found in this client so it can be fixed with /fstack.
--
-- Core: shared state, config and helpers. Loaded first; every other file
-- reads what it needs from the addon namespace `ns`.

local _, ns = ...

local ScUI = { missing = {} }
ns.ScUI = ScUI
_G.ScUI = ScUI

------------------------------------------------------------------------------
-- Config
------------------------------------------------------------------------------
ns.C = {
    frameColor   = { 0.21, 0.21, 0.42, 0.9 },  -- unit frame borders
    darkColor    = { 0.21, 0.21, 0.21, 1 },    -- cast bar / minimap borders
    portrait     = { 0.9, 0.9, 0.9, 0.82 },
    iconCrop     = 0.08,
    menuFadeIn   = 1,     -- alpha of micro menu / bags while hovered
    menuFadeOut  = 0,     -- alpha otherwise
}
local C = ns.C

------------------------------------------------------------------------------
-- Safe helpers
------------------------------------------------------------------------------

-- Resolve a dotted path like "PlayerFrame.PlayerFrameContainer.FrameTexture".
-- Accepts several alternatives; returns the first that exists.
function ns.get(...)
    for i = 1, select("#", ...) do
        local path = select(i, ...)
        local obj = _G
        for key in path:gmatch("[^%.]+") do
            obj = type(obj) == "table" and obj[key] or nil
            if obj == nil then break end
        end
        if obj ~= nil then return obj end
    end
    ScUI.missing[(...)] = true
    return nil
end

function ns.color(obj, c)
    if obj and obj.SetVertexColor then obj:SetVertexColor(c[1], c[2], c[3], c[4] or 1) end
end
local color = ns.color

-- Blizzard re-tints some frame borders (e.g. on classification or vehicle
-- changes). Hook SetVertexColor so our tint is restored right after.
function ns.lockColor(tex, c)
    if not (tex and tex.SetVertexColor) then return end
    tex.scuiColor = c
    if not tex.scuiLocked then
        tex.scuiLocked = true
        hooksecurefunc(tex, "SetVertexColor", function(self)
            if self.scuiBusy or not self.scuiColor then return end
            self.scuiBusy = true
            local k = self.scuiColor
            self:SetVertexColor(k[1], k[2], k[3], k[4] or 1)
            self.scuiBusy = false
        end)
    end
    color(tex, c)
end

function ns.alpha(obj, a)
    if obj and obj.SetAlpha then obj:SetAlpha(a) end
end

function ns.hideArt(obj)
    -- Alpha instead of Hide: Blizzard code re-Shows art on updates, and
    -- some of these are children of protected frames.
    ns.alpha(obj, 0)
end

-- Hide and keep hidden: Blizzard code re-Shows some objects on updates.
-- Only for non-protected objects (textures, or frames outside the secure tree).
function ns.forceHide(obj)
    if not (obj and obj.Hide) or obj.scuiHidden then return end
    obj.scuiHidden = true
    obj:Hide()
    hooksecurefunc(obj, "Show", obj.Hide)
    hooksecurefunc(obj, "SetShown", obj.Hide)
end

-- Hidden until hovered (micro menu, bags bar).
function ns.FadeOnHover(container)
    if not container or container.ScUIFade then return end
    container.ScUIFade = true

    local function over()
        if container:IsMouseOver() then return true end
        for _, child in ipairs({ container:GetChildren() }) do
            if child:IsShown() and child:IsMouseOver() then return true end
        end
    end
    local function refresh()
        container:SetAlpha(over() and C.menuFadeIn or C.menuFadeOut)
    end

    container:HookScript("OnEnter", refresh)
    container:HookScript("OnLeave", refresh)
    for _, child in ipairs({ container:GetChildren() }) do
        if child.HookScript then
            child:HookScript("OnEnter", refresh)
            child:HookScript("OnLeave", function() C_Timer.After(0, refresh) end)
        end
    end
    refresh()
end
