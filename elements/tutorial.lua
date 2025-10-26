local tutorial = {}

function tutorial:load()
    self.items = {
        {
            condition = function ()
                return love.mouse.isDown(1)
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

                local textY = wH/2 - h/4  - 20
                love.graphics.printf(text, wW/2 - w/2 + 20, textY, w - 40, "center")

                textY = textY + fontSMS:getHeight() + 140
                love.graphics.setColor(0.8, 0.8, 0.8)
                love.graphics.printf("'click' to continue tutorial", wW/2 - w/2 + 20, textY, w - 40, "center")
            end
        }
    }
end

function tutorial:update()
    for i, v in ipairs(self.items) do
        if not v.done and v.condition() then
            v.done = true
            break
        end
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