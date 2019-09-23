extends Node

onready var enemy_pos = $enemyPos

onready var ui :UI= $UI
onready var sm = $SM

export(Array, PackedScene) var enemies := []



func _ready() -> void:
	randomize()
	sm.change_state(sm.q)
	
	pass
	player_turn()
	
	
	var enemy = battle_unit.enemy
	if enemy:
		enemy.connect('died', self, '_on_enemy_died')
	

func _on_enemy_died():
	
	ui.show_button_next_room()
	ui.show_buttons(false)
	pass

func player_turn():
	ui.show_buttons()
	battle_unit.player.recovery()
	yield(battle_unit.player, 'end_turn')
	enemy_turn()

func enemy_turn():
	ui.show_buttons(false)
	if battle_unit.enemy and not battle_unit.enemy.is_queue_for_deletion():
		battle_unit.enemy.attack()
		yield(battle_unit.enemy, 'end_turn')
	player_turn()

func _on_next_pressed() -> void:
	print('button_pressed')
	
	ui.show_button_next_room(false)
	
	ui.play_fade()
	
	var states := battle_unit.player
	states.ap = states.max_ap
	
	ui.show_buttons()
	
	create_enemy()


func create_enemy():
	enemies.shuffle()
	var E :PackedScene= enemies.front()
	var ins = E.instance()
	
	enemy_pos.add_child(ins)
	ins.connect('died', self, '_on_enemy_died')

func _on_SM_state_changed(new) -> void:
	print(new)
	match new:
		sm.battle:
			pass
		sm.idle:
			pass
		sm.q:
			ui.show_button_next_room()
			ui.show_buttons(false)
