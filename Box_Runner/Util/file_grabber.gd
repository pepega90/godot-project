extends Node


# file_grabber.gd akan ke directory untuk mendapatkan seluruh food types
# dan menjadikannya projectile yang di tembakan secara random
# file_grabber.gd menjadi autoload singleton, jadi bisa di akses di seluruh game script

func get_files(folder):
	var gathered_files = {}  #berisikan file food types
	var file_count = 0 #menghitung banyaknya jumlah file food types
	var dir = Directory.new() #membuat directory untuk mengakses folder food types
	
	dir.open(folder) # membuka folder food types
	dir.list_dir_begin() # mengurut directory dari awal
	
	while true:
#		selama true, kita mau mendapatkan file selanjutnya
		var file = dir.get_next()
#		jika filenya sudah tidak ada makan akan kita break
		if file == "":
			break
#		jika masih, maka kita check apakah filenya tidak diawali dengan .
		elif not file.begins_with(".") and not file.ends_with("import"):
#			kita assing path file (folder + file) ke ke dict gathered files
#			dan untuk setiap keynya kita gunakan files_count lalu increment
			gathered_files[file_count] = folder + file
			file_count += 1
	
	return gathered_files
