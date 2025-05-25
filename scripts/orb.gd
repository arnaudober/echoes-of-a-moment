extends Sprite2D

var dragging := false
var drag_offset := Vector2.ZERO

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				var local_mouse = to_local(event.position)
				if get_rect().has_point(local_mouse):
					dragging = true
					drag_offset = global_position - event.position
					get_viewport().set_input_as_handled() # Optional: block other input
			else:
				dragging = false

	elif event is InputEventMouseMotion and dragging:
		global_position = event.position + drag_offset

# TODO: Create 2 areas for window and chair. When dragging an orb, the areas should be visible so the player knows where he can drop the orb.
# TODO: The orb should come back to the start position if not dropped in one of the designed areas.
# TODO: When all orbs in areas, we check if the order is correct for the level. If yes, the level is completed successfully, we let the player know. If no, we need to display a message to the player and invite him to retry. We reset therefore the level.
# TODO: Make the scene/level more beautifully designed, smooth, inviting, manscrafted style.
# TODO: We also need a way to introduce the player to the game. Maybe a tutorial, or instructions, or something to guide the player to what to do. For that, we'll have to convert our scene/level into a storytelling. How? Video? Scene dynamic? Something else?
# TODO: When all points completed, think and create level 2, then 3, then 4 (as many/little as wanted).
