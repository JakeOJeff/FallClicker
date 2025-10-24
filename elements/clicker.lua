local clicker = {}

function clicker:load()
    self.img = love.graphics.newImage("assets/clicker.png")
    self.width = self.img:getWidth()
    self.height = self.img:getHeight()

    self.scale = 1
    self.x = wW / 2
    self.y = wH / 2

    self.scaledWidth = self.width * self.scale
    self.scaledHeight = self.height * self.scale
    self.drawX = self.x - self.scaledWidth / 2
    self.drawY = self.y - self.scaledHeight / 2

    self.rotate = 0

    self.hovered = false
end

function clicker:update(dt)
    self.scaledWidth = self.width * self.scale
    self.scaledHeight = self.height * self.scale
    self.drawX = self.x - self.scaledWidth / 2
    self.drawY = self.y - self.scaledHeight / 2

    if self.rotate > 0 then
        self.rotate = self.rotate - math.rad(15) * dt
    elseif self.rotate < 0 then
        self.rotate = self.rotate + math.rad(15) * dt
    end
end

function clicker:draw()
    love.graphics.translate(self.x, self.y)
    love.graphics.scale(self.scale, self.scale)
    love.graphics.rotate(self.rotate)
    love.graphics.draw(
        self.img,
        -self.width / 2, -self.height / 2
    )
end

function clicker:mousepressed(x, y, button)
    if button == 1 and
       x > self.drawX and x < self.drawX + self.scaledWidth and
       y > self.drawY and y < self.drawY + self.scaledHeight then
        self.scale = 1.2
        self.rotate = math.rad(love.math.random(-15, 15))
        effects:new()
        self:increment(1)
    end
end

function clicker:mousereleased(x, y, button)
    if button == 1 then
        self.scale = 1
    end
end

function clicker:increment(incrementVal)
    Coins = Coins + incrementVal
end

return clicker
