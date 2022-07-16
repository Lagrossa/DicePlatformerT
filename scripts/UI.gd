extends Control

export (int) var DiceBar_maxValue
export (int) var DiceBar_Progress

var dice := Dice.new()

func _ready():
	$DiceBar/ProgressBar.max_value = DiceBar_maxValue
	$DiceBar/ProgressBar.value = DiceBar_Progress

func _physics_process(delta):
	if Input.is_action_just_pressed("jump"):
		DiceBar_Progress += 1
		$DiceBar/ProgressBar.value = DiceBar_Progress
	
	if Input.is_action_just_pressed("E") and DiceBar_Progress >= DiceBar_maxValue:
		DiceBar_Progress = 0
		$DiceBar/ProgressBar.value = DiceBar_Progress
		var roll = dice.dice_ability(dice.draw_roll([1,2,3,4,5,6],[.16,.16,.16,.16,.16,.16]))
		print(roll)
	
