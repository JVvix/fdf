; TOC ;{{{
; #IF
;AsusVivo         := True
ShiftOuter        := True
shiftRight1       := False
;shiftRight2       := True
kShift            := True
fShift            := True
dellXps           := True
OldStuff          := False
rRwinMapCtrl      := True
;enableTap         := True
;enableMouseMode   := True
enablePrevious    := True

EnvGet, HOME, USERPROFILE
;EnvGet, SNAM,
HOME              := StrReplace(HOME, "\", "\\") 
;MsgBox SNAME: %SNAME% HOME: %HOME%
chromePath        := "C:\\Program Files (x86)\\Google\\Chrome\\Application\\chrome.exe"
connectifyPath    := "C:\\Program Files (x86)\\Connectify\\Connectify.exe"
ghosterPath       := HOME . "\\fdf\\Ghoster.ahk"
hostFilePath      := "c:\\windows\\system32\\drivers\\etc\\hosts"
hapPath           := HOME . "\\fdf\\bin\\hap\\hap.exe /hint"
kittyPath         := HOME . "\\fdf\\bin\\kitty_portable.exe"
mouseModeAhk      := HOME . "\\fdf\\MouseMode.ahk"
screenDimAhk      := HOME . "\\fdf\\ScreenDim.ahk"
mouseModeExe      := HOME . "\\fdf\\MouseMode.exe"
mstscPath         := "C:\\Windows\\System32\\mstsc.exe"
nvimPath          := HOME . "\\fdf\\bin\\Neovim\\bin\\nvim.exe"
nvimqtPath        := HOME . "\\fdf\\bin\\Neovim\\bin\\nvim-qt.exe"
; powershellPath    := "c:/WINDOWs/System32/WindowsPowerShell/v1.0/powershell.exe"
; powershellPath    := "C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe"
outlookPath       := "C:\Program Files\Microsoft Office\root\Office16\\Outlook.exe"
powershellPath    := "c:\WINDOWs\System32\cmd.exe"
pushNvimCfg       := HOME . "\\fdf\\PushNvim.ahk"
; powershellPath    := "powershell.exe"
tapPathAhk        := HOME . "\\fdf\\tap.ahk"
tapPathExe        := HOME . "\\fdf\\tap.exe"
vifmPath          := HOME . "\\fdf\\bin\\vifm.exe"
vsCodePath        := "C:\\Program Files\\Microsoft VS Code\\Code.exe"
;vsCodePath        := HOME . "\\VScode\\code.exe"
YTdownloadAHKPath    := HOME . "\\fdf\youtube-dl.ahk"
minttyPath        := "C:\\Program Files\\Git\\usr\\bin\\mintty.exe"
;minttyPath        := "C:\\Program Files\\Git\\git-bash.exe"
;"C:\Program Files\Git\git-bash.exe" --cd-to-home
for n, param in A_Args  ; For each parameter:
{
    ;MsgBox Parameter number %n% is %param%.
    if param = 3
        ;msgbox shiftRight1   := True
        shiftRight1   := False  ; right hand shift 1 key to the right.
        shiftRightHand2   := False  ; right hand shift 2 key to the right.
    ;
    if param = shitRightHand1
        ;msgbox shiftRight1   := True
        shiftRight1   := True   ; right hand shift 1 key to the right.
        shiftRightHand2   := False  ; right hand shift 2 key to the right.
    ;
    if param = shiftRightHand2
        msgbox shiftRightHand2   := True
        shiftRight1   := False  ; right hand shift 1 key to the right.
        shiftRightHand2   := True   ; right hand shift 2 key to the right.
}

reStartInAdmin()
{
    ; MsgBox, "%A_ScriptFullPath%" will restart in Admin mode.
    ;<<< Start as Admin >>>
    ; If the script is not elevated, relaunch as administrator and kill current instance:
    full_command_line := DllCall("GetCommandLine", "str")
    ; msgbox fullcmd: %full_command_line% A_IsAdmin: %A_IsAdmin%

    if not (A_IsAdmin or RegExMatch(full_command_line, " /restart(?!\S)"))
    {
        ; MsgBox, Starting script in admin mode.
        try ; leads to having the script re-launching itself as administrator
        {
            if A_IsCompiled 
            {
                ; MsgBox Run *RunAs "%A_ScriptFullPath%" /restart
                Run *RunAs "%A_ScriptFullPath%" /restart
            }
            else
            {    
                ; MsgBox Run *RunAs "%A_AhkPath%" /restart "%A_ScriptFullPath%"
                Run *RunAs "%A_AhkPath%" /restart "%A_ScriptFullPath%"
            }
        }
        ExitApp
    }
}
;<<< Start as Admin >>>
if( "CAR-LT-C50626B" <> A_ComputerName) {
    ; MsgBox Computer is not CAR-LT-C50626, restarting in Admin mode.
    reStartInAdmin()
}

SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Include %A_ScriptDir%\DimScreen.ahk
#Include %A_ScriptDir%\passwords.ahk
#Include %A_ScriptDir%\FindClick.ahk
#Include %A_ScriptDir%\RunOrActivate.ahk
#Include %A_ScriptDir%\TrayIcon.ahk
#Include %A_ScriptDir%\CloseScript.ahk
; #Include %A_ScriptDir%\PreviousWindow.ahk
; #Include %A_ScriptDir%\KeepRemindingOutlook.ahk

#NoEnv
#SingleInstance force
;#InstallMouseHook
#installkeybdhook
#EscapeChar \

; DetectHiddenWindows, On  ; BUG: Causes windows not to be in focuse if turned on
SetNumLockState,On
SetScrollLockState,Off
SetScrollLockState,AlwaysOff
SetCapsLockState,Off
SetCapsLockState,AlwaysOff
SendMode Input

;;;; TAP.AHK ;;;;
if (enableTap == True) {
    if  (A_IsCompiled) {
        Run %tapPathExe%
    } else {
        Run %A_AhkPath% %tapPathAhk%
    }
}

;;;;; KeepRemindingOutlook.ahk ;;;;
if (A_ComputerName = "CAR-LT-C50626B" ) {
; restart KeepRemindingOutlook.ahk
    TapPath = %A_ScriptDir%\\KeepRemindingOutlook.ahk
    WinClose, %TapPath% ahk_class AutoHotkey
    if(A_IsCompiled) {
        Run %A_AhkPath% %TapPath%
    } else {
        Run %A_AhkPath% %TapPath%
    }
}

:*:]d::  ; This hotstring replaces "]d" with the current date and time via the commands below.
    FormatTime, CurrentDateTime,, M/d/yyyy h:mm tt  ; It will look like 9/1/2005 3:53 PM
    ; SendInput %CurrentDateTime%
return

Left & d::Send {RWin Down}d{Rwin Up}
Left::BS.SetBrightness(-15)
Right::BS.SetBrightness(15)
Up::Send {Volume_Up}{Volume_Up}{Volume_Up}{Volume_Up}{Volume_Up}
Down::Send {Volume_Down}{Volume_Down}{Volume_Down}{Volume_Down}{Volume_Down}
; Ctrl & Up::Send {Volume_Up}
; Ctrl & Down::Send {Volume_Down}

; LALT & RALT::Send {Shift Down}{Ctrl Down}{Left}{Backspace}{Shift Up}{Ctrl Up}
;LALT & RALT::Send ^{BackSpace}

; IDLE
msgbox check_idle
SetTimer, check_idle, 10000
check_idle:
msgbox check_idle
If A_TimeIdlePhysical > 10000
   MouseMove, 500, 500, 0, R
return

` & 2::
    MsgBox FindClick("ExecutorCl1.png")
    FindClick("ExecutorCl1.png")
    Return
` & 1::
    MsgBox FindClick("executor.png")
    FindClick("executor.png")
    Return
` & ,::
    FindClick()
    Return

#IF OldStuff
LWIN::Return
LWIN & \;::Send ^l
; LWIN & f::Run, %hapPath%
LWIN & o::Send ^i
LWIN & p::Send ^o
LWIN & BackSpace::Send #{Up}
LWIN & =::Send #{Down}
LWIN & ]::Send #{Left}
LWIN & \::Send #{Right}
;F3::RunOrActivate(mstscPath, "con103")
;,^!3::RunOrActivate(mstscPath, "con103")
;^!6::RunOrActivate(mstscPath, "connvm06")
;+3::RunOrActivate(mstscPath, "con103")
;+6::RunOrActivate(mstscPath, "connvm06")

CTRL & Left::Send {Left}
CTRL & Right::Send {Right}
CTRL & Up::Send {Up}
CTRL & Down::Send {Down}

RWIN & \;::Send ^L
RWIN & `::Send ^`
RWIN & 1::Send ^1
RWIN & 2::Send ^2
RWIN & 3::Send ^3
RWIN & 4::Send ^4
RWIN & 5::Send ^5
RWIN & 6::Send ^6
RWIN & 7::Send ^7
RWIN & 8::Send ^8
RWIN & 9::Send ^9
RWIN & c::Send ^c
RWIN & d::Send ^d
RWIN & o::Send ^i
RWIN & p::Send ^o
RWIN & r::Send ^r
RWIN & s::Send ^s
RWIN & t::Send ^t
RWIN & u::Send ^u
RWIN & v::Send ^v
RWIN & w::Send ^w
; LWIN & z::run Shutdown /s /t 0
; LWIN & q::run Shutdown /r /t 0

RWIN::RCTRL
AppsKey & \;::Send ^l
AppsKey & a::Send ^a
AppsKey & c::Send ^c
AppsKey & f::Run, %hapPath%
AppsKey & r::Send ^r
AppsKey & s::Send ^s
AppsKey & w::Send ^w
AppsKey & 4::Send !{F4}
;AppsKey & Space::Send ^{Backspace}
RCTRL   & Space::Send ^{Backspace}
AppsKey::Send {Enter}
RCTRL::Send {Enter}

F12::
    SysGet, Remote, 4096
    MsgBox %Remote%
    Return

;RCTRL & Space::Send ^{Backspace}
RALT & LALT::Send ^{Backspace}
;RALT & Tab::Send #{Tab}
;RALT & Space::Send {BackSpace}
RALT & Space::Send {BackSpace}
LALT::Send {Enter}
; RALT & Space::Send {BackSpace}
; RALT & Space::AltTab
LALT & Tab::AltTab
; RALT & LALT::ShiftAltTab
RCTRL & Up::AltTab
RCTRL & Down::ShiftAltTab
; RALT & RCTRL::ShiftAltTab
;RALT & CapsLock::AltTab
;RALT & LShift::ShiftAltTab

;RALT & 3::RunOrActivate(mstscPath, "con103")
;RALT & [::RunOrActivate(kittyPath)
;RALT & b::SendRaw \\
;RALT & q::SendRaw '
;RALT & t::Send {Tab}
;RALT & e::Send {Escape}
;RALT & f::Send {Enter}
RALT & s::RunOrActivate(nvimqtPath)
;RALT & v::SendRaw |
;RALT & w::SendRaw "
;RALT & x::SendRaw ?
;RALT & z::SendRaw /
;RALT & `::RunOrActivate(nvimPath)
RALT & g::
    altR := vimfmPath
    RunOrActivate(vifmPath)
    Return
;RALT & c::RunOrActivate(chromePath)
;RALT & a::RunOrActivate(vsCodePath)
;RALT & '::Send {Enter}
;RALT & RShift::Send ^n
End::Ctrl

Backspace & e::MouseMove,   0, -25 , 0, R
Backspace & d::MouseMove,   0,  25 , 0, R
Backspace & s::MouseMove, -25,  0,   0, R
Backspace & f::MouseMove,  25,  0,   0, R
Backspace & Space::MouseClick Right

; Left Pinky Shift
3 & RALT::SendRaw 0
3 & RCTRL::SendRaw .
3 & RSHIFT::Enter
3 & m::SendRaw 0
3 & ,::SendRaw 1
3 & .::SendRaw 2
3 & /::SendRaw 3
3 & k::SendRaw 4
3 & l::SendRaw 5
3 & \;::SendRaw 6
3 & i::SendRaw 7
3 & o::SendRaw 8
3 & p::SendRaw 9
3 & 9::SendRaw /
3 & 0::SendRaw *
3 & -::SendRaw -
3 & j::SendRaw +
3 & '::SendRaw +
3 & [::SendRaw -
3 & ]::=
3 & u::SendRaw -
3 & y::SendRaw *
3 & c::SendRaw rvl-pv-connvm06
3 & r::SendRaw rvl-pv-nvm
3 & w::SendRaw Wevalid8
$3::3

;4 & RALT::MSGbox 4 & alt
4 & o::
    MMcount := MMcount / 2
    Return
4 & p::
    MMcount := MMcount * 2 
    Return
4 & l::MouseMove,    0, -200, 0, R
4 & k::MouseMove,    0,  200, 0, R
4 & j::MouseMove, -200, 0,   0, R
4 & \;::MouseMove, 200,  0,   0, R
4 & /::MouseMove,  -20, 0, 0, R
4 & ,::MouseMove,    0, 20, 0, R
4 & m::MouseMove, -20, 0,   0, R    ; Left
4 & .::MouseMove,  20, 0,   0, R
4 & RALT::MouseClick
4 & END::MouseClick, right
4 & RCTRL::MouseClick, right
$4::4

5 & l::MouseMove,    0, -20 , 0, R
5 & k::MouseMove,    0,  20,  0, R
5 & j::MouseMove,  -20,  0,   0, R
5 & RALT::MouseClick
5 & \;::MouseMove,   20,  0,   0, R
5 & END::MouseClick, right
5 & RCTRL::MouseClick, right
$5::5  

0 & q::SendRaw ^
0 & w::SendRaw &
0 & e::SendRaw *
0 & r::SendRaw (
0 & t::SendRaw )
0 & a::SendRaw !
0 & s::SendRaw @
0 & d::SendRaw #
0 & f::SendRaw $
0 & c::SendRaw _

- & d::
    loop 4 {
        Send {WheelDown} 
        sleep 125
    }
    Return
- & e::
    loop 4 {
        Send {WheelUp}
        sleep 125
    }
    Return
#IF
; }}} OldStuff

#IF ShiftOuter ;{{{ #IF ShiftOuter

    ;Escape::MsgBox Escape is left Alt (left of Spacebar)
    ;123456
    `::1
    $1::2
    $2::3
    3::4
    4::5
    5::6
    l & `::SendRaw !
    l & 1::SendRaw @
    l & 2::SendRaw #
    l & 3::SendRaw $
    l & 4::SendRaw \%
    l & 5::SendRaw ^

    ;;;; qwert
    Tab::q
    q::w
    w::e
    e::r
    r::t
    l & tab::SendRaw Q
    l & q::SendRaw W
    l & w::SendRaw E
    l & e::SendRaw R
    l & r::SendRaw T

    ;;;; asdfg
    CapsLock::a
    a::s
    s::d
    d::f
    f::g
    l & capslock::SendRaw A
    l & a::SendRaw S
    l & s::SendRaw D
    l & d::SendRaw F
    l & f::SendRaw G
    
    ;;;; zxcvb
    Lshift::z
    z::x
    x::c
    c::v
    v::b
    l & lshift::SendRaw Z
    l & z::SendRaw X
    l & x::SendRaw C
    l & c::SendRaw V
    l & v::SendRaw B

    ;;;;; 790-=
    9::7
    0::8
    -::9
    =::0
    Backspace::-
    d & 9::SendRaw &
    d & 0::SendRaw *
    d & -::SendRaw (
    d & =::SendRaw )
    d & backspace::SendRaw _

    ;;;;; yuiop[]
    i::y
    o::u
    p::i
    [::o
    ]::p
    ;\::MsgBox Tab is left Win
    d & \::send |

    d & i::sendraw Y
    d & o::sendraw U
    d & p::sendraw I
    d & [::sendraw O
    d & ]::sendraw P
    d & Tab::send +Tab 
    ;d & \::sendraw {
    ;d & Delete::sendraw }

    ;;;;; hjklmn"
    k::h
    l::j
    \;::k
    '::l
    enter::\;
    d & k::sendraw H
    d & l::sendraw J
    d & \;::sendraw K
    d & '::sendraw L
    d & Enter::sendraw :

    ;;;;;  nm,./?  ;;;;;
    ,::n
    .::m
    /::,
    rshift::.
    d & ,::sendraw N
    d & .::sendraw M
    d & /::sendraw < 
    d & rshift::sendraw > 

    - & 2::WinActivate con103   ; 3
    - & 5::WinActivate connvm06 ; 6
    - & `::sendraw ~
    - & e::
    ralt & e::
        sendinput {Escape}:w{Enter}
        RunOrActivate(chromePath)
        SendInput ^r
        return 
    - & a::Run %A_AhkPath% %ScreenDimAhk%

    ; left middle
     1 & [::Send {LWin Down}{Ctrl Down}c{Ctrl Up}{LWin Up}  ; toggle Wintools invert Win+Ctrl+c
    ; 1 & l::Send ^{WheelDown} 
    ; 1 & \;::Send ^{WheelUp} 
    ; 1 & '::Send !{Space}f
    ;2 & =::sendraw +
    ;2 & -::sendraw _
    ;2 & p::sendraw [
    ;2 & [::sendraw ]
    ;2 & \;::sendraw {
    ;2 & '::sendraw }
    2 & '::send +#{right} ; send window to right screen
    2 & k::send +#{left}  ; send window to right screen
    2 & l::send #{down}   ; win+down 
    2 & \;::send #{up}   ; win+up 
    2 & [::RunOrActivate(outlookPath) ; alt-o (vim)
    2 & p::WinActivate Inbox

    ; right middle - shift see map below
    ;- & a::sendraw {
    ;- & v::sendraw \\
    ;- & capslock::sendraw ~
    ;- & e::sendraw ] 
    ;- & lshift::sendraw /
    ;- & q::sendraw "
    ;- & f::sendraw +
    ;- & r::sendraw \=
    ;- & s::sendraw {
    ;- & d::sendraw }
    ;- & tab::sendraw '
    ;- & w::sendraw [
    ;- & c::sendraw |
    ;- & z::sendraw ?

    - & 3::Send !{F4}
    = & e::
    y & r::
       msgbox reload
       reload
       return
    y & s::
       msgbox Soft Ergo Keyboard Suspeneded. Press 'y' + s to resume.
       suspend
       return
    ` & \;::send #{Up}
    ` & l::send #{Down}
    ` & k::send #{Left}
    ` & '::send #{Right}

;    lwin & backspace::sendraw +
    lwin::Send {Tab}
    lwin & '::send ^l
    lwin & \;::send ^k
    lwin & x::send ^c
    lwin & c::send ^v
    ; for systems with no ctrl on right of apps key
    Left & x::send ^c
    Left & c::send ^v
    Left & capslock::send ^a
    Left & e::send ^r
    ;lalt & '::send !{right} 
    ;lalt & k::send !{Left} 
    ;lshift & rshift::send ?

    lalt::Send {Escape}
    lalt & backspace::sendraw \=
    2    & backspace::sendraw + 
    lalt & -::sendraw {
    lalt & =::sendraw }
    lalt & \::sendraw \\
       2 & \::sendraw |
    lalt & enter::sendraw '
       2 & enter::sendraw "
    lalt & rshift::sendraw /
    ;lalt & '::Msgbox alt-l press inside nvim
       2 & rshift::sendraw ?
    n::shift
    h::alt
    g::lctrl
    j::rctrl

    ;;; keep below code same is the next section but RALT is replace
    RALT & '::Send {Right}
    RALT & ,::Send {Home} 
    RALT & RSHIFT::Send {End}
    RALT & Space::Send {BackSpace}
    RALT & [::Send {PgUp}
    RALT & p::Send {PgDn}
    ;RALT & ]::RunOrActivate(kittyPath)
    RALT & r::RunOrActivate(kittyPath)  ; alt-t (terminal)
    RALT & `::sendraw `
    RALT & c::RunOrActivate(nvimqtPath) ; alt-v (vim)
    1    & k::RunOrActivate(connectifyPath) ; alt-h hotspot
    RALT & k::Send {Left}
    RALT & /::Send ^{Right}
    RALT & .::Send ^{Left}
    RALT & 1::Send [
    RALT & 2::Send ]
    RALT & \;::Send {Up}
    RALT & l::Send {Down}
    RALT & w::MsgBox Escape is left Alt (left of Spacebar)
    RALT & x::RunOrActivate(chromePath)
    RALT & a::RunOrActivate(minttyPath)
    d & RALT::send {Enter}
    lalt & RALT::send {Enter}
    ctrl & space::Send ^{BackSpace}
    l & space::Run %A_AhkPath% %MouseModeAhk%
    ralt & lalt::!Tab
    ralt & lwin::+!Tab

    ;; should duplicate the above excecpt AppKey change
    appskey & '::Send {Right}
    appskey & ,::Send {Home} 
    appskey & RSHIFT::Send {End}
    appskey & Space::Send {BackSpace}
    appskey & [::Send {PgUp}
    appskey & p::Send {PgDn}
    appskey & ]::RunOrActivate(kittyPath)
    appskey & r::RunOrActivate(kittyPath)  ; alt-t (terminal)
    appskey & `::sendraw `
    appskey & c::RunOrActivate(nvimqtPath) ; alt-v (vim)
    appskey & k::Send {Left}
    appskey & /::Send ^{Right}
    appskey & .::Send ^{Left}
    appskey & 1::Send [
    appskey & 2::Send ]
    appskey & \;::Send {Up}
    appskey & l::Send {Down}
    appskey & w::MsgBox Escape is left Alt (left of Spacebar)
    appskey & x::RunOrActivate(chromePath)
    d & appskey::send {Enter}
    lalt & appskey::send {Enter}
    appskey & lalt::!Tab
    appskey & lwin::+!Tab

#IF ; ShiftOuter }}}

SetTitleMatchMode, 2

#IfWinActive, ahk_exe kitty_portable.exe
    lalt & k::Send !h
    lalt & '::Send !l
    lalt & l::Send !j
    lalt & \;::Send !k
    ; increase/decrease font/fullscreen
    1 & l::Send ^{WheelDown} 
    1 & \;::Send ^{WheelUp} 
    1 & '::Send !{Space}f
#IfWinActive

#IfWinActive, ahk_exe nvim-qt.exe
    lalt & k::Send !h
    lalt & '::Send !l
    lalt & l::Send !j
    lalt & \;::Send !k
    lalt & p::send ^i
    lalt & [::send ^o
    1 & l::Send ^-
    1 & \;::Send ^{+}
#IfWinActive

#IfWinActive, ahk_exe chrome.exe
    lalt & [::Send ^{Tab}
    lalt & p::Send +^{Tab}
    lalt & k::Send !{left}
    lalt & '::Send !{right}
    ; increase/decrease font/fullscreen
       1 & l::Send ^{-}
       1 & \;::Send ^{+}
       1 & '::Send {F11}
    -    & s::Send +!d   ; chrome Dark Reader mode toggle (- & d)
#IfWinActive

; C:\Program Files\Git\usr\bin\mintty.exe
#IfWinActive, ahk_exe mintty.exe
    1 & l::Send ^-
    1 & \;::Send ^{+}
#IfWinActive

;{{{ #IF shiftRight1
#IF shiftRight1
    l::k
    i::u
    o::i
    p::o
    [::p
    ]::[
    \::]
    u::y
    k::j
    \;::l
    '::;
    j::h
    h::Backspace
    m::n
    ;]::m
    ,::m
    .::,
    /::.
    y::Tab
    n::Enter
    7::6
    8::7
    9::8
    0::9
    -::0
    =::-
    Backspace::=

    RALT & j::Send {Left}
    RALT & k::Send {Down}
    RALT & l::Send {Up}
    RALT & \;::Send {Right}
    RALT & o::Send {PgDn}
    RALT & p::Send {PgUp}
    RALT & m::Send {Home} 
    RALT & ,::Send ^{Left}
    RALT & .::Send ^{Right}
    RALT & ?::Send {End}
    ;RALT & m::Send ^n
    RALT::Return

    LALT & RALT::Send ^{BackSpace}
    ;RCTRL & Space::Send ^{Backspace}
    RALT & LALT::Send ^{Backspace}
    RALT & Tab::Send #{Tab}
    ;RALT & Space::Send {BackSpace}
    RALT & Space::Send {BackSpace}
    LALT::Send {Enter}
    ; RALT & Space::Send {BackSpace}
    ; RALT & Space::AltTab
    LALT & Tab::AltTab
    ; RALT & LALT::ShiftAltTab
    RCTRL & Up::AltTab
    RCTRL & Down::ShiftAltTab
    ; RALT & RCTRL::ShiftAltTab
    ;RALT & CapsLock::AltTab
    ;RALT & LShift::ShiftAltTab
    ;LALT & w::Send ^w

    RALT & 3::RunOrActivate(mstscPath, "con103")
    RALT & [::RunOrActivate(kittyPath)
    RALT & b::SendRaw \\
    ;RALT & q::SendRaw '
    RALT & t::Send {Tab}
    RALT & e::Send {Escape}
    ;RALT & f::Send {Enter}
    RALT & s::RunOrActivate(nvimqtPath)
    RALT & v::SendRaw |
    RALT & w::SendRaw "
    RALT & x::SendRaw ?
    RALT & z::SendRaw /
    RALT & `::RunOrActivate(nvimPath)
    RALT & g::
        altR := vimfmPath
        RunOrActivate(vifmPath)
        Return
    RALT & c::RunOrActivate(chromePath) 
    RALT & a::RunOrActivate(vsCodePath)
    End::Ctrl
    AppsKey::RCTRL
    AppsKey & \;::Send ^l
    AppsKey & a::Send ^a
    AppsKey & c::Send ^c
    AppsKey & d::Send #d
    AppsKey & f::Run, %hapPath%
    AppsKey & r::Send ^r
    AppsKey & s::Send ^s
    AppsKey & w::Send ^w
    AppsKey & 4::Send !{F4}
    ;AppsKey & Space::Send ^{Backspace}
    RCTRL   & Space::Send ^{Backspace}

    RWIN & \;::Send ^L
    RWIN & `::Send ^`
    RWIN & 1::Send ^1
    RWIN & 2::Send ^2
    RWIN & 3::Send ^3
    RWIN & 4::Send ^4
    RWIN & 5::Send ^5
    RWIN & 6::Send ^6
    RWIN & 7::Send ^7
    RWIN & 8::Send ^8
    RWIN & 9::Send ^9
    RWIN & c::Send ^c
    RWIN & d::Send ^d
    RWIN & r::Send ^r
    RWIN & s::Send ^s
    RWIN & t::Send ^t
    RWIN & u::Send ^u
    RWIN & v::Send ^v
    RWIN & w::Send ^w
    ; LWIN & z::run Shutdown /s /t 0
    ; LWIN & q::run Shutdown /r /t 0

    0 & q::SendRaw ^
    0 & w::SendRaw &
    0 & e::SendRaw *
    0 & r::SendRaw (
    0 & t::SendRaw )
    0 & a::SendRaw !
    0 & s::SendRaw @
    0 & d::SendRaw #
    0 & f::SendRaw $
    0 & c::SendRaw _

    ; Left Mid Finger Shift
    3 & RALT::SendRaw 0
    3 & RCTRL::SendRaw .
    3 & RSHIFT::Enter
    3 & m::SendRaw 0
    3 & ,::SendRaw 1
    3 & .::SendRaw 2
    3 & /::SendRaw 3
    3 & k::SendRaw 4
    3 & l::SendRaw 5
    3 & \;::SendRaw 6
    3 & i::SendRaw 7
    3 & o::SendRaw 8
    3 & p::SendRaw 9
    3 & 9::SendRaw /
    3 & 0::SendRaw *
    3 & -::SendRaw -
    3 & j::SendRaw +
    3 & '::SendRaw +
    3 & [::SendRaw -
    3 & ]::=
    3 & u::SendRaw -
    3 & y::SendRaw *
    3 & c::SendRaw rvl-pv-connvm06
    3 & r::SendRaw rvl-pv-nvm
    3 & w::SendRaw Wevalid8
    $3::3

    #IF kShift
        ;k & Space::SendRaw j
        ;k & Space::Send {Backspace}
        k & Space::Send {Escape}
        k & 1::SendRaw !
        k & 2::SendRaw @
        k & 3::SendRaw #
        k & 4::SendRaw $
        k & 5::SendRaw \%
        k & 6::SendRaw ^
        k & q::SendRaw Q
        k & w::SendRaw W
        k & e::SendRaw E
        k & r::SendRaw R
        k & t::SendRaw T
        k & a::SendRaw A
        k & s::SendRaw S
        k & d::SendRaw D
        k & f::SendRaw F
        k & g::SendRaw G
        k & z::SendRaw Z
        k & x::SendRaw X
        k & c::SendRaw C
        k & v::SendRaw V
        k & b::SendRaw B
        k & `::SendRaw ~
    #IF
;}}}

    $f::f
    f & 6::Return
    f & 7::SendRaw ^
    f & 8::SendRaw &
    f & 9::SendRaw *
    f & 0::SendRaw (
    f & -::SendRaw )
    f & =::SendRaw _
    f & Backspace::SendRaw +
    f & l::SendRaw K
    f & i::SendRaw U
    f & o::SendRaw I
    f & p::SendRaw O
    f & [::SendRaw P
    f & ]::SendRaw {
    f & \::SendRaw }
    f & u::SendRaw Y
    f & j::SendRaw H
    f & k::SendRaw J
    f & \;::SendRaw L
    f & '::SendRaw :
    f & m::SendRaw N
    f & ,::SendRaw M
    f & .::SendRaw <
    f & /::SendRaw >
    f & RALT::Send {Enter}
    ;f & RALT::Send ^{BackSpace}
    ;f & RALT::Send {Backspace}
    ;f & Space::Send {Escape}
    ;RALT & e::Send {Escape}

    ; MEDIA KEYS
    ;2 & k::Send {Volume_Down}{Volume_Down}{Volume_Down}{Volume_Down}{Volume_Down}
    2 & l::Send {Volume_Up}{Volume_Up}{Volume_Up}{Volume_Up}{Volume_Up}
    RShift & Down::Send  {Volume_Down}{Volume_Down}{Volume_Down}{Volume_Down}{Volume_Down}
    RShift & Up::Send {Volume_Up}{Volume_Up}{Volume_Up}{Volume_Up}{Volume_Up}
    2 & j::Send {Media_Prev}
    2 & \;::Send {Media_Next}
    2 & [::Send {Media_Play_Pause} 
    2 & ,::Send {Volume_Mute} 
    2 & o::BS.SetBrightness(15)
    2 & i::BS.SetBrightness(-15)
    ;2 & p::Send {LWin Down}{Ctrl Down}c{Ctrl Up}{LWin Up}  ; toggle Wintools invert
    Enter & p::Send {LWin Down}{Ctrl Down}c{Ctrl Up}{LWin Up}  ; toggle Wintools invert
    2 & u::Send {Shift Down}{F11}{Shift Up}                ; toggle Chrome Deliminate plugin
    2 & ]::Send {Shift Down}{Ctrl Down}{F12}{Shift Up}{Ctrl Up}   ; Chrome Deliminate plugin
    2 & RALT::RunOrActivate("explorer.exe")
    $2::2 

#IF
; }}} shiftRight1

; {{{ #IF shiftRightHand2
#IF shiftRightHand2
    \;::k
    l::j
    i::y
    o::u
    p::i
    '::l
    [::o

    ]::p
    \::[
    u::y
    k::h

   ; \;::l
    Enter::;
    j::h
    h::Backspace
    m::n
    ;]::m
    ,::n
    .::m
    /::,
    Rshift::.
    y::Tab
    n::Enter
    7::6
    8::7
    9::8
    0::9
    -::0
    =::-
    Backspace::=
    RALT::AppsKey
    AppsKey & Space::Send {BackSpace}
#IF
;}}}

;    layer 1:
;    --------
;    y u i o      p [
;    h k l enter
;    m n , . 

; 3 
;    / [ ]  
;    ? { } 
;      
;      ` 1 2 3 4 
;    Tab q w e r 
;    Cap a s d f 
;    Shi z x c v 

; -      
;      ` " [ ] = 
;      ~ s { } +
;      / ? c | \ 
;
; lwin
;      7 8 9 0 -
;      y u i o p
;      h j k l ;
;      n m , . 

;      7 8 9 + =
;      y u [ ] p "
;      h X { } '
;      \ | ? / 

; alt layer
;  '  1  2  3  4              9  0  -  =  BS
;  '~ [  ]                          {  }  =+
;                                         \|
;                                         '"  <- enter
;                                         /?  <- rshift 
 
; https://www.autohotkey.com/docs/Hotkeys.htm  
;#   Win (Windows logo key).
;!   Alt
;^   Control
;+   Shift
 
; Test area: 
;  ergo laptop layout.
; -  ergonomic laptop layout
; -  I tried many 200+ keyboards, but settled on the Microsoft Scult (~ $60) with a custom mapping.
;    It solved my main issue of having pinky pain at the end of day.

;  - These are the key eronomic features this layout was design to solve:
;       - offload pinkies workload - this is the first reason I started looking into erognomic keyboard because at 
;         end of a 8 hour day, my pinkies would be in pain.
;       - increase thumb work load - thumbs are stronger and can do more work then just the spacebar.  This layout, each thumbs can
;         reach 3 keys.
;       - avoid reaching - especially the BackSpace key, it is the 2nd most used key, but is placed so far from 
;         the home row. This layout can do back space with the LayerKey (RALT + Space)
;      
;  - Weakness of the time ths
