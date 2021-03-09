# script ini adalah singleton/autoload
extends Node

func generate_random_kombinasi(kombinasi_length):
	var kombinasi_generate = []	
	for num in range(kombinasi_length):
		kombinasi_generate.append(randi() % 10)
	return kombinasi_generate
