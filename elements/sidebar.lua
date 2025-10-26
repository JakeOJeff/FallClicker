local sidebar = {}
sidebar.__index = sidebar
sidebar.elements = {}

-- Important Global Loading
local buyImg = love.graphics.newImage("assets/buy.png")
local button = require("elements.button")

function sidebar:setDimension(x, y)
    self.x = x
    self.y = y
end

function sidebar:newElement(name, description, buttonName, condition, func)
    local obj = setmetatable( {}, sidebar )

    obj.name = name
    obj.desc = description
    obj.buttonName = buttonName
    obj.condition = condition
    obj.func = func

    obj.button = button:new()

    obj.hovered = false

    return obj
end

function sidebar:update(dt)
    for i,v in ipairs( self.elements ) do
        

    end
end