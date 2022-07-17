extends Reference
class_name Dice
<<<<<<< Updated upstream:scripts/Dice.gd
var rng = RandomNumberGenerator.new()
onready var player = get_tree().get_nodes_in_group("player")[0]
<<<<<<< HEAD

=======
>>>>>>> Stashed changes:Dice.gd
=======
var jh = funcref(self, "jump_height")
var db = funcref(self, "damage_buff")
var td = funcref(self, "take_damage")
var hd = funcref(self, "take_damage")
var se = funcref(self, "spawn_enemy")
>>>>>>> 1d263c98c7f11885e34a769db37067edbdaa4c3e

func dice_ability(value):
	var dice_to_ability = {
		1 : jh, # jump
		2 : db,
		3 : td,
		4 : hd,
		5 : se,
		6 : jh,
	}
<<<<<<< HEAD


func jump_height():
<<<<<<< Updated upstream:scripts/Dice.gd
	player.JumpHeight += 50
	
=======
	JumpHeight += 50
	print("TESTING")

>>>>>>> Stashed changes:Dice.gd
=======

	return dice_to_ability[value].call_func()


func jump_height():
	var jumps = rng.randi_range(1,6)
	print("jumps", jumps)
	player.JumpAmount = jumps
>>>>>>> 1d263c98c7f11885e34a769db37067edbdaa4c3e

func damage_buff():
	var damage = rng.randi_range(1,3)
	print("player damage", damage)
	player.Damage += damage
	
func take_damage():
	var damage = rng.randi_range(1,3)
	print("take damage", damage)
	player.Health -= damage
	
func heal_damage():
	var damage = rng.randi_range(1,6)
	print("heal damage", damage)
	player.Health += damage

func spawn_enemy():
	#no enemy spawning code yet..
	print("would spawn enemy")
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
