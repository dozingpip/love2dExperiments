--! file: player.lua

Player = Object:extend()
function Player:new(x, y, body, vx)
  self.x = x
  self.y = y
  self.body = body
  self.vx = vx
  self.vy = 0
  self.grounded = true
end

function Player:move(direction)
  body:walk()
  if string.find(direction,'left') then
    self.vx = -math.abs(self.vx)
  elseif string.find(direction, 'right') then
    self.vx = math.abs(self.vx)
  end
  if string.find(direction,'up') and self.vy<5 then
    self.vy = self.vy + 1
    self.goingUp = true
  elseif self.vy>=5 and self.goingUp then
    self.vy = self.vy - 1
    self.goingUp = false
  end
end

function Player:update(dt)
  if  not self.vy == 0 then
    self.y = self.y + self.vy
    self.grounded = false
  end

  body:update(dt)
end
