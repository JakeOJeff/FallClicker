local gui = {}

function gui:load()
    self.coinDisplay = {
        x = 10,
        y = 10,
        textX = 20,
        textY = 13,
        img = love.graphics.newImage("assets/cDisplay.png")
    }

    self.sidebarButton = {
        x = wW - 42 - 10,
        y = wH / 2 - 21,
        targetX = wW - 42 - 10 - 200,
        scale = 1,
        hovered = false,
        opened = false,
        img = love.graphics.newImage("assets/sButton.png")
    }
    self.sidebarButton.defX = self.sidebarButton.x

    self.sidebar = {
        x = wW,
        y = 0,
        with = 200,
        height = wH,
    }

    self.buyButton = {
        
    }
end

function gui:update(dt)
    if self.sidebarButton.opened then
        self.sidebarButton.x = math.max(self.sidebarButton.x - 300 * dt, self.sidebarButton.targetX)
        self.sidebar.x = self.sidebarButton.x + 42 + 10
    else
        self.sidebarButton.x = math.min(self.sidebarButton.x + 300 * dt, self.sidebarButton.defX)
        self.sidebar.x = self.sidebarButton.x + 42 + 10
    end
    local mx, my = love.mouse.getPosition()
    if mx > self.sidebarButton.x and mx < self.sidebarButton.x + self.sidebarButton.img:getWidth() and
       my > self.sidebarButton.y and my < self.sidebarButton.y + self.sidebarButton.img:getHeight() then
        self.sidebarButton.hovered = true
       else
        self.sidebarButton.hovered = false
    end

    if self.sidebarButton.hovered then
        self.sidebarButton.scale = math.min(self.sidebarButton.scale + 2 * dt, 1.1)
    else
        self.sidebarButton.scale = math.max(self.sidebarButton.scale - 2 * dt, 1)
    end
end

function gui:draw()
    love.graphics.draw(self.coinDisplay.img, self.coinDisplay.x, self.coinDisplay.y)

    -- DISPLAYING COINS
    local str = string.format("%09d", Coins) -- "00000023"
    local firstReal = string.find(str, "[1-9]") or #str
    local leadingZeros = string.sub(str, 1, firstReal - 1)
    local actualNum = string.sub(str, firstReal)

    love.graphics.setColor(0.74, 0.66, 0.69)
    love.graphics.print(leadingZeros, self.coinDisplay.textX, self.coinDisplay.textY)

    local offset = font:getWidth(leadingZeros)
    love.graphics.setColor(0.54, 0.46, 0.49)
    love.graphics.print(actualNum, self.coinDisplay.textX + offset, self.coinDisplay.textY)

    love.graphics.setColor(1, 1, 1)
    
    love.graphics.push()
    love.graphics.translate(self.sidebarButton.x + self.sidebarButton.img:getWidth() / 2, self.sidebarButton.y + self.sidebarButton.img:getHeight() / 2)
    love.graphics.scale(self.sidebarButton.scale)
    love.graphics.draw(self.sidebarButton.img, -self.sidebarButton.img:getWidth()/2, -self.sidebarButton.img:getWidth()/2)
    love.graphics.pop()

    love.graphics.setColor(1, 0.88, 0.92)
    love.graphics.rectangle("fill", self.sidebar.x, self.sidebar.y, self.sidebar.with, self.sidebar.height)
end

function gui:mousepressed(x, y, button)
    if self.sidebarButton.hovered and button == 1 then
        self.sidebarButton.opened = not self.sidebarButton.opened
    end
end

return gui