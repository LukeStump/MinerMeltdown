extends Node2D

@onready var ambient_music = get_child(0)
@onready var radio = get_child(1)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func radio_beep():
	radio.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !ambient_music.is_playing():
		ambient_music.play()
	pass
