
-- Globals
wW, wH = love.graphics.getDimensions()
Coins = 0


-- Requiring Elements
local clicker = require "elements.clicker"
local effects = require "elements.effects"


-- Set default systems
love.graphics.setDefaultFilter("nearest", "nearest")


function love.load()

    clicker:load()
end

function love.update(dt)
    clicker:update(dt)
end

function love.mousepressed(x, y, button)
    clicker:mousepressed(x, y, button)
end

function love.mousereleased(x, y, button)
    clicker:mousereleased(x, y, button)
end

function love.draw()
    clicker:draw()
    love.graphics.print(Coins)
end