extends Node


signal state_changed(new)

enum { battle, idle, q}
var cstate = q


func change_state(new):
	cstate = new
	emit_signal('state_changed', cstate)