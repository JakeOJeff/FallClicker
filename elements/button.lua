local button = {}
button.__index = button
button.items = {}

function button:new(x, y, img, func)
    obj = setmetatable({}, button)
    
    obj.x = x
    obj.y = y 
    obj.img = img
    obj.width = img:getWidth()
    obj.height = img:getHeight()
    obj.func = func 

    obj.hovered = false
    obj.scale = 1
    table.insert(self.items, obj)
    return obj

end

function button:update(dt)
    local mx, my = love.mouse.getPosition()

    for i, v in ipairs(button.items) do
        if mx > v.x and mx < v.x + v.width and my > v.y and my < v.y + v.height then
            v.hovered = true
        else
            v.hovered = false
        end

        if v.hovered then
            v.scale = math.min(v.scale + 2 * dt, 1.1)
        else
            v.scale = math.max(v.scale - 2 * dt, 1)
        end
    end

end

function button:draw()

    for i, v in ipairs(button.items) do
        love.graphics.push()
        love.graphics.translate(v.x + self.sidebarButton.img:getWidth() / 2, self.sidebarButton.y + self.sidebarButton.img:getHeight() / 2)
        love.graphics.scale(v.scale)
        love.graphics.draw(v.img, -v.width/2, -v.height/2)
        love.graphics.pop()
    end

end

function button:mousepressed(x, y, button)
    for i, v in ipairs(button.items) do
        if button == 1 then
            if v.hovered then
                v.func()
            end
        end
    end
end

return button