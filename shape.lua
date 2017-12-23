--! file: shape.lua

Shape = Object:extend()

function Shape:new(x, y, vx, vy, mode)
  self.x = x or math.random(100, 500)
  self.y = y or math.random(100, 500)
  self.vx = vx or 0
  self.vy = vy or 0
  self.mode = mode or "line"
end

function Shape:update(dt)
  self.x = self.x + self.vx*dt
  self.y = self.y + self.vy*dt
end
