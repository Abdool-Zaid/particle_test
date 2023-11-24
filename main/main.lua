local Str = require("./test/temp")

function love.load()
    world = love.physics.newWorld(0,0,true)
    
end
function love.update()
    
end

function love.draw()
    love.graphics.print(Str.string, 400, 300)
end