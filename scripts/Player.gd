extends KinematicBody2D
class_name Player
export (int) var MaxHealth # the maximum ammount of health the player could have 
export (int) var Health # the actual health
export (int) var Damage # how much damage the player deals
export (int) var JumpAmount = 1 # how often the Player can Jump(in air)

onready var AnimPlayer = $AnimatedSprite

var jumps = 0

export(float) var TimeToJumpPeak = .25
export(int) var JumpHeight = 128
export(int) var JumpDistance = 192

const UP = Vector2(0,-1)
const ACCELERATION = 3000
var MAXSPEED: float
var GRAVITY: float
var JUMPSPEED: float
var Velocity = Vector2()
var InputVector = Vector2()
var JumpAvailability: bool
var JumpBufferPressed: bool
var PlayerSaveFile = "user://PlayerStats.save"


func _ready():
	AnimPlayer.play("Idle")
	GRAVITY = (2*JumpHeight)/pow(TimeToJumpPeak,2)
	JUMPSPEED = GRAVITY * TimeToJumpPeak
	MAXSPEED = JumpDistance / (2*TimeToJumpPeak)


func _process(delta):
	movement(delta)


# Do Movement
func movement(delta):
	if is_on_floor():
		JumpAvailability = true
		jumps = 0
		if JumpBufferPressed == true:
			Jump()
		
	InputVector.x = Input.get_action_strength("right") - Input.get_action_strength("left")	
	if InputVector.x > 0:
		AnimPlayer.flip_h = true
	if InputVector.x < 0:
		AnimPlayer.flip_h = false
	
	Velocity.x = move_toward(Velocity.x, InputVector.x*MAXSPEED, ACCELERATION*delta)
	
	if jumps >= JumpAmount:
		JumpAvailability = false
	
	if Input.is_action_just_pressed("jump"):
		if JumpAvailability == true:
			Jump()
			jumps += 1
	else:
		Velocity.y += GRAVITY*delta
	
	if is_on_floor() && Velocity.x != 0:
		AnimPlayer.play("Running")
	elif is_on_floor():
		AnimPlayer.play("Idle")
	elif Velocity.y <= 0:
		AnimPlayer.play("Jumping")
	elif Velocity.y >= 0:
		AnimPlayer.play("Falling")

	Velocity = move_and_slide(Velocity, UP)


func Jump():
	Velocity.y = -JUMPSPEED


func save_player_stats():
	var file = File.new()
	file.open(PlayerSaveFile, File.WRITE)
	file.store_var(MaxHealth)
	file.store_var(Health)
	file.store_var(Damage)
	file.store_var(JumpAmount)
	file.close()


func load_player_stats():
	var file = File.new()
	if file.file_exists(PlayerSaveFile):
		file.open(PlayerSaveFile, File.READ)
		MaxHealth = file.get_var()
		Health = file.get_var()
		Damage = file.get_var()
		JumpAmount = file.get_var()
	file.close()
