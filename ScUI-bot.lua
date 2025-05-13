local function Hide()

    exp_bar_hight = 8

    MainMenuBar:SetScale(0.9)
	MainMenuBarLeftEndCap:Hide()
    MainMenuBarRightEndCap:Hide()
    MainMenuBarTexture0:Hide()
    MainMenuBarTexture1:Hide()
    MainMenuBarTexture2:Hide()
    MainMenuBarTexture3:Hide()
    MainMenuXPBarTexture0:Hide()
    MainMenuXPBarTexture1:Hide()
    MainMenuXPBarTexture2:Hide()
    MainMenuXPBarTexture3:Hide()

    MainMenuBarPerformanceBarFrame:Hide()

    MainMenuExpBar:ClearAllPoints()
    MainMenuExpBar:SetPoint("BOTTOM",0,44)
    MainMenuExpBar:SetWidth(1010)
    MainMenuExpBar:SetHeight(exp_bar_hight)
    ExhaustionLevelFillBar:SetHeight(exp_bar_hight)
    ExhaustionTick:SetAlpha(0)


    KeyRingButton:SetAlpha(0)
    MainMenuMicroButton:SetAlpha(0)
    TalentMicroButton:SetAlpha(0)
    HelpMicroButton:SetAlpha(0)
    WorldMapMicroButton:SetAlpha(0)
    SocialsMicroButton:SetAlpha(0)
    QuestLogMicroButton:SetAlpha(0)
    SpellbookMicroButton:SetAlpha(0)
    CharacterMicroButton:SetAlpha(0)
    FriendsMicroButton:SetAlpha(0)




    --Icons

    MultiBarBottomLeftButton1FloatingBG:Hide()
    MultiBarBottomLeftButton2FloatingBG:Hide()
    MultiBarBottomLeftButton3FloatingBG:Hide()
    MultiBarBottomLeftButton4FloatingBG:Hide()
    MultiBarBottomLeftButton5FloatingBG:Hide()
    MultiBarBottomLeftButton6FloatingBG:Hide()
    MultiBarBottomLeftButton7FloatingBG:Hide()
    MultiBarBottomLeftButton8FloatingBG:Hide()
    MultiBarBottomLeftButton9FloatingBG:Hide()
    MultiBarBottomLeftButton10FloatingBG:Hide()
    MultiBarBottomLeftButton11FloatingBG:Hide()
    MultiBarBottomLeftButton12FloatingBG:Hide()

    MultiBarBottomRightButton1FloatingBG:Hide()
    MultiBarBottomRightButton2FloatingBG:Hide()
    MultiBarBottomRightButton3FloatingBG:Hide()
    MultiBarBottomRightButton4FloatingBG:Hide()
    MultiBarBottomRightButton5FloatingBG:Hide()
    MultiBarBottomRightButton6FloatingBG:Hide()
    MultiBarBottomRightButton7FloatingBG:Hide()
    MultiBarBottomRightButton8FloatingBG:Hide()
    MultiBarBottomRightButton9FloatingBG:Hide()
    MultiBarBottomRightButton10FloatingBG:Hide()
    MultiBarBottomRightButton11FloatingBG:Hide()
    MultiBarBottomRightButton12FloatingBG:Hide()



    MultiBarBottomLeftButton1NormalTexture:SetTexture()
    MultiBarBottomLeftButton2NormalTexture:SetTexture()
    MultiBarBottomLeftButton3NormalTexture:SetTexture()
    MultiBarBottomLeftButton4NormalTexture:SetTexture()
    MultiBarBottomLeftButton5NormalTexture:SetTexture()
    MultiBarBottomLeftButton6NormalTexture:SetTexture()
    MultiBarBottomLeftButton7NormalTexture:SetTexture()
    MultiBarBottomLeftButton8NormalTexture:SetTexture()
    MultiBarBottomLeftButton9NormalTexture:SetTexture()
    MultiBarBottomLeftButton10NormalTexture:SetTexture()
    MultiBarBottomLeftButton11NormalTexture:SetTexture()
    MultiBarBottomLeftButton12NormalTexture:SetTexture()

    MultiBarBottomRightButton1NormalTexture:SetTexture()
    MultiBarBottomRightButton2NormalTexture:SetTexture()
    MultiBarBottomRightButton3NormalTexture:SetTexture()
    MultiBarBottomRightButton4NormalTexture:SetTexture()
    MultiBarBottomRightButton5NormalTexture:SetTexture()
    MultiBarBottomRightButton6NormalTexture:SetTexture()
    MultiBarBottomRightButton7NormalTexture:SetTexture()
    MultiBarBottomRightButton8NormalTexture:SetTexture()
    MultiBarBottomRightButton9NormalTexture:SetTexture()
    MultiBarBottomRightButton10NormalTexture:SetTexture()
    MultiBarBottomRightButton11NormalTexture:SetTexture()
    MultiBarBottomRightButton12NormalTexture:SetTexture()

    ActionButton1NormalTexture:SetTexture()
    ActionButton2NormalTexture:SetTexture()
    ActionButton3NormalTexture:SetTexture()
    ActionButton4NormalTexture:SetTexture()
    ActionButton5NormalTexture:SetTexture()
    ActionButton6NormalTexture:SetTexture()
    ActionButton7NormalTexture:SetTexture()
    ActionButton8NormalTexture:SetTexture()
    ActionButton9NormalTexture:SetTexture()
    ActionButton10NormalTexture:SetTexture()
    ActionButton11NormalTexture:SetTexture()
    ActionButton12NormalTexture:SetTexture()

    
    
    MultiBarBottomLeftButton1Icon:SetTexCoord(.08, .92, .08, .92)
    MultiBarBottomLeftButton2Icon:SetTexCoord(.08, .92, .08, .92)
    MultiBarBottomLeftButton3Icon:SetTexCoord(.08, .92, .08, .92)
    MultiBarBottomLeftButton4Icon:SetTexCoord(.08, .92, .08, .92)
    MultiBarBottomLeftButton5Icon:SetTexCoord(.08, .92, .08, .92)
    MultiBarBottomLeftButton6Icon:SetTexCoord(.08, .92, .08, .92)
    MultiBarBottomLeftButton7Icon:SetTexCoord(.08, .92, .08, .92)
    MultiBarBottomLeftButton8Icon:SetTexCoord(.08, .92, .08, .92)
    MultiBarBottomLeftButton9Icon:SetTexCoord(.08, .92, .08, .92)
    MultiBarBottomLeftButton10Icon:SetTexCoord(.08, .92, .08, .92)
    MultiBarBottomLeftButton11Icon:SetTexCoord(.08, .92, .08, .92)
    MultiBarBottomLeftButton12Icon:SetTexCoord(.08, .92, .08, .92)

    MultiBarBottomRightButton1Icon:SetTexCoord(.08, .92, .08, .92)
    MultiBarBottomRightButton2Icon:SetTexCoord(.08, .92, .08, .92)
    MultiBarBottomRightButton3Icon:SetTexCoord(.08, .92, .08, .92)
    MultiBarBottomRightButton4Icon:SetTexCoord(.08, .92, .08, .92)
    MultiBarBottomRightButton5Icon:SetTexCoord(.08, .92, .08, .92)
    MultiBarBottomRightButton6Icon:SetTexCoord(.08, .92, .08, .92)
    MultiBarBottomRightButton7Icon:SetTexCoord(.08, .92, .08, .92)
    MultiBarBottomRightButton8Icon:SetTexCoord(.08, .92, .08, .92)
    MultiBarBottomRightButton9Icon:SetTexCoord(.08, .92, .08, .92)
    MultiBarBottomRightButton10Icon:SetTexCoord(.08, .92, .08, .92)
    MultiBarBottomRightButton11Icon:SetTexCoord(.08, .92, .08, .92)
    MultiBarBottomRightButton12Icon:SetTexCoord(.08, .92, .08, .92)

    ActionButton1Icon:SetTexCoord(.08, .92, .08, .92)
    ActionButton2Icon:SetTexCoord(.08, .92, .08, .92)
    ActionButton3Icon:SetTexCoord(.08, .92, .08, .92)
    ActionButton4Icon:SetTexCoord(.08, .92, .08, .92)
    ActionButton5Icon:SetTexCoord(.08, .92, .08, .92)
    ActionButton6Icon:SetTexCoord(.08, .92, .08, .92)
    ActionButton7Icon:SetTexCoord(.08, .92, .08, .92)
    ActionButton8Icon:SetTexCoord(.08, .92, .08, .92)
    ActionButton9Icon:SetTexCoord(.08, .92, .08, .92)
    ActionButton10Icon:SetTexCoord(.08, .92, .08, .92)
    ActionButton11Icon:SetTexCoord(.08, .92, .08, .92)
    ActionButton12Icon:SetTexCoord(.08, .92, .08, .92)
    

    
    ActionBarUpButton:Hide()
    ActionBarDownButton:Hide()




    GameTimeFrame:Hide()

    --Minimap
    Minimap:ClearAllPoints()
    Minimap:SetPoint("CENTER", MinimapCluster, "CENTER", 32, 32)
    MinimapZoomIn:SetAlpha(0)
    MinimapZoomOut:SetAlpha(0)  
    MinimapBorderTop:SetAlpha(0)
    MinimapToggleButton:Hide()
    MinimapZoneText:Hide()
    Minimap:SetScale(0.87)
    MinimapBorder:SetAlpha(0.85)
    MinimapBorder:SetVertexColor(0, 0, 0.21)
    MinimapBorder:ClearAllPoints()
    MinimapBorder:SetPoint("CENTER", Minimap ,"CENTER", -40, -20)
    MinimapBorder:SetTexCoord(0, 1, 0, 1)

    for _, region in ipairs({TimeManagerClockButton:GetRegions()}) do
        region:SetVertexColor(0.21, 0.21, 0.21, 1)
        break
    end

    --[0]:SetVertexColor(0, 0, 0)
    --Backpack
    MainMenuBarBackpackButton:SetAlpha(0)
    CharacterBag0Slot:SetAlpha(0)
    CharacterBag1Slot:SetAlpha(0)
    CharacterBag2Slot:SetAlpha(0)
    CharacterBag3Slot:SetAlpha(0)

    ChatFrame1:SetScale(1)
    --ChatFrame1:ClearAllPoints()
    --ChatFrame1:SetPoint("BOTTOMLEFT", PlayerFrame, "BOTTOMLEFT", -50, -400)
    
    --CastingBar
    CastingBarFrame:SetScale(0.8)
    CastingBarFrame:SetWidth(130)
    CastingBarFrame.Border:SetScale(0.98)
    CastingBarFrame:ClearAllPoints()
    CastingBarFrame:SetPoint("BOTTOMRIGHT", PlayerFrame, "BOTTOMRIGHT", -12, 30)
    CastingBarFrame.Border:SetVertexColor(0.21, 0.21, 0.21, 1)
    CastingBarFrame.Icon:Hide()
    

    --PlayerFrame
    PlayerFrame:SetScale(1)
    TargetFrame:SetScale(1)
    PlayerFrameTexture:SetTexture("Interface\\AddOns\\ScUI\\Textures\\UI-TargetingFrame-NoMana.blp")
    PlayerFrameTexture:SetVertexOffset(1, 37, -7)
    PlayerFrameTexture:SetVertexOffset(2, 37, -7)
    PlayerFrameTexture:SetVertexOffset(3, 37, -7)
    PlayerFrameTexture:SetVertexOffset(4, 37, -7)
    PlayerFrameTexture:SetVertexColor(0.21, 0.21, 0.42, 0.9)

    PlayerPortrait:SetVertexColor(0.9, 0.9, 0.9, 0.82)



    PlayerName:ClearAllPoints()
    PlayerName:SetPoint("CENTER", PlayerFrame, "CENTER", 15, 19)
    
    PlayerFrameHealthBar:ClearAllPoints()
    PlayerFrameHealthBar:SetPoint("RIGHT", PlayerFrame, "RIGHT", -5.6, 18)
    PlayerFrameHealthBar:SetHeight(16)
    PlayerFrameHealthBarText:ClearAllPoints()
    PlayerFrameHealthBarText:SetPoint("CENTER", PlayerFrame, "CENTER", 80, 17.4)
    
    PlayerFrameManaBar:ClearAllPoints()
    PlayerFrameManaBar:SetPoint("RIGHT", PlayerFrame, "RIGHT", -5.5, 3)
    PlayerFrameManaBarText:SetScale(0.9)
    PlayerFrameManaBarText:ClearAllPoints()
    PlayerFrameManaBarText:SetPoint("CENTER", PlayerFrame, "CENTER", 80, 3.4)

    PlayerFrameBackground:SetHeight(28)

    TargetFrameHealthBar:ClearAllPoints()
    TargetFrameHealthBar:SetPoint("LEFT", TargetFrame, "LEFT", 5.6, 17.5)
    TargetFrameHealthBar:SetHeight(16)

    TargetFrameManaBar:ClearAllPoints()
    TargetFrameManaBar:SetPoint("LEFT", TargetFrame, "LEFT", 5.6, 3.8)
    TargetFrameHealthBar:SetHeight(16)

    TargetFrameSpellBar:ClearAllPoints()

    TargetFrameSpellBar:SetScale(0.8)
    TargetFrameSpellBar:SetWidth(130)
    TargetFrameSpellBar.Border:SetScale(0.98)
    TargetFrameSpellBar.Border:SetVertexColor(0.21, 0.21, 0.21, 1)
    TargetFrameSpellBar.Icon:Hide()


    TargetFrameToTTextureFrameTexture:SetVertexColor(0.21, 0.21, 0.42, 0.9)
    TargetFrameToT:ClearAllPoints()
    TargetFrameToT:SetPoint("BOTTOMRIGHT", TargetFrame, "BOTTOMRIGHT", -40, -5)

    TargetFrameTextureFramePVPIcon:SetVertexColor(0.21, 0.21, 0.42, 0.9)
    TargetFramePortrait:SetVertexColor(0.9, 0.9, 0.9, 0.82)

    --Party Frame
    PartyMemberFrame1:SetScale(1.2)
    PartyMemberFrame2:SetScale(1.2)
    PartyMemberFrame3:SetScale(1.2)
    PartyMemberFrame4:SetScale(1.2)
    PartyMemberFrame1Texture:SetVertexColor(0.21,0.21,0.42)
    PartyMemberFrame2Texture:SetVertexColor(0.21,0.21,0.42)
    PartyMemberFrame3Texture:SetVertexColor(0.21,0.21,0.42)
    PartyMemberFrame4Texture:SetVertexColor(0.21,0.21,0.42)

    
end

local function target_frame()
    if (UnitClassification("target") == "normal") then
        TargetFrameTextureFrameTexture:SetTexture("Interface\\AddOns\\ScUI\\Textures\\UI-TargetingFrame-NoMana.blp")
        TargetFrameTextureFrameTexture:SetVertexOffset(1, -37, -7)
        TargetFrameTextureFrameTexture:SetVertexOffset(2, -37, -7)
        TargetFrameTextureFrameTexture:SetVertexOffset(3, -37, -7)
        TargetFrameTextureFrameTexture:SetVertexOffset(4, -37, -7)

    end
    if (UnitClassification("target") == "elite") then
        TargetFrameTextureFrameTexture:SetTexture("Interface\\AddOns\\ScUI\\Textures\\UI-TargetingFrame-EliteE.blp")    
        TargetFrameTextureFrameTexture:SetVertexOffset(1, 0, 0)
        TargetFrameTextureFrameTexture:SetVertexOffset(2, 0, 0)
        TargetFrameTextureFrameTexture:SetVertexOffset(3, 0, 0)
        TargetFrameTextureFrameTexture:SetVertexOffset(4, 0, 0)
    end

    TargetFrameTextureFrameTexture:SetVertexColor(0.21, 0.21, 0.42, 0.9)
    TargetFrameNameBackground:SetAlpha(0)
    TargetFrameBackground:SetHeight(30)
    TargetFrameBackground:ClearAllPoints()
    TargetFrameBackground:SetPoint("CENTER", TargetFrame, "CENTER", -50, 13)
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:SetScript("OnEvent", Hide)

local frame2 = CreateFrame("Frame")
frame2:RegisterEvent("PLAYER_TARGET_CHANGED")
frame2:SetScript("OnEvent", target_frame)

--local f = CreateFrame("Frame")
--f:RegisterEvent("PLAYER_REGEN_ENABLED")
--f:RegisterEvent("PLAYER_REGEN_DISABLED")
--f:SetScript("OnEvent", function(self, event)
--	print("1")
--end)

SlashCmdList["CLEAR"] = function()
    SELECTED_CHAT_FRAME:Clear()
end

--local function combat_log(self, event)
--	arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15 = CombatLogGetCurrentEventInfo()
--    if arg5 == "Botinha" then
--        print(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15)
--    end
--    --print(arg1, arg2, arg3, arg4, arg5)
--end

local f = CreateFrame("Frame")
f:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
f:RegisterEvent("PLAYER_REGEN_ENABLED")
f:RegisterEvent("PLAYER_REGEN_DISABLED")
f:SetScript("OnEvent", combat_log)


local messages = {} -- Table to store messages

local function logMessage(message)
    table.insert(messages, message) -- Add the message to the table
end

local function printMessages()
    if #messages > 0 then
        print(table.concat(messages, " | ")) -- Concatenate messages with " | " as the separator
        messages = {}
    else
        print("No messages to display.")
    end
end

local f = CreateFrame("Frame")
-- No need for 'global', just declare the variable
message = {"","","","",""}  -- Same for 'message'
combat = "○" --ok
casting = "○" --ok
not_facing = "○" --ok
out_of_range = "○"
target = "○"
kills = "○"
reward_a = "■"
reward_b = "■"

-- Register events
f:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
f:RegisterEvent("PLAYER_REGEN_ENABLED")
f:RegisterEvent("PLAYER_REGEN_DISABLED")
f:RegisterEvent("PLAYER_XP_UPDATE")
f:RegisterEvent("PLAYER_TARGET_CHANGED")
f:RegisterEvent("GLOBAL_MOUSE_DOWN")
f:RegisterEvent("UNIT_SPELLCAST_INTERRUPTED")

-- OnEvent handler
f:SetScript("OnEvent", function(self, event, arg1, arg2, arg3, ...)
    if event == "PLAYER_REGEN_ENABLED" then
        combat = "○"  -- Change combat state to out of combat
        message = combat .. target .. casting .. not_facing .. out_of_range
    elseif event == "PLAYER_REGEN_DISABLED" then
        combat = "■"
        message = combat .. target .. casting .. not_facing .. out_of_range
    elseif event == "PLAYER_TARGET_CHANGED" then
        name = UnitName("target")
        target = "○"
        not_facing = "○"
        out_of_range = "○"
        if name ~= nil then
            target = "■"
            not_facing = "○"
        end
        message = combat .. target .. casting .. not_facing .. out_of_range
    elseif event == "PLAYER_XP_UPDATE" then
        reward_a = "■"
        message = combat .. target .. casting .. not_facing .. out_of_range
    elseif event == "UNIT_SPELLCAST_INTERRUPTED" then
        if arg1 == "player" then
                if arg3 == 116 then
                    casting = "○"
                    out_of_range = "○"
                    not_facing = "■"
                end
            end
    elseif event == "COMBAT_LOG_EVENT_UNFILTERED" then
        -- Process combat log events
        local _, sub_event, _, _, name, _, _, _, _, _, _, spellID, _, _, info = CombatLogGetCurrentEventInfo()

--        -- Only process the event if it's relevant
--        if sub_event == "PARTY_KILL" then
--            print("■")
--        end
        if name == "Botinha" and (sub_event ~= "SPELL_AURA_REMOVED" and sub_event ~= "SPELL_AURA_REFRESH" and sub_event ~= "SPELL_AURA_APPLIED" and sub_event ~= "SPELL_DAMAGE") then
            if info == "Target needs to be in front of you" then
                not_facing = "■"
            end
            if info == "Out of range" then
                out_of_range = "■"
                not_facing = "○"
            end
            if info == "No target" then
                target = "○"
                casting = "○"
                out_of_range = "○"
                not_facing = "○"
            end
            if info == "Interrupted" then
                casting = "○"
            end
            if info == "Not enough mana" then
                casting = "○"
                out_of_range = "○"
            end
            if info == "Invalid target" then
                target = "■"
                out_of_range = "○"
            end
            if info == "Target needs to be in front of you" then
                not_facing = "■"
                out_of_range = "○"
                casting = "○"
            end
            if sub_event == "SPELL_CAST_START" then
                not_facing = "○"
                out_of_range = "○"
                target = "■"
                casting = "■"
            end
            if sub_event == "SPELL_CAST_FAILED" then
                casting = "○"
            end
            if sub_event == "SPELL_CAST_SUCCESS" then
                reward_b = "■"
                casting = "○"
                message = combat .. target .. casting .. not_facing .. out_of_range
            end
            message = combat .. target .. casting .. not_facing .. out_of_range
            if info then
                message = combat .. target .. casting .. not_facing .. out_of_range
            end
        end
        elseif event == "GLOBAL_MOUSE_DOWN" then
            message = combat .. target .. casting .. not_facing .. out_of_range
            logMessage(message .. reward_a .. reward_b)
            reward_a = "○"
            reward_b = "○"
            printMessages()
    end
end)
--○◙
-- Example of printing stored messages (you can call this as needed)


--Vespasianus
--Lucylight
--Scantron
--Terrysuffers
--terranigma
--hardcorehank
--mcsneakyolo
--lunabolt