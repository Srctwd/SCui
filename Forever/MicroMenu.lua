-- Micro menu: hidden, fades in on hover.

local _, ns = ...

function ns.SkinMicroMenu()
    ns.FadeOnHover(ns.get("MicroMenuContainer", "MicroMenu"))
end
