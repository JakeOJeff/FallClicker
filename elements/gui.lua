local gui = {}

function gui:load()
    self.coinDisplay = {
        x = 10,
        y = 10,
        textX = 20,
        textY = 13,
        img = love.graphics.newImage("assets/cDisplay.png")
    }
end

function gui:draw()
    love.graphics.draw(self.coinDisplay.img, self.coinDisplay.x, self.coinDisplay.y)
    love.graphics.setColor(0.74, 0.66, 0.69)
    love.graphics.print(Coins, self.coinDisplay.textX, self.coinDisplay.textY)
end

return gui