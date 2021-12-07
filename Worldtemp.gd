#NEW

extends Node2D

onready var current_level = self.name

signal level_changed(level_name)

export(int) var level_name = 1

var level_parameters := {
	
}

func load_level_parameters(new_level_parameters: Dictionary): #UNUSED BUT IMPORTANT
	level_parameters = new_level_parameters

func _on_LevelTransition_level_change_zone_entered() -> void:
	emit_signal("level_changed", level_name)
