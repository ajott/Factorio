require("__base__.prototypes.entity.pipecovers")


local pipepictures = {
  north =
  {
    filename = "__base__/graphics/entity/pipe-to-ground/pipe-to-ground-up.png",
    priority = "extra-high",
    width = 128,
    height = 128,
    shift = {0, 0.75},
    --shift = util.by_pixel(2.25, 13.5),
    scale = 0.5
  },
  east =
  {
    filename = "__base__/graphics/entity/pipe-to-ground/pipe-to-ground-right.png",
    priority = "extra-high",
    width = 128,
    height = 128,
    shift = { -0.75, 0 },
    --shift = util.by_pixel(-24.5, 1),
    scale = 0.5
  },
  south =
  {
    filename = "__base__/graphics/entity/pipe-to-ground/pipe-to-ground-down.png",
    priority = "extra-high",
    width = 128,
    height = 128,
    shift = { 0, -0.75 },
    --shift = util.by_pixel(0, -31.25),
    scale = 0.5
  },
  west =
  {
    filename = "__base__/graphics/entity/pipe-to-ground/pipe-to-ground-left.png",
    priority = "extra-high",
    width = 128,
    height = 128,
    shift = { 0.75, 0 },
    --shift = util.by_pixel(25.75, 1.25),
    scale = 0.5
  }
}




centrifugePipeCovers = function()
  return
  {
    north =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/pipe-covers/pipe-cover-north.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/pipe-covers/pipe-cover-north-shadow.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          scale = 0.5,
          draw_as_shadow = true
        }
      }
    },
    east =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/pipe-covers/pipe-cover-east.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          scale = 0.5,
          shift = util.by_pixel(7, 0)
        },
        {
          filename = "__base__/graphics/entity/pipe-covers/pipe-cover-east-shadow.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          scale = 0.5,
          shift = util.by_pixel(7, 0),
          draw_as_shadow = true
        }
      }
    },
    south =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/pipe-covers/pipe-cover-south.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          scale = 0.5,
          shift = util.by_pixel(0, 7),
        },
        {
          filename = "__base__/graphics/entity/pipe-covers/pipe-cover-south-shadow.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          scale = 0.5,
          shift = util.by_pixel(0, 7),
          draw_as_shadow = true
        }
      }
    },
    west =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/pipe-covers/pipe-cover-west.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          scale = 0.5,
          shift = util.by_pixel(-7, 0)
        },
        {
          filename = "__base__/graphics/entity/pipe-covers/pipe-cover-west-shadow.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          scale = 0.5,
          shift = util.by_pixel(-7, 0),
          draw_as_shadow = true
        }
      }
    }
  }
end



local spriteShift = { 0.72, -0.80 }
local centrifugeNames = { "tiberium-centrifuge-1", "tiberium-centrifuge-2", "tiberium-centrifuge-3" }

for _, c in next, centrifugeNames do
  local centrifuge = data.raw["assembling-machine"][c]
  centrifuge.collision_box = { { -1.2, -1.2 }, { 1.2, 1.2 } }
  centrifuge.selection_box = { { -1.5, -1.5 }, { 1.5, 1.5 } }

  centrifuge.fluid_boxes = { {
    production_type = "output",
    pipe_picture = pipepictures,
    --pipe_picture = centrifugePipePictures(),
    pipe_covers = centrifugePipeCovers(),
    base_area = 10,
    base_level = 1,
    volume = 100,
    pipe_connections = { {
      flow_direction = "output",
      direction = defines.direction.north,
      position = { 1, -.8 }     -- Top Right
    } },
    --render_layer = "higher-object-above",
    secondary_draw_orders = { north = -1, east = -1, west = -1 },
    fluid_boxes_off_when_no_fluid_recipe = false
  }, {
    production_type = "output",
    pipe_picture = pipepictures,
    --pipe_picture = centrifugePipePictures(),
    pipe_covers = centrifugePipeCovers(),
    base_area = 10,
    base_level = 1,
    volume = 100,
    pipe_connections = { {
      flow_direction = "output",
      direction = defines.direction.north,
      position = { -1, -.8 }     -- Top Left
    } },
    --render_layer = "higher-object-above",
    secondary_draw_orders = { north = -1, east = -1, west = -1 },
    fluid_boxes_off_when_no_fluid_recipe = false
  }, {
    production_type = "output",
    pipe_picture = pipepictures,
    --pipe_picture = centrifugePipePictures(),
    pipe_covers = centrifugePipeCovers(),
    base_area = 10,
    base_level = 1,
    volume = 100,
    pipe_connections = { {
      flow_direction = "output",
      direction = defines.direction.south,
      position = { -1, .8 }     -- Bottom Left
    } },
    --render_layer = "higher-object-above",
    secondary_draw_orders = { north = -1, east = -1, west = -1 },
    fluid_boxes_off_when_no_fluid_recipe = false
  }, {
    production_type = "input",
    pipe_picture = pipepictures,
    --pipe_picture = centrifugePipePictures(),
    pipe_covers = centrifugePipeCovers(),
    base_area = 10,
    base_level = -1,
    volume = 200,
    pipe_connections = { {
      flow_direction = "input",
      direction = defines.direction.south,
      position = { 1, .8 }     -- Bottom Right
    } },
    --render_layer = "higher-object-above",
    secondary_draw_orders = { north = -1, east = -1, west = -1 },
    fluid_boxes_off_when_no_fluid_recipe = false
  } }

  centrifuge.graphics_set = {
    animation = {
      layers = { {
        filename = "__althalin-tib-centrifuge__/graphics/entity/tiberium-centrifuge-idle.png",
        priority = "high",
        width = 250,
        height = 250,
        scale = 0.6,
        frame_count = 1,
        shift = spriteShift

      }, {
        filename = "__althalin-tib-centrifuge__/graphics/entity/" .. c .. "-base.png",
        priority = "high",
        width = 250,
        height = 250,
        scale = 0.6,
        frame_count = 1,
        shift = spriteShift

      }, {
        filename = "__althalin-tib-centrifuge__/graphics/entity/tiberium-centrifuge-shadow.png",
        priority = "high",
        width = 250,
        height = 250,
        scale = 0.6,
        frame_count = 1,
        shift = spriteShift,
        draw_as_shadow = true
      } }
    },
    working_visualisations = { {
      animation = {
        layers = { {
          filename = "__althalin-tib-centrifuge__/graphics/entity/tiberium-centrifuge-anim.png",
          priority = "high",
          frame_count = 64,
          line_length = 8,
          width = 250,
          height = 250,
          scale = 0.6,
          shift = spriteShift,
          draw_as_glow = true
        }, {
          filename = "__althalin-tib-centrifuge__/graphics/entity/tiberium-centrifuge-stack-lights.png",
          priority = "high",
          frame_count = 64,
          line_length = 8,
          width = 250,
          height = 250,
          scale = 0.6,
          shift = spriteShift,
          draw_as_glow = true
        }, {
          filename = "__althalin-tib-centrifuge__/graphics/entity/tiberium-centrifuge-fan.png",
          priority = "high",
          frame_count = 64,
          line_length = 8,
          width = 250,
          height = 250,
          scale = 0.6,
          shift = spriteShift,
          draw_as_glow = true
        } }
      }
    }, {
      animation = {
        layers = { {
          filename = "__althalin-tib-centrifuge__/graphics/entity/" .. c .. "-stack.png",
          priority = "high",
          frame_count = 64,
          line_length = 8,
          width = 250,
          height = 250,
          scale = 0.6,
          shift = spriteShift

        } }
      }
    } }
  }
end
