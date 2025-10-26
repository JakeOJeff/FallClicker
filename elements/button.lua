local button = {}
button.__index = button
button.items = {}

function button:new()
    obj = setmetatable({}, button)
    
    obj.x = x
    obj.y = y 
    obj.img = img
    obj.width = img:getWidth()
    obj.height = height:getHeight()
    obj.func = func 
    table.insert(self.items, obj)
    return obj

end

function button:update(dt)
        if mx > self.sidebarButton.x and mx < self.sidebarButton.x + self.sidebarButton.img:getWidth() and
       my > self.sidebarButton.y and my < self.sidebarButton.y + self.sidebarButton.img:getHeight() then
        self.sidebarButton.hovered = true
       else
        self.sidebarButton.hovered = false
    end

    if self.sidebarButton.hovered then
        self.sidebarButton.scale = math.min(self.sidebarButton.scale + 2 * dt, 1.1)
    else
        self.sidebarButton.scale = math.max(self.sidebarButton.scale - 2 * dt, 1)
    end
end
end

function button:draw()
    
end