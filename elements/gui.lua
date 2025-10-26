local gui = {}

local button = require("elements/button")
local sidebar = require "elements.sidebar"

function gui:load()
    self.coinDisplay = {
        x = 10,
        y = 10,
        textX = 22,
        textY = 13,
        img = love.graphics.newImage("assets/cDisplay.png")
    }

    self.sidebarButton = button:new(
        wW - 42 - 10,
        wH / 2 - 21,
        love.graphics.newImage("assets/sButton.png"),
        function() end, "", function () return true end, "button"
    )

    self.sidebarButton.opened = false
    self.sidebarButton.targetX = wW - 42 - 10 - 200
    self.sidebarButton.func = function()
        self.sidebarButton.opened = not self.sidebarButton.opened
    end
    self.sidebarButton.defX = self.sidebarButton.x

    self.sidebar = sidebar:new(wW, 0, 200, wH)

    self.sidebar:newElement(
        "Upgrade state",
        "Add content to the Map",
        function ()
            return UpgradeCost
        end,
        "Upgrade",
        function()
            return Coins >= UpgradeCost 
        end,
        function()
            if Coins >= UpgradeCost and background.state < (totalStates) then
                Coins = Coins - UpgradeCost
                Upgrade = Upgrade + 2 * Rebirths * Multiplier
                UpgradeCost = UpgradeCost + 20 * Upgrade
                background.state = background.state + 1
                background.fadeAlpha = 0
                background.targetAlpha = 1
            end
        end
    )
    self.sidebar:newElement(
        "Upgrade Map",
        "Buys Global Multiplier and Map",
        function ()
            return MultiplierCost
        end,
        "Upgrade",
        function()
            return Coins >= MultiplierCost and background.state == totalStates 
        end,
        function()
            if Coins >= MultiplierCost and background.state == totalStates and background.level < totalLevels  then
                Coins = Coins - MultiplierCost
                Upgrade = Upgrade + 2 * Rebirths * Multiplier
                Multiplier = Multiplier + 2 * Rebirths * Upgrade
                MultiplierCost = MultiplierCost + 500 * Multiplier
                background.state = 1
                background.level = background.level + 1
                background.fadeAlpha = 0
                background.targetAlpha = 1
            end
        end
    )
end

function gui:update(dt)
    if self.sidebarButton.opened then
        self.sidebarButton.x = math.max(self.sidebarButton.x - 300 * dt, self.sidebarButton.targetX)
        self.sidebar.x = self.sidebarButton.x + 42 + 10
    else
        self.sidebarButton.x = math.min(self.sidebarButton.x + 300 * dt, self.sidebarButton.defX)
        self.sidebar.x = self.sidebarButton.x + 42 + 10
    end
    button:update(dt)

    self.sidebar:update(dt)
end

function gui:draw()
    love.graphics.draw(self.coinDisplay.img, self.coinDisplay.x, self.coinDisplay.y)

    local str = string.format("%09d", Coins)
    local firstReal = string.find(str, "[1-9]") or #str
    local leadingZeros = string.sub(str, 1, firstReal - 1)
    local actualNum = string.sub(str, firstReal)

    love.graphics.setColor(0.74, 0.66, 0.69)
    love.graphics.print(leadingZeros, self.coinDisplay.textX, self.coinDisplay.textY)

    local offset = font:getWidth(leadingZeros)
    love.graphics.setColor(0.54, 0.46, 0.49)
    love.graphics.print(actualNum, self.coinDisplay.textX + offset, self.coinDisplay.textY)

    love.graphics.setColor(1, 1, 1)
    button:draw()

    love.graphics.setColor(1, 0, 0)
    if Notifications > 0 then
        
        love.graphics.circle("fill", self.sidebarButton.x, self.sidebarButton.y, 7)
        love.graphics.setFont(fontSS)
        love.graphics.setColor(1,1,1)
        love.graphics.print(Notifications, self.sidebarButton.x - 3, self.sidebarButton.y - 8)
        love.graphics.setFont(fontSS)
    end

    love.graphics.setColor(1, 0.88, 0.92)
    love.graphics.rectangle("fill", self.sidebar.x, self.sidebar.y, self.sidebar.width, self.sidebar.height)

    self.sidebar:draw()
end


function gui:mousepressed(x, y, mousebutton)
    button:mousepressed(x, y, mousebutton)
    self.sidebar:mousepressed(x, y, mousebutton)
end

return gui