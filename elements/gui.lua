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
        opened = false,
        img = love.graphics.newImage("assets/sButton.png")
    }
    self.sidebarButton.defX = self.sidebarButton.x

    self.buyButton = {
        
    }
end

function gui:update(dt)
    if self.sidebarButton.opened then
        self.sidebarButton.x = math.max(self.sidebarButton.x - 300 * dt, self.sidebarButton.targetX)
    else
        self.sidebarButton.x = math.min(self.sidebarButton.x + 300 * dt, self.sidebarButton.defX)
    end
    
end

function gui:draw()
    love.graphics.draw(self.coinDisplay.img, self.coinDisplay.x, self.coinDisplay.y)
    love.graphics.setColor(0.74, 0.66, 0.69)
    love.graphics.print(Coins, self.coinDisplay.textX, self.coinDisplay.textY)

    love.graphics.setColor(1, 1, 1)
end

function gui:mousepressed(x, y, button)
    if x > self.sidebarButton.x and x < self.sidebarButton.x + self.sidebarButton.img:getWidth() and
       y > self.sidebarButton.y and y < self.sidebarButton.y + self.sidebarButton.img:getHeight() then
        self.sidebarButton.opened = not self.sidebarButton.opened
    end
end

return gui