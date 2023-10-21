#include <FileConstants.au3>
#include <MsgBoxConstants.au3>

Func GenerateOrRetrieveString()
	
    Local Const $OUTPUT_FILE = @ScriptDir & "\generated_string.txt"

    ; Vérifier si le fichier existe et n'est pas vide
    If FileExists($OUTPUT_FILE) And FileGetSize($OUTPUT_FILE) > 0 Then
        Local $existingString = ReadStringFromFile($OUTPUT_FILE)
        Return $existingString
    Else
        ; Générer une nouvelle chaîne de caractères aléatoire
        Global $randomString = GenerateRandomString(10)

        ; Enregistrer la nouvelle chaîne de caractères dans un fichier texte
        If SaveStringToFile($randomString, $OUTPUT_FILE) Then
            MsgBox($MB_OK, "Succès", "Une nouvelle chaîne de caractères a été générée et enregistrée.")
        EndIf
    EndIf
EndFunc

Func GenerateRandomString($length)
    Local $charSet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    Local $randomString = ""

    For $i = 1 To $length
        $randomString &= StringMid($charSet, Random(1, StringLen($charSet), 1), 1)
    Next

    Return $randomString
EndFunc

Func SaveStringToFile($str, $file)
    Local $hFile = FileOpen($file, $FO_OVERWRITE)
    If $hFile = -1 Then
        Return False
    EndIf

    FileWrite($hFile, $str)
    FileClose($hFile)
    Return True
EndFunc

Func ReadStringFromFile($file)
    Local $hFile = FileOpen($file, $FO_READ)
    If $hFile = -1 Then
        Return ""
    EndIf

    Local $content = FileRead($hFile)
    FileClose($hFile)
    Return $content
EndFunc

