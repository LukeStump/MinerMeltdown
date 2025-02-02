extends Node2D

@onready var creditSprite = get_child(0)
@onready var song = get_child(1)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	song.play()
	pass # Replace with function body.

var time_elapsed = 0
@export var speed = 400
@onready var initial_pos = creditSprite.position.y
@export var max_disp = 1336
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time_elapsed += delta
	creditSprite.position.y = (initial_pos - min(time_elapsed*speed, max_disp))
	pass
