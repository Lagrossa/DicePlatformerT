extends Node


# This node should recieve a signal from the parent to start the launch sequence. The payload must be the parent's position + 
var launch_height: int = 50
var last_known_player_pos: Vector2
var parent_position: Vector2


# The spore will tween between the positions inside this array
var targets_queue: Array = []

signal spore_generate

func _ready():
	set_process(false)
	connect("spore_generate",self,"launch_spore")
	launch_spore()

# Launch the spore
func launch_spore() -> void:
	$Tween.interpolate_property(self,"position",self.position,Vector2(self.position.x,self.position.y - launch_height),0.3,3)
	$Tween.start()
	yield($Tween,"tween_all_completed")
	set_process(true)


func _process(delta):
	print(targets_queue)
	if targets_queue.size() != 0:
		var next_position = targets_queue.front()
		$Tween.interpolate_property(self,"position",self.position,next_position,0.3)
		$Tween.start()
		yield($Tween,"tween_all_completed")



func _on_detection_range_area_entered(area):
	if area.name == "player_detection_range":
		targets_queue.append(get_node("/root/Player").position)
