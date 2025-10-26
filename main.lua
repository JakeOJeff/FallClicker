-- Globals
wW, wH = love.graphics.getDimensions()
Coins = 0
Upgrade = 1
UpgradeCost = 20
Multiplier = 1
Rebirths = 1
totalLevels = 2
totalStates = 5
-- Requiring Elements
local clicker = require "elements.clicker"
background = require "elements.background"
effects = require "elements.effects"
local gui = require "elements.gui"

-- font
fontSS = love.graphics.newFont("assets/BoldPixels.ttf", 16)
fontSMS = love.graphics.newFont("assets/BoldPixels.ttf", 22)
fontS = love.graphics.newFont("assets/BoldPixels.ttf", 28)
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
