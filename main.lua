-- Globals
wW, wH = love.graphics.getDimensions()
Coins = 0

-- Requiring Elements
local clicker = require "elements.clicker"
background = require "elements.background"
effects = require "elements.effects"

-- Set default systems
love.graphics.setDefaultFilter("nearest", "nearest")

function love.load()

    clicker:load()
    background:loadLevel()
end

function love.update(dt)
    clicker:update(dt)
    effects:update(dt)
end

function love.mousepressed(x, y, button)
    clicker:mousepressed(x, y, button)
    
end

function love.mousereleased(x, y, button)
    clicker:mousereleased(x, y, button)
end

function love.draw()
    background:draw()
    effects:draw()

    clicker:draw()
    love.graphics.print(Coins)
end
