extends CharacterBody2D


const SPEED = 150.0
var direction: Vector2

func _ready():
	$AnimatedSprite2D.play("idle")
	
func _physics_process(delta):
	
	velocity = Vector2.ZERO
	
	direction.x = Input.get_axis("ui_left", "ui_right")
	direction.y = Input.get_axis("ui_up", "ui_down")
	if direction:
		velocity += direction
		velocity = velocity.normalized() * SPEED
		$AnimatedSprite2D.play("walk")
		if direction.x > 0:
			if $AnimatedSprite2D.flip_h == false:
				$PointLight2D.position.x += 100
			$AnimatedSprite2D.flip_h = true
		else:
			if $AnimatedSprite2D.flip_h == true:
				$PointLight2D.position.x -= 100
			$AnimatedSprite2D.flip_h = false
			
	else:
		$AnimatedSprite2D.play("idle")
		
	move_and_slide()
