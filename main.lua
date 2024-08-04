function love.load()
    
end

function love.update()
    if love.keyboard.isDown('escape') then
        love.event.quit()
    end
end

function love.draw()
    love.graphics.print('Press ESC to quit')
end