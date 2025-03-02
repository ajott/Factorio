local moltenCategory = ""
local circuitCategory = ""

if mods["space-age"] then
    moltenCategory = "chemistry-or-cryogenics"
    circuitCategory = "electronics-with-fluid"
else
    moltenCategory = "chemistry"
    circuitCategory = "crafting-with-fluid"
end


data:extend{{
    type = "fluid",
    name = "molten-plastic",
    subgroup = "fluid",
    default_temperature = 60,
    base_color = {0.8, 0.8, 0.8},
    flow_color = {1.0, 1.0, 1.0},
    icon = "__injection-molding__/graphics/icons/fluid/molten-plastic.png",
    order = "a[fluid]-b[plastic]-c[molten-plastic]"
}, {
    type = "recipe",
    name = "molten-plastic",
    category = moltenCategory,
    always_show_made_in = true,
    energy_required = 1,
    enabled = false,
    icons = {{
        icon = "__injection-molding__/graphics/icons/recipe/molten-plastic.png",
        icon_size = 32
    }},
    ingredients = {{
        type = "fluid",
        name = "petroleum-gas",
        amount = 20
    }, {
        type = "item",
        name = "coal",
        amount = 1
    }},
    results = {{
        type = "fluid",
        name = "molten-plastic",
        amount = 20
    }},
    allow_productivity = true,
    crafting_machine_tint = {
        primary = {
            r = 1.000,
            g = 1.000,
            b = 1.000,
            a = 1.000
        }, -- #fefeffff
        secondary = {
            r = 0.771,
            g = 0.771,
            b = 0.771,
            a = 1.000
        }, -- #c4c4c4ff
        tertiary = {
            r = 0.768,
            g = 0.665,
            b = 0.762,
            a = 1.000
        }, -- #c3a9c2ff
        quaternary = {
            r = 0.000,
            g = 0.000,
            b = 0.000,
            a = 1.000
        } -- #000000ff
    }
}, {
    type = "recipe",
    name = "plastic-bar-from-molten",
    category = "crafting-with-fluid",
    energy_required = 1,
    enabled = false,
    icons = {{
        icon = "__injection-molding__/graphics/icons/recipe/plastic-from-molten.png",
        icon_size = 32
    }},
    ingredients = {{
        type = "fluid",
        name = "molten-plastic",
        amount = 20
    }},
    results = {{
        type = "item",
        name = "plastic-bar",
        amount = 2
    }},
    allow_productivity = false,
    crafting_machine_tint = {
        primary = {
            r = 1.000,
            g = 1.000,
            b = 1.000,
            a = 1.000
        }, -- #fefeffff
        secondary = {
            r = 0.771,
            g = 0.771,
            b = 0.771,
            a = 1.000
        }, -- #c4c4c4ff
        tertiary = {
            r = 0.768,
            g = 0.665,
            b = 0.762,
            a = 1.000
        }, -- #c3a9c2ff
        quaternary = {
            r = 0.000,
            g = 0.000,
            b = 0.000,
            a = 1.000
        } -- #000000ff
    },
    order = "b-[circuits]"
}, {
    type = "recipe",
    name = "advanced-circuit-molten-plastic",
    category = circuitCategory,
    enabled = false,
    energy_required = 6,
    icons = {{
        icon = "__injection-molding__/graphics/icons/recipe/advanced-circuit.png",
        icon_size = 32
    }},
    ingredients = {{
        type = "item",
        name = "electronic-circuit",
        amount = 2
    }, {
        type = "fluid",
        name = "molten-plastic",
        amount = 20
    }, {
        type = "item",
        name = "copper-cable",
        amount = 4
    }},
    results = {{
        type = "item",
        name = "advanced-circuit",
        amount = 1
    }},
    allow_productivity = true
}, {
    type = "recipe",
    name = "low-density-structure-molten-plastic",
    category = "crafting-with-fluid",
    energy_required = 15,
    icon = "__injection-molding__/graphics/icons/recipe/low-density-structure.png",
    icon_size = 32,
    enabled = false,
    ingredients = {{
        type = "item",
        name = "steel-plate",
        amount = 2
    }, {
        type = "item",
        name = "copper-plate",
        amount = 20
    }, {
        type = "fluid",
        name = "molten-plastic",
        amount = 50
    }},
    results = {{
        type = "item",
        name = "low-density-structure",
        amount = 1
    }},
    allow_productivity = true
}}

table.insert(data.raw.technology["plastics"].effects, {
    type = "unlock-recipe",
    recipe = "molten-plastic"
})
table.insert(data.raw.technology["plastics"].effects, {
    type = "unlock-recipe",
    recipe = "plastic-bar-from-molten"
})
table.insert(data.raw.technology["advanced-circuit"].effects, {
    type = "unlock-recipe",
    recipe = "advanced-circuit-molten-plastic"
})
table.insert(data.raw.technology["low-density-structure"].effects, {
    type = "unlock-recipe",
    recipe = "low-density-structure-molten-plastic"
})

