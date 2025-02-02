extends Node2D

@onready var ice = get_child(0)
@onready var camera = get_child(1)
@onready var flamethrower = get_child(2)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	camera.visible = false
	pass # Replace with function body.

var melt_time = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("mine") and melt_time:
		flamethrower.throw_flame()
		await get_tree().create_timer(0.6).timeout
		ice.melt()
		if ice.is_melted():
			camera.visible = true
		flamethrower.flame_off()
	if Input.is_action_just_released("mine"):
		melt_time = true

func click_camera():
	if ice.is_melted():
#		#TODO add flash and dialogue
		SceneSwitcher.dialogue()
		#SceneSwitcher.end_cutscene()

#func _input(event):
	#if event.is_action_just_pressed("mine"):
		#ice.melt()

func _on_camera_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("click"):
		click_camera()
	pass # Replace with function body.
