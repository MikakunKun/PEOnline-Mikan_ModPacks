function onCreate()
    luaDebugMode=true
--Final camera pos ref
initSaveData('HypnosPref')
makeLuaSprite('CameraFollowPos',nil,0,0)
--makeGraphic('CameraFollowPos',10,10,"FF0000")
--addLuaSprite('CameraFollowPos',true)
--Config with setGlobalFromScript('Path/CameraMove','CharcterMove',var)
CamMove=true
FirstPerson=false
BFZoom=0
DADZoom=0
CamNoteMove=15
CharcterMove={dad=0,bf=0}
cameraCentred=false
ForceCamPos=false
ManualPos={0,0}
ManualCharCamPos=false
ManualCharacterPos={dad={0,0},bf={0,0}}
CharacterForce=false
CameraFollow={0,0}
Pos={0,0}
OffsetCam={0,0}
CamDisplaceX=0
CamDisplaceY=0
CanBooping=true
ExtraZoom=0

end
local ActualZoom=0
local firstTime=false
function fpSong() 
    FirstPerson = true
    ForceCamPos=true
    ManualPos={getMidpointX('dad')+150+getProperty('dad.cameraPosition[0]'),getMidpointY('dad')- 100+getProperty('dad.cameraPosition[1]')}
    setProperty('boyfriend.visible',false)
    if not firstTime then
        firstTime=true
        setProperty('camFollow.x',ManualPos[1])
        setProperty('camFollow.y',ManualPos[2])
    end

end
function onGameOver()
    CamDisplaceX=0
    CamDisplaceY=0
end
function GetCameraPos(character)
    CameraFollow={0,0}
    if character=='dad' and not FirstPerson and not ForceCamPos and not cameraCentred then
        Pos={getMidpointX('dad')+ 150,getMidpointY('dad')- 100}
        CameraFollow[1]=Pos[1]+getProperty('dad.cameraPosition[0]')+getProperty('opponentCameraOffset[0]')
        CameraFollow[2]=Pos[2]+getProperty('dad.cameraPosition[1]')+getProperty('opponentCameraOffset[1]')
        if ManualCharacterPos['dad']~={0,0} and CharacterForce then
            CameraFollow[1]=ManualCharacterPos['dad'][1]
            CameraFollow[2]=ManualCharacterPos['dad'][2]
        end
        ActualZoom=DADZoom
    elseif character=='boyfriend' and not FirstPerson and not ForceCamPos and not cameraCentred then
        Pos={getMidpointX('boyfriend')- 100,getMidpointY('boyfriend')- 100}
        CameraFollow[1]=Pos[1]-getProperty('boyfriend.cameraPosition[0]')-getProperty('boyfriendCameraOffset[0]')
        CameraFollow[2]=Pos[2]+getProperty('boyfriend.cameraPosition[1]')+getProperty('boyfriendCameraOffset[1]')
        if ManualCharacterPos['bf']~={0,0} and CharacterForce then
            CameraFollow[1]=ManualCharacterPos['bf'][1]
            CameraFollow[2]=ManualCharacterPos['bf'][2]
        end
        ActualZoom=BFZoom
    elseif ForceCamPos then
        CameraFollow[1]=ManualPos[1]
        CameraFollow[2]=ManualPos[2]
    elseif cameraCentred then
        CameraFollow=getPositionArrayCenter()
    end
end
function onMoveCamera(character)

    Character=character
end
local FirstTime=true
function onUpdate(elapsed)
    GetCameraPos(Character)
    if ForceCamPos then
        CameraFollow[1]=ManualPos[1]
        CameraFollow[2]=ManualPos[2]
        setProperty('camFollow.x',CameraFollow[1]+OffsetCam[1]+CamDisplaceX)
        setProperty('camFollow.y',CameraFollow[2]+OffsetCam[2]+CamDisplaceY)
        if FirstTime then
            FirstTime=false
            setProperty('camFollow.x',CameraFollow[1]+OffsetCam[1]+CamDisplaceX)
            setProperty('camFollow.y',CameraFollow[2]+OffsetCam[2]+CamDisplaceY)
        end
    elseif (runHaxeCode([[return game.boyfriend != null;]]) and Character=='boyfriend') or (runHaxeCode([[return game.dad != null;]]) and Character=='dad') then
        if FirstTime then
            FirstTime=false
            setProperty('camFollow.x',CameraFollow[1]+OffsetCam[1]+CamDisplaceX)
            setProperty('camFollow.y',CameraFollow[2]+OffsetCam[2]+CamDisplaceY)
        end
        setProperty('camFollow.x',CameraFollow[1]+OffsetCam[1]+CamDisplaceX)
        setProperty('camFollow.y',CameraFollow[2]+OffsetCam[2]+CamDisplaceY)
    end

end
local CharacterZoom=0
function onUpdatePost(elapsed)
    CharacterZoom=Lerp(CharacterZoom,ActualZoom,elapsed*2)
    local easeLerp = 1 - (elapsed * 3.125)
    if not isRunning('custom_events/Camera Bop Speed.lua') and CanBooping then
        setProperty('camGame.zoom',Lerp(getProperty('defaultCamZoom')+CharacterZoom+ExtraZoom,getProperty('camGame.zoom'),easeLerp))
    elseif isRunning('custom_events/Camera Bop Speed.lua') then
        setGlobalFromScript('custom_events/Camera Bop Speed.lua','Zoom',ActualZoom+ExtraZoom)
    end
end
function Lerp(Min,Max,Ratio)
    return Min + Ratio * (Max - Min)
end
function goodNoteHit(membersIndex, noteData, noteType, isSustainNote)
    if ((mustHitSection or (songPath=='amusia' and getDataFromSave('HypnosPref','Hell mode',false))) and CamMove) or (FirstPerson)  then
        if (songPath=='death-toll' and noteData>3) then return end
        CamDisplaceY=0
        if noteData == 1 or noteData == 5 then
            CamDisplaceY=CamNoteMove+CharcterMove['bf']
        end
        if noteData == 2 or noteData == 6 then
            CamDisplaceY=-CamNoteMove-CharcterMove['bf']
        end
        CamDisplaceX=0
        if noteData == 0 or noteData == 4 then
            CamDisplaceX=-CamNoteMove-CharcterMove['bf']
        end
        if noteData == 3 or noteData == 7 then
            CamDisplaceX=CamNoteMove+CharcterMove['bf']
        end
    end
end
function opponentNoteHit(membersIndex, noteData, noteType, isSustainNote)
    if (not mustHitSection or (songPath=='amusia' and getDataFromSave('HypnosPref','Hell mode',false))) and CamMove and not FirstPerson then
        CamDisplaceY=0
        if noteData == 1 then
            CamDisplaceY=CamNoteMove+CharcterMove['dad']
        end
        if noteData == 2 then
            CamDisplaceY=-CamNoteMove-CharcterMove['dad']
        end
        CamDisplaceX=0
        if noteData == 0 then
            CamDisplaceX=-CamNoteMove-CharcterMove['dad']
        end
        if noteData == 3 then
            CamDisplaceX=CamNoteMove+CharcterMove['dad']
        end
        
    end
end
local lastSection = 0
local lastMustHit = 0
function onSectionHit()
    if curSection ~= lastSection then
        if mustHitSection ~= lastMustHit then
            camDisplaceX = 0;
            camDisplaceY = 0;
        end
    end
    if type(getPropertyFromClass('states.PlayState','SONG.notes['..curSection..'].sectionNotes.length'))~='string' then
        if getPropertyFromClass('states.PlayState','SONG.notes['..curSection..'].sectionNotes.length')<1 then

            camDisplaceX = 0
            camDisplaceY = 0
        end
    else
        camDisplaceX = 0
        camDisplaceY = 0
    end
    if lastMustHit~=mustHitSection then
        if mustHitSection and character~='boyfriend' then
            Character='boyfriend'
        elseif not mustHitSection and character~='dad' then
            Character='dad'
        end
    end
    lastSection = curSection	
    lastMustHit = mustHitSection

end
function getPositionArrayCenter() 
    leftPosX = (getMidpointX('dad') + 100) + getProperty('dad.cameraPosition[0]')+getProperty('opponentCameraOffset[0]')
    rightPosX = (getMidpointX('boyfriend') - 100) - getProperty('boyfriend.cameraPosition[0]')-getProperty('boyfriendCameraOffset[0]');
    leftPosY = (getMidpointY('dad') - 100) + getProperty('dad.cameraPosition[1]')+getProperty('opponentCameraOffset[1]')
    rightPosY = (getMidpointY('boyfriend') - 100) + getProperty('boyfriend.cameraPosition[1]')+getProperty('boyfriendCameraOffset[1]');
    return {(leftPosX + rightPosX) / 2, ((leftPosY + rightPosY) / 2) + 50}
end