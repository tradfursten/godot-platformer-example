extends Area2D

signal goal_entered

func _ready() -> void:
	pass
	
func activate_goal() -> void:
	self.set_collision_mask_bit(0, true)
	$AnimatedSprite.play("open")
	
func _on_Goal_body_entered(body: Node) -> void:
	print("Goal! (in goal)")
	emit_signal("goal_entered")
