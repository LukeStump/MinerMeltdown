extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

var body = null

func area_entered(area: Area2D):
	print("OUEFHIHWEBFIBQEIF")

func body_entered(b: Node2D):
	#print("yelooooo")
	body = b

func body_exited(b: Node2D):
	#print("oooooley")
	body = null
