-- Action bars: square, cropped icons; button and bar art hidden.

local _, ns = ...
local C, get, hideArt = ns.C, ns.get, ns.hideArt

local BAR_PREFIXES = {
    "ActionButton", "MultiBarBottomLeftButton", "MultiBarBottomRightButton",
    "MultiBarRightButton", "MultiBarLeftButton",
    "MultiBar5Button", "MultiBar6Button", "MultiBar7Button",
    "PetActionButton", "StanceButton",
}

local WHITE = { 1, 1, 1, 1 }

-- Crop an overlay atlas by the icon-crop fraction, inside its own atlas
-- coords rather than the whole sheet.
local function CropOverlay(tex)
    local k = C.iconCrop
    local l, t, _, bot, r = tex:GetTexCoord()
    local w, h = r - l, bot - t
    tex:SetTexCoord(l + w * k, r - w * k, t + h * k, bot - h * k)
end

local function SkinButton(b)
    if not b or b.ScUISkinned then return end
    local icon = b.icon or b.Icon
    if icon then
        if b.IconMask and icon.RemoveMaskTexture then
            icon:RemoveMaskTexture(b.IconMask)   -- square icons instead of rounded
        end
        local k = C.iconCrop
        icon:SetTexCoord(k, 1 - k, k, 1 - k)

        -- Crop the overlay textures by the same fraction.
        local overlays = {
            b.GetHighlightTexture and b:GetHighlightTexture(),
            b.GetCheckedTexture and b:GetCheckedTexture(),
            b.Flash, b.Border, b.SpellHighlightTexture, b.NewActionTexture,
        }
        for i = 1, 6 do
            local tex = overlays[i]
            if tex and tex.GetTexCoord then
                CropOverlay(tex)
                -- Blizzard may re-set these atlases later, which drops our crop.
                hooksecurefunc(tex, "SetAtlas", CropOverlay)
                -- White instead of the stock yellow: the yellow is baked into
                -- the art, so desaturate it, and lock the tint to white so
                -- Blizzard's re-tints (e.g. green equipped border) don't apply.
                tex:SetDesaturated(true)
                ns.lockColor(tex, WHITE)
            end
        end

        -- Pushed art: white tint only. Cropping it never lined up with the
        -- icon the way the other overlays do, so it keeps its stock shape.
        local pushed = b.GetPushedTexture and b:GetPushedTexture()
        if pushed then
            pushed:SetDesaturated(true)
            ns.lockColor(pushed, WHITE)
        end
    end
    hideArt(b.NormalTexture or (b.GetNormalTexture and b:GetNormalTexture()))
    hideArt(b.SlotArt)
    hideArt(b.SlotBackground)
    hideArt(b.FloatingBG)
    b.ScUISkinned = true
end

function ns.SkinActionBars()
    local bar = get("MainActionBar", "MainMenuBar")   -- renamed in 12.x
    if bar then
        hideArt(bar.BorderArt)
        if bar.EndCaps then
            hideArt(bar.EndCaps.LeftEndCap)
            hideArt(bar.EndCaps.RightEndCap)
        end
        hideArt(bar.ActionBarPageNumber)

        -- The top border line is a TopEdge texture on an unnamed child frame
        -- (/fstack shows it as MainActionBar.<address>, which changes every
        -- session), so search the bar's child frames for it.
        local pieces = { "TopEdge", "BottomEdge", "Center" }
        local frames = { bar, bar:GetChildren() }
        for _, f in ipairs(frames) do
            for _, key in ipairs(pieces) do
                ns.forceHide(f[key])
            end
        end
    end
    for _, prefix in ipairs(BAR_PREFIXES) do
        for i = 1, 12 do
            SkinButton(_G[prefix .. i])
        end
    end
end
