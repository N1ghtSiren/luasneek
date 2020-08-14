--messages on screen
local printf=love.graphics.printf
local logtable = {}
local textlimit = 30

function logDraw()
    local i = 0
    love.graphics.setColor(1,1,1)
    for k,v in pairs(logtable) do
        printf(v,10,i*20,999)
        i = i + 1
    end
    if(#logtable>textlimit)then
        table.remove(logtable,1)
    end
    return false
end
addOnDraw(logDraw)

function cleanLog()
    for k,v in pairs(logtable) do
        logtable[k] = nil
    end
end

function printa(msg)
    if(type(msg)=="nil")then
        msg="nil"
    end
    table.insert(logtable,msg)
end
---------------------------------------------------------------------
--is file exists on path
function isFileExists(path)
    local f=io.open(path,"r")
    if f~=nil then 
        return true, f:read("*all")
    else 
        return false
    end
end

function isFolderExists(foldername)
    local f=io.open(foldername.."/temp","w+")
    if(f==nil)then
        return false
    end
    f:close()
    return os.remove(foldername.."/temp")
end
---------------------------------------------------------------------
--set number to range
function mathfix(n,min,max)
    if(min==nil and maxx==nil)then
        min=0
        max=1
    end
    if(n<min)then
        return min
    end
    if(n>max)then 
        return max
    end
    return n
end
--round
function round(number)
    return math.floor(number+0.5)
end
---------------------------------------------------------------------
--table seekers
function fuko(t,msg)
    if(msg~=nil)then 
        print(msg)
    end

    for k,v in pairs(t)do
        print("t["..k.."]:",v)
    end
    print("")
end
------------------------------------------------------------------------------------------------------------------------------------------
--2d menu library
--col = vertical
--row = horisontal

--#menu == rownumber
--menu[rown][coln]
---------------------------------------------------------------------
--key timer
key_timer_max = 0.15
key_timer = 0
function resetKeyTimer(val)
    if(val==nil)then val=0 end
    key_timer=val
end

function getKeyTimer()
    if(key_timer>=key_timer_max)then
        return true
    end
    return false
end

local function f(dt)
    key_timer=key_timer+dt
end
addOnUpdate(f)
---------------------------------------------------------------------
--keyboard keys shortener
local isDown = love.keyboard.isDown
function isKeyPressed(key1,key2,val)
    local flag=false
    local err="no errors"

    if(getKeyTimer()==false) then
        err = ("Key timer on cd:"..key_timer)
        return false,err,key1,key2
    end

    if(keyRecordFlag or textInputFlag) then
        err = "Key record or Text Input enabled"
        return false,err,key1,key2
    end

    if(isDown(key1))then
        flag=true
    end

    if(key2~=nil)then
        if(isDown(key2))then
            flag=true
        end
    end
 
    if(flag)then
        resetKeyTimer(val)
    end


    return flag,err,key1,key2
end
---------------------------------------------------------------------
--get last pressed key
keyRecordFlag = false
local m,c,r,varname
function EnableCatchKeyMode(m_,c_,r_,varname_)
    m,c,r,varname = m_,c_,r_,varname_
    keyRecordFlag = true
end

function love.keypressed(key)
    if(keyRecordFlag)then

        _G[varname]=key
        setButtonText(m,c,r,_G[varname])
        m,c,r,varname = nil

        keyRecordFlag=false
    end
end

m,c,r,varname = nil
---------------------------------------------------------------------
--get input
textInputFlag = false
local m,c,r,varname
function EnableTextInputMode(m_,c_,r_,varname_)
    m,c,r,varname = m_,c_,r_,varname_
    textInputFlag = true
end

function love.textinput(text)
    if(textInputFlag)then

        _G[varname]=text
        setButtonText(m,c,r,_G[varname])
        m,c,r,varname = nil
        
        textInputFlag = false
    end
end
m,c,r,varname = nil
---------------------------------------------------------------------
--lazy ifs
function oneof(exp,...)
    local t
    --check if 2nd argument is table and not pairs
    if(type(...)=="table")then
        t = ...
    else
        t = {...}
    end
    
    for i = 1, #t, 2 do
        if(exp==t[i])then
            if(t[i+1]==nil)then
                return "error"
            else
                return t[i+1]
            end
        end
    end
end