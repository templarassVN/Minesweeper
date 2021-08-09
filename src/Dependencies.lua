push = require "lib/push"
Class = require "lib/class"
require "src/constant"
require "src/GameGrid"
require "src/GridTile"
love.graphics.setDefaultFilter('nearest','nearest')

gTexture = {
	['tile'] = love.graphics.newImage('image/tile.png'),
	['tile_click'] = love.graphics.newImage('image/tile_depressed.png'),
	['bom'] = love.graphics.newImage('image/bom.png'),

	['1'] = love.graphics.newImage('image/1.png'),
	['2'] = love.graphics.newImage('image/2.png'),
	['3'] = love.graphics.newImage('image/3.png'),
	['4'] = love.graphics.newImage('image/4.png'),
	['5'] = love.graphics.newImage('image/5.png'),
	['6'] = love.graphics.newImage('image/6.png'),
	['7'] = love.graphics.newImage('image/7.png'),
	['8'] = love.graphics.newImage('image/8.png')
}