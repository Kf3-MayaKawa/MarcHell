extends CharacterBody2D

@export var speed : float = 50

var direction := Vector2.ZERO

@onready var animation_sprite : AnimatedSprite2D = $AnimatedSprite2D;
var animation_locked : bool = false

func _ready():
	return

func _physics_process(delta):
	velocity = direction * speed
	
	if direction.x > 0 :
		
		$AnimatedSprite2D.flip_h = true
	
	
	
	move(delta)
	
func _input(event):
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	
	
func move(delta):
	if !animation_locked :
		if velocity != Vector2.ZERO :
			if velocity.x > 0 :
				velocity.x += 1
				animation_sprite.flip_h = false
				animation_sprite.play("left&right")
			elif velocity.x < 0:
				velocity.x += -1
				animation_sprite.flip_h = true
				animation_sprite.play("left&right")
			elif   velocity.y > 0 :
				velocity.y += 1
				animation_sprite.play("down")
			elif direction.y < 0:
				velocity.x += -1
				animation_sprite.play("up")
			position += velocity * delta
		else:
			animation_sprite.stop()
		
