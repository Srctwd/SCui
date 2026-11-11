-- ScUI - minimal dark skin for the default Blizzard UI.
-- Written defensively for WoW Forever: every Blizzard frame is looked up by
-- name and checked for nil before use, so a frame that is missing or renamed
-- in this client is skipped instead of throwing an error.

local ADDON = ...
local ScUI = {}

------------------------------------------------------------------------------
-- Config
------------------------------------------------------------------------------
local C = {
    frameColor   = { 0.21, 0.21, 0.42, 0.9 },  -- unit frame borders
    darkColor    = { 0.21, 0.21, 0.21, 1 },    -- cast bar / clock borders
    minimapColor = { 0, 0, 0.21 },
    portrait     = { 0.9, 0.9, 0.9, 0.82 },
    xpBarHeight  = 8,
    xpBarWidth   = 1010,
    iconCrop     = 0.08,
    actionBarScale = 0.9,
    castBarScale   = 0.8,
    castBarWidth   = 130,
    partyScale     = 1.2,
    minimapScale   = 0.87,
}

local TEX_PATH  = "Interface\\AddOns\\" .. (ADDON or "ScUI") .. "\\Textures\\"
local TEX_PLAIN = TEX_PATH .. "UI-TargetingFrame-NoMana.blp"
local TEX_ELITE = TEX_PATH .. "UI-TargetingFrame-EliteE.blp"

------------------------------------------------------------------------------
-- Safe helpers
------------------------------------------------------------------------------
local function F(name) return _G[name] end

local function hide(name)
    local f = F(name)
    if f and f.Hide then f:Hide() end
end

local function alpha(name, a)
    local f = F(name)
    if f and f.SetAlpha then f:SetAlpha(a) end
end

local function color(obj, c)
    if type(obj) == "string" then obj = F(obj) end
    if obj and obj.SetVertexColor then obj:SetVertexColor(c[1], c[2], c[3], c[4] or 1) end
end

local function place(obj, ...)
    if type(obj) == "string" then obj = F(obj) end
    if obj and obj.ClearAllPoints then
        obj:ClearAllPoints()
        obj:SetPoint(...)
    end
    return obj
end

local function vertexOffset(tex, x, y)
    if tex and tex.SetVertexOffset then
        for i = 1, 4 do tex:SetVertexOffset(i, x, y) end
    end
end

------------------------------------------------------------------------------
-- Action bars
------------------------------------------------------------------------------
local BAR_PREFIXES = { "ActionButton", "MultiBarBottomLeftButton", "MultiBarBottomRightButton" }

local function SkinActionBars()
    local mmb = F("MainMenuBar")
    if mmb then mmb:SetScale(C.actionBarScale) end

    for _, n in ipairs({ "MainMenuBarLeftEndCap", "MainMenuBarRightEndCap",
                          "MainMenuBarPerformanceBarFrame",
                          "ActionBarUpButton", "ActionBarDownButton" }) do
        hide(n)
    end
    for i = 0, 3 do
        hide("MainMenuBarTexture" .. i)
        hide("MainMenuXPBarTexture" .. i)
    end

    local crop = C.iconCrop
    for _, prefix in ipairs(BAR_PREFIXES) do
        for i = 1, 12 do
            local b = prefix .. i
            hide(b .. "FloatingBG")
            local nt = F(b .. "NormalTexture")
            if nt then nt:SetTexture(nil) end
            local icon = F(b .. "Icon")
            if icon then icon:SetTexCoord(crop, 1 - crop, crop, 1 - crop) end
        end
    end
end

local function SkinXPBar()
    local xp = place("MainMenuExpBar", "BOTTOM", UIParent, "BOTTOM", 0, 44)
    if xp then
        xp:SetWidth(C.xpBarWidth)
        xp:SetHeight(C.xpBarHeight)
    end
    local rest = F("ExhaustionLevelFillBar")
    if rest then rest:SetHeight(C.xpBarHeight) end
    alpha("ExhaustionTick", 0)
end

local MICRO_BUTTONS = {
    "CharacterMicroButton", "SpellbookMicroButton", "TalentMicroButton",
    "QuestLogMicroButton", "SocialsMicroButton", "WorldMapMicroButton",
    "MainMenuMicroButton", "HelpMicroButton", "FriendsMicroButton",
    "KeyRingButton",
}

local BAG_BUTTONS = {
    "MainMenuBarBackpackButton",
    "CharacterBag0Slot", "CharacterBag1Slot", "CharacterBag2Slot", "CharacterBag3Slot",
}

local function HideMenus()
    for _, n in ipairs(MICRO_BUTTONS) do alpha(n, 0) end
    for _, n in ipairs(BAG_BUTTONS) do alpha(n, 0) end
end

------------------------------------------------------------------------------
-- Minimap
------------------------------------------------------------------------------
local function SkinMinimap()
    hide("GameTimeFrame")
    hide("MinimapToggleButton")
    hide("MinimapZoneText")
    alpha("MinimapZoomIn", 0)
    alpha("MinimapZoomOut", 0)
    alpha("MinimapBorderTop", 0)

    local mm, cluster = F("Minimap"), F("MinimapCluster")
    if mm and cluster then
        place(mm, "CENTER", cluster, "CENTER", 32, 32)
        mm:SetScale(C.minimapScale)
    end

    local border = F("MinimapBorder")
    if border and mm then
        border:SetAlpha(0.85)
        color(border, C.minimapColor)
        place(border, "CENTER", mm, "CENTER", -40, -20)
        border:SetTexCoord(0, 1, 0, 1)
    end
end

-- The clock is load-on-demand (Blizzard_TimeManager), so skin it when it shows up.
local function SkinClock()
    local clock = F("TimeManagerClockButton")
    if not clock then return false end
    local region = clock:GetRegions()
    color(region, C.darkColor)
    return true
end

------------------------------------------------------------------------------
-- Cast bars
------------------------------------------------------------------------------
local function SkinCastBar(bar)
    if not bar then return end
    bar:SetScale(C.castBarScale)
    bar:SetWidth(C.castBarWidth)
    if bar.Border then
        bar.Border:SetScale(0.98)
        color(bar.Border, C.darkColor)
    end
    if bar.Icon then bar.Icon:Hide() end
end

------------------------------------------------------------------------------
-- Unit frames
------------------------------------------------------------------------------
local function SkinPlayerFrame()
    local pf = F("PlayerFrame")
    if not pf then return end

    local tex = F("PlayerFrameTexture")
    if tex then
        tex:SetTexture(TEX_PLAIN)
        vertexOffset(tex, 37, -7)
        color(tex, C.frameColor)
    end
    color("PlayerPortrait", C.portrait)

    place("PlayerName", "CENTER", pf, "CENTER", 15, 19)

    local hp = place("PlayerFrameHealthBar", "RIGHT", pf, "RIGHT", -5.6, 18)
    if hp then hp:SetHeight(16) end
    place("PlayerFrameHealthBarText", "CENTER", pf, "CENTER", 80, 17.4)

    place("PlayerFrameManaBar", "RIGHT", pf, "RIGHT", -5.5, 3)
    local mpText = place("PlayerFrameManaBarText", "CENTER", pf, "CENTER", 80, 3.4)
    if mpText then mpText:SetScale(0.9) end

    local bg = F("PlayerFrameBackground")
    if bg then bg:SetHeight(28) end

    local cast = F("CastingBarFrame") or F("PlayerCastingBarFrame")
    SkinCastBar(cast)
    place(cast, "BOTTOMRIGHT", pf, "BOTTOMRIGHT", -12, 30)
end

local function SkinTargetFrameStatic()
    local tf = F("TargetFrame")
    if not tf then return end

    local hp = place("TargetFrameHealthBar", "LEFT", tf, "LEFT", 5.6, 17.5)
    if hp then hp:SetHeight(16) end
    place("TargetFrameManaBar", "LEFT", tf, "LEFT", 5.6, 3.8)

    SkinCastBar(F("TargetFrameSpellBar"))

    color("TargetFrameToTTextureFrameTexture", C.frameColor)
    place("TargetFrameToT", "BOTTOMRIGHT", tf, "BOTTOMRIGHT", -40, -5)

    color("TargetFrameTextureFramePVPIcon", C.frameColor)
    color("TargetFramePortrait", C.portrait)
end

-- Elite / rare-elite / world boss get the dragon border; everything else plain.
local ELITE = { elite = true, rareelite = true, worldboss = true }

local function SkinTargetFrameDynamic()
    local tf  = F("TargetFrame")
    local tex = F("TargetFrameTextureFrameTexture")
    if not (tf and tex) then return end

    if ELITE[UnitClassification("target") or ""] then
        tex:SetTexture(TEX_ELITE)
        vertexOffset(tex, 0, 0)
    else
        tex:SetTexture(TEX_PLAIN)
        vertexOffset(tex, -37, -7)
    end
    color(tex, C.frameColor)

    alpha("TargetFrameNameBackground", 0)
    local bg = F("TargetFrameBackground")
    if bg then
        bg:SetHeight(30)
        place(bg, "CENTER", tf, "CENTER", -50, 13)
    end
end

local function SkinPartyFrames()
    for i = 1, 4 do
        local f = F("PartyMemberFrame" .. i)
        if f then f:SetScale(C.partyScale) end
        color("PartyMemberFrame" .. i .. "Texture", C.frameColor)
    end
end

------------------------------------------------------------------------------
-- Apply (deferred out of combat: most of these frames are protected)
------------------------------------------------------------------------------
local pending = false

function ScUI.Apply()
    if InCombatLockdown() then
        pending = true
        return
    end
    pending = false

    SkinActionBars()
    SkinXPBar()
    HideMenus()
    SkinMinimap()
    SkinClock()
    SkinPlayerFrame()
    SkinTargetFrameStatic()
    SkinTargetFrameDynamic()
    SkinPartyFrames()
end

------------------------------------------------------------------------------
-- Events
------------------------------------------------------------------------------
local ev = CreateFrame("Frame")
ev:RegisterEvent("PLAYER_ENTERING_WORLD")
ev:RegisterEvent("PLAYER_REGEN_ENABLED")
ev:RegisterEvent("PLAYER_TARGET_CHANGED")
ev:RegisterEvent("UNIT_CLASSIFICATION_CHANGED")
ev:RegisterEvent("ADDON_LOADED")

local clockSkinned = false

ev:SetScript("OnEvent", function(_, event, arg1)
    if event == "PLAYER_ENTERING_WORLD" then
        ScUI.Apply()
    elseif event == "PLAYER_REGEN_ENABLED" then
        if pending then ScUI.Apply() end
    elseif event == "PLAYER_TARGET_CHANGED" then
        SkinTargetFrameDynamic()
    elseif event == "UNIT_CLASSIFICATION_CHANGED" then
        if arg1 == "target" then SkinTargetFrameDynamic() end
    elseif event == "ADDON_LOADED" then
        if arg1 == "Blizzard_TimeManager" and not clockSkinned then
            clockSkinned = SkinClock()
        end
    end
end)

-- Blizzard re-sets the target border texture on its own; re-apply ours after it.
if type(TargetFrame_CheckClassification) == "function" then
    hooksecurefunc("TargetFrame_CheckClassification", SkinTargetFrameDynamic)
end

------------------------------------------------------------------------------
-- Slash commands
------------------------------------------------------------------------------
SLASH_SCUICLEAR1 = "/clear"
SlashCmdList["SCUICLEAR"] = function()
    local cf = SELECTED_CHAT_FRAME or DEFAULT_CHAT_FRAME
    if cf and cf.Clear then cf:Clear() end
end

SLASH_SCUI1 = "/scui"
SlashCmdList["SCUI"] = function()
    ScUI.Apply()
    print(pending and "|cff6b6bd6ScUI|r: will re-apply after combat."
                   or "|cff6b6bd6ScUI|r: re-applied.")
end

_G.ScUI = ScUI
