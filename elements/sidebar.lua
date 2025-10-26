local sidebar = {}
sidebar.__index = sidebar
sidebar.elements = {}

-- Important Global Loading
local buyImg = love.graphics.newImage("assets/buy.png")

function sidebar:newElement(name, description, buttonName, condition, func)
    local obj = setmetatable( {}, sidebar )

    obj.name = name
    obj.desc = description
    obj.buttonName = buttonName
    obj.condition = condition
    obj.func = func

    obj.hovered = false

    return obj
end

function sidebar:update(dt)
    local mx, my = love.mouse.getPosition()
    for i,v in ipairs( self.elements ) do
        
        if mx > 

    end
end