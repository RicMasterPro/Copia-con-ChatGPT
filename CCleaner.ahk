#SingleInstance Force

; Chiude completamente lo script
Up::
    ExitApp
return


; Sospende o riattiva lo script
RCtrl::
    Suspend, Toggle 
return


; Apre una nuova finestra di ChatGPT in background
RShift::
    Run, "chrome.exe" --new-window https://chatgpt.com
    WinWaitActive, ChatGPT ahk_class Chrome_WidgetWin_1
    WinMinimize, A
return


; Chiude tutte le finestre di ChatGPT in background
Down::
    WinGet, id, List, ahk_class Chrome_WidgetWin_1
    Loop, %id%
    {
        this_id := id%A_Index%
        WinGetTitle, title, ahk_id %this_id%
        IfInString, title, ChatGPT
        {
            WinClose, ahk_id %this_id%
        }
    }
return


; Cambia finestra premendo Alt+Esc
Right::
    Send, !{Esc}
return

; Mostra il desktop con Win+D
Left::
    Send, #{d}
return
