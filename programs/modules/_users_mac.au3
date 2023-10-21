
Func _GetMACFromIP ($sIP)
    Local $MAC,$MACSize
    Local $i,$s,$r,$iIP

	;Create the struct
	;{
	;   char    data[6];
	;}MAC
    $MAC        = DllStructCreate("byte[6]")

	;Create a pointer to an int
	;   int *MACSize;
    $MACSize    = DllStructCreate("int")

	;*MACSize = 6;
    DllStructSetData($MACSize,1,6)

	;call inet_addr($sIP)
    $r = DllCall ("Ws2_32.dll", "int", "inet_addr", _
                    "str", $sIP)
    $iIP = $r[0]

	;Make the DllCall
    $r = DllCall ("iphlpapi.dll", "int", "SendARP", _
                    "int", $iIP, _
                    "int", 0, _
                    "ptr", DllStructGetPtr($MAC), _
                    "ptr", DllStructGetPtr($MACSize))

	;Format the MAC address into user readble format: 00:00:00:00:00:00
    $s  = ""
    For $i = 0 To 5
        If $i Then $s = $s & ":"
        $s = $s & Hex(DllStructGetData($MAC,1,$i+1),2)
    Next

	;Must free the memory after it is used
    $MAC = 0
    $MACSize = 0

	;Return the user readble MAC address
    Return $s
EndFunc