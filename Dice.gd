extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	print(draw_roll([1,2,3,4,5,6],[.1, .2, .3, .2, .1, .1]))
	print(draw_roll([1,2,3,4,5,6],[.1, .2, .3, .2, .1, .1]))
	print(draw_roll([1,2,3,4,5,6],[.1, .2, .3, .2, .1, .1]))
	print(draw_roll([1,2,3,4,5,6],[.1, .2, .3, .2, .1, .1]))
	print(draw_roll([1,2,3,4,5,6],[.1, .2, .3, .2, .1, .1]))
	print(draw_roll([1,2,3,4,5,6],[.1, .2, .3, .2, .1, .1]))


func draw_roll(values, weights):
	var totalWeight = 0
	var roll
	var rvalue
	for n in weights:
		totalWeight += n
	if totalWeight != 1:
		rng.randomize()
		return rng.randi_range(0, 6) # this works
	else:
		roll = rng.randf_range(0,1)
		print(roll, " ROLL")
		if roll >= weights[0] + weights[1] + weights[2] + weights[3] + weights[4]:
			print("got heeeere")
			rvalue = values[5]
			return rvalue
		elif roll >= weights[0] + weights[1] + weights[2] + weights[3]:
			print("got here")
			rvalue = values[4]
			return rvalue
		elif roll >= weights[0] + weights[1] + weights[2]:
			rvalue = values[3]
			return rvalue
		elif roll >= weights[0] + weights[1]:
			rvalue = values[2]
			return rvalue
		elif roll >= weights[0] + weights[1]:
			rvalue = values[1]
			return rvalue
		elif roll >= 0:
			rvalue = values[0]
	print("rolled ", rvalue)
	return rvalue
