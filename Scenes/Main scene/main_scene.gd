extends Node2D


func _ready():
	$"Stella's layer/Stella/Animations".play("Light match")


func _process(_delta):
	if Input.is_action_pressed("spacebar"):
		$"Stella's layer/Stella/Animations".play("Light match")
