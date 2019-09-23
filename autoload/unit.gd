extends Node

const slash = preload('res://obj/slash/Slash.tscn')


func create_slash(position):
	var ins = slash.instance()
	var main = get_tree().current_scene
	
	main.add_child(ins)
	
	ins.global_position = position
