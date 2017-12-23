--! file: rectangle.lua

AnimRectangle = Shape:extend()

require "keyframe"
defaultt = {Keyframe(1, 100, 100, 0)}
function AnimRectangle:new(mode, keys)
  self.keys = keys or defaultt
  AnimRectangle.super.new(self, self.keys[1].x, self.keys[1].y, 0, 0, mode)
  self.width = w or math.random(20, 100)
  self.height = h or math.random(20, 200)
  self.t = self.keys[1].t
  self.a = self.keys[1].a or 0
  self.reachedLastFrame = false
end

function AnimRectangle:draw()
  love.graphics.push()
  love.graphics.translate(self.x, self.y)
  love.graphics.rotate(self.a)
  love.graphics.rectangle(self.mode, 0, 0, self.width, self.height)
  love.graphics.pop()
end

function AnimRectangle:animate(dt)
  print(#self.keys)
  if(self.keys ~= nil) then
    self.t = self.t+dt
    local segIndex = 0
    for i = 1,#self.keys do
      if self.t < self.keys[i].t then
        segIndex = i
        break
      end
    end

    if segIndex > 1 then
      local s = (self.t - self.keys[segIndex-1].t) / (self.keys[segIndex].t - self.keys[segIndex-1].t)
      self.x = self.keys[segIndex-1].x + s*(self.keys[segIndex].x - self.keys[segIndex-1].x)
      self.y = self.keys[segIndex-1].y + s*(self.keys[segIndex].y - self.keys[segIndex-1].y)
      self.a = self.keys[segIndex-1].a + s*(self.keys[segIndex].a - self.keys[segIndex-1].a)
    elseif segIndex == 0 then
      self.x = self.keys[#self.keys].x
      self.y = self.keys[#self.keys].y
      self.a = self.keys[#self.keys].a
      --reachedLastFrame = true
      self.t=self.keys[1].t
    end
  end
end
