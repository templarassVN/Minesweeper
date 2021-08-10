TitleState = Class{__includes = BaseState}

function TitleState:init( ... )
	-- body
end

function TitleState:update( dt )
	-- body
	print('call titleupdate')
	if love.keyboard.wasPressed('return') then
		gStateMachine:change('play')
	end
end

function TitleState:render( ... )
	-- body
	love.graphics.printf('Minesweeper',0,VIRTUAL_HEIGHT /2 -8, VIRTUAL_WIDTH,'center')
	love.graphics.printf('Enter to play',0
		,VIRTUAL_HEIGHT /2 - 20, VIRTUAL_WIDTH,'center')
end