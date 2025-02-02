extends Node2D

@onready var flamethrower = get_child(0)
@onready var flame = get_child(1)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	flamethrower.play()

func throw_flame():
	flame.play()
	flame.frame = 0
	await get_tree().create_timer(0.4).timeout
	flame.animation = "flame_sustain"

func flame_off():
	flame.stop()
	flame.animation = "flame_up"
	flame.frame = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
