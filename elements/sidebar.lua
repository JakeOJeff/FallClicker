local sidebar = {}
sidebar.__index = sidebar
sidebar.elements = {}

-- Important Global Loading
local buyImg = love.graphics.newImage("assets/buy.png")
local button = require("elements.button")

sidebar.x = 20
sidebar.y = 50
sidebar.spacing = 80


function sidebar:newElement(name, desc, buttonName, condition, func)
    local obj = setmetatable( {}, sidebar )

    obj.name = name
    obj.desc = desc
    obj.buttonName = buttonName
    obj.condition = condition
    obj.func = func
    
    obj.y = sidebar.y
    obj.width = 0

    obj.button = button:new(0, 0, buyImg, func, buttonName)
    obj.hovered = false

    table.insert(sidebar.elements, obj)
    return obj
end

function sidebar:update(dt)
    for i,v in ipairs( self.elements ) do
        local y = self.y + (i - 1) * self.spacing
        v.button.x = self.x
        v.button.y = y
        if v.button.update then
            v.button:update(dt)
        end
    end
end

function sidebar:draw()
    
    for i,v in ipairs( self.elements ) do
        
        local y = self.y + ( i - 1 ) * self.spacing

        love.graphics.print(v.name, self.x + 60, y)
        love.graphics.print(v.desc, self.x + 60, y + 20)

        if v.button.draw then
            v.button.draw()
        end

    end
end

function sidebar:mousepressed(x, y, button)
    for i, v in ipairs( self.elements ) do
        v.button:mousepressed(x, y, button)
    end
end

return sidebar