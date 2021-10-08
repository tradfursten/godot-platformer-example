extends Area2D

signal coin_collected

var active = true

func _ready() -> void:
	pass


func _on_Coin_body_entered(body: Node) -> void:
	active = false
	$AnimationPlayer.play("bounce")
	emit_signal("coin_collected")
	set_collision_mask_bit(0, false)





func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if anim_name == "bounce":
		queue_free()
