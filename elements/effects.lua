local effects = {}
effects.__index = effects
effects.list = {}

function effects:new()
    local obj = {}
    setmetatable(obj, effects)

    obj.x = love.math.random(0, wW)
    obj.y = love.math.random(0, wH)
    obj.rotation = love.math.random()  * 2 * math.pi
    obj.img = love.graphics.newImage("assets/effect.png")
    obj.timer = 0
    obj.scale = 0.5
    obj.lifetime = 5
    obj.speed = 200

    table.insert(effects.list, obj)
    return obj

end


function effects:update(dt)
    
    for i = #effects.list, 1, -1 do
        local e = effects.list[i]
        e.timer = e.timer + dt
        e.rotation = (e.rotation + 0.5 * dt) % (2 * math.pi)
        e.y = e.y + e.speed * dt
        if e.scale < 1 then
            e.scale = e.scale + 0.25 * dt
        end

        if e.timer > e.lifetime or e.y > wH + e.img:getHeight() then
            table.remove(effects.list, i)
        end
    end

end

function effects:draw()
    for _, e in ipairs(effects.list) do
        love.graphics.push()
        love.graphics.scale(e.scale, e.scale)
        love.graphics.draw(e.img, e.x, e.y, e.rotation, 1, 1, e.img:getWidth() /2 , e.img:getHeight() /2 )
        love.graphics.pop()
    end
end
return effects