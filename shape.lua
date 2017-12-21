--! file: shape.lua

Shape = Object:extend()

function Shape:new(x, y, vx, vy, mode)
  self.x = x
  self.y = y
  self.vx = vx
  self.vy = vy
  self.drawMode = mode
end

function Shape:new()
  self.x = math.random(100, 500)
  self.y = math.random(100, 500)
  self.vx = math.random(10, 200)
  self.vy = 0
  self.drawMode = "line"
end

function Shape:update(dt)
  self.x = self.x + self.vx*dt
  self.y = self.y + self.vy*dt
end
