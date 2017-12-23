--! file: rectangle.lua

Rectangle = Shape:extend()

function Rectangle:new(x, y, w, h, mode, color, rx, ry)
  Rectangle.super.new(self, x, y, nil, mode, color)
  self.width = w or math.random(20, 100)
  self.height = h or math.random(20, 100)
  self.rx = rx or 0
  self.ry = ry or self.rx
end

function Rectangle:draw()
  love.graphics.rectangle(self.mode, 0, 0, self.width, self.height, self.rx, self.ry)
end
