require "src/Dependencies"
math.randomseed(os.time())

local game = GameGrid(GRID_SIZE,GRID_SIZE)

function love.load( ... )
	-- body
	push:setupScreen(VIRTUAL_WIDTH,VIRTUAL_HEIGHT,WINDOW_WIDTH, WINDOW_HEIGHT)
	grid = {}
	
	love.mouse.buttonpressed = {}
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

function love.keypressed( key )
	-- body
	if key == 'escape' then
		love.event.quit()
	end
end

function love.update( dt )
	-- body
	game:update(dt)
	
	
end

function love.draw( ... )
	-- body
	push:start()
	love.graphics.clear(0.42,0.42,0.42,1)

	love.graphics.printf('0',0,0,VIRTUAL_WIDTH, 'right')

	game:CalculateNumber()
	game:render()
	push:finish()
end