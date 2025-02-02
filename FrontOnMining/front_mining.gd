extends Node2D

@onready var ice = get_child(0)
@onready var camera = get_child(1)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var melt_time = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_released("mine"):
		if melt_time:
			ice.melt()
		else:
			melt_time = true
	pass

func click_camera():
	if ice.is_melted():
#		#TODO add flash
		SceneSwitcher.end_cutscene()

#func _input(event):
	#if event.is_action_just_pressed("mine"):
		#ice.melt()

func _on_camera_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("click"):
		click_camera()
	pass # Replace with function body.
