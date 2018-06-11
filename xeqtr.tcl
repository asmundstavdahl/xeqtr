#!/usr/bin/env tclsh

#########################################
###########XEQTR############2018-06-08###
#########################################
#################BY ÅSMUND STAVDAHL######
#########################################

cd [file dirname $argv0]

package require Tk

set OS [lindex $tcl_platform(os) 0]
if { $OS == "Windows" } {
	set path $::env(PATH)
	set path [string map {\\ /} $path]
	set paths [regexp -inline -all {[^;]+} $path]
	set extentions [list .exe .bat .hint]
} else {
	set path $::env(PATH)
	set paths [regexp -inline -all {[^:]+} $path]
	set extentions [list]
}

array set completions {}
foreach p $paths {
	if { $OS == "Windows" } {
		foreach ext $extentions {
			catch {
				foreach f [glob "$p/*$ext"] {
					variable hint [lindex [split $f /] end]
					if {-1 == [lsearch -exact $cmds $hint]} {
						lappend cmds $hint
						lappend cmd_paths $f
					}
				}
			}
		}
	} else {
		catch {
			foreach f [exec find $p/ -maxdepth 1 -executable -type f] {
				variable name [lindex [split $f /] end]
				if {-1 == [lsearch -exact [array names completions] $name]} {
					set completions($name) $f
				}
			}
			foreach f [exec find $p/ -maxdepth 1 -executable -type l] {
				variable name [lindex [split $f /] end]
				if {-1 == [lsearch -exact [array names completions] $name]} {
					set completions($name) $f
				}
			}
		}
	}
}


# Our hint of intent goes here (e.g. firef)
set hint {}
set list_items [list hei]

source ui.tcl

ui::ui .

bind . <Key> {
	variable hint

	if {[string length %K] == 1} {
		suggest
	} else {
		switch -exact -- %K {
			Tab {
				puts "Tab was pressed"
				set hint [.matches get active]
				#focus .hint_entry
				#.hint_entry selection range end end
			}
			BackSpace {
				suggest
			}
			default {
				puts "default: %K was pressed"
			}
		}
	}
}
bind . <Return> {
	if {[launch]} {
		destroy .
	}
}
bind . <Control-Return> {
	if {[do_execute {*}$hint]} {
		destroy .
	}
}
bind . <Escape> {destroy .}

focus .hint_entry

set matches {}

set prev_cmd {}
proc update_matches {} {
	variable hint
	variable prev_cmd

	variable hint [string trimleft $hint]

	set matches {}

	if {$hint != $prev_cmd} {
		set prev_cmd $hint
		if [string length $hint] {
			variable completions
			variable names [array names completions]

			puts "| | | | |"
			puts "v v v v v"
			

			variable matches_exactly [list]
			foreach name $names {
				if [regexp "^$hint" $name] {
					lappend matches_exactly $name
				}
			}
			lappend matches {*}[lsort $matches_exactly]


			variable matches_partly [list]
			foreach name $names {
				if [regexp ".*$hint.*" $name] {
					if {$name ni $matches} {
						lappend matches_partly $name
					}
				}
			}
			lappend matches {*}[lsort $matches_partly]

			
			variable matches_fuzzily [list]
			foreach name $names {
				variable pattern [fuzzyfi $hint]
				if {[regexp $pattern $name]} {
					if {$name ni $matches} {
						lappend matches_fuzzily $name
					}
				}
			}
			lappend matches {*}[lsort $matches_fuzzily]
		} else {
			puts "Need a hint first (hint is 0 chars long)"
		}
	}

	set matches $matches

	return $matches
}

proc suggest {} {
	variable matches [update_matches]

	uplevel 1 [list set list_items $matches]
	.matches activate 0

	foreach match $matches {
		puts $match
	}
}

proc launch {} {
	update_matches

	variable matches
	variable completions
	variable hint

	variable name [lindex $matches 0]

	if {$name in [array names completions]} {
		execute $completions($name)
	} else {
		exec {*}"$hint" &
	}
}

# Turns abcd into a.*b.*c.*d
proc fuzzyfi {pattern} {
	if {[string length $pattern] > 1} {
		return "[string range $pattern 0 0].*[fuzzyfi [string range $pattern 1 end]]"
	} else {
		return $pattern
	}
}

proc execute {path} {
	variable OS
	
	variable final $path
	if { $OS == "Windows" } {
		set final [string map {/ \\} $final]
	}

	return [do_execute $final]
}

proc do_execute {command_line} {
	catch {
		exec {*}$command_line &
	} e1 e2

	.matches insert 0 $e1
	.matches insert 0 $e2

	if {[string is integer $e1]} {
		# Success
		return 1
	} else {
		# Error
		return 0
	}
}
