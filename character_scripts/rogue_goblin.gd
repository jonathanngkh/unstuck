extends CharacterBody2D

@onready var rogue_sprite: AnimatedSprite2D = $RogueSprite

@export var default_speed = 50


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rogue_sprite.play("idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("move_left"):
		velocity.x = -default_speed
		rogue_sprite.scale.x = -1
	if Input.is_action_just_released("move_left"):
		velocity.x = 0
	if Input.is_action_pressed("move_right"):
		velocity.x = default_speed
		rogue_sprite.scale.x = 1
	if Input.is_action_just_released("move_right"):
		velocity.x = 0
	if velocity == Vector2.ZERO:
		rogue_sprite.play("idle")
	else:
		rogue_sprite.play("run")
	
	move_and_slide()
