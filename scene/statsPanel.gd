extends Panel


onready var hp_label = $MarginContainer/HBoxContainer/HBoxContainer/HP
onready var ap_label = $MarginContainer/HBoxContainer/HBoxContainer/AP
onready var mp_label = $MarginContainer/HBoxContainer/HBoxContainer/MP

func _on_PlayerStats_ap_changed(value) -> void:
	ap_label.text = "AP\n" + str(value)


func _on_PlayerStats_hp_changed(value) -> void:
	hp_label.text = "HP\n" + str(value)


func _on_PlayerStats_mp_changed(value) -> void:
	mp_label.text = "MP\n" + str(value)
