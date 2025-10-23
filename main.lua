

-- Globals
wW, wH = love.graphics.getDimensions()
Coins = 0


-- Requiring Elements
local clicker = require "elements.clicker"


function love.load()

    clicker:load()
end

function love.update(dt)
    clicker:update(dt)
end

function love.draw()
    clicker:draw()
end