extends Popup

func set_text(kombinasi):
	$NinePatchRect/CenterContainer/NinePatchRect/Label.text = (
		"Sudah kubilang jangan suka pikun!, kode yang ku berikan adalah "
		+ PoolStringArray(kombinasi).join("") + 
		", ini adalah yang terakhir kalinya!"
	)
	
#	"Sudah kubilang jangan suka pikun, kode yang ku berikanadalah " + PoolStringArray(kombinasi).join("") + 
#		+ ", ini adalah yang terakhir kalinya!"
