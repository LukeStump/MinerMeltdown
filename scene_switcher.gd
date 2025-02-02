extends Node

var current_scene = null
var main_scene = null

var object_num = 0

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
	#if event.is_action_pressed("click"):
		#dialogue()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var root = get_tree().root
	current_scene = root.get_child(root.get_child_count() - 1)
	#print(current_scene)

var dialogue_path = "res://Dialogue/testdialogue.dialogue"
var dialogue_names = ["no_item", "rock_interact", "deerskull_interact", "tree_interact", "fish_interact", "notDeer_interact", "alien_interact", "jerry_interact"]
func dialogue():
	if current_scene != main_scene:
		# in cutscene
		print("cutscene dialogue: " + str(object_num))
		show_dialogue(dialogue_names[object_num])
		
		pass
	else:
		# starting dialogue
		show_dialogue("start")
		pass

func show_dialogue(name):
	DialogueManager.show_example_dialogue_balloon(load(dialogue_path), name)

func cutscene_ice(res_path, object):
	object_num = object
	cutscene(res_path)
	
func cutscene(res_path):
	var scene = load(res_path).instantiate()
	switch_scene(scene, false)

func end_cutscene():
	switch_scene(main_scene, true)

func start_game():
	main_scene = load("res://main.tscn").instantiate()
	switch_scene(main_scene, true)
	
func switch_scene(scene, free):
	call_deferred("_deffered_switch_scene", scene, free)

func _deffered_switch_scene(scene, free):
	if free:
		current_scene.free()
	else:
		get_tree().root.remove_child(current_scene)
	current_scene = scene
	get_tree().root.add_child(scene)
	get_tree().current_scene = current_scene
