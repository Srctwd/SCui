-- Unit frames: player, pet, target/focus (+ToT), boss and party.

local _, ns = ...
local ScUI, C = ns.ScUI, ns.C
local get, color, lockColor, hideArt = ns.get, ns.color, ns.lockColor, ns.hideArt

------------------------------------------------------------------------------
-- Small units (pet, party, ToT, arena)
------------------------------------------------------------------------------

-- Key and global-name fallbacks match ClassicPortrait Forever 0.2.12, which
-- probes both the modern (Mainline) and legacy (Classic) templates.
local function portraitOf(frame)
    if not frame then return end
    local name = frame.GetName and frame:GetName()
    local p = frame.Portrait or frame.portrait or (name and _G[name .. "Portrait"])
    if not p and frame == _G.PetFrame then p = _G.PetPortrait end
    return p
end

local function borderOf(frame)
    if not frame then return end
    local name = frame.GetName and frame:GetName()
    return frame.FrameTexture or frame.Texture
        or (name and _G[name .. "Texture"])
        or (name and _G[name .. "TextureFrameTexture"])
        or (frame.PartyMemberOverlay and frame.PartyMemberOverlay.Texture)
end

local function SkinSmallUnit(frame)
    if not frame then return end
    lockColor(borderOf(frame), C.frameColor)
    color(portraitOf(frame), C.portrait)
end

------------------------------------------------------------------------------
-- Player / pet
------------------------------------------------------------------------------

-- Blizzard places the player level 1px too far right. Nudge every anchor it
-- sets, from Blizzard's own offsets each time, so it never drifts.
local LEVEL_NUDGE_X = -1

local function NudgePoint(fs, point)
    for i = 1, fs:GetNumPoints() do
        local p, rel, rp, x, y = fs:GetPoint(i)
        if not point or p == point then
            fs.scuiBusy = true
            fs:SetPoint(p, rel, rp, (x or 0) + LEVEL_NUDGE_X, y or 0)
            fs.scuiBusy = false
        end
    end
end

local function NudgePlayerLevel()
    local fs = get("PlayerLevelText",
        "PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.LevelText")
    if not fs or fs.scuiNudged then return end
    fs.scuiNudged = true
    NudgePoint(fs)
    hooksecurefunc(fs, "SetPoint", function(self, point)
        if not self.scuiBusy then NudgePoint(self, point) end
    end)
end

function ns.SkinPlayerFrame()
    NudgePlayerLevel()
    lockColor(get("PlayerFrame.PlayerFrameContainer.FrameTexture"), C.frameColor)
    lockColor(get("PlayerFrame.PlayerFrameContainer.AlternatePowerFrameTexture"), C.frameColor)
    lockColor(get("PlayerFrame.PlayerFrameContainer.VehicleFrameTexture"), C.frameColor)
    color(get("PlayerFrame.PlayerFrameContainer.PlayerPortrait", "PlayerPortrait"), C.portrait)
    ns.SkinCastBar(get("PlayerCastingBarFrame", "CastingBarFrame"))
end

function ns.SkinPet()
    SkinSmallUnit(get("PetFrame"))
end

------------------------------------------------------------------------------
-- Target / focus / boss
------------------------------------------------------------------------------

-- Target, focus and boss frames share the same template.
local function SkinTargetStyleFrame(name)
    local f = _G[name]
    if not f then return end
    local container = f.TargetFrameContainer
    if container then
        lockColor(container.FrameTexture, C.frameColor)
        lockColor(container.BossPortraitFrameTexture, C.frameColor)
        color(container.Portrait or _G[name .. "Portrait"], C.portrait)
    else
        ScUI.missing[name .. ".TargetFrameContainer"] = true
    end
    local main = f.TargetFrameContent and f.TargetFrameContent.TargetFrameContentMain
    if main then hideArt(main.ReputationColor) end   -- name background strip
    ns.SkinCastBar(f.spellbar or _G[name .. "SpellBar"])
end

function ns.SkinTargets()
    SkinTargetStyleFrame("TargetFrame")
    SkinTargetStyleFrame("FocusFrame")
    SkinSmallUnit(get("TargetFrameToT", "TargetFrame.totFrame"))
    SkinSmallUnit(get("FocusFrameToT", "FocusFrame.totFrame"))
end

-- Boss frames reuse the target template; they only exist during encounters,
-- so they are skipped silently instead of being reported as missing.
function ns.SkinBoss()
    for i = 1, 5 do
        if _G["Boss" .. i .. "TargetFrame"] then
            SkinTargetStyleFrame("Boss" .. i .. "TargetFrame")
        end
    end
end

------------------------------------------------------------------------------
-- Party
------------------------------------------------------------------------------
local function SkinPartyMember(m)
    if not m then return end
    SkinSmallUnit(m)
    SkinSmallUnit(m.PetFrame)
end

function ns.SkinParty()
    local party = _G.PartyFrame
    for i = 1, 4 do
        SkinPartyMember(party and party["MemberFrame" .. i])
        SkinPartyMember(_G["PartyMemberFrame" .. i])          -- legacy template
    end
    -- Forever may create party members without the MemberFrameN keys.
    if party and party.GetChildren then
        for _, child in ipairs({ party:GetChildren() }) do
            local unit = child.unit
            if type(unit) == "string" and not (issecretvalue and issecretvalue(unit))
                and unit:match("^party%d+$") then
                SkinPartyMember(child)
            end
        end
    end
end

------------------------------------------------------------------------------
-- Hooks
------------------------------------------------------------------------------

-- Blizzard swaps the target border atlas (elite/rare/boss) after our event
-- handler runs; recolor after it.
for _, name in ipairs({ "TargetFrame", "FocusFrame", "Boss1TargetFrame", "Boss2TargetFrame",
                        "Boss3TargetFrame", "Boss4TargetFrame", "Boss5TargetFrame" }) do
    local f = _G[name]
    if f and type(f.CheckClassification) == "function" then
        hooksecurefunc(f, "CheckClassification", function() SkinTargetStyleFrame(name) end)
    end
end
if type(PlayerFrame_ToPlayerArt) == "function" then
    hooksecurefunc("PlayerFrame_ToPlayerArt", ns.SkinPlayerFrame)
end
