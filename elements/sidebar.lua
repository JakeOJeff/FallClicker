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

    obj.button = button:new()

    obj.hovered = false

    table.insert(sidebar.elements, obj)
    return obj
end

function sidebar:update(dt)
    for i,v in ipairs( self.elements ) do
        


    end
end

function sidebar:draw()
    
    for i,v in ipairs( self.elements ) do
        
        

    end
end