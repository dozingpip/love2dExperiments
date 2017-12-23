--! file: keyframe.lua
Keyframe = Object:extend()

function Keyframe:new(t, x, y, a)
  self.t = t
  self.x = x
  self.y = y
  self.a = a or 0
end

function Keyframe.setT(t_)
  self.t = t_
end

function Keyframe.setX(x_)
  self.x = x_
end

function Keyframe.setY(y_)
  self.y = y_
end

function Keyframe.setA(a_)
  self.a = a_
end

function Keyframe.keyframeOut(filename)
  file = io.open(filename, "w")
  keyInfo = "/n" .. t .. "," .. x .. "," .. "," .. y .. "," .. a
  file:write(keyInfo)
  file:close()
end
