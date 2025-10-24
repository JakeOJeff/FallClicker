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

    self.particles = {}
    self.particleImg = love.graphics.newImage("assets/effect.png")

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

    for _, v in ipairs(self.particles) do
        v.x = v.x + v.vx * dt
        v.y = v.y + v.vy * dt
        v.lifetime = v.lifetime - dt
        v.scale = v.scale - .5 * dt

        if v.lifetime <= 0 then
            table.remove(self.particles, _)
        end
    end
end

function clicker:draw()
    love.graphics.push()
    love.graphics.translate(self.x, self.y)
    love.graphics.scale(self.scale, self.scale)
    love.graphics.rotate(self.rotate)
    love.graphics.draw(
        self.img,
        -self.width / 2, -self.height / 2
    )
    love.graphics.pop()

    
    for _, v in ipairs(self.particles) do
        love.graphics.push()
        love.graphics.translate(v.x, v.y)
        love.graphics.rotate(v.rotation)
        love.graphics.scale(v.scale, v.scale)
        love.graphics.draw(self.particleImg, -self.particleImg:getWidth() /2 , -self.particleImg:getHeight() /2 )
        love.graphics.pop()
    end

    love.graphics.setColor(1,1,1,1)
end

function clicker:mousepressed(x, y, button)
    if button == 1 and
       x > self.drawX and x < self.drawX + self.scaledWidth and
       y > self.drawY and y < self.drawY + self.scaledHeight then
        self.scale = 1.2
        self.rotate = math.rad(love.math.random(-15, 15))
        effects:new()
        self:increment(1)
        self:addParticles(x, y)
        background:updateCoin()

    end
end

function clicker:mousereleased(x, y, button)
    if button == 1 then
        self.scale = 1
    end
end

function clicker:addParticles(x, y)
    for i = 0, 360, (360/5) do
        local angle = math.rad(i)
        local speed = love.math.random(100, 200)
            table.insert(self.particles, {
            x = x,
            y = y,
            vx = speed * math.cos(angle) * love.math.random(0.5, 1),
            vy = speed * math.sin(angle)* love.math.random(0.5, 1),
            rotation = love.math.random() * 2 * math.pi,
            scale = 0.7,
            lifetime = 1
        })
    end

end

function clicker:increment(incrementVal)
    Coins = Coins + incrementVal
end

return clicker
