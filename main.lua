-- Globals
wW, wH = love.graphics.getDimensions()
Coins = 0
Upgrade = 1
UpgradeCost = 20
Multiplier = 1
MultiplierCost = 500
Rebirths = 1
IncrementValue = 1 * Upgrade * Multiplier * Rebirths
totalLevels = 2
totalStates = 5
Notifications = 0
-- Requiring Elements
local clicker = require "elements.clicker"
background = require "elements.background"
effects = require "elements.effects"
local gui = require "elements.gui"
local tutorial = require "elements.tutorial"

-- font
fontSSSS = love.graphics.newFont("assets/BoldPixels.ttf", 12)
fontSS = love.graphics.newFont("assets/BoldPixels.ttf", 16)
fontSMS = love.graphics.newFont("assets/BoldPixels.ttf", 20)
fontS = love.graphics.newFont("assets/BoldPixels.ttf", 28)
font = love.graphics.newFont("assets/BoldPixels.ttf", 36)

-- Set default systems
love.graphics.setDefaultFilter("nearest", "nearest")
disabledCursor = love.mouse.getSystemCursor("no")
defaultCursor = love.mouse.getSystemCursor("arrow")
function love.load()

    clicker:load()
    background:loadLevel()
    gui:load()
    tutorial:load()
end

function love.update(dt)
    background:update(dt)
    clicker:update(dt)
    effects:update(dt)
    gui:update(dt)
    tutorial:update(dt)
    IncrementValue = 1 * Upgrade * Multiplier * Rebirths
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
    tutorial:draw()
end
