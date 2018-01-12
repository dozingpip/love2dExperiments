--! file: main.lua
local utf8 = require("utf8")

function love.load()
  tick = require "tick"
  Object = require "classic"
  require "origamiModel"
  window_height = love.graphics.getHeight()
  window_width = love.graphics.getWidth()

  local actualX = 0; local actualY = actualX
  local width = 5; local height = 5
  creasePattern = {
    flat = {
      points = {
        center = {
          x = actualX + width/2,
          y = actualY +height/2,
          z = 0
        },
        topLeft = {
          x = actualX,
          y = actualY,
          z = 0
        },
        topRight = {
          x = actualX +width,
          y = actualY,
          z = 0
        },
        bottomLeft = {
          x = actualX,
          y = actualY + height,
          z = 0
        },
        bottomRight = {
          x = actualX + width,
          y = actualY + height,
          z = 0
        },
        centerLeft = {
          x = actualX,
          y = actualY + height/2,
          z = 0
        },
        centerRight = {
          x = actualX + width,
          y = actualY + height/2,
          z = 0
        },
        centerTop = {
          x = actualX + width/2,
          y = actualY,
          z = 0
        },
        centerBottom = {
          x = actualX + width/2,
          y = actualY + height,
          z = 0
        },

        modelSpecific = {
          A = {
            x = actualX + width/5,
            y = actualY + height/2,
            z = 0
          },
          B = {
            x = actualX + width/2,
            y = actualY + width/5,
            z = 0
          },
          C = {
            x = actualX + 4*width/5,
            y = actualY + width/2,
            z = 0
          },
          D = {
            x = actualX + width/2,
            y = actualY + 4*width/5,
            z = 0
          },
          E = {
            x = actualX+width/10,
            y = point1.y,
            z = 0
          },
          F = {
            x = actualX+width/10,
            y = point1.y,
            z = 0
          }
        }
      },
      edges = {
        top = {
          A = points.topLeft,
          B = points.topRight
        },
        left = {
          A = points.topLeft,
          B = points.bottomLeft
        },
        right = {
          A = points.topRight,
          B = points.bottomRight
        },
        bottom = {
          A = points.bottomLeft,
          B = points.bottomRight
        },
        leftDownDiagonal = {
          A = points.topLeft,
          B = points.bottomRight
        },
        leftUpDiagonal = {
          A = points.bottomLeft,
          B = points.topRight
        },
        horizontal = {
          A = points.centerRight,
          B = points.centerLeft
        },
        vertical = {
          A = points.centerTop,
          B = points.centerBottom
        },

        modelSpecific = {
          {
            A = points.topLeft,
            B = points.B
          },
          {
            A = points.topLeft,
            B = points.A
          },
          {
            A = points.topRight,
            B = points.B
          },
        }
      }
    }
  }
end

function love.mousepressed(x, y, mbutton, istouch)

end

function love.update(dt)
  mouse_x, mouse_y = love.mouse.getPosition()

end

function love.draw()
  love.graphics.setBackgroundColor(100, 100, 100)

end

function love.keypressed(key)

    if key== "escape" then
      love.event.quit()
    end

    if key == "rctrl" then --set to whatever key you want to use
      debug.debug()
   end
end
