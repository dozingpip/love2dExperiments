--! file: body.lua
Body = Object:extend()

function Body:new(x, y, w, h, spriteSheet, animSet)
  self.x = x
  self.y = y
  self.w = w
  self.h = h
  self.sheet = love.graphics.newImage(spriteSheet)
  self.anims = newAnimationSet(self.sheet, w, h, animSet)
  self.current = self.anims["idle"]
  self.time = 0
end


function Body:update(dt)
  self.time = self.time + dt
  if self.current.loop then
    if self.time >= self.current.duration then
      self.time = self.time - self.current.duration
    end
  else
    self.idle()
  end
end

function Body:draw()
  love.graphics.push()
  love.graphics.translate(self.x, self.y)
  love.graphics.scale(4, 4)
  setColor("white")
  local spriteNum = math.floor(self.time /
    self.current.duration * #self.current.quads) + 1;
  love.graphics.draw(self.sheet, self.current.quads[spriteNum], 0, 0)
  love.graphics.pop()
end

function Body:walk()
  self.current = self.anims["walk"]
end

function Body:idle()
  self.current = self.anims["idle"]
end

function newAnimationSet(image, sWidth, sHeight, anims)
  local animationSet = {}
  animationSet.spriteSheet = image
  local k =""
  for key, anim in pairs(anims) do
    animation = {}
    animation.quads = {}
    local startX, startY = unpack(anim.coords.start)
    local endX, endY = unpack(anim.coords["end"])
    animation.duration = anim.duration
    animation.loop = anim.loop or true
    for y = startY, endY, sHeight do
      for x = startX, endY, sWidth do
        table.insert(animation.quads,
          love.graphics.newQuad(x, y, sWidth, sHeight, image:getDimensions()))
      end
    end
    k = key
    animationSet[key] = animation
    animationSet[key].quads = animation.quads
  end
  return animationSet
end
