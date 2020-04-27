extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const Char = preload("Main.tscn")
var rng_start = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	rng_start.randomize()
	for i in range(10):
		var charachter = Char.instance()
		charachter.char_name = "Gubbe " + str(i)
		charachter.position = Vector2(rng_start.randi_range(0, get_viewport().size.x), rng_start.randi_range(0, get_viewport().size.y))
		add_child(charachter)


	#Lägg till 20 av klassen karaktär
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
