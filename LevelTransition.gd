#NEW

tool

extends Node2D

export(Vector2) var player_spawn_location = Vector2.ZERO

signal level_change_zone_entered

func _on_Area2D_area_entered(_area):
	PlayerStats.player_init_pos = player_spawn_location
	emit_signal("level_change_zone_entered")
	$Area2D.set_deferred("monitoring", false)
	
func _on_LevelTransition_level_change_zone_entered():
	$Area2D.set_deferred("monitoring", true)
