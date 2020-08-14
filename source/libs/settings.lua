configpath = (love.filesystem.getSourceBaseDirectory().."\\config.lua")

function defaultConfig()
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

    grid_sy = "#"
    grid_rr = 0.35
    grid_gg = 0.35
    grid_bb = 0.35
    grid_aa = 0.2
    grid_sc = 20
    grid_ox = 0
    grid_oy = 0

    body_sy = "#"
    body_rr = 0
    body_gg = 1
    body_bb = 0
    body_aa = 1
    body_sc = 1
    body_ox = 3
    body_oy = -5

    head_sy = "@"
    head_rr = 0
    head_gg = 0.6
    head_bb = 0
    head_aa = 1
    head_sc = 1
    head_ox = 1
    head_oy = -4

    apple_sy = "$"
    apple_rr = 1
    apple_gg = 0
    apple_bb = 0
    apple_aa = 1
    apple_sc = 1
    apple_ox = 4
    apple_oy = -5

    bord_sy = "x"
    bord_rr = 1
    bord_gg = 0
    bord_bb = 0
    bord_aa = 1
    bord_sc = 1
    bord_ox = 5
    bord_oy = -7

    head_direction = "false"
    game_font_size = 20
    game_font_scale = 1
end

function checkConfig()
    local t = {"key_up",
    "key_up_alt",
    "key_down",
    "key_down_alt",
    "key_left",
    "key_left_alt",
    "key_right",
    "key_right_alt",
    "key_increase",
    "key_increase_alt",
    "key_decrease",
    "key_decrease_alt",
    "key_confirm",
    "key_confirm_alt",
    "key_back",
    "key_back_alt",
    "grid_sy",
    "grid_rr",
    "grid_gg",
    "grid_bb",
    "grid_aa",
    "grid_sc",
    "grid_ox",
    "grid_oy",
    "body_sy",
    "body_rr",
    "body_gg",
    "body_bb",
    "body_aa",
    "body_sc",
    "body_ox",
    "body_oy",
    "head_sy",
    "head_rr",
    "head_gg",
    "head_bb",
    "head_aa",
    "head_sc",
    "head_ox",
    "head_oy",
    "apple_sy",
    "apple_rr",
    "apple_gg",
    "apple_bb",
    "apple_aa",
    "apple_sc",
    "apple_ox",
    "apple_oy",
    "bord_sy",
    "bord_rr",
    "bord_gg",
    "bord_bb",
    "bord_aa",
    "bord_sc",
    "bord_ox",
    "bord_oy",
    "head_direction",
    "game_font_size",
    "game_font_scale"}
    for k,v in pairs(t)do
        if(_G[v]==nil)then
            return false, v
        end
    end
    return true
end

function backupConfig()
    local f=io.open(configpath,"r+")
    local content = f:read("*all")
    f:close()

    if(isFolderExists("backups")==false)then
        os.execute("mkdir ".."backups")
    end

    local str = os.date("%c")
    str = string.gsub(str,":",".")
    str = string.gsub(str,"/",".")

    
    f=io.open((love.filesystem.getSourceBaseDirectory().."/backups\\config "..str..".lua"),"w+")
    f:write(content)
    f:close()
end

function writeConfig()
    local f=io.open(configpath,"w+")

    io.output(f)
    io.write("key_up=\""..key_up.."\"\n")
    io.write("key_up_alt=\""..key_up_alt.."\"\n")
    io.write("key_down=\""..key_down.."\"\n")
    io.write("key_down_alt=\""..key_down_alt.."\"\n")
    io.write("key_left=\""..key_left.."\"\n")
    io.write("key_left_alt=\""..key_left_alt.."\"\n")
    io.write("key_right=\""..key_right.."\"\n")
    io.write("key_right_alt=\""..key_right_alt.."\"\n")
    io.write("key_increase=\""..key_increase.."\"\n")
    io.write("key_increase_alt=\""..key_increase_alt.."\"\n")
    io.write("key_increase=\""..key_increase.."\"\n")
    io.write("key_increase_alt=\""..key_increase_alt.."\"\n")
    io.write("key_decrease=\""..key_decrease.."\"\n")
    io.write("key_decrease_alt=\""..key_decrease_alt.."\"\n")
    io.write("key_confirm=\""..key_confirm.."\"\n")
    io.write("key_confirm_alt=\""..key_confirm_alt.."\"\n")
    io.write("key_back=\""..key_back.."\"\n")
    io.write("key_back_alt=\""..key_back_alt.."\"\n")
    io.write("\n")

    if(grid_sy=="\"")then
        io.write("grid_sy=\"\\\"\"\n")
    elseif(grid_sy=="\\")then
        io.write("grid_sy=\"\\\\\" \n")
    else
        io.write("grid_sy=\""..grid_sy.."\" \n")
    end
    io.write("grid_rr="..grid_rr.."\n")
    io.write("grid_gg="..grid_gg.."\n")
    io.write("grid_bb="..grid_bb.."\n")
    io.write("grid_aa="..grid_aa.."\n")
    io.write("grid_sc="..grid_sc.."\n")
    io.write("grid_ox="..grid_ox.."\n")
    io.write("grid_oy="..grid_oy.."\n")
    io.write("\n")

    if(body_sy=="\"")then
        io.write("body_sy=\"\\\"\"\n")
    elseif(body_sy=="\\")then
        io.write("body_sy=\"\\\\\" \n")
    else
        io.write("body_sy=\""..body_sy.."\" \n")
    end
    io.write("body_rr="..body_rr.."\n")
    io.write("body_gg="..body_gg.."\n")
    io.write("body_bb="..body_bb.."\n")
    io.write("body_aa="..body_aa.."\n")
    io.write("body_sc="..body_sc.."\n")
    io.write("body_ox="..body_ox.."\n")
    io.write("body_oy="..body_oy.."\n")
    io.write("\n")

    if(head_sy=="\"")then
        io.write("head_sy=\"\\\"\"\n")
    elseif(head_sy=="\\")then
        io.write("head_sy=\"\\\\\" \n")
    else
        io.write("head_sy=\""..head_sy.."\" \n")
    end
    io.write("head_rr="..head_rr.."\n")
    io.write("head_gg="..head_gg.."\n")
    io.write("head_bb="..head_bb.."\n")
    io.write("head_aa="..head_aa.."\n")
    io.write("head_sc="..head_sc.."\n")
    io.write("head_ox="..head_ox.."\n")
    io.write("head_oy="..head_oy.."\n")
    io.write("\n")
    
    if(apple_sy=="\"")then
        io.write("apple_sy=\"\\\"\"\n")
    elseif(apple_sy=="\\")then
        io.write("apple_sy=\"\\\\\" \n")
    else
        io.write("apple_sy=\""..apple_sy.."\" \n")
    end
    io.write("apple_rr="..apple_rr.."\n")
    io.write("apple_gg="..apple_gg.."\n")
    io.write("apple_bb="..apple_bb.."\n")
    io.write("apple_aa="..apple_aa.."\n")
    io.write("apple_sc="..apple_sc.."\n")
    io.write("apple_ox="..apple_ox.."\n")
    io.write("apple_oy="..apple_oy.."\n")
    io.write("\n")

    if(bord_sy=="\"")then
        io.write("bord_sy=\"\\\"\"\n")
    elseif(bord_sy=="\\")then
        io.write("bord_sy=\"\\\\\" \n")
    else
        io.write("bord_sy=\""..bord_sy.."\" \n")
    end
    io.write("bord_sy=\""..bord_sy.."\"\n")
    io.write("bord_rr="..bord_rr.."\n")
    io.write("bord_gg="..bord_gg.."\n")
    io.write("bord_bb="..bord_bb.."\n")
    io.write("bord_aa="..bord_aa.."\n")
    io.write("bord_sc="..bord_sc.."\n")
    io.write("bord_ox="..bord_ox.."\n")
    io.write("bord_oy="..bord_oy.."\n")
    io.write("\n")

    io.write("head_direction=\""..head_direction.."\"\n")
    io.write("game_font_size="..game_font_size.."\n")
    io.write("game_font_scale="..game_font_scale.."\n")
    
    f:close()
end

function readConfig()
    dofile(configpath)
end

function loadConfig()
    local flag2
    local flag = isFileExists(configpath)
    local err
    if(flag)then
        flag, err = xpcall(readConfig,debug.traceback)
        if(flag)then
            if(not canDoInit)then
                flag2,err=checkConfig()
                if(not flag2)then
                    printa(locale_conf_tip_10..err)
                    return true
                else
                    printa(locale_conf_tip_1)
                    return false
                end
            end
        else
            printa(locale_conf_tip_2)
            printa(err)
            return true
        end
    else
        printa(locale_conf_tip_3)
        defaultConfig()
        writeConfig()
        loadConfig()
    end
    return false
end

loadConfigError = false
local function f()
    love.graphics.setColor(0.5,1,0.5)
    love.graphics.printf(locale_conf_tip_4, 10, 420, 999, "left",0)
    love.graphics.printf(locale_conf_tip_5, 10, 440, 999, "left",0)
    love.graphics.printf(locale_conf_tip_6, 10, 460, 999, "left",0)

    love.graphics.setColor(0,1,0)
    love.graphics.printf(locale_conf_tip_7, 10, 500, 999, "left",0)
    love.graphics.printf(locale_conf_tip_8, 10, 520, 999, "left",0)
    return canDoInit
end
local function f2()
    love.graphics.setColor(0,1,0)
    love.graphics.printf(locale_conf_tip_9, 10, 50, 999, "left",0)
    return canDoInit
end

local flag1 = false
local flag2 = false
local function fu()
    flag1 = drawIf(flag1,f,0,loadConfigError)
    flag2 = drawIf(flag2,f2,0,(not loadConfigError and currentMenu==lang_pick_menu))
    if(isKeyPressed("f1")and canDoInit==false)then
        cleanLog()
        waitForUserInput()
    elseif(isKeyPressed("f2")and canDoInit==false)then
        backupConfig()
        defaultConfig()
        writeConfig()
        cleanLog()
        waitForUserInput()
    elseif(isKeyPressed("f4")and canDoInit==false)then
        defaultConfig()
        writeConfig()
        cleanLog()
        waitForUserInput()
    elseif(not loadConfigError and isKeyPressed("return","space"))then
        canDoInit = true
        cleanLog()
        font_game = love.graphics.newFont("comicsans.ttf", game_font_size)
        require("init")
    end    
    return canDoInit
end
addOnUpdate(fu)

function waitForUserInput()
    loadConfigError = loadConfig()

    if(loadConfigError)then
        canDoInit = false
    end

end