local function Hide()

    exp_bar_hight = 8

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

    --CastingBar
    CastingBarFrame:SetScale(1)
    CastingBarFrame:SetWidth(130)
    CastingBarFrame.Border:SetScale(0.98)
    CastingBarFrame:ClearAllPoints()
    CastingBarFrame:SetPoint("BOTTOMRIGHT", PlayerFrame, "BOTTOMRIGHT", -11, 30)
    CastingBarFrame.Border:SetVertexColor(0.21, 0.21, 0.21, 1)
    CastingBarFrame.Icon:Hide()
    

    --PlayerFrame
    PlayerFrame:SetScale(1.2)
    TargetFrame:SetScale(1.2)
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
    TargetFrameHealthBar:SetPoint("LEFT", TargetFrame, "LEFT", 5.6, 18.4)
    TargetFrameHealthBar:SetHeight(16)

    TargetFrameManaBar:ClearAllPoints()
    TargetFrameManaBar:SetPoint("LEFT", TargetFrame, "LEFT", 5.6, 5)

    TargetFrameSpellBar:ClearAllPoints()
    TargetFrameSpellBar:SetPoint("BOTTOMRIGHT", TargetFrame, "BOTTOMRIGHT", -11, 30)
    TargetFrameSpellBar:SetHeight(16)

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
    TargetFrameTextureFrameTexture:SetTexture("Interface\\AddOns\\ScUI\\Textures\\UI-TargetingFrame-NoMana.blp")
    TargetFrameTextureFrameTexture:SetVertexOffset(1, -37, -7)
    TargetFrameTextureFrameTexture:SetVertexOffset(2, -37, -7)
    TargetFrameTextureFrameTexture:SetVertexOffset(3, -37, -7)
    TargetFrameTextureFrameTexture:SetVertexOffset(4, -37, -7)
    TargetFrameTextureFrameTexture:SetVertexColor(0.21, 0.21, 0.42, 0.9)
    TargetFrameNameBackground:SetAlpha(0)
    TargetFrameBackground:SetHeight(28)
    TargetFrameBackground:ClearAllPoints()
    TargetFrameBackground:SetPoint("CENTER", TargetFrame, "CENTER", -50, 13)
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:SetScript("OnEvent", Hide)

local frame2 = CreateFrame("Frame")
frame2:RegisterEvent("PLAYER_TARGET_CHANGED")
frame2:SetScript("OnEvent", target_frame)



--Vespasianus
--Lucylight
--Scantron
--Terrysuffers
--terranigma
--hardcorehank
--mcsneakyolo