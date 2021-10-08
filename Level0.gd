extends Node2D

signal level_completed
signal level_failed

export (String) var level_name = "Level0"


func _ready() -> void:
	for child in $coins.get_children():
		child.connect("coin_collected", self, "should_goal_be_active")
		child.connect("coin_collected", $HUD, "_on_coin_collected")
	
	$Goal.connect("goal_entered", self, "level_completed")

	
	
func should_goal_be_active():
	var activate_goal = true
	for coin in $coins.get_children():
		if coin.active:
			activate_goal = false
			
	if activate_goal:
		$Goal.activate_goal()



func _on_fallzone_body_entered(body: Node) -> void:
	print("fallzone")
	emit_signal("level_failed", level_name)


func level_completed() -> void:
	print("Goal! (in level0)")
	emit_signal("level_completed", level_name, $HUD.coins)

func set_score(score):
	$HUD.set_score(score)

