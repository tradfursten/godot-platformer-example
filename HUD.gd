extends CanvasLayer

var coins = 0
var thousand_digit = 0
var hundred_digit = 0
var ten_digit = 0
var one_digit = 0

var numbers = {}



func _ready() -> void:
	numbers[0] = preload("res://assets/numbers/0.png")
	numbers[1] = preload("res://assets/numbers/1.png")
	numbers[2] = preload("res://assets/numbers/2.png")
	numbers[3] = preload("res://assets/numbers/3.png")
	numbers[4] = preload("res://assets/numbers/4.png")
	numbers[5] = preload("res://assets/numbers/5.png")
	numbers[6] = preload("res://assets/numbers/6.png")
	numbers[7] = preload("res://assets/numbers/7.png")
	numbers[8] = preload("res://assets/numbers/8.png")
	numbers[9] = preload("res://assets/numbers/9.png")

	display_score()
	
	
func display_score():
	$"1000".texture = numbers[coins/1000%10]
	$"100".texture = numbers[coins/100%10]
	$"10".texture = numbers[coins/10%10]
	$"1".texture = numbers[coins%10]


func _on_coin_collected():
	coins = coins + 1
	display_score()
	
func set_score(score):
	coins = score

	
