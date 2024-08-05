function love.load()
    eyeX = 200
    eyeY = 200
    
end

function love.update()
    if love.keyboard.isDown('escape') then
        love.event.quit()
    end
end

function love.draw()
    local function setColor(r, g, b, a)
        love.graphics.setColor(love.math.colorFromBytes(r, g, b, a))
    end
    love.graphics.setBackgroundColor(255,255,255)
    love.graphics.print('Press ESC to quit')

    --eye
    setColor(200, 200, 200)
    love.graphics.circle("fill", eyeX, eyeY, 50)
    --pupil
    love.graphics.setColor(0, 0, 0)
    love.graphics.circle("fill", 200, 200, 15)
end