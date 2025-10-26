local tutorial = {}

function tutorial:load()
    self.items = {
        {
            condition = function ()
                return true
            end,
            done = false,
            draw = function ()
                local w = wW/1.5
                local h = wH/1.2
                love.graphics.rectangle("fill", wW/2 - w/2, wH/2 - h/2, w, h)
            end
        }
    }
end

function tutorial:update()
    
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