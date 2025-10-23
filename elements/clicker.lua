local clicker = {}


function clicker:load()
    self.img = love.graphics.newImage("assets/clicker.png")
    self.width = self.img:getWidth()
    self.height = self.img:getHeight()
    
    self.scale = 1
    self.currentWidth = self.width/self.scale
    self.currentHeight = self.height/self.scale

    self.x = wW/2 - self.currentWidth/2
    self.y = wH/2 - self.currentHeight/2
 end


 function clicker:draw()
    love.graphics.draw(self.img, self.x, self.y, 0, self.scale, self.scale)
 end

 return clicker