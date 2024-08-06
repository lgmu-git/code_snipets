@tool
extends EditorPlugin

var menu: SelectSnippet
var edit: CodeEdit

func _enter_tree() -> void:
	menu = SelectSnippet.new()
	menu.id_pressed.connect(snipedPressed)
	menu.position.x = 10
	menu.position.y = 30
	add_child(menu)
	
	# This line should be here, although the engine cannot load it
	#edit = EditorInterface.get_script_editor().get_current_editor().get_base_editor()

func _exit_tree() -> void:
	# Clean-up of the plugin goes here.
	menu.queue_free()

func _shortcut_input(event: InputEvent) -> void:
	if ( (event.is_pressed()) and (Input.is_key_pressed(KEY_CTRL)) and (Input.is_key_pressed(KEY_1)) ):
		if (edit == null):
			edit = EditorInterface.get_script_editor().get_current_editor().get_base_editor()
		menu.showSnippets()

func snipedPressed(id: int):
	print("Inser text: ", menu.snipet_arr[id].name, ":\n", menu.snipet_arr[id].snipet)
	edit.insert_text_at_caret(menu.snipet_arr[id].snipet)


# oooooooooooooooooooo oooooooooooooooooooo oooooooooooooooooooo
# oooooooooooooooooooo      my Class        oooooooooooooooooooo
# oooooooooooooooooooo oooooooooooooooooooo oooooooooooooooooooo

# oooooooooooooooooooo oooooooooooooooooooo oooooooooooooooooooo

# oooooooooooooooooooo oooooooooooooooooooo 

# oooooooooooooooooooo 
