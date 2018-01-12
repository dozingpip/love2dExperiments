--! file: text.lua

Text = Shape:extend()

function Text:new(x, y, text)
  Text.super.new(self, x, y, nil, nil, "black")
  self.text = text
end

function Text:draw()
  Text.super.draw(self)
  love.graphics.print(self.text, 0, 0)
end
