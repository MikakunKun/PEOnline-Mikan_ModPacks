local onlineOwner=false
function onCreate()
    onlineOwner=not runHaxeCode('return PlayState.playsAsBF();')
end
function onStepHit()
    if curStep == 1 then
        if (onlineOwner==true) then
            noteTweenX("Note0", 0, 400, 1, "elasticout")
            noteTweenX("Note1", 1, 520, 1, "elasticout")
            noteTweenX("Note2", 2, 640, 1, "elasticout")
            noteTweenX("Note3", 3, 760, 1, "elasticout")

            noteTweenX("Note4", 4, 1500, 1, "quartout")
            noteTweenX("Note5", 5, 1500, 1, "quartout")
            noteTweenX("Note6", 6, 1500, 1, "quartout")
            noteTweenX("Note7", 7, 1500, 1, "quartout")
        else
            noteTweenX("Note0", 0, -300, 1, "quartout")
            noteTweenX("Note1", 1, -300, 1, "quartout")
            noteTweenX("Note2", 2, -300, 1, "quartout")
            noteTweenX("Note3", 3, -300, 1, "quartout")
            
            noteTweenX("Note4", 4, 400, 1, "elasticout")
            noteTweenX("Note5", 5, 520, 1, "elasticout")
            noteTweenX("Note6", 6, 640, 1, "elasticout")
            noteTweenX("Note7", 7, 760, 1, "elasticout")
        end
    end
end