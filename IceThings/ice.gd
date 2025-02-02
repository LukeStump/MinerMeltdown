extends StaticBody2D

@export var object = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	input_pickable = true

func _input_event (viewport:Viewport, event:InputEvent, shape_idx:int) -> void:
	if event.is_action_pressed("click"):
		SceneSwitcher.cutscene_ice("res://FrontOnMining/frontMining.tscn",object)
		#get_tree().change_scene_to_file("res://FrontOnMining/frontMining.tscn")
		queue_free()
