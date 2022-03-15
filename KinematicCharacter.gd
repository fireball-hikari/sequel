extends KinematicBody

export (float) var run_speed = 1
export (Vector3) var gravity  = ProjectSettings.get_setting("physics/3d/default_gravity_vector") * ProjectSettings.get_setting("physics/3d/default_gravity")

var velocity = Vector3.ZERO

func _physics_process(_delta):
	var up = Input.is_action_pressed("ui_up")
	var down = Input.is_action_pressed("ui_down")
	var right = Input.is_action_pressed("ui_right")
	var left = Input.is_action_pressed("ui_left")

	var run_velocity =  run_speed * Vector3(
		1 if right else 0 -1 if left else 0,
		0,
		1 if down else 0 - 1 if up else 0
	)

	velocity.y = move_and_slide(
		velocity + run_velocity + gravity,
		Vector3(0, -1, 0)
	).y
