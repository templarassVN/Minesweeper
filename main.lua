require "src/Dependencies"
math.randomseed(os.time())



function love.load( ... )
	-- body
	push:setupScreen(VIRTUAL_WIDTH,VIRTUAL_HEIGHT,WINDOW_WIDTH, WINDOW_HEIGHT)
	
	gStateMachine = StateMachine{
		['title'] = function() return TitleState( ) end,
		['play'] = function() return PlayState(  ) end,
		['victory'] = function() return VictoryState() end,
		['lose'] = function() return GameOverState() end
			-- body
	}

	gStateMachine:change('title')

	love.mouse.buttonpressed = {}
	love.keyboard.keypressed = {}
end

function love.mousepressed(x,y,button,istouch,presses)
	-- body
	love.mouse.buttonpressed[button] = true
	
end

function love.mouse.wasPressed( button )
	-- 
	local flag = love.mouse.buttonpressed[button]
	love.mouse.buttonpressed = {}
	return flag

end

function love.keyboard.wasPressed( key )
	-- body
	return love.keyboard.keypressed[key]
end

function love.keypressed( key )
	-- body
	if key == 'escape' then
		love.event.quit()
	end
	
	love.keyboard.keypressed[key] = true
end



function love.update( dt )
	-- body
	gStateMachine:update(dt)

	love.keyboard.keypressed = {}
end

function love.draw( ... )
	-- body
	push:start()
	gStateMachine:render()
	push:finish()
end