extends Node

const FILE_PATH : String = "user://SaveFileName.json"

var save_data : Dictionary = {
	"best_points": 0
}

func _save() -> void:
	var file : FileAccess = FileAccess.open(FILE_PATH, FileAccess.WRITE)
	file.store_var(save_data)
	file.close()

func _load() -> void:
	if FileAccess.file_exists(FILE_PATH):
		var file : FileAccess = FileAccess.open(FILE_PATH, FileAccess.READ)
		var data : Dictionary = file.get_var()
		for i in data:
			if save_data.has(i):
				save_data[i] = data[i]
		file.close()
