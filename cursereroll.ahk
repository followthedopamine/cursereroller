Gui, +AlwaysOnTop -SysMenu +Owner  ; +Owner avoids a taskbar button.
Gui, Add, Button, default, &Speedrun Sword
Gui, Add, Button, default, &Serpent2
Gui, Add, Button, default, &Serpent3
Gui, Add, Button, default, &Eagle1
Gui, Add, Button, default, &Eagle2
Gui, Add, Button, default, &Eagle3
Gui, Add, Button, default, &Speedrun Bow
Gui, Add, Button, default, &No Attack
Gui, Add, Button, default, &Dynamite
Gui, Add, Button, default, &Throwing
Gui, Show, NoActivate, Curse Reroller  

;Filepath = the save file

Reroll(Filepath) {
    Path = D:\Games\SteamLibrary\steamapps\common\Curse of the Dead Gods
    Saves = %Path%\TempleResources\_Saves
    SChamp2 = %Saves%\cursereroller\practice\serpent\champ2\Profile_1.ob
    
    WinClose, Curse of the Dead Gods

    FileCopy, %Saves%%Filepath%, %Saves%\Profile_1.ob, 1
    Sleep, 1000
    Run, steam://rungameid/1123770
}

ButtonSpeedrunSword:
    Filepath = \cursereroller\speedrun\reallyreallygoodsword\Profile_2.ob
    Reroll(Filepath)
return

ButtonSerpent2:
    Filepath = \cursereroller\practice\serpent\champ2\Profile_1.ob
    Reroll(Filepath)
return

ButtonSerpent3:
    Filepath = \cursereroller\practice\serpent\boss\Profile_1.ob
    Reroll(Filepath)
return

ButtonEagle1:
    Filepath = \cursereroller\practice\eagle\champ1\Profile_1.ob
    Reroll(Filepath)
return

ButtonEagle2:
    Filepath = \cursereroller\practice\eagle\champ2\Profile_1.ob
    Reroll(Filepath)
return

ButtonEagle3:
    Filepath = \cursereroller\practice\eagle\boss\Profile_1.ob
    Reroll(Filepath)
return

ButtonSpeedrunBow:
    Filepath = \cursereroller\speedrun\perfect effulgence\Profile_2.ob
    Reroll(Filepath)
return

ButtonNoAttack:
    Filepath = cursereroller\speedrun\great no attack\Profile_2.ob
    Reroll(Filepath)
return

ButtonDynamite:
    Filepath = \cursereroller\speedrun\great dynamite\Profile_2.ob
    Reroll(Filepath)
return

ButtonThrowing:
    Filepath = \cursereroller\speedrun\throwing\Profile_2.ob
    Reroll(Filepath)
return

Numpad8::
toggle := !toggle
If toggle
	Gui, Show
else
	Gui, hide
return

;#IfWinExist, Curse of the Dead Gods
;{
;    Numpad8::Reroll()
;    Numpad9::FileCopy, %Path%\cursereroller\practice\serpent\champ2\Profile_1.ob, %Path%
;}