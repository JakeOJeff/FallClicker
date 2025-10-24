local effects = {}
effects.__index = effects


function effects:new()
    local obj = {}
    setmetatable(obj, effects)

    obj.x = love.math.random(0, wW)
    obj.y = love.math.random(0, wH)
    obj.rotation = love.math.random()  * 2 * math.pi
    obj.img = love.graphics.newImage("assets/clicker.png")
    obj.timer = 0

    return obj

end


function effects:update(dt)
    obj.timer = obj.timer + dt

    if obj.rotation < 2 * math.pi then
        obj.rotation = obj.rotation + 5 * dt
    end

    if obj.y > wH then
        table.remove(effects, )
    end

    if obj.y < wH + obj.img:getHeight() then
        obj.y = obj.y + 200 * dt
    end


end

function effects:draw()
    
end
return effects