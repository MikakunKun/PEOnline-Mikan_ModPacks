function onCreate()
    setPropertyFromClass("openfl.Lib", "application.window.title",'Salty Sunday Night Fanmade')
end

function onUpdate()
    if getProperty("health") < 0 then
        setPropertyFromClass("openfl.Lib", "application.window.title",'JAJA POR NUB')
    end
end

function onDestroy()
    setPropertyFromClass("openfl.Lib", "application.window.title","Friday Night Funkin' : Pre Mikan Engine")
end