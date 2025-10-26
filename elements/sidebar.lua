local sidebar = {}
sidebar.__index = sidebar
sidebar.elements = {}

function sidebar:newElement(name, description, buttonName, condition, func)
    local obj = setmetatable( {}, sidebar )

    obj.name = name
    obj.desc = description
    obj.buttonName = buttonName
    obj.condition = condition
    obj.func = func


    return obj
end