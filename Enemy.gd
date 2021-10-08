extends KinematicBody2D


var velocity = Vector2()
var speed = 50
export var direction = -1

func _ready() -> void:
	if direction == 1:
		$AnimatedSprite.flip_h = true
	$floorChecker.position.x = $CollisionShape2D.shape.get_extents().x * direction
	
func _physics_process(delta: float) -> void:
	velocity.y += 35
	
	if is_on_wall() or !$floorChecker.is_colliding():
		direction *= -1
		$AnimatedSprite.flip_h = !$AnimatedSprite.flip_h
		$floorChecker.position.x = $CollisionShape2D.shape.get_extents().x * direction
		
	velocity.x = speed * direction
	velocity = move_and_slide(velocity, Vector2.UP)


func _on_top_checker_body_entered(body: Node) -> void:
	$AnimatedSprite.play("dead")
	speed = 0
	set_collision_layer_bit(4, false)
	set_collision_mask_bit(0, false)
	$top_checker.set_collision_layer_bit(4, false)
	$top_checker.set_collision_mask_bit(0, false)
	$side_checker.set_collision_layer_bit(4, false)
	$side_checker.set_collision_mask_bit(0, false)
	$Timer.start()
	body.bounce()
	



func _on_Timer_timeout() -> void:
	queue_free()


func _on_side_checker_body_entered(body: Node) -> void:
	body.ouch(position)

