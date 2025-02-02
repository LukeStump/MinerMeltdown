extends StaticBody2D

@export var object = 0

@onready var ice = get_child(1)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if object == -1:
		ice.frame = 3
	elif object != 0:
		ice.frame = 1
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#input_pickable = true
	pass

func melt_ice_scene():
	if object == -1:
		# satchel scene
		SceneSwitcher.cutscene("res://Satchel.tscn")
	else:
		SceneSwitcher.cutscene_ice("res://FrontOnMining/frontMining.tscn",object)
	queue_free()

#func _input_event (viewport:Viewport, event:InputEvent, shape_idx:int) -> void:
	#if event.is_action_pressed("click"):
		#melt_ice_scene()
