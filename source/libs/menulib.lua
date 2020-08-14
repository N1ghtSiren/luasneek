currentMenu = nil

function newMenu(rows)
    local t = {}
    for i = 1, rows do
        t[i] = {}
    end
    return t
end

function addButton(menu,rownumber,globalVarName)
    if(menu==nil)then
        return
    end
    local obj = {}
    obj.coln = #menu[rownumber]
    obj.gvar = globalVarName
    obj.text = tostring(_G[obj.gvar])
    table.insert(menu[rownumber],obj)
    return #menu[rownumber]
end

function refreshButtonsText(menu)
    if(menu==nil)then
        return
    end
    for k,t in pairs(menu)do
        for k,v in pairs(t)do
            v.text=_G[v.gvar]
        end
    end
end

function setSelectedButton(menu,coln,rown)
    if(menu==nil)then
        return
    end
    for k,v in pairs(menu)do
        for k,v in pairs(v)do
            v.selected=false
        end
    end
--left/right
    if(coln>0 and coln<=#menu)then
        --print("kekW")
    elseif(coln<1)then
        coln=#menu
    elseif(coln>#menu)then
        coln = 1
    end
--up/down
    if(rown>0 and rown<=#menu[coln])then
        menu[coln][rown].selected = true
    elseif(rown<1)then
        menu[coln][#menu[coln]].selected = true
    elseif(rown>#menu[coln])then
        menu[coln][1].selected = true
    end
end

function getSelectedButton(menu)
    if(menu==nil)then
        return
    end
    local t = menu
    for c=1,#t do
        for r=1,#t[c] do
            if(t[c][r].selected==true)then
                return c,r
            end
        end
    end
end

function setButtonText(menu,coln,rown,text)
    if(menu==nil)then
        return
    end
    menu[coln][rown].text = text
end

function getSelectedButtonText(menu)
    if(menu==nil)then
        return
    end
    local t = menu
    for c=1,#t do
        for r=1,#t[c] do
            if(t[c][r].selected==true)then 
                return t[c][r].text
            end
        end
    end
end

function setMenuTo(menu)
    currentMenu = menu
end

function DrawMenu()
    if(currentMenu==nil)then
        return
    end
    local x = 10
    local y = 30
    local t = currentMenu
    love.graphics.setColor(0.5,0.6,0.9)
    local i = 0
    for c=1,#t do
        for r=1,#t[c] do
            if(t[c][r].selected==true)then
                love.graphics.setColor(0,1,0)
                love.graphics.printf(t[c][r].text, x, y, 999, "left",0)
                love.graphics.setColor(0.5,0.6,0.9)
            else
                love.graphics.printf(t[c][r].text, x, y, 999, "left",0)
            end
            y = y + 20
        end
        i = i + 1
        if(i==1)then
            x = x + 200
        else
            x = x + 100
        end
        y = 30
    end
end
addOnDraw(DrawMenu)
---------------------------------------------------------------------
--usage start:
--[[
visualMenu = newMenu(9)
addButton(visualMenu,1,"locale_grid")
addButton(visualMenu,1,"locale_snake_body")
addButton(visualMenu,1,"locale_snake_head")
addButton(visualMenu,1,"locale_apple")
addButton(visualMenu,1,"locale_borders")
addButton(visualMenu,1,"locale_saveandback")
addButton(visualMenu,1,"locale_menuback")

addButton(visualMenu,2,"grid_sy")
addButton(visualMenu,3,"grid_rr")
addButton(visualMenu,4,"grid_gg")
addButton(visualMenu,5,"grid_bb")
addButton(visualMenu,6,"grid_aa")
addButton(visualMenu,7,"grid_sc")
addButton(visualMenu,8,"grid_ox")
addButton(visualMenu,9,"grid_oy")

--...

setSelectedButton(visualMenu,1,1)

--visual menu controller
local function control(dt)
    if(currentMenu~=visualMenu)then return end
    local m = visualMenu
    local c,r = getSelectedButton(m)
--up
    if(isKeyPressed(key_up,key_up_alt))then
        setSelectedButton(m,c,r-1)
--down
    elseif(isKeyPressed(key_down,key_down_alt))then
        setSelectedButton(m,c,r+1)
--left
    elseif(isKeyPressed(key_left,key_left_alt))then
        setSelectedButton(m,c-1,r)
--right
    elseif(isKeyPressed(key_right,key_right_alt))then
        setSelectedButton(m,c+1,r)
    end

    c,r = getSelectedButton(m)
--settings part
--grid
    if(r==1)then
        if(c==2)then
            if(isKeyPressed(key_confirm,key_confirm_alt,-0.5))then
                EnableTextInputMode(m,c,r,"grid_sy")
            end
        elseif(c==3)then
            -...
        end
    elseif(r==2)then
        --...
    end

    if(isKeyPressed(key_back,key_back_alt))then
        currentMenu=mainMenu
    end
end
addOnUpdate(control)

--tips on screen
local flag1 = false
local flag2 = false
local flag3 = false
local flag4 = false
local function f1()
    love.graphics.setColor(0.5,1,0.5)
    love.graphics.printf(locale_menu_tip_1, 10, 260, 999, "left",0)
end
local function f2()
    love.graphics.setColor(0.5,1,0.5)
    love.graphics.printf(locale_menu_tip_2, 10, 260, 999, "left",0)
end
local function f3()
    love.graphics.setColor(0.5,1,0.5)
    love.graphics.printf(locale_menu_tip_3, 10, 0, 999, "left",0)
    love.graphics.printf(locale_menu_tip_4, 210, 0, 999, "left",0)
    love.graphics.printf(locale_menu_tip_5, 310, 0, 999, "left",0)
    love.graphics.printf(locale_menu_tip_6, 10, 300, 999, "left",0)
    love.graphics.printf(locale_menu_tip_7, 10, 320, 999, "left",0)
    love.graphics.printf(locale_menu_tip_8, 10, 340, 999, "left",0)
    love.graphics.printf(locale_menu_tip_9, 10, 360, 999, "left",0)
end
local function f4()
    love.graphics.setColor(1,1,1)
    love.graphics.printf(locale_menu_tip_10, 10, 260, 999, "left",0)
end

local function fu()
    local m = currentMenu
    local c,r = getSelectedButton(m)
    flag1 = drawIf(flag1,f1,1,(currentMenu==controlsMenu and c==1 and r==9))
    flag2 = drawIf(flag2,f2,1,(currentMenu==controlsMenu and c==1 and r==10))
    flag3 = drawIf(flag3,f3,1,currentMenu==controlsMenu)
    flag4 = drawIf(flag4,f4,1,keyRecordFlag)

    --return before checking pressed keys to not steal input
end
addOnUpdate(fu)
]]--
--usage end
---------------------------------------------------------------------