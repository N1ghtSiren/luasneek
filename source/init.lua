---------------------------------------------------------------------
--menues init start
addDrawGroup(1)
addUpdateGroup(1)
---------------------------------------------------------------------
--main menu start
mainMenu = newMenu(1)
addButton(mainMenu,1,"locale_startGame")
addButton(mainMenu,1,"locale_leaderBoard")
addButton(mainMenu,1,"locale_controls")
addButton(mainMenu,1,"locale_visuals")
addButton(mainMenu,1,"locale_moresettings")
addButton(mainMenu,1,"locale_languages")
addButton(mainMenu,1,"locale_exit")
setSelectedButton(mainMenu,1,1)
currentMenu = mainMenu

local function control(dt)
    if(currentMenu~=mainMenu)then
        return
    end
    local m = mainMenu
    local c,r = getSelectedButton(m)
--up
    if(isKeyPressed(key_up,key_up_alt))then
        setSelectedButton(m,c,r-1)
--down
    elseif(isKeyPressed(key_down,key_down_alt))then
        setSelectedButton(m,c,r+1)
    end
    
    c,r = getSelectedButton(m)
    if(r==1)then
        if(isKeyPressed(key_confirm,key_confirm_alt))then
            currentMenu=startMenu
        end
    
    elseif(r==2)then
        if(isKeyPressed(key_confirm,key_confirm_alt))then
            
        end
    elseif(r==3)then
        if(isKeyPressed(key_confirm,key_confirm_alt))then
            currentMenu=controlsMenu
        end
    elseif(r==4)then
        if(isKeyPressed(key_confirm,key_confirm_alt))then
            currentMenu=visualMenu
        end
        
    elseif(r==5)then
        if(isKeyPressed(key_confirm,key_confirm_alt))then
            currentMenu=settingsMenu
        end
    elseif(r==6)then
        if(isKeyPressed(key_confirm,key_confirm_alt))then
            currentMenu=langMenu
        end
    elseif(r==7)then
        if(isKeyPressed(key_confirm,key_confirm_alt))then
            love.event.quit()
        end
    end
end
addOnUpdate(control)

--animation smth smth
local rrbb = 1
local gg = 0.0
local flag = true
local function f()
    if(gg>=0.0 and gg<=1.0)then
        if(flag)then
            gg=gg+0.005
            rrbb=rrbb-0.005
        else
            gg=gg-0.005
            rrbb=rrbb+0.005
        end
    end
    if(gg<=0.0)then
        gg=0.0
        flag = true
    elseif(gg>=1.0)then
        gg=1.0
        flag = false
    end
    love.graphics.setColor(rrbb,gg,rrbb)
    love.graphics.printf(locale_sneek, 10, 0, 999, "left",0)
end

local drawsneekflag = false
local function fu()
    drawsneekflag = drawIf(drawsneekflag,f,1,(currentMenu==mainMenu or currentMenu==startMenu or currentMenu==langMenu or currentMenu==classicMenu or currentMenu==settingsMenu))
end
addOnUpdate(fu)

--main menu end
---------------------------------------------------------------------
--start menu start

startMenu = newMenu(1)

addButton(startMenu,1,"locale_classic")
addButton(startMenu,1,"locale_custom")
addButton(startMenu,1,"locale_menuback")
setSelectedButton(startMenu,1,1)

local function control(dt)
    if(currentMenu~=startMenu)then return end
    local m = startMenu
    local c,r = getSelectedButton(m)
--up
    if(isKeyPressed(key_up,key_up_alt))then
        setSelectedButton(m,c,r-1)
--down
    elseif(isKeyPressed(key_down,key_down_alt))then
        setSelectedButton(m,c,r+1)
    end

    c,r = getSelectedButton(m)
    if(r==1)then
        if(isKeyPressed(key_confirm,key_confirm_alt))then
            currentMenu=classicMenu
        end
    elseif(r==2)then
        if(isKeyPressed(key_confirm,key_confirm_alt))then
            
        end
    elseif(r==3)then
        if(isKeyPressed(key_confirm,key_confirm_alt))then
            currentMenu=mainMenu
        end
    end
    if(isKeyPressed(key_back,key_back_alt))then
        currentMenu=mainMenu
    end
end
addOnUpdate(control)


local function f1()
    love.graphics.setColor(0.5,1,0.5)
    love.graphics.printf(locale_menu_tip_33, 10, 100, 999, "left",0)
    love.graphics.printf(locale_menu_tip_34, 10, 120, 999, "left",0)
    love.graphics.printf(locale_menu_tip_35, 10, 140, 999, "left",0)
    love.graphics.printf(locale_menu_tip_36, 10, 160, 999, "left",0)
    love.graphics.printf(locale_menu_tip_37, 10, 180, 999, "left",0)
    love.graphics.printf(locale_menu_tip_38, 10, 200, 999, "left",0)
end
local function f2()
    love.graphics.setColor(0.5,1,0.5)
    love.graphics.printf(locale_menu_tip_39, 10, 100, 999, "left",0)
    love.graphics.printf(locale_menu_tip_40, 10, 120, 999, "left",0)
    love.graphics.printf(locale_menu_tip_41, 10, 140, 999, "left",0)
    love.graphics.printf(locale_menu_tip_42, 10, 160, 999, "left",0)
    love.graphics.printf(locale_menu_tip_43, 10, 180, 999, "left",0)
end

local flag1 = false
local flag2 = false
local function fu()
    local m = currentMenu
    local c,r = getSelectedButton(m)

    flag1 = drawIf(flag1,f1,1,r==1 and currentMenu==startMenu)
    flag2 = drawIf(flag2,f2,1,r==2 and currentMenu==startMenu)

    if(currentMenu~=startMenu)then return end
end
addOnUpdate(fu)

--start menu end
---------------------------------------------------------------------
--controls menu start
controlsMenu = newMenu(3)

addButton(controlsMenu,1,"locale_up")
addButton(controlsMenu,1,"locale_down")
addButton(controlsMenu,1,"locale_left")
addButton(controlsMenu,1,"locale_right")
addButton(controlsMenu,1,"locale_increase")
addButton(controlsMenu,1,"locale_decrease")
addButton(controlsMenu,1,"locale_back")
addButton(controlsMenu,1,"locale_confirm")
addButton(controlsMenu,1,"locale_saveandback")
addButton(controlsMenu,1,"locale_menuback")

addButton(controlsMenu,2,"key_up")
addButton(controlsMenu,3,"key_up_alt")
addButton(controlsMenu,2,"key_down")
addButton(controlsMenu,3,"key_down_alt")
addButton(controlsMenu,2,"key_left")
addButton(controlsMenu,3,"key_left_alt")
addButton(controlsMenu,2,"key_right")
addButton(controlsMenu,3,"key_right_alt")
addButton(controlsMenu,2,"key_increase")
addButton(controlsMenu,3,"key_increase_alt")
addButton(controlsMenu,2,"key_decrease")
addButton(controlsMenu,3,"key_decrease_alt")
addButton(controlsMenu,2,"key_back")
addButton(controlsMenu,3,"key_back_alt")
addButton(controlsMenu,2,"key_confirm")
addButton(controlsMenu,3,"key_confirm_alt")
setSelectedButton(controlsMenu,1,1)

local function control(dt)
    if(currentMenu~=controlsMenu)then return end
    local m = controlsMenu
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
    if(r==1)then
        if(c==2)then
            if(isKeyPressed(key_confirm,key_confirm_alt,-0.5))then
                EnableCatchKeyMode(m,c,r,"key_up")
            end
        elseif(c==3)then
            if(isKeyPressed(key_confirm,key_confirm_alt,-0.5))then
                EnableCatchKeyMode(m,c,r,"key_up_alt")
            end
        end
    elseif(r==2)then
        if(c==2)then
            if(isKeyPressed(key_confirm,key_confirm_alt,-0.5))then
                EnableCatchKeyMode(m,c,r,"key_down")
            end
        elseif(c==3)then
            if(isKeyPressed(key_confirm,key_confirm_alt,-0.5))then
                EnableCatchKeyMode(m,c,r,"key_down_alt")
            end
        end
    elseif(r==3)then
        if(c==2)then
            if(isKeyPressed(key_confirm,key_confirm_alt,-0.5))then
                EnableCatchKeyMode(m,c,r,"key_left")
            end
        elseif(c==3)then
            if(isKeyPressed(key_confirm,key_confirm_alt,-0.5))then
                EnableCatchKeyMode(m,c,r,"key_left_alt")
            end
        end
    elseif(r==4)then
        if(c==2)then
            if(isKeyPressed(key_confirm,key_confirm_alt,-0.5))then
                EnableCatchKeyMode(m,c,r,"key_right")
            end
        elseif(c==3)then
            if(isKeyPressed(key_confirm,key_confirm_alt,-0.5))then
                EnableCatchKeyMode(m,c,r,"key_right_alt")
            end
        end
    elseif(r==5)then
        if(c==2)then
            if(isKeyPressed(key_confirm,key_confirm_alt,-0.5))then
                EnableCatchKeyMode(m,c,r,"key_increase")
            end
        elseif(c==3)then
            if(isKeyPressed(key_confirm,key_confirm_alt,-0.5))then
                EnableCatchKeyMode(m,c,r,"key_increase_alt")
            end
        end
    elseif(r==6)then
        if(c==2)then
            if(isKeyPressed(key_confirm,key_confirm_alt,-0.5))then
                EnableCatchKeyMode(m,c,r,"key_decrease")
            end
        elseif(c==3)then
            if(isKeyPressed(key_confirm,key_confirm_alt,-0.5))then
                EnableCatchKeyMode(m,c,r,"key_decrease_alt")
            end
        end
    elseif(r==7)then
        if(c==2)then
            if(isKeyPressed(key_confirm,key_confirm_alt,-0.75))then
                EnableCatchKeyMode(m,c,r,"key_back")
            end
        elseif(c==3)then
            if(isKeyPressed(key_confirm,key_confirm_alt,-0.75))then
                EnableCatchKeyMode(m,c,r,"key_back_alt")
            end
        end
    elseif(r==8)then
        if(c==2)then
            if(isKeyPressed(key_confirm,key_confirm_alt,-0.75))then
                EnableCatchKeyMode(m,c,r,"key_confirm")
            end
        elseif(c==3)then
            if(isKeyPressed(key_confirm,key_confirm_alt,-0.75))then
                EnableCatchKeyMode(m,c,r,"key_confirm_alt")
            end
        end   
    --save and back
    elseif(r==9)then
        if(c==1)then
            if(isKeyPressed(key_confirm,key_confirm_alt))then
                writeConfig()
                currentMenu=mainMenu
            end
        end
    --back
    elseif(r==10)then
        if(c==1)then
            if(isKeyPressed(key_confirm,key_confirm_alt))then
                currentMenu=mainMenu
            end
        end
    end
    if(isKeyPressed(key_back,key_back_alt))then
        currentMenu=mainMenu
    end
    --
end
addOnUpdate(control)

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
    flag4 = drawIf(flag4,f4,1,keyRecordFlag and currentMenu==controlsMenu)

    if(m~=controlsMenu)then return end
    if(isKeyPressed("f1")and(currentMenu==controlsMenu))then
        loadConfig()
        refreshButtonsText(controlsMenu)

    elseif(isKeyPressed("f5")and(currentMenu==controlsMenu))then
        key_up="w"
        key_up_alt="up"
        key_down="s"
        key_down_alt="down"
        key_left="a"
        key_left_alt="left"
        key_right="d"
        key_right_alt="right"
        key_increase="e"
        key_increase_alt="kp+"
        key_decrease="q"
        key_decrease_alt="kp-"
        key_confirm="return"
        key_confirm_alt="space"
        key_back="escape"
        key_back_alt="backspace"
        refreshButtonsText(controlsMenu)

        writeConfig()
        loadConfig()
    end
end
addOnUpdate(fu)

--controls menu end
---------------------------------------------------------------------
--visual menu start

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

addButton(visualMenu,2,"body_sy")
addButton(visualMenu,3,"body_rr")
addButton(visualMenu,4,"body_gg")
addButton(visualMenu,5,"body_bb")
addButton(visualMenu,6,"body_aa")
addButton(visualMenu,7,"body_sc")
addButton(visualMenu,8,"body_ox")
addButton(visualMenu,9,"body_oy")

addButton(visualMenu,2,"head_sy")
addButton(visualMenu,3,"head_rr")
addButton(visualMenu,4,"head_gg")
addButton(visualMenu,5,"head_bb")
addButton(visualMenu,6,"head_aa")
addButton(visualMenu,7,"head_sc")
addButton(visualMenu,8,"head_ox")
addButton(visualMenu,9,"head_oy")

addButton(visualMenu,2,"apple_sy")
addButton(visualMenu,3,"apple_rr")
addButton(visualMenu,4,"apple_gg")
addButton(visualMenu,5,"apple_bb")
addButton(visualMenu,6,"apple_aa")
addButton(visualMenu,7,"apple_sc")
addButton(visualMenu,8,"apple_ox")
addButton(visualMenu,9,"apple_oy")

addButton(visualMenu,2,"bord_sy")
addButton(visualMenu,3,"bord_rr")
addButton(visualMenu,4,"bord_gg")
addButton(visualMenu,5,"bord_bb")
addButton(visualMenu,6,"bord_aa")
addButton(visualMenu,7,"bord_sc")
addButton(visualMenu,8,"bord_ox")
addButton(visualMenu,9,"bord_oy")

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
            if(isKeyPressed(key_decrease,key_decrease_alt,0.1))then
                grid_rr=mathfix(grid_rr-0.01) 
                setButtonText(m,c,r,grid_rr)
            elseif(isKeyPressed(key_increase,key_increase_alt,0.1))then
                grid_rr=mathfix(grid_rr+0.01) 
                setButtonText(m,c,r,grid_rr)
            end
        elseif(c==4)then
            if(isKeyPressed(key_decrease,key_decrease_alt,0.1))then
                grid_gg=mathfix(grid_gg-0.01)
                setButtonText(m,c,r,grid_gg)
            elseif(isKeyPressed(key_increase,key_increase_alt,0.1))then
                grid_gg=mathfix(grid_gg+0.01)
                setButtonText(m,c,r,grid_gg)
            end
        elseif(c==5)then
            if(isKeyPressed(key_decrease,key_decrease_alt,0.1))then
                grid_bb=mathfix(grid_bb-0.01)
                setButtonText(m,c,r,grid_bb)
            elseif(isKeyPressed(key_increase,key_increase_alt,0.1))then
                grid_bb=mathfix(grid_bb+0.01)
                setButtonText(m,c,r,grid_bb)
            end
        elseif(c==6)then
            if(isKeyPressed(key_decrease,key_decrease_alt,0.1))then
                grid_aa=mathfix(grid_aa-0.01)
                setButtonText(m,c,r,grid_aa)
            elseif(isKeyPressed(key_increase,key_increase_alt,0.1))then
                grid_aa=mathfix(grid_aa+0.01)
                setButtonText(m,c,r,grid_aa)
            end
        elseif(c==7)then
            if(isKeyPressed(key_decrease,key_decrease_alt))then
                grid_sc=mathfix(round(grid_sc-1),1,40)
                setButtonText(m,c,r,grid_sc)
            elseif(isKeyPressed(key_increase,key_increase_alt))then
                grid_sc=mathfix(round(grid_sc+1),1,40)
                setButtonText(m,c,r,grid_sc)
            end
        elseif(c==8)then
            if(isKeyPressed(key_decrease,key_decrease_alt))then
                grid_ox=mathfix(round(grid_ox-1),-40,40)
                setButtonText(m,c,r,grid_ox)
            elseif(isKeyPressed(key_increase,key_increase_alt))then
                grid_ox=mathfix(round(grid_ox+1),-40,40)
                setButtonText(m,c,r,grid_ox)
            end
        elseif(c==9)then
            if(isKeyPressed(key_decrease,key_decrease_alt))then
                grid_oy=mathfix(round(grid_oy-1),-40,40)
                setButtonText(m,c,r,grid_oy)
            elseif(isKeyPressed(key_increase,key_increase_alt))then
                grid_oy=mathfix(round(grid_oy+1),-40,40)
                setButtonText(m,c,r,grid_oy)
            end
        end
--body
    elseif(r==2)then
        if(c==2)then
            if(isKeyPressed(key_confirm,key_confirm_alt,-0.5))then
                EnableTextInputMode(m,c,r,"body_sy")
            end
        elseif(c==3)then
            if(isKeyPressed(key_decrease,key_decrease_alt,0.1))then
                body_rr=mathfix(body_rr-0.01) 
                setButtonText(m,c,r,body_rr)
            elseif(isKeyPressed(key_increase,key_increase_alt,0.1))then
                body_rr=mathfix(body_rr+0.01) 
                setButtonText(m,c,r,body_rr)
            end
        elseif(c==4)then
            if(isKeyPressed(key_decrease,key_decrease_alt,0.1))then
                body_gg=mathfix(body_gg-0.01)
                setButtonText(m,c,r,body_gg)
            elseif(isKeyPressed(key_increase,key_increase_alt,0.1))then
                body_gg=mathfix(body_gg+0.01)
                setButtonText(m,c,r,body_gg)
            end
        elseif(c==5)then
            if(isKeyPressed(key_decrease,key_decrease_alt,0.1))then
                body_bb=mathfix(body_bb-0.01)
                setButtonText(m,c,r,body_bb)
            elseif(isKeyPressed(key_increase,key_increase_alt,0.1))then
                body_bb=mathfix(body_bb+0.01)
                setButtonText(m,c,r,body_bb)
            end
        elseif(c==6)then
            if(isKeyPressed(key_decrease,key_decrease_alt,0.1))then
                body_aa=mathfix(body_aa-0.01)
                setButtonText(m,c,r,body_aa)
            elseif(isKeyPressed(key_increase,key_increase_alt,0.1))then
                body_aa=mathfix(body_aa+0.01)
                setButtonText(m,c,r,body_aa)
            end
        elseif(c==7)then
            if(isKeyPressed(key_decrease,key_decrease_alt))then
                body_sc=mathfix(body_sc-0.1,0.1,3)
                setButtonText(m,c,r,body_sc)
            elseif(isKeyPressed(key_increase,key_increase_alt))then
                body_sc=mathfix(body_sc+0.1,0.1,3)
                setButtonText(m,c,r,body_sc)
            end
        elseif(c==8)then
            if(isKeyPressed(key_decrease,key_decrease_alt))then
                body_ox=mathfix(round(body_ox-1),-40,40)
                setButtonText(m,c,r,body_ox)
            elseif(isKeyPressed(key_increase,key_increase_alt))then
                body_ox=mathfix(round(body_ox+1),-40,40)
                setButtonText(m,c,r,body_ox)
            end
        elseif(c==9)then
            if(isKeyPressed(key_decrease,key_decrease_alt))then
                body_oy=mathfix(round(body_oy-1),-40,40)
                setButtonText(m,c,r,body_oy)
            elseif(isKeyPressed(key_increase,key_increase_alt))then
                body_oy=mathfix(round(body_oy+1),-40,40)
                setButtonText(m,c,r,body_oy)
            end
        end
--head
    elseif(r==3)then
        if(c==2)then
            if(isKeyPressed(key_confirm,key_confirm_alt,-0.5))then
                EnableTextInputMode(m,c,r,"head_sy")
            end
        elseif(c==3)then
            if(isKeyPressed(key_decrease,key_decrease_alt,0.1))then
                head_rr=mathfix(head_rr-0.01) 
                setButtonText(m,c,r,head_rr)
            elseif(isKeyPressed(key_increase,key_increase_alt,0.1))then
                head_rr=mathfix(head_rr+0.01) 
                setButtonText(m,c,r,head_rr)
            end
        elseif(c==4)then
            if(isKeyPressed(key_decrease,key_decrease_alt,0.1))then
                head_gg=mathfix(head_gg-0.01)
                setButtonText(m,c,r,head_gg)
            elseif(isKeyPressed(key_increase,key_increase_alt,0.1))then
                head_gg=mathfix(head_gg+0.01)
                setButtonText(m,c,r,head_gg)
            end
        elseif(c==5)then
            if(isKeyPressed(key_decrease,key_decrease_alt,0.1))then
                head_bb=mathfix(head_bb-0.01)
                setButtonText(m,c,r,head_bb)
            elseif(isKeyPressed(key_increase,key_increase_alt,0.1))then
                head_bb=mathfix(head_bb+0.01)
                setButtonText(m,c,r,head_bb)
            end
        elseif(c==6)then
            if(isKeyPressed(key_decrease,key_decrease_alt,0.1))then
                head_aa=mathfix(head_aa-0.01)
                setButtonText(m,c,r,head_aa)
            elseif(isKeyPressed(key_increase,key_increase_alt,0.1))then
                head_aa=mathfix(head_aa+0.01)
                setButtonText(m,c,r,head_aa)
            end
        elseif(c==7)then
            if(isKeyPressed(key_decrease,key_decrease_alt))then
                head_sc=mathfix(head_sc-0.1,0.1,3)
                setButtonText(m,c,r,head_sc)
            elseif(isKeyPressed(key_increase,key_increase_alt))then
                head_sc=mathfix(head_sc+0.1,0.1,3)
                setButtonText(m,c,r,head_sc)
            end
        elseif(c==8)then
            if(isKeyPressed(key_decrease,key_decrease_alt))then
                head_ox=mathfix(round(head_ox-1),-40,40)
                setButtonText(m,c,r,head_ox)
            elseif(isKeyPressed(key_increase,key_increase_alt))then
                head_ox=mathfix(round(head_ox+1),-40,40)
                setButtonText(m,c,r,head_ox)
            end
        elseif(c==9)then
            if(isKeyPressed(key_decrease,key_decrease_alt))then
                head_oy=mathfix(round(head_oy-1),-40,40)
                setButtonText(m,c,r,head_oy)
            elseif(isKeyPressed(key_increase,key_increase_alt))then
                head_oy=mathfix(round(head_oy+1),-40,40)
                setButtonText(m,c,r,head_oy)
            end
        end
--apple
    elseif(r==4)then
        if(c==2)then
            if(isKeyPressed(key_confirm,key_confirm_alt,-0.5))then
                EnableTextInputMode(m,c,r,"apple_sy")
            end
        elseif(c==3)then
            if(isKeyPressed(key_decrease,key_decrease_alt,0.1))then
                apple_rr=mathfix(apple_rr-0.01) 
                setButtonText(m,c,r,apple_rr)
            elseif(isKeyPressed(key_increase,key_increase_alt,0.1))then
                apple_rr=mathfix(apple_rr+0.01) 
                setButtonText(m,c,r,apple_rr)
            end
        elseif(c==4)then
            if(isKeyPressed(key_decrease,key_decrease_alt,0.1))then
                apple_gg=mathfix(apple_gg-0.01)
                setButtonText(m,c,r,apple_gg)
            elseif(isKeyPressed(key_increase,key_increase_alt,0.1))then
                apple_gg=mathfix(apple_gg+0.01)
                setButtonText(m,c,r,apple_gg)
            end
        elseif(c==5)then
            if(isKeyPressed(key_decrease,key_decrease_alt,0.1))then
                apple_bb=mathfix(apple_bb-0.01)
                setButtonText(m,c,r,apple_bb)
            elseif(isKeyPressed(key_increase,key_increase_alt,0.1))then
                apple_bb=mathfix(apple_bb+0.01)
                setButtonText(m,c,r,apple_bb)
            end
        elseif(c==6)then
            if(isKeyPressed(key_decrease,key_decrease_alt,0.1))then
                apple_aa=mathfix(apple_aa-0.01)
                setButtonText(m,c,r,apple_aa)
            elseif(isKeyPressed(key_increase,key_increase_alt,0.1))then
                apple_aa=mathfix(apple_aa+0.01)
                setButtonText(m,c,r,apple_aa)
            end
        elseif(c==7)then
            if(isKeyPressed(key_decrease,key_decrease_alt))then
                apple_sc=mathfix(apple_sc-0.1,0.1,3)
                setButtonText(m,c,r,apple_sc)
            elseif(isKeyPressed(key_increase,key_increase_alt))then
                apple_sc=mathfix(apple_sc+0.1,0.1,3)
                setButtonText(m,c,r,apple_sc)
            end
        elseif(c==8)then
            if(isKeyPressed(key_decrease,key_decrease_alt))then
                apple_ox=mathfix(round(apple_ox-1),-40,40)
                setButtonText(m,c,r,apple_ox)
            elseif(isKeyPressed(key_increase,key_increase_alt))then
                apple_ox=mathfix(round(apple_ox+1),-40,40)
                setButtonText(m,c,r,apple_ox)
            end
        elseif(c==9)then
            if(isKeyPressed(key_decrease,key_decrease_alt))then
                apple_oy=mathfix(round(apple_oy-1),-40,40)
                setButtonText(m,c,r,apple_oy)
            elseif(isKeyPressed(key_increase,key_increase_alt))then
                apple_oy=mathfix(round(apple_oy+1),-40,40)
                setButtonText(m,c,r,apple_oy)
            end
        end
--borders
    elseif(r==5)then
        if(c==2)then
            if(isKeyPressed(key_confirm,key_confirm_alt,-0.5))then
                EnableTextInputMode(m,c,r,"bord_sy")
            end
        elseif(c==3)then
            if(isKeyPressed(key_decrease,key_decrease_alt,0.1))then
                bord_rr=mathfix(bord_rr-0.01) 
                setButtonText(m,c,r,bord_rr)
            elseif(isKeyPressed(key_increase,key_increase_alt,0.1))then
                bord_rr=mathfix(bord_rr+0.01) 
                setButtonText(m,c,r,bord_rr)
            end
        elseif(c==4)then
            if(isKeyPressed(key_decrease,key_decrease_alt,0.1))then
                bord_gg=mathfix(bord_gg-0.01)
                setButtonText(m,c,r,bord_gg)
            elseif(isKeyPressed(key_increase,key_increase_alt,0.1))then
                bord_gg=mathfix(bord_gg+0.01)
                setButtonText(m,c,r,bord_gg)
            end
        elseif(c==5)then
            if(isKeyPressed(key_decrease,key_decrease_alt,0.1))then
                bord_bb=mathfix(bord_bb-0.01)
                setButtonText(m,c,r,bord_bb)
            elseif(isKeyPressed(key_increase,key_increase_alt,0.1))then
                bord_bb=mathfix(bord_bb+0.01)
                setButtonText(m,c,r,bord_bb)
            end
        elseif(c==6)then
            if(isKeyPressed(key_decrease,key_decrease_alt,0.1))then
                bord_aa=mathfix(bord_aa-0.01)
                setButtonText(m,c,r,bord_aa)
            elseif(isKeyPressed(key_increase,key_increase_alt,0.1))then
                bord_aa=mathfix(bord_aa+0.01)
                setButtonText(m,c,r,bord_aa)
            end
        elseif(c==7)then
            if(isKeyPressed(key_decrease,key_decrease_alt))then
                bord_sc=mathfix(bord_sc-0.1,0.1,3)
                setButtonText(m,c,r,bord_sc)
            elseif(isKeyPressed(key_increase,key_increase_alt))then
                bord_sc=mathfix(bord_sc+0.1,0.1,3)
                setButtonText(m,c,r,bord_sc)
            end
        elseif(c==8)then
            if(isKeyPressed(key_decrease,key_decrease_alt))then
                bord_ox=mathfix(round(bord_ox-1),-40,40)
                setButtonText(m,c,r,bord_ox)
            elseif(isKeyPressed(key_increase,key_increase_alt))then
                bord_ox=mathfix(round(bord_ox+1),-40,40)
                setButtonText(m,c,r,bord_ox)
            end
        elseif(c==9)then
            if(isKeyPressed(key_decrease,key_decrease_alt))then
                bord_oy=mathfix(round(bord_oy-1),-40,40)
                setButtonText(m,c,r,bord_oy)
            elseif(isKeyPressed(key_increase,key_increase_alt))then
                bord_oy=mathfix(round(bord_oy+1),-40,40)
                setButtonText(m,c,r,bord_oy)
            end
        end
    elseif(r==6)then
        if(c==1)then
            if(isKeyPressed(key_confirm,key_confirm_alt))then
                writeConfig()
                currentMenu=mainMenu
            end
        end
    elseif(r==7)then
        if(c==1)then
            if(isKeyPressed(key_confirm,key_confirm_alt))then
                currentMenu=mainMenu
            end
        end
    end
    if(isKeyPressed(key_back,key_back_alt))then
        currentMenu=mainMenu
    end
end
addOnUpdate(control)

local function f1()
    love.graphics.setColor(0.5,1,0.5)
    love.graphics.printf(locale_menu_tip_11, 210, 0, 999, "left",0)
    love.graphics.printf(locale_menu_tip_12, 310, 0, 999, "left",0)
    love.graphics.printf(locale_menu_tip_13, 410, 0, 999, "left",0)
    love.graphics.printf(locale_menu_tip_14, 510, 0, 999, "left",0)
    love.graphics.printf(locale_menu_tip_15, 610, 0, 999, "left",0)
    love.graphics.printf(locale_menu_tip_16, 710, 0, 999, "left",0)
    love.graphics.printf(locale_menu_tip_26, 810, 0, 999, "left",0)
    love.graphics.printf(locale_menu_tip_27, 910, 0, 999, "left",0)
    love.graphics.printf(locale_menu_tip_17, 10, 0, 999, "left",0)
    love.graphics.printf(locale_menu_tip_6, 10, 180, 999, "left",0)
    love.graphics.printf(locale_menu_tip_7, 10, 200, 999, "left",0)
end
local function f2()
    love.graphics.setColor(0.5,1,0.5)
    love.graphics.printf(locale_menu_tip_1, 10, 230, 999, "left",0)
end
local function f3()
    love.graphics.setColor(0.5,1,0.5)
    love.graphics.printf(locale_menu_tip_2, 10, 230, 999, "left",0)
end

local function f4()
    love.graphics.setColor(0.5,1,0.5)
    love.graphics.printf(locale_menu_tip_20, 10, 230, 999, "left",0)
    love.graphics.printf(locale_menu_tip_21, 10, 250, 999, "left",0)
end
local function f5()
    love.graphics.setColor(0.5,1,0.5)
    love.graphics.printf(locale_menu_tip_22, 10, 230, 999, "left",0)
end
local function f6()
    love.graphics.setColor(1,1,1)
    love.graphics.printf(locale_menu_tip_23, 10, 270, 999, "left",0)
end
local function f7()
    love.graphics.setColor(1,1,1)
    love.graphics.printf(locale_menu_tip_24, 10, 280, 999, "left",0)
    love.graphics.printf(locale_menu_tip_25, 10, 300, 999, "left",0)
end
local function f9()
    love.graphics.setColor(1,1,1)
    love.graphics.printf(locale_menu_tip_28, 10, 280, 999, "left",0)
    love.graphics.printf(locale_menu_tip_29, 10, 300, 999, "left",0)
end
local function f10()
    love.graphics.setColor(0.5,1,0.5)
    love.graphics.printf(locale_menu_tip_47, 10, 250, 999, "left",0)
end
local function preview()
    --preset
    love.graphics.setFont(font_game)
    local shx,shy = 4,1
    local sbx,sby = {1,2,3},{1,1,1}
    local ax,ay = 6,1
    --
    local n = round(220/grid_sc)
    --grid
	love.graphics.setColor(grid_rr,grid_gg,grid_bb,grid_aa)
	for x = 0, n do
		for y = 0, n do
			love.graphics.rectangle("line",10+grid_ox+x*grid_sc,grid_oy+340+y*grid_sc,grid_sc,grid_sc)
		end
	end
    --head
    love.graphics.setColor(head_rr,head_gg,head_bb,head_aa)
    love.graphics.printf(head_sy,10+head_ox+grid_sc*shx,head_oy+340+grid_sc*shy,999,"left",0,head_sc*game_font_scale,head_sc*game_font_scale)
    --body
    love.graphics.setColor(body_rr,body_gg,body_bb,body_aa)
	love.graphics.printf(body_sy,10+body_ox+grid_sc*sbx[1],body_oy+340+grid_sc*sby[1],999,"left",0,body_sc*game_font_scale,body_sc*game_font_scale)
    love.graphics.printf(body_sy,10+body_ox+grid_sc*sbx[2],body_oy+340+grid_sc*sby[2],999,"left",0,body_sc*game_font_scale,body_sc*game_font_scale)
    love.graphics.printf(body_sy,10+body_ox+grid_sc*sbx[3],body_oy+340+grid_sc*sby[3],999,"left",0,body_sc*game_font_scale,body_sc*game_font_scale)
    --apple
    love.graphics.setColor(apple_rr,apple_gg,apple_bb,apple_aa)
	love.graphics.printf(apple_sy,10+apple_ox+grid_sc*ax,apple_oy+340+grid_sc*ay,999,"left",0,apple_sc*game_font_scale,apple_sc*game_font_scale)
    --borders
    love.graphics.setColor(bord_rr,bord_gg,bord_bb,bord_aa)
    for x = 0, n do
        for y = 0, n do
            if(x==0 or x==n or y==0 or y==n)then
                love.graphics.printf(bord_sy,10+bord_ox+x*grid_sc,bord_oy+340+y*grid_sc,999,"left",0,bord_sc*game_font_scale,bord_sc*game_font_scale)
            end
        end
    end
    love.graphics.setFont(font_menues)
end
local flag1 = false
local flag2 = false
local flag3 = false
local flag4 = false
local flag5 = false
local flag6 = false
local flag7 = false
local flag8 = false
local flag9 = false
local flag10 = false
local function f()
    local m = currentMenu
    local c,r = getSelectedButton(m)

    flag1 = drawIf(flag1,f1,1,currentMenu==visualMenu)
    flag2 = drawIf(flag2,f2,1,currentMenu==visualMenu and r==6)
    flag3 = drawIf(flag3,f3,1,currentMenu==visualMenu and r==7)

    flag4 = drawIf(flag4,f4,1,currentMenu==visualMenu and r==1)
    flag5 = drawIf(flag5,f5,1,currentMenu==visualMenu and r==3)

    flag6 = drawIf(flag6,f6,1,textInputFlag)
    flag7 = drawIf(flag7,f7,1,c==6)

    flag9 = drawIf(flag9,f9,1,currentMenu==visualMenu and (c==8 or c==9))
    flag10 = drawIf(flag10,f10,1,currentMenu==visualMenu and c==7 and r~=1)

    flag8 = drawIf(flag8,preview,1,currentMenu==visualMenu)

    if(m~=visualMenu)then return end
    --reset to default
    if(isKeyPressed("f1"))then
        loadConfig()
        refreshButtonsText(visualMenu)

    elseif(isKeyPressed("f5")and(currentMenu==visualMenu))then
        grid_sy="#"
        grid_rr=0.35
        grid_gg=0.35
        grid_bb=0.35
        grid_aa=0.2
        grid_sc=20
        grid_ox = 0
        grid_oy = 0

        body_sy="#"
        body_rr=0
        body_gg=1
        body_bb=0
        body_aa=1
        body_sc=1
        body_ox = 3
        body_oy = -5

        head_sy="@"
        head_rr=0
        head_gg=0.6
        head_bb=0
        head_aa=1
        head_sc=1
        head_ox = 1
        head_oy = -4

        apple_sy="$"
        apple_rr=1
        apple_gg=0
        apple_bb=0
        apple_aa=1
        apple_sc=1
        apple_ox = 4
        apple_oy = -5

        bord_sy="x"
        bord_rr=1
        bord_gg=0
        bord_bb=0
        bord_aa=1
        bord_sc=1
        bord_ox = 5
        bord_oy = -7

        refreshButtonsText(visualMenu)
    end

end
addOnUpdate(f)
--visual menu end
---------------------------------------------------------------------
--lang menu start
langMenu = newMenu(1)
addButton(langMenu,1,"_ru")
addButton(langMenu,1,"_eng")
setSelectedButton(langMenu,1,1)

local function control(dt)
    if(currentMenu~=langMenu)then
        return
    end
    local m = langMenu
    local c,r = getSelectedButton(m)
--up
    if(isKeyPressed(key_up,key_up_alt))then
        setSelectedButton(m,c,r-1)
--down
    elseif(isKeyPressed(key_down,key_down_alt))then
        setSelectedButton(m,c,r+1)
    end
    
    c,r = getSelectedButton(m)
    if(r==1)then
        if(isKeyPressed(key_confirm,key_confirm_alt))then
            setLanguage("ru",true)
            currentMenu=mainMenu
        end
    
    elseif(r==2)then
        if(isKeyPressed(key_confirm,key_confirm_alt))then
            setLanguage("en",true)
            currentMenu=mainMenu
        end
    end
    if(isKeyPressed(key_back,key_back_alt))then
        currentMenu=mainMenu
    end
end
addOnUpdate(control)
--lang menu end
---------------------------------------------------------------------
--more settings menu start
settingsMenu = newMenu(2)
addButton(settingsMenu,1,"locale_settings_head")
addButton(settingsMenu,1,"locale_settings_font_size")
addButton(settingsMenu,1,"locale_settings_font_scale")
addButton(settingsMenu,1,"locale_saveandback")
addButton(settingsMenu,1,"locale_menuback")

addButton(settingsMenu,2,"head_direction")
addButton(settingsMenu,2,"game_font_size")
addButton(settingsMenu,2,"game_font_scale")

setSelectedButton(settingsMenu,1,1)

local function control(dt)
    if(currentMenu~=settingsMenu)then
        return
    end
    local m = settingsMenu
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
    if(r==1)then
        if(isKeyPressed(key_confirm,key_confirm_alt))then
            if(head_direction=="true")then
                head_direction="false"
            elseif(head_direction=="false")then
                head_direction="true"
            end
            refreshButtonsText(settingsMenu)
        end
    elseif(r==2)then
        if(isKeyPressed(key_decrease,key_decrease_alt,0.1))then
            game_font_size=mathfix(game_font_size-1,1,100)
            setButtonText(m,2,r,game_font_size)
            font_game = love.graphics.newFont("comicsans.ttf", game_font_size)
        elseif(isKeyPressed(key_increase,key_increase_alt,0.1))then
            game_font_size=mathfix(game_font_size+1,1,100)
            setButtonText(m,2,r,game_font_size)
            font_game = love.graphics.newFont("comicsans.ttf", game_font_size)
        end
    elseif(r==3)then
        if(isKeyPressed(key_decrease,key_decrease_alt,0.1))then
            game_font_scale=mathfix(game_font_scale-0.1,0.1,3)
            setButtonText(m,2,r,game_font_scale)
        elseif(isKeyPressed(key_increase,key_increase_alt,0.1))then
            game_font_scale=mathfix(game_font_scale+0.1,0.1,3)
            setButtonText(m,2,r,game_font_scale)
        end
    elseif(r==4)then
        if(isKeyPressed(key_confirm,key_confirm_alt))then
            writeConfig()
            currentMenu=mainMenu
        end
    elseif(r==5)then
        if(isKeyPressed(key_confirm,key_confirm_alt))then
            currentMenu=mainMenu
        end
    end

    if(isKeyPressed(key_back,key_back_alt))then
        currentMenu=mainMenu
    end
end
addOnUpdate(control)


local function f1()
    love.graphics.setColor(0.5,1,0.5)
    love.graphics.printf(locale_menu_tip_30, 210, 0, 999, "left",0)
    love.graphics.printf(locale_menu_tip_6, 10, 150, 999, "left",0)
    love.graphics.printf(locale_menu_tip_7, 10, 170, 999, "left",0)
end
local function f2()
    love.graphics.setColor(0.5,1,0.5)
    love.graphics.printf(locale_menu_tip_18, 10, 200, 999, "left",0)
    love.graphics.printf(locale_menu_tip_19, 10, 220, 999, "left",0)
end
local function f3()
    love.graphics.setColor(0.5,1,0.5)
    love.graphics.printf(locale_menu_tip_1, 10, 200, 999, "left",0)
end
local function f4()
    love.graphics.setColor(0.5,1,0.5)
    love.graphics.printf(locale_menu_tip_2, 10, 200, 999, "left",0)
end
local function f5()
    love.graphics.setColor(0.5,1,0.5)
    love.graphics.printf(locale_menu_tip_48, 10, 200, 999, "left",0)
end
local function preview()
    --preset
    love.graphics.setFont(font_game)
    local shx,shy = 4,1
    local sbx,sby = {1,2,3},{1,1,1}
    local ax,ay = 6,1
    --
    local n = round(220/grid_sc)
    --grid
	love.graphics.setColor(grid_rr,grid_gg,grid_bb,grid_aa)
	for x = 0, n do
		for y = 0, n do
			love.graphics.rectangle("line",10+grid_ox+x*grid_sc,grid_oy+340+y*grid_sc,grid_sc,grid_sc)
		end
	end
    --head
    love.graphics.setColor(head_rr,head_gg,head_bb,head_aa)
    love.graphics.printf(head_sy,10+head_ox+grid_sc*shx,head_oy+340+grid_sc*shy,999,"left",0,head_sc*game_font_scale,head_sc*game_font_scale)
    --body
    love.graphics.setColor(body_rr,body_gg,body_bb,body_aa)
	love.graphics.printf(body_sy,10+body_ox+grid_sc*sbx[1],body_oy+340+grid_sc*sby[1],999,"left",0,body_sc*game_font_scale,body_sc*game_font_scale)
    love.graphics.printf(body_sy,10+body_ox+grid_sc*sbx[2],body_oy+340+grid_sc*sby[2],999,"left",0,body_sc*game_font_scale,body_sc*game_font_scale)
    love.graphics.printf(body_sy,10+body_ox+grid_sc*sbx[3],body_oy+340+grid_sc*sby[3],999,"left",0,body_sc*game_font_scale,body_sc*game_font_scale)
    --apple
    love.graphics.setColor(apple_rr,apple_gg,apple_bb,apple_aa)
	love.graphics.printf(apple_sy,10+apple_ox+grid_sc*ax,apple_oy+340+grid_sc*ay,999,"left",0,apple_sc*game_font_scale,apple_sc*game_font_scale)
    --borders
    love.graphics.setColor(bord_rr,bord_gg,bord_bb,bord_aa)
    for x = 0, n do
        for y = 0, n do
            if(x==0 or x==n or y==0 or y==n)then
                love.graphics.printf(bord_sy,10+bord_ox+x*grid_sc,bord_oy+340+y*grid_sc,999,"left",0,bord_sc*game_font_scale,bord_sc*game_font_scale)
            end
        end
    end
    love.graphics.setFont(font_menues)
end

local flag1 = false
local flag2 = false
local flag3 = false
local flag4 = false
local flag5 = false
local flag6 = false
local function f()
    local m = currentMenu
    local c,r = getSelectedButton(m)

    flag1 = drawIf(flag1,f1,1,currentMenu==settingsMenu)
    flag2 = drawIf(flag2,f2,1,currentMenu==settingsMenu and r==1)
    flag3 = drawIf(flag3,f3,1,currentMenu==settingsMenu and r==4)
    flag4 = drawIf(flag4,f4,1,currentMenu==settingsMenu and r==5)
    flag5 = drawIf(flag5,f5,1,currentMenu==settingsMenu and (r==2 or r==3))
    flag6 = drawIf(flag6,preview,1,currentMenu==settingsMenu)

    if(m~=settingsMenu)then return end
    --reset to default
    if(isKeyPressed("f1"))then
        loadConfig()
        setButtonText(m,2,1,head_direction)
        setButtonText(m,2,2,game_font_size)
        setButtonText(m,2,3,game_font_scale)
        font_game = love.graphics.newFont("comicsans.ttf", game_font_size)

    elseif(isKeyPressed("f5")and(currentMenu==settingsMenu))then
        head_direction="false"

        setButtonText(m,2,1,head_direction)
        setButtonText(m,2,2,game_font_size)
        setButtonText(m,2,3,game_font_scale)
        writeConfig()
        loadConfig()
        game_font_size = 20
        game_font_scale = 1
        font_game = love.graphics.newFont("comicsans.ttf", game_font_size)
    end

end
addOnUpdate(f)
--more settings menu end
---------------------------------------------------------------------
--classic menu start
game_speed = 5
game_field = 20

classicMenu = newMenu(2)
addButton(classicMenu,1,"locale_menu_game_speed")
addButton(classicMenu,1,"locale_menu_grid_size")
addButton(classicMenu,1,"locale_menu_start_game")
addButton(classicMenu,1,"locale_menuback")

addButton(classicMenu,2,"game_speed")
addButton(classicMenu,2,"game_field")

setSelectedButton(classicMenu,1,1)

local function control(dt)
    if(currentMenu~=classicMenu)then
        return
    end
    local m = classicMenu
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

    if(c==1)then
        if(r==3)then
            if(isKeyPressed(key_confirm,key_confirm_alt))then
                love.window.setMode((game_field+2)*grid_sc,(game_field+2)*grid_sc+65)
                startClassic(game_speed,game_field)
            end
        elseif(r==4)then
            if(isKeyPressed(key_confirm,key_confirm_alt))then
                currentMenu=startMenu
            end
        end
    end
    if(r==1)then
        if(isKeyPressed(key_decrease,key_decrease_alt))then
            game_speed=mathfix(round(game_speed-1),1,50)
            setButtonText(m,2,1,game_speed)
        elseif(isKeyPressed(key_increase,key_increase_alt))then
            game_speed=mathfix(round(game_speed+1),1,50)
            setButtonText(m,2,1,game_speed)
        end
    elseif(r==2)then
        if(isKeyPressed(key_decrease,key_decrease_alt))then
            game_field=mathfix(round(game_field-1),5,100)
            setButtonText(m,2,2,game_field)
        elseif(isKeyPressed(key_increase,key_increase_alt))then
            game_field=mathfix(round(game_field+1),5,100)
            setButtonText(m,2,2,game_field)
        end
    end
    if(isKeyPressed(key_back,key_back_alt))then
        currentMenu=startMenu
    end
end
addOnUpdate(control)

local function f1()
    love.graphics.setColor(0.5,1,0.5)
    love.graphics.printf(locale_menu_tip_31, 10, 120, 999, "left",0)
    love.graphics.printf(locale_menu_tip_32, 10, 140, 999, "left",0)
end

local flag1 = false
local function f()
    local m = currentMenu
    local c,r = getSelectedButton(m)
    flag1 = drawIf(flag1,f1,1,currentMenu==classicMenu and r==2)
end
addOnUpdate(f)
--classic menu end
---------------------------------------------------------------------