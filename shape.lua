--! file: shape.lua

Shape = Object:extend()
require "randomThings"
function Shape:new(x, y, a, mode, color)
  self.x = x or math.random(100, 500)
  self.y = y or math.random(100, 500)
  self.a = a or 0
  self.mode = mode or "line"
  self.color = color or "white"
end

function Shape:draw()
  love.graphics.translate(self.x, self.y)
  love.graphics.rotate(self.a)
  ink(self.color)
end
