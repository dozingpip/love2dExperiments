--! file: main.lua
rects = {}

function love.load()
  tick = require "tick"
  Object = require "classic"
  require "shape"
  require "rectangle"
  myImage = love.graphics.newImage("images/sheep.png")
  r1 = Rectangle()
  r2 = Rectangle()
end

function love.update(dt)
  r1:update(dt)
  r2:update(dt)
  for i,rect in ipairs(rects) do
    rect:update(dt)
  end
end

function love.draw()
  r1:draw()
  r2:draw()
  for i,rect in ipairs(rects) do
    rect:draw()
  end
  love.graphics.draw(myImage, 200, 200, 90, 2, 2, myImage:getWidth(), myImage:getHeight())
end

function love.keypressed(key)
  if key =="space" then
    rects.createRect()
  end
end

function keyDown(key)
  if love.keyboard.isDown(key) then
    return true
  else
    return false
  end
end

function rects.createRect()
  table.insert(rects,Rectangle())
end
