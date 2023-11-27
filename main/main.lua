local Str = require("./test/temp")

function love.load()
    World = love.physics.newWorld(0, 0, true)
    Entity = {}
    Entity.body = love.physics.newBody(World, 300, 300, 'static')
    Entity.shape1 = love.physics.newRectangleShape(47, 47)
    Entity.shape2 = love.physics.newCircleShape(300, 300, 47)
    Entity.fixture1 = love.physics.newFixture(Entity.body, Entity.shape1, 1)
    Entity.fixture2 = love.physics.newFixture(Entity.body, Entity.shape2, 1)
end

function love.update(dt)
    World:update(dt)
end

function love.draw()
    love.graphics.polygon("line", Entity.body:getWorldPoints(Entity.shape1:getPoints()))
    love.graphics.circle("line", Entity.body:getX(), Entity.body:getY(), Entity.shape2:getRadius())
end
