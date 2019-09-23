extends GridContainer

#const action_button = preload("res://obj/button/core/ActionButton.tscn")

const buttons = {
	'sword': preload("res://obj/button/SwordButton.tscn"),
	'heal': preload("res://obj/button/HealButton.tscn")
}

var b = ['sword', 'heal']

func _ready() -> void:
	yield(owner, 'ready')
	
	for nam in b:
		add_button(nam)


func add_button(button_name):
	
	var ins = buttons[button_name].instance()
	
	add_child(ins)





