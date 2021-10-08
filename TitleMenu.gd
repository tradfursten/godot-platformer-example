extends CanvasLayer

signal level_completed
signal level_failed

func _ready() -> void:
	pass


func _on_Button_pressed() -> void:
	emit_signal("level_completed", "TitleMenu", 0)
