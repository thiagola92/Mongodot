## Arguments to be used in the Python executable.
class_name PythonArgs
extends RefCounted


const CODEPATH = "--code-path"

const URI = "--uri"

const DB = "--database"

const PAGE_SIZE = "--page-size"

var uris: Array[String] = ["mongodb://127.0.0.1:27017"]

var dbs: Array[String] = ["admin"]

var page_size: int = 20


## Returns an Array respecting the sequence of argument and value.
## [br]In others words: [code][argument1, value1, argument2, value2, argument3, value3, ...][/code]
func to_array(code_path: String) -> Array[String]:
	var global_code_path: String = ProjectSettings.globalize_path(code_path)
	var args: Array[String] = []
	
	args.append_array([CODEPATH, global_code_path])
	args.append_array([PAGE_SIZE, str(page_size)])
	
	for uri in uris:
		args.append_array([URI, uri])
	
	for db in dbs:
		args.append_array([DB, db])
	
	return args
