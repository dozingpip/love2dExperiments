--! file: rectangle.lua

AnimRectangle = AnimShape:extend()

require "keyframe"
defaultt = {Keyframe(1, 100, 100, 0)}
function AnimRectangle:new(width, height, mode, keys)
  AnimRectangle.super.new(self, mode, keys)
  self.width = w or math.random(20, 100)
  self.height = h or math.random(20, 200)
end

function AnimRectangle:draw()
  love.graphics.push()
  AnimRectangle.super.draw(self)
  love.graphics.rectangle(self.mode, 0, 0, self.width, self.height)
  love.graphics.pop()
end
