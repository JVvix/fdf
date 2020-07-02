;based on code by qwerty12:
;Set laptop brightness & show Win 10's native OSD - AutoHotkey Community
;https://autohotkey.com/boards/viewtopic.php?f=6&t=26921
;2020/3/29 pcs added j k keys to decrease and increase brightness.

#SingleInstance force

DllCall("powrprof\PowerGetActiveScheme", Ptr,0, PtrP,vActivePolicyGuid, UInt)

VarSetCapacity(GUID_VIDEO_SUBGROUP, 16)
NumPut(0x7516B95F, &GUID_VIDEO_SUBGROUP, 0, "UInt"), NumPut(0x4464F776, &GUID_VIDEO_SUBGROUP, 4, "UInt")
NumPut(0x1606538C, &GUID_VIDEO_SUBGROUP, 8, "UInt"), NumPut(0x99CC407F, &GUID_VIDEO_SUBGROUP, 12, "UInt")

VarSetCapacity(GUID_DEVICE_POWER_POLICY_VIDEO_BRIGHTNESS, 16)
NumPut(0xADED5E82, &GUID_DEVICE_POWER_POLICY_VIDEO_BRIGHTNESS, 0, "UInt"), NumPut(0x4619B909, &GUID_DEVICE_POWER_POLICY_VIDEO_BRIGHTNESS, 4, "UInt")
NumPut(0xD7F54999, &GUID_DEVICE_POWER_POLICY_VIDEO_BRIGHTNESS, 8, "UInt"), NumPut(0xCB0BAC1D, &GUID_DEVICE_POWER_POLICY_VIDEO_BRIGHTNESS, 12, "UInt")

DllCall("powrprof\PowerReadACValueIndex", Ptr,0, Ptr,vActivePolicyGuid, Ptr,&GUID_VIDEO_SUBGROUP, Ptr,&GUID_DEVICE_POWER_POLICY_VIDEO_BRIGHTNESS, UIntP,vBrightnessAC, UInt)
DllCall("powrprof\PowerReadDCValueIndex", Ptr,0, Ptr,vActivePolicyGuid, Ptr,&GUID_VIDEO_SUBGROUP, Ptr,&GUID_DEVICE_POWER_POLICY_VIDEO_BRIGHTNESS, UIntP,vBrightnessDC, UInt)

vBrightness := vBrightnessAC

ToolTip, "ScreenDim Mode - j/k (decrease/increase) Esc (exit)" ;  - AC brightness: " vBrightnessAC "`r`n" "DC brightness: " vBrightnessDC

q:: ;get AC/DC brightness
w:: ;set AC brightness
e:: ;set DC brightness
j:: ; decrease brightness
k:: ; increase brightness
;note: AC is the brightness when the laptop is plugged in

;e.g. 46 40
if InStr(A_ThisHotkey, "q")
	MsgBox, % "AC brightness: " vBrightnessAC "`r`n" "DC brightness: " vBrightnessDC

; shift by 2 to right l which is j (down) lower brightness by 10
if InStr(A_ThisHotkey, "j")
{
	;MsgBox, % "brightness: " vBrightness
    vBrightness := vBrightness - 10
    if(vBrightness < 0) {
        vBrightness := 0
    }

	DllCall("powrprof\PowerWriteACValueIndex", Ptr,0, Ptr,vActivePolicyGuid, Ptr,&GUID_VIDEO_SUBGROUP, Ptr,&GUID_DEVICE_POWER_POLICY_VIDEO_BRIGHTNESS, UInt,vBrightness, UInt)

    DllCall("powrprof\PowerWriteDCValueIndex", Ptr,0, Ptr,vActivePolicyGuid, Ptr,&GUID_VIDEO_SUBGROUP, Ptr,&GUID_DEVICE_POWER_POLICY_VIDEO_BRIGHTNESS, UInt,vBrightness, UInt)
    DllCall("powrprof\PowerSetActiveScheme", Ptr,0, Ptr,vActivePolicyGuid, UInt)
	DllCall("powrprof\PowerSetActiveScheme", Ptr,0, Ptr,vActivePolicyGuid, UInt)
}

; shift by 2 to right l which is j (down) lower brightness by 10
if InStr(A_ThisHotkey, "k")
{
	;MsgBox, % "AC brightness2: " vBrightnessAC2 "`r`n" "DC brightness2: " vBrightnessDC2
    ;msgbox vBrightnessAC2
	;InputBox, vBrightnessAC2,, % vPrompt,,,,,,,, % vBrightnessAC
    vBrightness := vBrightness + 10
    if(vBrightness > 100) {
        vBrightness := 100
    }
    DllCall("powrprof\PowerWriteACValueIndex", Ptr,0, Ptr,vActivePolicyGuid, Ptr,&GUID_VIDEO_SUBGROUP, Ptr,&GUID_DEVICE_POWER_POLICY_VIDEO_BRIGHTNESS, UInt,vBrightness, UInt)
    DllCall("powrprof\PowerSetActiveScheme", Ptr,0, Ptr,vActivePolicyGuid, UInt)
vBrightnessDC2 := vBrightnessDC2 + 10
    DllCall("powrprof\PowerWriteDCValueIndex", Ptr,0, Ptr,vActivePolicyGuid, Ptr,&GUID_VIDEO_SUBGROUP, Ptr,&GUID_DEVICE_POWER_POLICY_VIDEO_BRIGHTNESS, UInt,vBrightness, UInt)
    DllCall("powrprof\PowerSetActiveScheme", Ptr,0, Ptr,vActivePolicyGuid, UInt)
}

if InStr(A_ThisHotkey, "w")
{
	InputBox, vBrightnessAC2,, % vPrompt,,,,,,,, % vBrightnessAC
	if !(vBrightnessAC2 = vBrightnessAC)
	{
		DllCall("powrprof\PowerWriteACValueIndex", Ptr,0, Ptr,vActivePolicyGuid, Ptr,&GUID_VIDEO_SUBGROUP, Ptr,&GUID_DEVICE_POWER_POLICY_VIDEO_BRIGHTNESS, UInt,vBrightnessAC2, UInt)
		DllCall("powrprof\PowerSetActiveScheme", Ptr,0, Ptr,vActivePolicyGuid, UInt)
	}
}

if InStr(A_ThisHotkey, "e")
{
	InputBox, vBrightnessDC2,, % vPrompt,,,,,,,, % vBrightnessDC
	if !(vBrightnessDC2 = vBrightnessDC)
	{
		DllCall("powrprof\PowerWriteDCValueIndex", Ptr,0, Ptr,vActivePolicyGuid, Ptr,&GUID_VIDEO_SUBGROUP, Ptr,&GUID_DEVICE_POWER_POLICY_VIDEO_BRIGHTNESS, UInt,vBrightnessDC2, UInt)
		DllCall("powrprof\PowerSetActiveScheme", Ptr,0, Ptr,vActivePolicyGuid, UInt)
	}
}
return

Escape::
    ExitApp
    Return
