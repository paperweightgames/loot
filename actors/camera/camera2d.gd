extends Camera2D

const ROOM_SIZE = Vector2(128, 128)
const HALF_ROOM = ROOM_SIZE / 2

export (NodePath) var _target_node = ""
var _min_room = Vector2()
var _max_room = Vector2()

onready var _target: Node2D = get_node(_target_node)


func _init() -> void:
	update_room_size(_min_room, _max_room)
	return


func _process(delta) -> void:
	position = _get_target_position()
	return


func _get_target_position() -> Vector2:
	return Vector2(
		clamp(_target.position.x, _min_room.x, _max_room.x),
		clamp(_target.position.y, _min_room.y, _max_room.y)
	)


func update_room_size(min_room: Vector2, max_room: Vector2) -> void:
	_min_room = min_room * ROOM_SIZE + HALF_ROOM
	_max_room = max_room * ROOM_SIZE + HALF_ROOM
	return