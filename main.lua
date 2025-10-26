-- Globals
wW, wH = love.graphics.getDimensions()
Coins = 0
Upgrade = 1
Multiplier = 1
Rebirths = 1

-- Requiring Elements
local clicker = require "elements.clicker"
local gui = require "elements.gui"
background = require "elements.background"
effects = require "elements.effects"

-- font
fontS = love.graphics.newFont("assets/BoldPixels.ttf", 24)
font = love.graphics.newFont("assets/BoldPixels.ttf", 36)

-- Set default systems
love.graphics.setDefaultFilter("nearest", "nearest")

function love.load()

    clicker:load()
    background:loadLevel()
    gui:load()
end

function love.update(dt)
    background:update(dt)
    clicker:update(dt)
    effects:update(dt)
    gui:update(dt)
end

function love.mousepressed(x, y, button)
    clicker:mousepressed(x, y, button)
    gui:mousepressed(x, y, button)

end

function love.mousereleased(x, y, button)
    clicker:mousereleased(x, y, button)
end

function love.draw()
    love.graphics.setFont(font)
    background:draw()
    effects:draw()

    clicker:draw()
    gui:draw()
end
