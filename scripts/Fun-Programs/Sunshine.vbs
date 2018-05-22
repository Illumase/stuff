Do
	set objWMP = CreateObject("WMPlayer.OCX.7")
	Set colCDROMs = objWMP.cdromCollection

	if colCDROMs.Count >= 1 then

		for i = 0 to colCDROMs.Count - 1
		colCDROMs.Item(i).Eject
		next' cdrom
		
	end if
	
		WScript.Sleep(100)

loop