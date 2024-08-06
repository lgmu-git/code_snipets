## Description
## 
## Description
class_name SelectSnippet
extends PopupMenu

const dir: StringName = "res://addons/code_snipets/Snippets/"
var snipet_arr: Array[Snipet_res]


func showSnippets() -> void:
	# Get Snippets
	var dir = DirAccess.open(dir)
	if (dir):
		self.clear(true)
		dir.list_dir_begin()
		var file = dir.get_next()
		while (file != ""):
			addSnippet(file)
			file = dir.get_next()
		self.visible = true

func addSnippet(file: StringName) -> void:
	var r: Snipet_res = ResourceLoader.load(dir + file, "Sniped_res")
	self.add_item(r.name)
	snipet_arr.push_back(r)

