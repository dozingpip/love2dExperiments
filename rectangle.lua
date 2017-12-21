--! file: rectangle.lua

Rectangle = Shape:extend()

function Rectangle:new(x, y, w, h, vx, vy, mode)
  Rectangle.super.new(self, x, y, vx, vy, mode)
  self.width = w
  self.height = h
end

function Rectangle:new()
  Rectangle.super.new(self)
  self.width = math.random(20, 100)
  self.height = math.random(20, 100)
end

function Rectangle:draw()
  love.graphics.push()
  love.graphics.translate(self.x, self.y)
  love.graphics.rectangle(self.drawMode, 0, 0, self.width, self.height)
  love.graphics.pop()
end
