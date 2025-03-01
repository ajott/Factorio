local centrifugeNames = {"tiberium-centrifuge-1", "tiberium-centrifuge-2", "tiberium-centrifuge-3"}

for _, c in next, centrifugeNames do
    local centrifuge = data.raw.item[c]
    
    centrifuge.icons = nil
    centrifuge.icon = "__althalin-tib-centrifuge__/graphics/icons/" .. c .. ".png"
end