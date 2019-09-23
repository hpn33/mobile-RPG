extends "res://obj/button/core/ActionButton.gd"

func _on_pressed():
	if player and player.mp >= 8:
		player.hp += 5
		player.mp -= 8
		player.ap -= 1