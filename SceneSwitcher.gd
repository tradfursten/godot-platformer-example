extends Node

var current_scene
var next_scene

func _ready() -> void:
	current_scene = $MainMenu
	current_scene.connect("level_completed", self, "_on_level_completed")
	current_scene.connect("level_failed", self, "_on_level_failed")

func _on_level_completed(current_scene_name, score) -> void:
	print(current_scene_name + " is complete")
	var next_scene_name: String
	match current_scene_name:
		"TitleMenu":
			next_scene_name = "Level0"
		"Level0":
			next_scene_name = "Level1"
		"Level1":
			next_scene_name = "Win"
	handle_scene_change(next_scene_name, score)
			
func _on_level_failed(level_name):
	print("Level failed: " + level_name)
	handle_scene_change("Lose", 0)
			

func handle_scene_change(next_scene_name: String, score) -> void:
	print("switch to " + next_scene_name)
	next_scene = load("res://"+next_scene_name + ".tscn").instance()

	next_scene.connect("level_completed", self, "_on_level_completed")
	next_scene.connect("level_failed", self, "_on_level_failed")
	if next_scene.has_method("set_score"):
		next_scene.set_score(score)
	
	print(next_scene.get_signal_connection_list("level_failed"))
	
	$AnimationPlayer.play("fade_in")

	

func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	match anim_name:
		"fade_in":
			add_child(next_scene)
			current_scene.queue_free()
			current_scene = next_scene
			next_scene = null
			$AnimationPlayer.play("fade_out")
		
