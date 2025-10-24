local effects = {}
effects.__index = effects


function effects:new()
    local obj = {}
    setmetatable(obj, effects)


    return obj

end


return effects