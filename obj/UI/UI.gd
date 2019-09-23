extends Control

class_name UI

onready var next_button = $CenterContainer/next
func show_button_next_room(visi = true):
	if visi:
		next_button.show()
	else:
		next_button.hide()


onready var buttons = $Buttons
func show_buttons(visi = true):
	if visi:
		buttons.show()
	else:
		buttons.hide()


onready var fade_player := $Fade/AnimationPlayer
func play_fade():
	fade_player.play("fade")
	yield(fade_player, 'animation_finished')