---------------------------------------------------------------------
--lazy config
font_menues = love.graphics.newFont("comicsans.ttf", 20)


love.graphics.setFont(font_menues)
love.window.setMode(1000,600)

require("libs/addon")
require("libs/menulib")
require("libs/mylib")
---------------------------------------------------------------------
canDoInit = false
require("locales")
require("libs/settings")
require("sneek")