extends CharacterBody2D

var _move_speed: float = 350.0


var _friction: float = 0.05
var _acceleration: float = 0.1

func _physics_process(_delta: float) -> void:#float=pode variar 
	_move()#metodo pra chamar a movimentaçao
	move_and_slide()#metodo pra chamar a açao de mover e deslizar 
	
func _move() -> void:
	var _direction: Vector2 = Vector2(
		 Input.get_axis("esquerda", "direita"),
		Input.get_axis("cima", "baixo"))

	if _direction != Vector2.ZERO:
		velocity.x = lerp(velocity.x, _direction.normalized().x * _move_speed, _acceleration)
		velocity.y = lerp(velocity.y, _direction.normalized().y * _move_speed, _acceleration)
		return
		
	velocity.x = lerp(velocity.x, _direction.normalized().x * _move_speed, _friction)
	velocity.y = lerp(velocity.y, _direction.normalized().y * _move_speed, _friction)
