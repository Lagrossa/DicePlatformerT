extends KinematicBody2D

export (bool) var local_chords = true
export (int) var max_bullet_lifetime = 300

var bullet_lifetime = 0
var bullet_on = false

func _ready():
	$CPUParticles2D.local_coords = local_chords


# Sets position to the mouse position
func _unhandled_input(event):
	if event is InputEventMouseMotion:
		position = get_global_mouse_position()
		position.x += 3
		position.y += 5


func _process(delta):

	if Input.is_action_just_pressed("bullet"):
		if bullet_lifetime <= max_bullet_lifetime:
			bullet_on = true
			show()
			$CPUParticles2D.emitting = true
			$AudioStreamPlayer.playing = true
			$Area2D/Hitbox.disabled = false
	
	if Input.is_action_just_released("bullet") or bullet_lifetime == max_bullet_lifetime:
		hide()
		bullet_on = false
		$CPUParticles2D.emitting = false
		$AudioStreamPlayer.playing = false
		$Area2D/Hitbox.disabled = true
	
	if bullet_on == true and int(bullet_lifetime) <= int(max_bullet_lifetime) - 1:
		bullet_lifetime += 1
	if not bullet_on and int(bullet_lifetime) <= int(max_bullet_lifetime) and bullet_lifetime >= 1:
		bullet_lifetime -= 1


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		print("on player")
