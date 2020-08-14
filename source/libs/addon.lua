---------------------------------------------------------------------
--main draw stack
local drawGroup = {}

function addDrawGroup(groupId)
    if(drawGroup[groupId]==nil)then
        drawGroup[groupId]={}
        drawGroup[groupId].drawflag=true
        return true
    end
    return false, ("draw group"..groupId.." already exist")
end

function addOnDraw(func,groupId,position)
    groupId=groupId or 0
    if(drawGroup[groupId]==nil)then
        return false, ("draw group"..groupId.." does not exist")
    end

    if(position~=nil)then
        table.insert(drawGroup[groupId],position,func)
    else
        table.insert(drawGroup[groupId],func)
    end

    return true
end

function removeOnDraw(func,groupId)
    local group = drawGroup[groupId]
    for k,v in pairs(group) do
        if(v==func)then group[k]=nil
            return
        end
    end
end

function removeOnDrawGroup(groupId)
    local group = drawGroup[groupId]
    for k,v in pairs(group) do
        group[k]=nil
    end
    drawGroup[groupId]=nil
end

function drawIf(previousFlag,func,groupId,...)
    local flag = true
    local conditions = {...}

    for k,v in pairs(conditions) do
        if(v==false)then
            flag=false
        end
    end
    
    if(flag==false) then
        removeOnDraw(func,groupId)
        return false
    elseif(flag==true)then
        if(previousFlag==false)then
            addOnDraw(func,groupId)
        end
        return true
    end
end

function setDrawGroupMode(groupId,flag)
    if(drawGroup[groupId]~=nil)then
        return false, ("draw group"..groupId.."does not exist")
    end
    drawGroup[groupId].drawflag = flag
    return true
end

function love.draw()
    local drawGroup=drawGroup

    for gid,t in pairs(drawGroup)do
        --exception, skip draw
        if(t.drawflag==false)then
            goto next
        end

        for key,func in pairs(t)do
            if(key~=nil and func~=nil and key~="drawflag")then
                if(func()==true)then
                    drawGroup[gid][key]=nil
                end
            end
        end

        ::next::
    end

end
---------------------------------------------------------------------
--main update stack
local updateGroup = {}
function addUpdateGroup(groupId)
    if(updateGroup[groupId]==nil)then
        updateGroup[groupId]={}
        updateGroup[groupId].updateflag=true
        return true
    end
    return false, ("update group"..groupId.." already exist")
end

function addOnUpdate(func,groupId,position)
    groupId=groupId or 0
    if(updateGroup[groupId]==nil)then
        return false, ("update group"..groupId.." does not exist")
    end

    if(position~=nil)then
        table.insert(updateGroup[groupId],position,func)
    else
        table.insert(updateGroup[groupId],func)
    end

    return true
end

function removeOnUpdate(func,groupId)
    local group = updateGroup[groupId]
    for k,v in pairs(group) do
        if(v==func)then group[k]=nil
            return
        end
    end
end

function removeOnUpdateGroup(groupId)
    local group = updateGroup[groupId]
    for k,v in pairs(group) do
        group[k]=nil
    end
    updateGroup[groupId]=nil
end

function updateIf(previousFlag,func,groupId,...)
    local flag = true
    local conditions = {...}

    for k,v in pairs(conditions) do
        if(v==false)then
            flag=false
        end
    end

    if(flag==false) then
        removeOnUpdate(func,groupId)
        return false
    elseif(flag==true)then
        if(previousFlag==false)then
            addOnUpdate(func,groupId)
        end
        return true
    end
end

function setUpdateGroupMode(groupId,flag)
    if(updateGroup[groupId]~=nil)then
        return false, ("update group"..groupId.."does not exist")
    end
    updateGroup[groupId].updateflag = flag
    return true
end

function love.update(dt)
    local updateGroup=updateGroup
    local flag

    for gid,t in pairs(updateGroup)do
        --exception, skip update
        if(t.updateflag==false)then
            goto next
        end

        for key,func in pairs(t)do
            if(key~=nil and func~=nil and key~="updateflag")then
                if(func(dt)==true)then
                    updateGroup[gid][key]=nil
                end
            end
        end

        ::next::
    end
end
---------------------------------------------------------------------
--how dare you to stole that...
--system groups
addDrawGroup(0)
addUpdateGroup(0)