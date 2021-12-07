#NEW
extends Node

onready var current_level = $World1


func _ready() -> void:
	current_level.connect("level_changed", self, "handle_level_changed")
	

func handle_level_changed(current_level_name):
	var next_level
	var next_level_name
	
	match current_level_name:
		1:
			next_level_name = 2
		2:
			next_level_name = 1
		_:
			return
			
	next_level = load("res://" + "World" + str(next_level_name) + ".tscn" ).instance()
	call_deferred("add_child", next_level)
	next_level.connect("level_changed", self, "handle_level_changed")
	current_level.queue_free()
	current_level = next_level
	transfer_data_between_scenes(current_level, next_level) #UNUSED BUT IMPORTANT

	
func transfer_data_between_scenes(old_scene, new_scene):
	new_scene.load_level_parameters(old_scene.level_parameters)
