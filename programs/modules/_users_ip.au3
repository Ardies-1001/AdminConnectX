

; Adresse IP priv�e 
Func _GetPrivateIP()
    Local $sIP = @IPAddress1 ; R�cup�re l'adresse IP priv�e du syst�me
    Return $sIP
EndFunc

; Adresse IP publique 
Func _GetPublicIP()
    Local $sIP =  _INetGetSource("https://api.ipify.org") ; R�cup�re l'adresse IP publique � partir d'un service en ligne
    Return $sIP
EndFunc