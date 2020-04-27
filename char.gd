extends KinematicBody2D

var current_dir = Vector2(0,0)
var destination = Vector2(0,0)
var speed = 50
var state = 1
var char_name = "test"
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Label").text = char_name
	rng.randomize()
	destination = Vector2(rng.randi_range(0, get_viewport().size.x), rng.randi_range(0, get_viewport().size.y))
	print(destination)
	designated_target()

func _input(event):
	
	if event.is_action_pressed("click"):
		state = 1
		destination = get_global_mouse_position()
		
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if state == 1:
		designated_target()
	else:
		wander()
	


func designated_target():
	current_dir = (destination - position).normalized() * speed
	if (destination - position).length() > 5:
		move_and_slide(current_dir)
	else:
		state = 0

func wander():
	current_dir = (destination - position).normalized() * speed
	if (destination - position).length() > 5:
			move_and_slide(current_dir)
	else:
		destination = Vector2(rng.randi_range(position.x-50, position.x+50), rng.randi_range(position.y-50, position.y+50))
