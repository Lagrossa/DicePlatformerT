extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func draw_roll(values, weights):
	var totalWeight = 0
	var roll
	for n in weights:
		totalWeight += n
	if totalWeight != 1:
		rng.randi_range(0, values[values.size()-1])
	else:
		roll = rng.randf()
