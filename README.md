# xeqtr
xeqts ur xeqtblz

This program is inspired by launchers like dmenu.

I'm sure the code lacks consistency and proper docs but this is mostly a project I started to learn about Tk and Tcl.

For the UI I used [GUI Builder](https://sourceforge.net/projects/spectcl/files/GUI%20Builder/) – however, I had to modify some parts of the generated UI code to eliminate a dependency so the ui.ui file is just there because why not.

*If you find it usefull and would like to develop it please tell me and I'll refactor and document the code if I have time for it :)*

## installation

- download the repo or just the .tcl files
- get Tcl and Tk (I've tested it with 8.6), e.g. `apt install tcl tk` or check out IronTcl on Windows
- add a keyboard shortcut for it. I like Control-Alt-D

## usage

- press the keyboard shortcut
- type what you want to execute
- either…
	* find what you were looking for in the list and press Enter, or
	* type whatever command line and press Control-Enter
- pressing Tab completes the top match but does not execute
