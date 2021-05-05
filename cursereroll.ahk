SetDefaultMouseSpeed, 0 ; move the mouse instantly

Gui, +AlwaysOnTop -SysMenu +Owner  ; +Owner avoids a taskbar button.
Gui, Add, Tab3,, Weapons | Bosses
Gui, Tab, 1
Gui, Add, Button, default, &Reroll
Gui, Add, Button, default, &Speedrun Sword
Gui, Add, Button, default, &Speedrun Bow
Gui, Add, Button, default, &Doubled Heartseeker
Gui, Add, Button, default, &Dynamite
Gui, Add, Button, default, &Throwing
Gui, Add, Button, default, &Curse effulgence
Gui, Add, Button, default, &No Attack
Gui, Tab, 2
Gui, Add, Button, default, &Serpent1
Gui, Add, Button, default, &Serpent2
Gui, Add, Button, default, &Serpent3
Gui, Add, Button, default, &Eagle1
Gui, Add, Button, default, &Eagle2
Gui, Add, Button, default, &Eagle3
Gui, Add, Button, default, &Jaguar1
Gui, Add, Button, default, &Jaguar2
Gui, Add, Button, default, &Jaguar3
Gui, Add, Button, default, &Final boss
Gui, Show, NoActivate, Curse Reroller
Path = ""
startup()
return

ButtonReroll:
    Reroll()
return

ButtonSpeedrunSword:
    Filepath = \cursereroller\speedrun\reallyreallygoodsword\Profile_2.ob
    ReplaceSave(Filepath)
return

ButtonSpeedrunBow:
    Filepath = \cursereroller\speedrun\godrange\Profile_1.ob
    ReplaceSave(Filepath)
return

ButtonDoubledHeartseeker:
    Filepath = \cursereroller\speedrun\doubledheartseeker\Profile_1.ob
    ReplaceSave(Filepath)
return

ButtonSerpent1:
    Filepath = \cursereroller\practice\serpent\boss\Profile_1.ob
    ReplaceSave(Filepath)
return

ButtonSerpent2:
    Filepath = \cursereroller\practice\serpent\champ2\Profile_1.ob
    ReplaceSave(Filepath)
return

ButtonSerpent3:
    Filepath = \cursereroller\practice\serpent\boss\Profile_1.ob
    ReplaceSave(Filepath)
return

ButtonEagle1:
    Filepath = \cursereroller\practice\eagle\champ1\Profile_1.ob
    ReplaceSave(Filepath)
return

ButtonEagle2:
    Filepath = \cursereroller\practice\eagle\champ2\Profile_1.ob
    ReplaceSave(Filepath)
return

ButtonEagle3:
    Filepath = \cursereroller\practice\eagle\boss\Profile_1.ob
    ReplaceSave(Filepath)
return

ButtonJaguar1:
    Filepath = \cursereroller\practice\jaguar\champ1\Profile_1.ob
    ReplaceSave(Filepath)
return

ButtonJaguar2:
    Filepath = \cursereroller\practice\jaguar\champ2\Profile_1.ob
    ReplaceSave(Filepath)
return

ButtonJaguar3:
    Filepath = \cursereroller\practice\jaguar\boss\Profile_1.ob
    ReplaceSave(Filepath)
return

ButtonFinalBoss:
    Filepath = \cursereroller\practice\eagle\boss\Profile_1.ob
    ReplaceSave(Filepath)
return

ButtonCurseEffulgence:
    Filepath = \cursereroller\speedrun\perfect effulgence\Profile_2.ob
    ReplaceSave(Filepath)
return

ButtonNoAttack:
    Filepath = cursereroller\speedrun\great no attack\Profile_2.ob
    ReplaceSave(Filepath)
return
    Filepath = \cursereroller\speedrun\great dynamite\Profile_2.ob
    ReplaceSave(Filepath)
return

ButtonThrowing:
    Filepath = \cursereroller\speedrun\throwing\Profile_2.ob
    ReplaceSave(Filepath)
return

Numpad8::
toggle := !toggle
If !toggle
	Gui, Show
else
	Gui, hide
return

Numpad2::Reroll()

ReplaceSave(Filepath) {
    global Path
    Saves = %Path%\TempleResources\_Saves
    MsgBox, %Saves%
    WinClose, Curse of the Dead Gods
    FileCopy, %Saves%%Filepath%, %Saves%\Profile_1.ob, 1
    Sleep, 1000
    Run, %Path%
}

Reroll() {
    Filepath = \cursereroller\speedrun\doubledheartseeker\Profile_2.ob
    ReplaceSave(Filepath)
    While(color != 0x2103B3)
    {
        PixelGetColor, color, 397, 235
        Sleep, 100
    }
    Sleep, 200
    MouseGetPos, xpos, ypos 
    Click, 277, 416
    Sleep, 200
    Click, 277, 416
    Sleep, 50
    MouseMove, %xpos%, %ypos%
    ;While(color2 != 0x6B1831)
    ;{
    ;    PixelGetColor, color2, 885, 132
    ;    Sleep, 100
    ;}
    ;Click
    ;Send, {Escape down}
    ;Sleep, 100
    ;Send, {Escape up}
    ;Click, 765, 517
    ;Sleep, 50
    ;Click 819, 700
}

startup() {
    global Path
    IniRead, OutputVar, options.ini, settings, path
    Path = %OutputVar%
    if (Path = 0) {
        FileSelectFile, CursePath,,Select your Curse of the Dead Gods.exe
        Path = %CursePath%
        IniWrite, %Path%, options.ini, settings, path
    }
}
;TODO
;Save files for all events
;Better save files for bosses
;Browse for COTDG.exe to set path (installer)
;Auto update
;Nice gui