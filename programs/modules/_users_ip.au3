

; Adresse IP privée 
Func _GetPrivateIP()
    Local $sIP = @IPAddress1 ; Récupère l'adresse IP privée du système
    Return $sIP
EndFunc

; Adresse IP publique 
Func _GetPublicIP()
    Local $sIP =  _INetGetSource("https://api.ipify.org") ; Récupère l'adresse IP publique à partir d'un service en ligne
    Return $sIP
EndFunc