--! file: body.lua
Body = Object:extend()
local anim8 = require 'anim8/anim8'

function Body:new(w, h, spriteSheet, animSet)
  self.w = w
  self.h = h
  self.sheet = love.graphics.newImage(spriteSheet)
  local grid = anim8.newGrid(w, h, self.sheet:getWidth(), self.sheet:getHeight())
  self.animations = setUpAnimations(grid, animSet)
  self.current = self.animations.idle
  self.time = 0
end

function Body:update(dt)
  self.animations.idle:update(dt)
end

function Body:draw()
  love.graphics.push()
  setColor("white")
  self.current:draw(self.sheet, w, h)
  love.graphics.pop()
end

function Body:walk()
  self.current = self.animations.walk
end

function Body:idle()
  self.current = self.animations.idle
end

function setUpAnimations(grid, anims)
  local animations = {}
  for key, anim in pairs(anims) do
    print(anim.frames)
    if(anim.loop) then
      animations[key] = anim8.newAnimation(grid(anim.frames, anim.row), anim.durations)
    else
      animations[key] = anim8.newAnimation(grid(anim.frames, anim.row), anim.durations, 'pauseAtEnd')
    end
  end
  return animations
end
