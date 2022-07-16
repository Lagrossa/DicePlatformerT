extends KinematicBody2D
class_name Player2

export (int) var MaxHealth # the maximum ammount of health the player could have 
export (int) var Health # the actual health
export (int) var Damage # How much damage the player deals
export (int) var JumpAmmount = 1 # Jow often the Player can Jump(in air)

export (int) var speed = 150
export (int) var Gravity = 400
export (int) var Jumppower = 225

const UP_VECTOR = Vector2(0, -1)

var jumps = 0 # needed to detect how often player already jumped, reset every time player is on ground
var velocity = Vector2()
var canMove = true

func _ready():
	pass


func _process(delta):
	velocity.x = 0

	if is_on_ceiling():
		velocity.y = 0

	if is_on_floor():
		velocity.y = 0
		jumps = 0

	if canMove == true:
		velocity.y += Gravity * delta

	if canMove == true:
		check_Input()

	move_and_slide(velocity, UP_VECTOR)


func check_Input():


	if Input.is_action_pressed("right"):
		velocity.x += 1 * speed
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("run")


	if Input.is_action_just_released("right"):
		$AnimatedSprite.play("Idle")

	if Input.is_action_pressed("left"):
		velocity.x -= 1 * speed
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("run")

	if Input.is_action_just_released("left"):
		$AnimatedSprite.play("Idle")


	if Input.is_action_just_pressed("jump") and JumpAmmount >= 2 and jumps <= (JumpAmmount - 1) :
		velocity.y = -Jumppower
		jumps += 1
	else:
		if Input.is_action_just_pressed("jump") and is_on_floor() == true:
			velocity.y = -Jumppower
			jumps += 1


	if velocity.y <= 0:
		$AnimatedSprite.play("jumping")
	if velocity.y >= 0 && is_on_floor() == false:
		$AnimatedSprite.play("falling")


	if is_on_floor() == true && velocity.x == 0:
		$AnimatedSprite.play("Idle")
