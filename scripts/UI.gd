extends Control

export (int) var DiceBar_maxValue

onready var dice = $DiceSystem
onready var Bullet = get_tree().get_nodes_in_group("bullet")[0]

func _ready():
	$bars/DiceBar.max_value = DiceBar_maxValue
	$bars/EnergyBar.max_value = Bullet.max_bullet_lifetime

func _physics_process(delta):
	updating_bars()
	
	if Input.is_action_just_pressed("jump"):
		$bars/DiceBar.value += 1 
	
	if Input.is_action_just_pressed("E"): #and DiceBar_Progress >= DiceBar_maxValue:
		$bars/DiceBar.value = 0
		var roll = dice.dice_ability(dice.draw_roll([1,2,3,4,5,6],[.16,.16,.16,.16,.16,.16]))
		print(roll)


func updating_bars():
	var diceBar = $bars/DiceBar
	var energyBar = $bars/EnergyBar
	
	energyBar.value = int(Bullet.max_bullet_lifetime) - Bullet.bullet_lifetime
