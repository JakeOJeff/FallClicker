local background = {}

local totalLevels = 1
local totalStates = 5

background.level = 1
background.state = 1

background.levelData = {}

background.fadeAlpha = 1
background.targetAlpha = 0
background.fadeSpeed = 1

function background:loadLevel()
    for i = 1, totalLevels do
        self.levelData[i] = {
            state = {}
        }
        for j = 1, totalStates do
            self.levelData[i].state[j] = love.graphics.newImage("assets/bg"..i.."/"..j..".png") 
        end
    end 
end

function background:update(dt)
    if self.fadeAlpha < self.targetAlpha then
        self.fadeAlpha = math.min(self.fadeAlpha + dt * self.fadeSpeed, self.targetAlpha)
    end
end    

function background:updateCoin()
    if Coins % 5 == 0 and background.state < totalStates then
        self.state = self.state + 1
        self.fadeAlpha = 0
        self.targetAlpha = 1
    end


end


function background:draw()
    for i = 1, totalLevels do
        for j = 1, totalStates do
            if self.level == i and j <= self.state then
                if j == self.state  then
                    love.graphics.setColor(1, 1, 1, self.fadeAlpha)
                else
                    love.graphics.setColor(1, 1, 1, 1)
                end

                love.graphics.draw(background.levelData[i].state[j], 0, 0)
                
            end
        end
    end 
    love.graphics.setColor(1, 1, 1, 1)

end

return background