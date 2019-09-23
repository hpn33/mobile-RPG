extends "res://obj/entity/Entity.gd"


onready var hp_label = $HPLabel
onready var anim :AnimationPlayer= $AnimationPlayer

export(int) var damage = 4

signal end_turn
signal died

func _ready() -> void:
	self.hp = hp
	
	battle_unit.enemy = self

func _exit_tree() -> void:
	battle_unit.enemy = null


func set_hp(value):
	hp = value
	
	hp_label.text = str(hp) + 'hp'

func damage(amount):
	anim.play('shake')
	yield(anim, 'animation_finished')
	
	self.hp = clamp(hp - amount, 0, hp)
	
	
	if hp == 0:
		emit_signal('died')
		queue_free()
	
	

func attack() -> void:
	yield(get_tree().create_timer(0.4), "timeout")
	
	anim.play('attack')
	yield(anim, 'animation_finished')
	
	emit_signal('end_turn')

func deal_damage():
	battle_unit.player.hp -= damage

func choose_target():
	pass

func die():
	queue_free()

