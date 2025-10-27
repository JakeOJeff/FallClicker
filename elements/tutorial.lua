local tutorial = {}

function tutorial:load()
    self.cooldown = 0
    self.cooldownTime = 0.3 -- seconds between clicks
    self.enableEndCooldown = true
    self.endCooldown = 2
    self.clicked = false
    self.readyForNextclick = false
    self.done = false

    self.items = {
        {
            condition = function ()
                return tutorial:checkClick()
            end,
            done = true,
            draw = function ()
                local w = wW / 2.5
                local h = wH / 2.5
                local text = "Welcome to FallClicker! In this quirky clicker game, your goal isn’t just to earn coins, it’s to level up entire maps! Tap to collect, upgrade your environment, and watch as your world evolves with every click. Unlock new areas, boost your earnings, and see how far your fall can go!"

                love.graphics.setColor(0.3, 0.3, 0.3)
                love.graphics.rectangle("fill", wW/2 - w/2, wH/2 - h/2, w, h, 10, 10)

                love.graphics.setColor(0.8, 0.8, 0.8)
                love.graphics.rectangle("line", wW/2 - w/2 + 10, wH/2 - h/2 + 10, w - 20, h - 20, 10, 10)

                love.graphics.setFont(fontSMS)
                love.graphics.setColor(1, 1, 1)

                local textY = wH/2 - h/4 - 20
                love.graphics.printf(text, wW/2 - w/2 + 20, textY, w - 40, "center")

                textY = textY + fontSMS:getHeight() + 140
                love.graphics.setColor(0.8, 0.8, 0.8)
                love.graphics.printf("'click' to continue tutorial", wW/2 - w/2 + 20, textY, w - 40, "center")
            end
        },
        {
            condition = function ()
                return tutorial:checkClick()
            end,
            postFunc = function ()
                self.done = true
            end,
            done = true,
            draw = function ()
                local w = 300
                local h = 100
                local text = "You can check your Coins over here!"

                love.graphics.setColor(0.3, 0.3, 0.3)
                love.graphics.rectangle("fill", 100, 70, w, h, 10, 10)

                love.graphics.setColor(0.8, 0.8, 0.8)
                love.graphics.rectangle("line", 110, 80, w - 20, h - 20, 10, 10)


                -- Draw Rectangle
                love.graphics.setLineWidth(5)
                                love.graphics.setColor(0.3, 0.3, 0.3)
                love.graphics.rectangle("line", gui.coinDisplay.x - 5, gui.coinDisplay.y - 5, gui.coinDisplay.img:getWidth() + 10, gui.coinDisplay.img:getHeight() + 10, 10, 10)

                love.graphics.setFont(fontSMS)
                love.graphics.setColor(1, 1, 1)

                
                

                local textY = 90
                love.graphics.printf(text, 120, textY, w - 40, "center")

                textY = textY + fontSMS:getHeight() + 20
                love.graphics.setColor(0.8, 0.8, 0.8)
                love.graphics.printf("'click' to continue tutorial", 120, textY, w - 40, "center")
            end
        },
        {
            condition = function ()
                return Coins >= 20
            end,
            done = true,
            draw = function ()
                local w = 300
                local h = 100
                local text = "Click the maple leaf till you get to 20 Coins!"

                local x = 100
                local y = 400

                love.graphics.setColor(0.3, 0.3, 0.3)
                love.graphics.rectangle("fill", x, y, w, h, 10, 10)

                love.graphics.setColor(0.8, 0.8, 0.8)
                love.graphics.rectangle("line", x + 10, y + 10, w - 20, h - 20, 10, 10)


                -- Draw Rectangle
                -- love.graphics.setLineWidth(5)
                -- love.graphics.setColor(0.3, 0.3, 0.3)
                -- love.graphics.rectangle("line", gui.coinDisplay.x - 5, gui.coinDisplay.y - 5, gui.coinDisplay.img:getWidth() + 10, gui.coinDisplay.img:getHeight() + 10, 10, 10)

                love.graphics.setFont(fontSMS)
                love.graphics.setColor(1, 1, 1)

                
                local textY = y + 30
                love.graphics.printf(text, x + 20, textY, w - 40, "center")


            end
        },
        {
            condition = function ()
                return gui.sidebarButton.opened
            end,
            done = false,
            draw = function ()
                local w = 300
                local h = 100
                local text = "Open the Upgrades button by clicking on it"

                local x = wW - 400
                local y = 400

                love.graphics.setColor(0.3, 0.3, 0.3)
                love.graphics.rectangle("fill", x, y, w, h, 10, 10)

                love.graphics.setColor(0.8, 0.8, 0.8)
                love.graphics.rectangle("line", x + 10, y + 10, w - 20, h - 20, 10, 10)


                -- Draw Rectangle
                love.graphics.setLineWidth(5)
                love.graphics.setColor(0.3, 0.3, 0.3)
                love.graphics.rectangle("line", gui.sidebarButton.x - 5, gui.sidebarButton.y - 5, gui.sidebarButton.img:getWidth() + 10, gui.sidebarButton.img:getHeight() + 10, 10, 10)

                love.graphics.setFont(fontSMS)
                love.graphics.setColor(1, 1, 1)

                
                local textY = y + 30
                love.graphics.printf(text, x + 20, textY, w - 40, "center")


            end
        },
        {
            condition = function ()
                return background.state >= 2
            end,
            postFunc = function ()
                self.readyForNextclick = true
            end,
            done = false,
            draw = function ()
                local w = 300
                local h = 100
                local text = "Now click 'Upgrade' to upgrade your clicks and to add content!"

                local x = wW - 400
                local y = 200

                love.graphics.setColor(0.3, 0.3, 0.3)
                love.graphics.rectangle("fill", x, y, w, h, 10, 10)

                love.graphics.setColor(0.8, 0.8, 0.8)
                love.graphics.rectangle("line", x + 10, y + 10, w - 20, h - 20, 10, 10)


                -- Draw Rectangle
                love.graphics.setLineWidth(5)
                love.graphics.setColor(0.3, 0.3, 0.3)
                love.graphics.rectangle("line", gui.sidebar.elements[1].button.x - 5, gui.sidebar.elements[1].button.y - 5, gui.sidebar.elements[1].button.img:getWidth() + 10, gui.sidebar.elements[1].button.img:getHeight() + 10, 10, 10)

                love.graphics.setFont(fontSMS)
                love.graphics.setColor(1, 1, 1)

                
                local textY = y + 20
                love.graphics.printf(text, x + 20, textY, w - 40, "center")


            end
        },
        {
            condition = function ()
                return self.endCooldown <= 0
            end,
            done = false,
            draw = function ()
                local w = 300
                local h = 100
                local text = "Once a map is fully upgraded, you can buy the next map!"

                local x = wW - 400
                local y = 350

                love.graphics.setColor(0.3, 0.3, 0.3)
                love.graphics.rectangle("fill", x, y, w, h, 10, 10)

                love.graphics.setColor(0.8, 0.8, 0.8)
                love.graphics.rectangle("line", x + 10, y + 10, w - 20, h - 20, 10, 10)


                -- Draw Rectangle
                love.graphics.setLineWidth(5)
                love.graphics.setColor(0.3, 0.3, 0.3)
                love.graphics.rectangle("line", gui.sidebar.elements[2].button.x - 5, gui.sidebar.elements[2].button.y - 5, gui.sidebar.elements[2].button.img:getWidth() + 10, gui.sidebar.elements[2].button.img:getHeight() + 10, 10, 10)

                love.graphics.setFont(fontSMS)
                love.graphics.setColor(1, 1, 1)

                
                local textY = y + 20
                love.graphics.printf(text, x + 20, textY, w - 40, "center")


            end
        }
    }
end

function tutorial:update(dt)
    if self.cooldown > 0 then
        self.cooldown = self.cooldown - dt
    end

    for i, v in ipairs(self.items) do
        if not v.done and v.condition() then
            if v.postFunc then
                v.postFunc()
            end
            v.done = true
            break
        end
    end
end

function tutorial:checkClick()
    if self.clicked then
        self.clicked = false
        return true
    end
    return false
end
function tutorial:mousepressed(x, y, button)
    if button == 1 and self.cooldown <= 0 then
        self.clicked = true
        self.cooldown = self.cooldownTime
    end
end

function tutorial:draw()
    for i, v in ipairs(self.items) do
        if not v.done then
            v.draw()
            break
        end
    end
end

return tutorial
