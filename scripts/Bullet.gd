extends KinematicBody2D

export (bool) var local_chords = true


func _ready():
	$CPUParticles2D.local_coords = local_chords

# Sets position to the mouse position
func _unhandled_input(event):
	if event is InputEventMouseMotion:
		position = get_global_mouse_position()
		position.x += 3
		position.y += 5


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		print("on player")
