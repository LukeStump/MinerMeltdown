extends Node2D

@onready var audioPlayer = get_node("Neigh")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	audioPlayer.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	SceneSwitcher.start_game()
	pass # Replace with function body.
