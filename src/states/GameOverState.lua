GameOverState = Class{__includes = BaseState}

function GameOverState:init( ... )
	-- body
end

function GameOverState:update( ... )
	-- body
	if love.keyboard.wasPressed('return') then
		gStateMachine:change('play')
	end
end

function GameOverState:render( ... )
	-- body
	love.graphics.printf('GAMEOVER',0,VIRTUAL_HEIGHT /2 -8, VIRTUAL_WIDTH,'center')
	love.graphics.printf('Enter to play',0
		,VIRTUAL_HEIGHT /2 - 20, VIRTUAL_WIDTH,'center')
end