-- Init: apply all skins and re-apply the relevant ones on events.
-- Loaded after every skin file.

local _, ns = ...
local ScUI = ns.ScUI

function ScUI.Apply()
    -- Nothing here moves or resizes protected frames, so it is safe in combat.
    ns.SkinActionBars()
    ns.SkinMicroMenu()
    ns.SkinBags()
    ns.SkinMinimap()
    ns.SkinBuffs()
    ns.SkinChat()
    ns.SkinPlayerFrame()
    ns.SkinPet()
    ns.SkinTargets()
    ns.SkinBoss()
    ns.SkinParty()
end

local ev = CreateFrame("Frame")
ev:RegisterEvent("PLAYER_ENTERING_WORLD")
ev:RegisterEvent("PLAYER_TARGET_CHANGED")
ev:RegisterEvent("PLAYER_FOCUS_CHANGED")
ev:RegisterEvent("GROUP_ROSTER_UPDATE")
ev:RegisterEvent("UNIT_ENTERED_VEHICLE")
ev:RegisterEvent("UNIT_EXITED_VEHICLE")
ev:RegisterEvent("EDIT_MODE_LAYOUTS_UPDATED")
ev:RegisterEvent("UNIT_PET")
ev:RegisterEvent("INSTANCE_ENCOUNTER_ENGAGE_UNIT")
ev:RegisterEvent("ADDON_LOADED")

ev:SetScript("OnEvent", function(_, event, unit)
    if event == "PLAYER_TARGET_CHANGED" or event == "PLAYER_FOCUS_CHANGED" then
        ns.SkinTargets()
    elseif event == "GROUP_ROSTER_UPDATE" then
        ns.SkinParty()
    elseif event == "UNIT_PET" then
        if unit == "player" then ns.SkinPet() else ns.SkinParty() end
    elseif event == "ADDON_LOADED" then
        if unit == "Blizzard_TimeManager" then ns.SkinMinimap() end
    elseif event == "INSTANCE_ENCOUNTER_ENGAGE_UNIT" then
        ns.SkinBoss()
    elseif event == "UNIT_ENTERED_VEHICLE" or event == "UNIT_EXITED_VEHICLE" then
        if unit == "player" then ns.SkinPlayerFrame() end
    else
        ScUI.Apply()
    end
end)
