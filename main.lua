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
    function drawEye(eyeX, eyeY)
        local distanceX = love.mouse.getX() - eyeX
        local distanceY = love.mouse.getY() - eyeY
        local angle = math.atan2(distanceY, distanceX)
        local distance = math.min(math.sqrt(distanceX^2 + distanceY^2), 30)
        local pupilX = eyeX + (math.cos(angle) * distance)
        local pupilY = eyeY + (math.sin(angle) * distance)
        local function setColor(r, g, b, a)
            love.graphics.setColor(love.math.colorFromBytes(r, g, b, a))
        end
        love.graphics.setBackgroundColor(255, 255, 255)
        love.graphics.print('Press ESC to quit', love.graphics.getWidth() / 2)
    
        --eye
        setColor(200, 200, 200)
        love.graphics.circle("fill", eyeX, eyeY, 50)
    
        --pupil
        love.graphics.setColor(0, 0, 0)
        love.graphics.circle("fill", pupilX, pupilY, 15)
    
        --distance
        -- love.graphics.setColor(0, 0, 0)
        -- love.graphics.print(table.concat({
        --     'distance X: ' .. distanceX,
        --     'distance Y: ' .. distanceY,
        --     'distance: '..distance,
        --     'angle: '..angle,
        --     'cos(angle): '..math.cos(angle),
        --     'sin(angle): '..math.sin(angle),
        -- }, '\n'))
    end
   
    drawEye(200, 200)
    drawEye(330, 200)
end
