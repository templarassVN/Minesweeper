GameGrid = Class{}
local x_2light, y_2light

function GameGrid:init(width,height)
	-- body
	self.width = width
	self.height = height

	self.MARGIN_x = (VIRTUAL_WIDTH - self.width *TILE_SIZE) /2
	self.MARGIN_y = (VIRTUAL_HEIGHT - self.height *TILE_SIZE) /2
	self.grid = {}

	for y = 1,self.height do
		table.insert(self.grid,{})
		for x = 1,self.width do
			local isBom = math.random(10)==1 and true or false
			local tile = GridTile(isBom)

			
			table.insert(self.grid[y],tile)
		
		end
	end
end

function GameGrid:CalculateNumber()
	-- body
	for y = 1,self.height do
		for x = 1,self.width do
			local num = 0
			--TOPLEFT
			if x > 1 and y > 1 then
				if self.grid[y-1][x-1].isBom then
					num = num + 1
				end
			end
			-- top
			if y > 1 then
				if self.grid[y-1][x].isBom then
					num = num + 1
				end
			end
			--topright
			if y > 1 and x < self.width then
				if self.grid[y-1][x+1].isBom then
					num = num +1
				end
			end
			--right
			if x < self.width then
				if self.grid[y][x+1].isBom then
					num = num +1
				end
			end
			--left
			if x > 1 then
				if self.grid[y][x-1].isBom then
					num=num+1
				end
			end
			--botright
			if x < self.width and y < self.height then
				if self.grid[y+1][x+1].isBom then
					num = num +1
				end
			end
			--botleft
			if x > 1 and y < self.height then
				if self.grid[y+1][x-1].isBom then
					num = num +1
				end
			end
			--bot
			if y < self.height then
				if self.grid[y+1][x].isBom then
					num = num +1
				end
			end
		self.grid[y][x].numBomNeighbors = num	
		end
	end
end

function GameGrid:update(dt)
	-- body
	x_2light, y_2light= push:toGame(love.mouse.getPosition())	
end

function GameGrid:revealTiles(x,y)
	-- body
	if self.grid[y][x].isBom or not self.grid[y][x].isHidden then self.grid[y][x].isHidden = false return end

	self.grid[y][x].isHidden = false

	local tile = self.grid[y][x]

	if tile.numBomNeighbors == 0 then
		--top
		if y > 1 then
			self:revealTiles(x,y-1)
		end
		--bot
		if y < self.height then
			self:revealTiles(x,y+1)
		end
		--left
		if x > 1 then
			self:revealTiles(x-1,y)
		end
		--right
		if x < self.width then
			self:revealTiles(x+1,y)
		end
	end
end

function GameGrid:render( ... )
	-- body
	for y = 1,self.height do
		for x = 1,self.width do

			self.grid[y][x]:render(self.MARGIN_x+(x-1)*TILE_SIZE, self.MARGIN_y + (y-1) * TILE_SIZE)

			if x_2light >= self.MARGIN_x+(x-1)*TILE_SIZE and x_2light < self.MARGIN_x+(x-1)*TILE_SIZE + TILE_SIZE then
				if y_2light >= self.MARGIN_y+(y-1)*TILE_SIZE and y_2light < self.MARGIN_y+(y-1)*TILE_SIZE + TILE_SIZE then
					--color 2light
					love.graphics.setColor(1,1,1,0.3)
					love.graphics.rectangle('fill',self.MARGIN_x+(x-1)*TILE_SIZE,self.MARGIN_y+(y-1)*TILE_SIZE,TILE_SIZE,TILE_SIZE)
					-- reset color
					love.graphics.setColor(1,1,1,1)
					-- click reveal
					if love.mouse.wasPressed(1) then
						love.graphics.print('click',self.MARGIN_x+(x-1)*TILE_SIZE,self.MARGIN_y+(y-1)*TILE_SIZE)
						self:revealTiles(x,y)
					end
				end
			end

		end
	end
	love.graphics.print(tostring(x_2light) .."," .. tostring(y_2light),x_2light, y_2light)
end