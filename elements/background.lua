local background = {}

local totalLevels = 1
local totalStates = 5

background.level = 1
background.state = 1

background.levelData = {}

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

function background:update()
    if Coins % 5 == 0 and background.state < 5 then
        background.state = background.state + 1
    end
end


function background:draw()
    for i = 1, totalLevels do
        for j = 1, totalStates do
            if self.level == i then
                if j <= self.state then
                    love.graphics.draw(background.levelData[i].state[j], 0, 0)
                end
            end
        end
    end 
end

return background