extends Node
class_name Dice
var rng = RandomNumberGenerator.new()
onready var player = get_tree().get_nodes_in_group("player")[0]


func dice_ability(value):
	var dice_to_ability = {
		1 : "add_life", 
		2 : jump_height(),
		3 : "increase_damage",
		4 : "spawn_enemy",
		5 : "damage_player",
		6 : jump_height(),
	}
#	match value: # I'm not sure if you can call functions from dictionaries in gdscript. If it doesn't work just use this
#		1:
#			print("lol")
#		2:
#			 player.JumpHeight
#		_:
#			player.JumpHeight = 500
	return dice_to_ability[value]


func jump_height():
	player.JumpHeight += 50
	

func draw_roll(values, weights): # Array Values, Array Weights
	var totalWeight = 0
	var roll
	var rvalue
	for n in weights:
		totalWeight += n
	if totalWeight != 1:
		rng.randomize()
		return rng.randi_range(1, 6) # this works
	else:
		roll = rng.randf_range(0,1)
		print(roll, " ROLL")
		if roll >= weights[0] + weights[1] + weights[2] + weights[3] + weights[4]:
			rvalue = values[5]
			return rvalue
		elif roll >= weights[0] + weights[1] + weights[2] + weights[3]:
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
