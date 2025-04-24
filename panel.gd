extends Control

var open : bool

func _ready() -> void:
	position.x += 650
	open = false


func _on_button__pressed() -> void:
	if open:
		position.x += 650
		$Button2.text = "<"
	else:
		position.x -= 650
		$Button2.text = ">"
	open = !open
