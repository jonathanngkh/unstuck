extends CharacterBody2D

@onready var rogue_sprite: AnimatedSprite2D = $RogueSprite

@export var default_speed := 50
var attacking := false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rogue_sprite.play("idle")
	rogue_sprite.animation_finished.connect(_on_animation_finished)

func _on_animation_finished()->void:
	print(rogue_sprite.animation)
	if rogue_sprite.animation == "attack":
		print("attack finished")
		attacking = false
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("move_left") and not attacking:
		velocity.x = -default_speed
		rogue_sprite.scale.x = -1
	if Input.is_action_just_released("move_left"):
		velocity.x = 0
	if Input.is_action_pressed("move_right") and not attacking:
		velocity.x = default_speed
		rogue_sprite.scale.x = 1
	if Input.is_action_just_released("move_right"):
		velocity.x = 0
	if Input.is_action_just_pressed("attack") and not attacking:
		velocity.x = 0
		attacking = true
		rogue_sprite.play("attack")
		
	
	if not attacking:
		if velocity == Vector2.ZERO:
			rogue_sprite.play("idle")
		else:
			rogue_sprite.play("run")
	
	move_and_slide()
