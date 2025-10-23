local clicker = {}


function clicker:load()
    self.img = love.graphics.newImage("assets/clicker.png")
    self.width = self.img:getWidth()
    self.height = self.img:getHeight()
    
    self.scale = 1
    self.currentWidth = self.width/self.scale
    self.currentHeight = self.height/self.scale
    
    self.x = 
end