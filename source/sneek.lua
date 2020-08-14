function startClassic(speed,fieldsize)
	---------------------------------------------------------------------------
	fieldsize=fieldsize +1
	----init start

	math.randomseed(os.time())
	setDrawGroupMode(1,false)
	setUpdateGroupMode(1,false)
	currentMenu = nil

	local gameEnded = false
	local ispaused = false
	local isdefeat = false

	local time = 0
	local score = 0

	local scores = {}
	scores.name = "dev"
	scores.score = 73

	addDrawGroup(2)
	addUpdateGroup(2)
	setDrawGroupMode(1,true)
	setUpdateGroupMode(1,true)
	----init end
	---------------------------------------------------------------------------
	----game logic start
	--game field
	local hit = {}
	local fields = {}
	local x,y 
	for x = 0, fieldsize do
		fields[x] = {}
		for y = 0, fieldsize do
			fields[x][y] = {}
			--props
			fields[x][y].isoccupied=0
			fields[x][y].issneek=0
		end
	end
	for x = 0, fieldsize do
		fields[x][0].isoccupied=1
		fields[x][fieldsize].isoccupied=1
	end
	for y = 0, fieldsize do
		fields[0][y].isoccupied=1
		fields[fieldsize][y].isoccupied=1
	end
	--game field end
	--apple start
	local apple = {math.random(1,fieldsize-1),math.random(1,fieldsize-1)}

	function newApple()
		local x,y
		while(true)do
			x = math.random(1,fieldsize-1)
			y = math.random(1,fieldsize-1)
			if(fields[x][y].isoccupied==0 and fields[x][y].issneek==0)then
				apple = {x,y}
				break
			end
		end
	end
	newApple()
	--apple end
	--sneek logic start
	local lastkey = "d"
	local sneeklen
	local sneek = {}
	local lastmove = "d"
	sneek[1] = {1,1}  --head

	local function sneekMove(string)
		--[up]				[x,y+1]
		--[l][r]	[x-1,y]			[x+1,y]
		--[down]			[x,y-1]
		local sneeklen = #sneek

		if(string=="w" and lastmove ~="s")then 
			x = sneek[1][1]
			y = sneek[1][2]-1
			lastmove = "w"
		elseif(string=="a" and lastmove ~="d")then
			x = sneek[1][1]-1
			y = sneek[1][2]
			lastmove = "a"
		elseif(string=="d" and lastmove ~="a")then
			x = sneek[1][1]+1
			y = sneek[1][2]
			lastmove = "d"
		elseif(string=="s" and lastmove ~="w")then
			x = sneek[1][1]
			y = sneek[1][2]+1
			lastmove = "s"
		end

		--apple eaten
		if(sneek[1][1]==apple[1]and sneek[1][2]==apple[2])then sneeklen=sneeklen+1; newApple() end
		if(fields[x][y].isoccupied==1 or fields[x][y].issneek==1)then hit={x,y};isdefeat=true;Defeat(speed,fieldsize,score,time);return end

		--move sneek
		local cx,cy = x,y --current xy
		local px,py --prev xy
		for i = 1, sneeklen do
			if(sneek[i]==nil)then sneek[i] = {} end
			px=sneek[i][1]
			py=sneek[i][2]
			sneek[i][1]=cx
			sneek[i][2]=cy
			cx,cy=px,py
		end

		--update fields
		for x = 1,fieldsize-1 do
			for y = 1,fieldsize-1 do
				fields[x][y].issneek = 0
			end
		end
		for i=1,#sneek do
			x,y = sneek[i][1],sneek[i][2]
			fields[x][y].issneek = 1
		end
	end
	--sneek logic end
	--sneek controls start
	local pausecd = 0
	local canpause = true
	local function control(dt)
		pausecd = pausecd + dt
		if(pausecd>=0.5)then
		 	canpause=true
		else
			canpause=false
		end
		if(ispaused and canpause and isKeyPressed(key_back,key_back_alt,0))then
			ispaused=not ispaused
		elseif(not ispaused and isKeyPressed(key_back,key_back_alt,-0.15))then
			ispaused=not ispaused
		end
		if(ispaused)then
			return
		end
		if(isdefeat)then
			return true
		end
		
		if(lastmove~="s" and isKeyPressed(key_up,key_up_alt,0.15))then 
			lastkey = "w"
		elseif(lastmove~="d" and isKeyPressed(key_left,key_left_alt,0.15))then
			lastkey = "a"
		elseif(lastmove~="w" and isKeyPressed(key_down,key_down_alt,0.15))then
			lastkey = "s"
		elseif(lastmove~="a" and isKeyPressed(key_right,key_right_alt,0.15))then
			lastkey = "d"
		end
	end
	addOnUpdate(control,2)
	--sneek controls end
	--main tickrate start
	local ticktime = 0
	local function tick(dt)
		if(ispaused or isdefeat)then goto endW end

		ticktime = ticktime + dt
		if(ticktime<=(1/speed))then goto endW end
		ticktime = 0
		time = time + 1
		
		sneekMove(lastkey)
		::endW::
	end
	addOnUpdate(tick,2)
	--main tickrate end
	----game logic end
	---------------------------------------------------------------------------
	--draw start

	local function screenInfo()
		score = #sneek

		local lowerscore,lowername
		local higherscore,highername

		if(scores.score<score)then
			lowerscore = scores.score
			lowername = scores.name
		end
		if(scores.score>score)then
			higherscore = scores.score
			highername = scores.name
		end

		love.graphics.setColor(0,1,0)
		--places
		if(higherscore~=nil)then
			love.graphics.printf(locale_game_tip_1..highername.." "..higherscore,0,-5+grid_sc*(fieldsize+1),999,"left")
			love.graphics.printf(locale_game_tip_2..locale_game_tip_3..score,0,15+grid_sc*(fieldsize+1),999,"left")
		else
			love.graphics.printf(locale_game_tip_4 ..locale_game_tip_3..score,0,-5+grid_sc*(fieldsize+1),999,"left")
			love.graphics.printf(locale_game_tip_5..lowername.." "..lowerscore,0,15+grid_sc*(fieldsize+1),999,"left")
		end
		if(lowerscore~=nil and higherscore~=nil)then
			love.graphics.printf(locale_game_tip_5..lowername.." "..lowerscore,0,35+grid_sc*(fieldsize+1),999,"left")
		elseif(lowerscore==nil and higherscore==nil)then

		end
		--
		love.graphics.printf(locale_game_tip_6..time,140,-5+grid_sc*(fieldsize+1),999,"left")
		love.graphics.printf(locale_game_tip_7..speed,140,15+grid_sc*(fieldsize+1),999,"left")
		love.graphics.printf(locale_game_tip_8..key_back,255,-5+grid_sc*(fieldsize+1),999,"left")
		if(ispaused)then
			love.graphics.printf(locale_game_tip_9,20,0,999,"left")
		end
	end
	addOnDraw(screenInfo,2)

	local function drawGrid()
		love.graphics.setColor(grid_rr,grid_gg,grid_bb,grid_aa)
		for x = 0, fieldsize do
			for y = 0, fieldsize do
				love.graphics.rectangle("line",grid_ox+x*grid_sc,grid_oy+y*grid_sc,grid_sc,grid_sc)
			end
		end
        return gameEnded
	end
	addOnDraw(drawGrid,2)

	local function drawSneek()
		local head_sy = head_sy
		love.graphics.setFont(font_game)
--head	
		love.graphics.setColor(head_rr,head_gg,head_bb,head_aa)
		if(isdefeat)then
			love.graphics.setColor(1,1,0)
		end

		local x,y = sneek[1][1],sneek[1][2]
		if(head_direction=="true")then
			head_sy=lastmove
		end
		love.graphics.printf(head_sy,head_ox+grid_sc*x,head_oy+grid_sc*y,999,"left",0,head_sc*game_font_scale,head_sc*game_font_scale)
--body
		love.graphics.setColor(body_rr,body_gg,body_bb,body_aa)
		for i=2,#sneek do
			x,y = sneek[i][1],sneek[i][2]
			if(x==hit[1]and y==hit[2])then
				love.graphics.setColor(1,1,0)
				love.graphics.printf(body_sy,body_ox+grid_sc*x,body_oy+grid_sc*y,999,"left",0,body_sc*game_font_scale,body_sc*game_font_scale)
				love.graphics.setColor(body_rr,body_gg,body_bb,body_aa)
			else
				love.graphics.printf(body_sy,body_ox+grid_sc*x,body_oy+grid_sc*y,999,"left",0,body_sc*game_font_scale,body_sc*game_font_scale)
			end
		end

		love.graphics.setFont(font_menues)
	end
	addOnDraw(drawSneek,2)

	local function drawApple()
		love.graphics.setFont(font_game)

		love.graphics.setColor(apple_rr,apple_gg,apple_bb,aple_aa)
		local x,y = apple[1],apple[2]
		love.graphics.printf(apple_sy,apple_ox+grid_sc*x,apple_oy+grid_sc*y,999,"left",0,apple_sc*game_font_scale,apple_sc*game_font_scale)

		love.graphics.setFont(font_menues)
	end
	addOnDraw(drawApple,2)

	local function drawBorders()
		love.graphics.setFont(font_game)
		
		love.graphics.setColor(bord_rr,bord_gg,bord_bb,bord_aa)
		for x = 0,fieldsize do
			for y = 0,fieldsize do
				if(fields[x][y].isoccupied==1)then

					if(x==hit[1]and y==hit[2])then
						love.graphics.setColor(1,1,0)
						love.graphics.printf(bord_sy,bord_ox+x*grid_sc,bord_oy+y*grid_sc,999,"left",0,bord_sc*game_font_scale,bord_sc*game_font_scale)
						love.graphics.setColor(bord_rr,bord_gg,bord_bb,bord_aa)
					else
						love.graphics.printf(bord_sy,bord_ox+x*grid_sc,bord_oy+y*grid_sc,999,"left",0,bord_sc*game_font_scale,bord_sc*game_font_scale)
					end
				end
			end
		end

		love.graphics.setFont(font_menues)
	end
	addOnDraw(drawBorders,2)

	--draw end
	---------------------------------------------------------------------------
end
function Defeat(speed,fieldsize,score,time)

	local function draw()
		love.graphics.setFont(font_menues)
		love.graphics.setColor(1,0,0,0.6)
		if(score>73)then
			love.graphics.printf(locale_game_tip_18,grid_sc,20,999,"left")
		else
			love.graphics.printf(locale_game_tip_10,grid_sc,20,999,"left")
		end
		love.graphics.setColor(0,1,0,0.6)
		love.graphics.printf(locale_game_tip_11..score,grid_sc,40,999,"left")
		love.graphics.printf(locale_game_tip_12..speed,grid_sc,60,999,"left")
		love.graphics.printf(locale_game_tip_13..fieldsize,grid_sc,80,999,"left")
		love.graphics.printf(locale_game_tip_14..time..locale_game_tip_15,grid_sc,100,999,"left")
		love.graphics.printf(locale_game_tip_16..key_back,grid_sc,120,999,"left")
		love.graphics.printf(locale_game_tip_17..key_confirm,grid_sc,140,999,"left")
	end
	addOnDraw(draw,2,1)

	local function controls()

		if(isKeyPressed(key_back,key_back_alt))then
			removeOnDrawGroup(2)
			removeOnUpdateGroup(2)
			currentMenu = classicMenu
			setDrawGroupMode(1,true)
			setUpdateGroupMode(1,true)
			love.window.setMode(1000,600)
		elseif(isKeyPressed(key_confirm,key_confirm_alt))then
			removeOnDrawGroup(2)
			removeOnUpdateGroup(2)
			startClassic(game_speed,game_field)
		end
	end
	addOnUpdate(controls,2)
end