extends Control

export (int) var DiceBar_maxValue
export (int) var DiceBar_Progress

func _ready():
	$DiceBar/ProgressBar.max_value = DiceBar_maxValue
	$DiceBar/ProgressBar.value = DiceBar_Progress

func _physics_process(delta):
	if Input.is_action_just_pressed("jump"):
		DiceBar_Progress += 1
		$DiceBar/ProgressBar.value = DiceBar_Progress
	
	if Input.is_action_just_pressed("E"):
		DiceBar_Progress = 0
		$DiceBar/ProgressBar.value = DiceBar_Progress
	
