; https://www.autohotkey.com/
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
    #singleinstance,force
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen

;example1
^SPACE:: Winset, Alwaysontop, , A

;example2
$^!o::
inputbox, google, Search Google, Search Google,
	if (errorlevel = "1"){
	reload
	exitapp
	}
run, % "https://www.google.com/search?q=" google
return

;example2
$^!4::
run, % "https://duckduckgo.com/"
return