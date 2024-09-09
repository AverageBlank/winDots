#SingleInstance

;;;;;;;;;;;! Variables ;;;;;;;;;;;
Panic := True

;;;;;;;;;;;! Key Bindings ;;;;;;;;;;;
;;;;? Glaze WM ;;;;
;; Rebinding Workspaces to Win + Num
#1::Send #!1
#2::Send #!2
#3::Send #!3
#4::Send #!4
#5::Send #!5
#6::Send #!6
#7::Send #!7
#8::Send #!8
#9::Send #!9

;; Rebinding Moving Windows to Win + Shfit + Num
#+1::Send !+1
#+2::Send !+2
#+3::Send !+3
#+4::Send !+4
#+5::Send !+5
#+6::Send !+6
#+7::Send !+7
#+8::Send !+8
#+9::Send !+9

;;;;? Flow Launcher ;;;;
#+Return::Send #y ;* Launch flow launcher ==> Win + Shift + Return
#v:: Send ^!{F4} ;* Clipbaord Manager ==> Win + V
#.:: Send ^!{F5} ;* Emoji Picker ==> Win + .
#o:: ;* Starting key chord for flow launcher ==> Win + O

    Input, SingleKey, L1, {Esc} ;* Getting key input

    if (SingleKey = "b") ;* Open bookmarks ==> B
    {
        Send, ^!{F2}
    }
    else if (SingleKey = "s") ;* Open spotify selector ==> S
    {
        Send, ^!{F3}
    }
    else if (SingleKey = "k") ;* Kill a program ==> K
    {
        Send, ^!{F6}
    }
return

;;;;? Arrow Keys ;;;;
!h::Send {Left}
!j::Send {Down}
!k::Send {Up}
!l::Send {Right}
!^h::Send ^{Left}
!^j::Send ^{Down}
!^k::Send ^{Up}
!^l::Send ^{Right}

;;;;? Window Modifications ;;;;
#+c::Send !{F4} ;* Close a program ==> Win + Shift + C
#+,::Send #+{Left} ;* Send window to left screen ==> Win + Shift + ,
#+.::Send #+{Right} ;* Send window to right screen ==> Win + Shift + .
#+f:: ;* If a window is not maximized, maximized it, and vice-versa ==> Win + Shift + T
    WinGet, State, MinMax, A
    if State = 1
        Send #{Down} ;* Un-Maximizing the window
    else
        Send #{Up} ;* Maximizing the window
return

;;;;? Miscelanious ;;;;
CapsLock::Delete ;* Map Caps Lock to Delete
#+/:: ;* Open a file listing all the keybindings. ==> Win + Shift + /
    FilePath := A_MyDocuments "\AutoHotkey\Keybindings.html"

    Run, %FilePath%
return
#+z:: ;* When first pressed, switches to the right desktop, mutes audio. Then, switches back to the left desktop, unmutes audio ==> Win + Shift + X
    if Panic {
        Send ^#{Right}
        Send #d
        Send #+q
        Send "{Volume_Mute}"
        Panic := False
    } else {
        Send ^#{Left}
        Send #d
        Send #+q
        Send "{Volume_Mute}"
        Panic := True
    }
return
#w::
    try if ((pDesktopWallpaper := ComObjCreate("{C2CF3110-460E-4fc1-B9D0-8A1C0C9CC4BD}", "{B92B56A9-8B55-4E14-9A89-0199BBB6F93B}"))) {
        DllCall(NumGet(NumGet(pDesktopWallpaper+0)+16*A_PtrSize), "Ptr", pDesktopWallpaper, "Ptr", 0, "UInt", 0) ; IDesktopWallpaper::AdvanceSlideshow - https://msdn.microsoft.com/en-us/library/windows/desktop/hh706947(v=vs.85).aspx
        ObjRelease(pDesktopWallpaper)
    }
return

;;;;? Power ;;;;
#+x:: ;* Starting key chord for power menu ==> Win + X

    Input, SingleKey, L1, {Esc} ;* Getting key input

    if (SingleKey = "u") ;* Shutdown System ==> U
    {
        Shutdown, 1
    }
    else if (SingleKey = "r") ;* Restart System ==> R
    {
        Shutdown, 2
    }
    else if (SingleKey = "h") ;* Hibernate ==> H
    {
        DllCall("PowrProf\SetSuspendState", "Int", 0, "Int", 0, "Int", 0)
    }
    else if (SingleKey = "s") ;* Sign Out ==> S
    {
        Shutdown, 0
    }
    else if (SingleKey = "l") ;* Lock ==> L
    {
        DllCall("LockWorkStation")
    }
return
