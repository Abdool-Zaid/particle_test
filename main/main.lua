local Str = require("./test/temp")
local particleImage = love.graphics.newImage("assets/green.png")

-- Create a particle system
local particleSystem = love.graphics.newParticleSystem(particleImage, 1000)
particleSystem:setParticleLifetime(1, 2)
particleSystem:setLinearAcceleration(-20, -20, 20, 20)
particleSystem:setColors(0, 1, 0, 1, 0, 1, 0, 0)  -- Green color
particleSystem:setSizes(2, 1, 0.5)  -- Varying sizes for the particles


function love.load()
    World = love.physics.newWorld(0, 10, true)
    Border = {}
    Border.body =love.physics.newBody(World,0,0,"static")
    Border.shape= love.physics.newChainShape(true,0,0,800,0,800,600,0,600   )
    Border.fixture= love.physics.newFixture(Border.body,Border.shape,1)
    Entity = {}
    Entity.body = love.physics.newBody(World, 300, 300, 'static')
    Entity.shape1 = love.physics.newRectangleShape(47, 47)
    Entity.shape2 = love.physics.newCircleShape(300, 300, 47)
    Entity.fixture1 = love.physics.newFixture(Entity.body, Entity.shape1, 1)
    Entity.fixture2 = love.physics.newFixture(Entity.body, Entity.shape2, 1)
end

function love.update(dt)
    if love.keyboard.isDown("right") then
        Entity.body:applyForce(400, 0)
      elseif love.keyboard.isDown("left") then
        Entity.body:applyForce(-400, 0)
    elseif love.keyboard.isDown("up") then 
        Entity.body:applyForce(0, 400)
      end

    World:update(dt)

     -- Update the particle system position
     particleSystem:setPosition(Entity.body:getX(), Entity.body:getY())
     particleSystem:update(dt)
end


function love.mousepressed(x, y, button, istouch, presses)
    -- Emit particles when the mouse is pressed
    particleSystem:emit(20)
end

function love.draw()
    love.graphics.line(Border.body:getWorldPoints(Border.shape:getPoints()))
    love.graphics.polygon("line", Entity.body:getWorldPoints(Entity.shape1:getPoints()))
    love.graphics.circle("line", Entity.body:getX(), Entity.body:getY(), Entity.shape2:getRadius())



    love.graphics.draw(particleSystem)
end
