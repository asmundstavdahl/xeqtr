# ui_ui.tcl --
#
# UI generated by GUI Builder Build 146 on 2018-06-08 21:41:54 from:
#    /home/asmund/Dropbox/Development/Tcl/ui.ui
# THIS IS AN AUTOGENERATED FILE AND SHOULD NOT BE EDITED.
# The associated callback file should be modified instead.
#

# Declare the namespace for this dialog
namespace eval ui {}

#package require BWidget
package require Tk
# ui::ui --
#
#   Create the UI for this dialog.
#
# ARGS:
#   root     the parent window for this form
#   args     a catch-all for other args, but none are expected
#
proc ui::ui {root args} {
    # this handles '.' as a special case
    set base [expr {($root == ".") ? "" : $root}]
    variable ROOT $root
    variable BASE $base
    variable SCRIPTDIR ; # defined in main script


    # Widget Initialization
    variable hint_entry [entry $BASE.hint_entry \
	    -background "#333333" \
	    -borderwidth 0 \
	    -font {{courier 10 pitch} 24} \
	    -foreground "#ff7e00" \
	    -highlightbackground "#000000" \
	    -highlightcolor "#00ff00" \
	    -invalidcommand [namespace code [list hint_entry_invalidcommand]] \
	    -justify "center" \
	    -relief "flat" \
	    -takefocus 1 \
	    -textvariable "hint" \
	    -validatecommand [namespace code [list hint_entry_validatecommand]] \
	    -width 0 \
	    -xscrollcommand [namespace code [list hint_entry_xscrollcommand]]]
    variable matches [listbox $BASE.matches \
	    -background "#333333" \
	    -foreground "#ff7e00" \
	    -borderwidth 0 \
	    -font {{courier 10 pitch} 16} \
	    -relief "flat" \
	    -selectmode "single" \
	    -takefocus 0 \
	    -listvariable "list_items" \
	    -xscrollcommand [namespace code [list matches_xscrollcommand]] \
	    -yscrollcommand [namespace code [list matches_yscrollcommand]]]


    # Geometry Management

    grid $BASE.hint_entry -in $root -row 1 -column 1 \
	    -columnspan 1 \
	    -ipadx 0 \
	    -ipady 0 \
	    -padx 0 \
	    -pady 0 \
	    -rowspan 1 \
	    -sticky "nsew"
    grid $BASE.matches -in $root -row 2 -column 1 \
	    -columnspan 1 \
	    -ipadx 0 \
	    -ipady 0 \
	    -padx 0 \
	    -pady 0 \
	    -rowspan 1 \
	    -sticky "nsew"

    # Resize Behavior
    grid rowconfigure $root 1 -weight 0 -minsize 65 -pad 0
    grid rowconfigure $root 2 -weight 0 -minsize 400 -pad 0
    grid columnconfigure $root 1 -weight 0 -minsize 600 -pad 0
}
