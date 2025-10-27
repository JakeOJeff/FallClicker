local tutorial = {}

function tutorial:load()
    self.cooldown = 0
    self.cooldownTime = 0.3 -- seconds between clicks
    self.done = false

    self.items = {
        {
            condition = function ()
                return tutorial:checkClick()
            end,
            done = false,
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
            done = false,
            draw = function ()
                local w = wW / 2.5
                local h = wH / 2.5
                local text = "You can check your "
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
            v.done = true
            if v.postFunc then
                v.postFunc()
            end
            break
        end
    end
end

function tutorial:checkClick()
    if self.cooldown <= 0 and love.mouse.isDown(1) then
        self.cooldown = self.cooldownTime
        return true
    end
    return false
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
