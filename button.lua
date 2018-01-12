--! file: button.lua

Button = Rectangle:extend()
require "text"
function Button:new(x, y, w, h, text, color, f)
  Button.super.new(self, x, y, w, h, "fill", color, 5, 5)
  self.text = Text(x, y, text)
  self.f = f
end

function Button:draw()
  love.graphics.push()
  Button.super.draw(self)
  self.text:draw()
  love.graphics.pop()
end

function Button:click()
  self.f()
end

function Button:isInside(x, y)
  if(x>self.x and y>self.y and
    x<self.x+self.width and
    y<self.y+self.height) then
    return true
  end
end
