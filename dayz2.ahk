;
; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Win10
; Author:         David Janda
; Date:           2019-10
;
; Script Function:
;	Dayz autorun function
;

#NoEnv  
SendMode Input  
SetWorkingDir %A_ScriptDir%  

; Init
SetDefaults(void) {
    global Index :=1
    global SprintToggle :=false
    return
}

; Script reload
PAUSE::
    Send ^s
    reload
return

; Startup
SetDefaults(0)

; +++++++++++++++++++++++++++++++++++
; SCRIPT LOGIC
; +++++++++++++++++++++++++++++++++++

SetRun() {
  global SprintToggle:=true
        ;Send, {Shift Down}
  sleep, 200
  Send, {w Down}
  SoundBeep, 1000, 50
  SoundBeep, 1200, 50
  SoundBeep, 1400, 50
}

UnsetRun() {
  global SprintToggle:=false
  Send, {w up}
  ;Send, {Shift Up}
  SoundBeep, 1600, 50
  SoundBeep, 1000, 50
}

; w activation and cancel
~w::
    KeyWait, w
    if (SprintToggle) {
        global SprintToggle:=false
        SoundBeep, 1600, 50
        SoundBeep, 1000, 50
        return
    }
    if (A_PriorHotkey != "~w" or A_TimeSincePriorHotkey > 400)
    {
        ; fail, no double press logic here
        return
    }
    ; success, double press logic here
    SetRun()
return

; shift activation
~Shift::
    KeyWait, Shift
    if (A_PriorHotkey != "~Shift" or A_TimeSincePriorHotkey > 400)
    {
        ; fail, no double press logic here
        return
    }
    ; success, double press logic here
    SetRun()
return

; cancel on back
~s::
	If (SprintToggle) {
		UnsetRun()
	}
Return