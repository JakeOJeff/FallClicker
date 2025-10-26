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

function sidebar:newElement(name, desc, buttonName, condition, func)
    local element = {
        name = name,
        desc = desc,
        buttonName = buttonName,
        condition = condition,
        func = func,
        button = button:new(0, 0, buyImg, func, buttonName),
        hovered = false
    }

    table.insert(self.elements, element)
    return element
end

function sidebar:update(dt)
    for i, v in ipairs(self.elements) do
        local y = self.y + (i - 1) * self.spacing
        v.button.x = self.x + 20
        v.button.y = y + 10
        if v.button.update then
            v.button:update(dt)
        end
    end
end

function sidebar:draw()
    for i, v in ipairs(self.elements) do
        local y = self.y + (i - 1) * self.spacing
        -- love.graphics.setColor(0, 0, 0)
        -- love.graphics.print(v.name, self.x + 60, y)
        -- love.graphics.print(v.desc, self.x + 60, y + 20)
        love.graphics.setColor(1, 1, 1)

        if v.button.draw then
            v.button:draw()
        end
    end
end

function sidebar:mousepressed(x, y, button)
    for _, v in ipairs(self.elements) do
        v.button:mousepressed(x, y, button)
    end
end

return sidebar
