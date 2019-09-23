extends "res://obj/button/core/ActionButton.gd"



func _on_pressed():
	
	if enemy and player:
		unit.create_slash(enemy.position)
		enemy.damage(4)
		player.ap -= 1
		player.mp += 2
	
	pass
