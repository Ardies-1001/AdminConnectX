#include <Inet.au3>
#include <Json.au3>
#include "key.au3"


Func Localisation($ip)
	
    Local $sURL = "https://api.apibundle.io/ip-lookup?apikey="& _GetPrivateKey() &"&ip=" & $ip

    Local $oHTTP = ObjCreate("WinHttp.WinHttpRequest.5.1")
    $oHTTP.Open("GET", $sURL, False)
    $oHTTP.Send()

    If $oHTTP.Status <> 200 Then
        MsgBox($MB_OK, "Erreur", "Une erreur s'est produite lors de la requête.")
        Return ""
    EndIf

    Return $oHTTP.ResponseText
EndFunc


Func Localisation_country($ip)
	Local $json = Localisation($ip)
	; je fais un test pour vérifier si tout le contenu est recupérer
	; ConsoleWrite($json)
	$data = Json_Decode($json)
	$country = Json_Get($data, '["country"]["name"]')
	;MsgBox($MB_OK, "Pays", "Le pays est : " & $country)
    Return $country
EndFunc
