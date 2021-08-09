GridTile = Class{}

function GridTile:init( isbom)
	-- body
	self.isBom = isbom
	self.isHidden = true
	self.numBomNeighbors = 0
end

function GridTile:update( ... )
	-- body
end

function GridTile:render(x,y)
	-- body
	if self.isHidden then
		love.graphics.draw(gTexture['tile'],x,y)
	else
		if self.isBom then
			love.graphics.draw(gTexture['bom'],x,y)
		else
			if self.numBomNeighbors > 0 then
				love.graphics.draw(gTexture[tostring(self.numBomNeighbors)],x,y)
			else
				love.graphics.draw(gTexture['tile_click'],x,y)
			end
		end
	end
end
--end