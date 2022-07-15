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
	var rvalue
	for n in weights:
		totalWeight += n
	if totalWeight != 1:
		rng.randi_range(0, values[values.size()-1])
	else:
		roll = rng.randf()
		if roll < values[0]:
			rvalue = values[0]
		elif roll < values[1]:
			rvalue = values[1]
		elif roll < values[2]:
			rvalue = values[2]
		elif roll < values[3]:
			rvalue = values[3]
		elif roll < values[4]:
			rvalue = values[4]
		elif roll < values[5]:
			rvalue = values[5]
		elif roll < values[6]:
			rvalue = values[6]
	print("rolled ", rvalue)
	return rvalue
