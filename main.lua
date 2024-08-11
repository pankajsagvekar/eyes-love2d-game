function love.load()
    eyeX = 200
    eyeY = 200
end

function love.update()
    if love.keyboard.isDown('escape') then
        love.event.quit()
    end

    distanceX = love.mouse.getX() - eyeX
    distanceY = love.mouse.getY() - eyeY
    angle = math.atan2(distanceY, distanceX)
    distance = math.min(math.sqrt(distanceX^2 + distanceY^2), 30)
    pupilX = eyeX + (math.cos(angle) * distance)
    pupilY = eyeY + (math.sin(angle) * distance)
end

function love.draw()
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
    love.graphics.setColor(0, 0, 0)
    love.graphics.print(table.concat({
        'distance X: ' .. distanceX,
        'distance Y: ' .. distanceY,
        'distance: '..distance,
        'angle: '..angle,
        'cos(angle): '..math.cos(angle),
        'sin(angle): '..math.sin(angle),
    }, '\n'))
end
