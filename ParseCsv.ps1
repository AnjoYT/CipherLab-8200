function UploadLookup([int]$comPort,[int]$baudrate) {
    #DLookup ParsedObjects.txt <COM Port>, <Baudrate 1-5>,<Download Via 1-3>, <Show Msg box 0-1>,<Show Progress 0-1>
    & "C:\CipherLab\Forge\Batch\8 Series\Utilities\DLookup.exe" .\ParsedObjects.txt,$comPort,$baudrate,1,0,1
}
function UploadApplication([int]$comPort,[int]$baudrate) {
    #AG_Load .\*.agx <COM Port>, <Baudrate 1-5>,<Download Via 1-3>,<File Type 1-3>, <Show Msg box 0-1>,<Show Progress 0-1>
    & "C:\CipherLab\Forge\Batch\8 Series\Utilities\AG_Load.exe" .\8200.agx,$comPort,$baudrate,1,1,0,1
}
function FunctionWrapper([System.Action[int,int]]$action) {
    Clear-host
    Write-Host "Podaj COM port oraz jego prędkość oddzielone przecinkiem (więcej w README)"
    Write-Host "np.: 1,1"
    Write-Host "Upewnij sie ze urzadzenie jest podlaczone pod wybrany COM port, po czym wcisnij ENTER" 
    $toSplit = Read-Host
    $parameters = $toSplit.Split(",")

    Write-Host "rozpoczecie dzialanie funkcji"
    $action.Invoke([int]$parameters[0],[int]$parameters[1])
}
function NormalizeDiacritics([string] $text) {
    $map = @{
        ([char]0x0105) = 'a'  # ą
        ([char]0x0107) = 'c'  # ć
        ([char]0x0119) = 'e'  # ę
        ([char]0x0142) = 'l'  # ł
        ([char]0x0144) = 'n'  # ń
        ([char]0x00F3) = 'o'  # ó
        ([char]0x015B) = 's'  # ś
        ([char]0x017A) = 'z'  # ź
        ([char]0x017C) = 'z'  # ż
    }
    $map.Keys|%{
        $text = $text.Replace($_,$map[$_])
        $text = $text.Replace($_.ToString().ToUpper(),$map[$_].ToString().ToUpper()) #TO DO: REFACTOR
    }
    return $text
}
function QuoteTrimmer([string]$preSplitString) {
    $stringBuilder = [System.Text.StringBuilder]::new();
    [int]$i = 1
    $preSplitString.Split(';')|%{
        [void]$stringBuilder.Append((NormalizeDiacritics($_).Trim('"').Trim()))
        if($i -lt 6){[void]$stringBuilder.Append(";")}
        $i++
    }
    $stringBuilder.ToString()
}
function CreateLookup {
    if(Get-Content -Path .\ParsedObjects.txt){
        Remove-Item -Path .\ParsedObjects.txt
    }
    $importedCSV = Import-Csv .\*.csv -Delimiter ';' -Encoding UTF8 |
        Select-Object "Nr inwentarzowy", "Nazwa","Wartość" , "Os. odpowiedzialna", "Umiejscowienie", "Grupa"
    $importedCSV | Export-Csv .\SelectedObjects.txt -NoTypeInformation -Delimiter ';' -Encoding UTF8
        Add-Content -Path .\ParsedObjects.txt -Encoding Ascii -Value(
        Get-Content -Path .\SelectedObjects.txt | % {
            if(!$_.contains("Nazwa")){
                QuoteTrimmer($_) 
            }
        }
    )
    Remove-Item -Path .\SelectedObjects.txt
}
Clear-host
Write-Output "Wybierz opcje:"
Write-Output "1 - Wygeneruj plik Lookup (UWAGA: wymaga pliku w formacie .CSV w lokacji skryptu)"
Write-Output "2 - Wgraj plik Lookup (UWAGA: wymaga pliku Lookup wygenerowanego przez opcje nr 1)"
Write-Output "3 - Wgraj Aplikacje (UWAGA: wymaga pliku .AGX w lokacji skryptu)"
Write-Output "4 - Zakoncz skrypt"
$value = Read-Host " "
switch($value){
   1 {CreateLookup }
   2 {
        $delegate = [System.Action[int,int]]{param($com,$baud) UploadLookup -comPort $com -baudrate $baud}
        FunctionWrapper -action $delegate
    }
   3 {  
        $delegate = [System.Action[int,int]]{param($com,$baud) UploadApplication -comPort $com -baudrate $baud}
        FunctionWrapper -action $delegate
    }
}