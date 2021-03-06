#!/usr/bin/env wish
# ui.tcl --
#
# UI generated by GUI Builder Build 146 on 2018-06-08 21:41:54 from:
#    /home/asmund/Dropbox/Development/Tcl/ui.ui
# This file is auto-generated.  Only the code within
#    '# BEGIN USER CODE'
#    '# END USER CODE'
# and code inside the callback subroutines will be round-tripped.
# The proc names 'ui' and 'init' are reserved.
#

package require Tk 8.4

# Declare the namespace for this dialog
namespace eval ui {}

# Source the ui file, which must exist
set ui::SCRIPTDIR [file dirname [info script]]
source [file join $ui::SCRIPTDIR ui_ui.tcl]

# BEGIN USER CODE

# END USER CODE

# BEGIN CALLBACK CODE
# ONLY EDIT CODE INSIDE THE PROCS.

# ui::hint_entry_invalidcommand --
#
# Callback to handle hint_entry widget option -invalidcommand
#
# ARGS:
#    <NONE>
#
proc ui::hint_entry_invalidcommand args {}

# ui::hint_entry_validatecommand --
#
# Callback to handle hint_entry widget option -validatecommand
#
# ARGS:
#    <NONE>
#
proc ui::hint_entry_validatecommand args {}

# ui::hint_entry_xscrollcommand --
#
# Callback to handle hint_entry widget option -xscrollcommand
#
# ARGS:
#    <NONE>
#
proc ui::hint_entry_xscrollcommand args {}

# ui::matches_xscrollcommand --
#
# Callback to handle matches widget option -xscrollcommand
#
# ARGS:
#    <NONE>
#
proc ui::matches_xscrollcommand args {}

# ui::matches_yscrollcommand --
#
# Callback to handle matches widget option -yscrollcommand
#
# ARGS:
#    <NONE>
#
proc ui::matches_yscrollcommand args {}

# END CALLBACK CODE

# ui::init --
#
#   Call the optional userinit and initialize the dialog.
#   DO NOT EDIT THIS PROCEDURE.
#
# Arguments:
#   root   the root window to load this dialog into
#
# Results:
#   dialog will be created, or a background error will be thrown
#
proc ui::init {root args} {
    # Catch this in case the user didn't define it
    catch {ui::userinit}
    if {[info exists embed_args]} {
	# we are running in the plugin
	ui::ui $root
    } elseif {$::argv0 == [info script]} {
	# we are running in stand-alone mode
	wm title $root ui
	if {[catch {
	    # Create the UI
	    ui::ui  $root
	} err]} {
	    bgerror $err ; exit 1
	}
    }
    catch {ui::run $root}
}
ui::init .

