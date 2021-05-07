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
AudioDriverSwitch = 0
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
    global AudioDriverSwitch
    Saves = %Path%\TempleResources\_Saves
    
    WinClose, Curse of the Dead Gods
    
    FileCopy, %Saves%%Filepath%, %Saves%\Profile_1.ob, 1
    Sleep, 1000
    if(AudioDriverSwitch) {
        changeSoundDevice(3)
    }
    Run, %Path%
    if(AudioDriverSwitch) {
        Sleep, 10000
        changeSoundDevice(2)
    }
    
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
    global AudioDriverSwitch
    IniRead, OutputVar, options.ini, settings, path
    IniRead, OutputVar2, options.ini, settings, audiodriverswitch
    Path = %OutputVar%
    AudioDriverSwitch = %OutputVar2%
    if (Path = 0) {
        FileSelectFile, CursePath,,Select your Curse of the Dead Gods.exe
        IniWrite, %CursePath%, options.ini, settings, path
    }
}
;TODO
;Save files for all events
;Better save files for bosses
;Browse for COTDG.exe to set path (installer)
;Auto update
;Nice gui

changeSoundDevice(DeviceNumber) {
    ; http://www.daveamenta.com/2011-05/programmatically-or-command-line-change-the-default-sound-playback-device-in-windows-7/
    Devices := {}
    IMMDeviceEnumerator := ComObjCreate("{BCDE0395-E52F-467C-8E3D-C4579291692E}", "{A95664D2-9614-4F35-A746-DE8DB63617E6}")

    ; IMMDeviceEnumerator::EnumAudioEndpoints
    ; eRender = 0, eCapture, eAll
    ; 0x1 = DEVICE_STATE_ACTIVE
    DllCall(NumGet(NumGet(IMMDeviceEnumerator+0)+3*A_PtrSize), "UPtr", IMMDeviceEnumerator, "UInt", 0, "UInt", 0x1, "UPtrP", IMMDeviceCollection, "UInt")
    ObjRelease(IMMDeviceEnumerator)

    ; IMMDeviceCollection::GetCount
    DllCall(NumGet(NumGet(IMMDeviceCollection+0)+3*A_PtrSize), "UPtr", IMMDeviceCollection, "UIntP", Count, "UInt")
    Loop % (Count)
    {
        ; IMMDeviceCollection::Item
        DllCall(NumGet(NumGet(IMMDeviceCollection+0)+4*A_PtrSize), "UPtr", IMMDeviceCollection, "UInt", A_Index-1, "UPtrP", IMMDevice, "UInt")

        ; IMMDevice::GetId
        DllCall(NumGet(NumGet(IMMDevice+0)+5*A_PtrSize), "UPtr", IMMDevice, "UPtrP", pBuffer, "UInt")
        DeviceID := StrGet(pBuffer, "UTF-16"), DllCall("Ole32.dll\CoTaskMemFree", "UPtr", pBuffer)

        ; IMMDevice::OpenPropertyStore
        ; 0x0 = STGM_READ
        DllCall(NumGet(NumGet(IMMDevice+0)+4*A_PtrSize), "UPtr", IMMDevice, "UInt", 0x0, "UPtrP", IPropertyStore, "UInt")
        ObjRelease(IMMDevice)

        ; IPropertyStore::GetValue
        VarSetCapacity(PROPVARIANT, A_PtrSize == 4 ? 16 : 24)
        VarSetCapacity(PROPERTYKEY, 20)
        DllCall("Ole32.dll\CLSIDFromString", "Str", "{A45C254E-DF1C-4EFD-8020-67D146A850E0}", "UPtr", &PROPERTYKEY)
        NumPut(14, &PROPERTYKEY + 16, "UInt")
        DllCall(NumGet(NumGet(IPropertyStore+0)+5*A_PtrSize), "UPtr", IPropertyStore, "UPtr", &PROPERTYKEY, "UPtr", &PROPVARIANT, "UInt")
        DeviceName := StrGet(NumGet(&PROPVARIANT + 8), "UTF-16")    ; LPWSTR PROPVARIANT.pwszVal
        DllCall("Ole32.dll\CoTaskMemFree", "UPtr", NumGet(&PROPVARIANT + 8))    ; LPWSTR PROPVARIANT.pwszVal
        ObjRelease(IPropertyStore)

        ObjRawSet(Devices, DeviceName, DeviceID)
    }
    ObjRelease(IMMDeviceCollection)

    Devices2 := {}
    For DeviceName, DeviceID in Devices
        List .= "(" . A_Index . ") " . DeviceName . "`n", ObjRawSet(Devices2, A_Index, DeviceID)
    ;InputBox n,, % List,,,,,,,, 1

    ;MsgBox % Devices2[n]

    ;IPolicyConfig::SetDefaultEndpoint
    IPolicyConfig := ComObjCreate("{870af99c-171d-4f9e-af0d-e63df40c2bc9}", "{F8679F50-850A-41CF-9C72-430F290290C8}") ;00000102-0000-0000-C000-000000000046 00000000-0000-0000-C000-000000000046
    R := DllCall(NumGet(NumGet(IPolicyConfig+0)+13*A_PtrSize), "UPtr", IPolicyConfig, "Str", Devices2[DeviceNumber], "UInt", 0, "UInt")
    ObjRelease(IPolicyConfig)
    ;MsgBox % Format("0x{:08X}", R)
}