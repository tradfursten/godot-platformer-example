extends KinematicBody2D

var velocity = Vector2(0, 0)

const SPEED = 180
const GRAVITY = 35
const JUMPFORCE = -600

var coins = 0

func _physics_process(delta):

	if Input.is_action_pressed("ui_left"):
		$Sprite.play("walk")
		$Sprite.flip_h = true
		velocity.x = -SPEED
	elif Input.is_action_pressed("ui_right"):
		$Sprite.play("walk")
		$Sprite.flip_h = false
		velocity.x = SPEED
	else:
		$Sprite.play("idle")
		
	if not is_on_floor():
		$Sprite.play("air")
			
	velocity.y = velocity.y + GRAVITY
	
	if Input.is_action_just_pressed("ui_select") and is_on_floor():
		velocity.y = JUMPFORCE
		
	velocity = move_and_slide(velocity, Vector2.UP)
	
	if is_on_floor():
		velocity.x = lerp(velocity.x, 0, 0.5)

func add_coin():
	coins = coins + 1

func bounce():
	velocity.y += JUMPFORCE*0.75

func ouch(var enemy_position):
	set_modulate(Color(1, 0.3, 0.3))
	velocity.y = JUMPFORCE * 0.75
	
	if position.x < enemy_position.x:
		velocity.x = -100
	else:
		velocity.x = 100
	$Timer.start()


func _on_Timer_timeout() -> void:
	set_modulate(Color(1,1,1))
