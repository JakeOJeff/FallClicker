local clicker = {}

function clicker:load()
    self.img = love.graphics.newImage("assets/clicker.png")
    self.width = self.img:getWidth()
    self.height = self.img:getHeight()

    self.scale = 1
    self.x = wW / 2
    self.y = wH / 2
end

function clicker:update(dt)
    local mx, my = love.mouse.getPosition()
    local scaledWidth = self.width * self.scale
    local scaledHeight = self.height * self.scale
    local drawX = self.x - scaledWidth / 2
    local drawY = self.y - scaledHeight / 2

    if mx > drawX and mx < drawX + scaledWidth and my > drawY and my < drawY + scaledHeight and love.mouse.isDown(1) then
        self.scale = 1.2
    else
        self.scale = 1
    end
end

function clicker:draw()
    love.graphics.draw(
        self.img,
        self.x, self.y,
        0,
        self.scale, self.scale,
        self.width / 2, self.height / 2
    )
end

return clicker
