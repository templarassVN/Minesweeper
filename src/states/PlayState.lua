PlayState = Class{__includes = BaseState}


function PlayState:init( ... )
	-- body
	self.game = GameGrid(GRID_SIZE,GRID_SIZE)
end

function PlayState:update( dt )
	-- body
	print('call playupdate')
	x_2light, y_2light = push:toGame(love.mouse.getPosition())
	self.game:update(dt)
end

function PlayState:render( ... )
	-- body
	love.graphics.clear(0.42,0.42,0.42,1)

	love.graphics.printf('0',0,0,VIRTUAL_WIDTH, 'right')

	self.game:CalculateNumber()
	self.game:render()
end