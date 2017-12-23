--! file: rectangle.lua

Rectangle = Object:extend()
require "randomThings"

function Rectangle:new(x, y, w, h, mode, color, rx, ry)
  self.x = x or math.random(100, 500)
  self.y = y or math.random(100, 500)
  self.width = w or math.random(20, 100)
  self.height = h or math.random(20, 100)
  self.mode = mode or "fill"
  self.color = color or "white"
  self.rx = rx or 0
  self.ry = ry or self.rx
end

function Rectangle:draw()
  love.graphics.translate(self.x, self.y)
  ink(self.color)
  love.graphics.rectangle(self.mode, 0, 0, self.width, self.height, rx, ry)
end
