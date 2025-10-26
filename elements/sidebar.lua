local sidebar = {}
sidebar.__index = sidebar
sidebar.elements = {}

-- Important Global Loading
local buyImg = love.graphics.newImage("assets/buy.png")
local button = require("elements.button")

sidebar.spacing = 80

function sidebar:new(x, y, width, height)
    local obj = setmetatable({}, sidebar)
    obj.x = x or 0
    obj.y = y or 0
    obj.width = width or 200
    obj.height = height or love.graphics.getHeight()
    obj.elements = {}
    return obj
end

function sidebar:newElement(name, desc, cost, buttonName, condition, func)
    local element = {
        name = name,
        desc = desc,
        cost = cost or 0,
        buttonName = buttonName,
        condition = condition,
        func = func,

        button = button:new(0, 0, buyImg, func, buttonName, condition, "upgrade"),
        hovered = false
    }

    table.insert(self.elements, element)
    return element
end

function sidebar:update(dt)
    for i, v in ipairs(self.elements) do
        local y = self.y + (i - 1) * self.spacing
        v.button.x = self.x + 20
        v.button.y = y + 10 + 50 + fontS:getHeight() + fontSS:getHeight()
        if v.button.update then
            v.button:update(dt)
        end
    end
end

function sidebar:draw()
    for i, v in ipairs(self.elements) do
        local y = self.y + (i - 1) * self.spacing
        local lineY = y + 10  -- starting point
        local lineSpacing = 5 -- space between lines

        -- name
        love.graphics.setColor(0, 0, 0)
        love.graphics.setFont(fontS)
        love.graphics.print(v.name, self.x + 20, lineY)
        lineY = lineY + fontS:getHeight() + lineSpacing + 5

        -- description
        love.graphics.setFont(fontSS)
        love.graphics.printf(v.desc, self.x + 20, lineY, self.width - 20)
        lineY = lineY + fontSS:getHeight() + lineSpacing + 15

        -- cost
        love.graphics.setColor(0.3, 0.3, 0.3)
        love.graphics.printf("$"..v.cost(), self.x + 20, lineY, self.width - 20)
        lineY = lineY + fontSS:getHeight() + lineSpacing
        love.graphics.setColor(1, 1, 1)

        if v.button.draw then
            v.button:draw()
        end
    end
end

function sidebar:mousepressed(x, y, mousebutton)
    for _, v in ipairs(self.elements) do
        v.button:mousepressed(x, y, mousebutton)
    end
end

return sidebar
