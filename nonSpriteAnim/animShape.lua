--! file: animShape.lua

AnimShape = Shape:extend()
require "keyframe"
defaultt = {Keyframe(1, 100, 100, 0)}
function AnimShape:new(mode, keys, color)
  self.keys = keys or defaultt
  AnimShape.super.new(self, self.keys[1].x, self.keys[1].y, self.keys[1].a, mode, color)
  self.t = self.keys[1].t
  self.reachedLastFrame = false
end

function AnimShape:animate(dt)
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
