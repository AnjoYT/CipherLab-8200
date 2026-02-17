📦 Konfiguracja programu
Parametry wejściowe
Argument	Opis
Nazwa pliku	Maksymalna długość: 256 bajtów.
Wymagana pełna ścieżka, jeśli plik nie znajduje się w bieżącym katalogu roboczym.
Port COM	Zakres: 1–255.
Domyślnie: 1.
Szybkość transmisji (Baudrate)	Zakres: 1–5.
Domyślnie: 1 (115200 bps).

Dostępne opcje:
1 → 115200 bps
2 → 57600 bps
3 → 38400 bps
4 → 19200 bps
5 → 9600 bps
Pobieranie przez (Download via)	Zakres: 1–3.
Domyślnie: 1.

Opcje:
1 → RS-232 lub IrDA
2 → Cradle-IR (podstawka IR)
3 → Modem
Pokaż okno wiadomości (Show Msg Box)	Zakres: 0–1.
Domyślnie: 1 (Włączone).

0 → Wyłącz
1 → Włącz
Pokaż okno dialogowe postępu (Show Progress Dialog)	Zakres: 0–1.
Domyślnie: 1 (Włączone).

0 → Wyłącz
1 → Włącz
⚙️ Wymagania

Uruchomienie wymaga:

PowerShell uruchomionego w trybie Administrator

Ustawienia polityki wykonywania skryptów na Bypass

Ustawienie polityki wykonywania skryptów
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope LocalMachine

▶️ Uruchomienie
.\ParseCsv.ps1

🔧 Funkcjonalność skryptu

Skrypt oferuje trzy tryby działania:

1️⃣ Generowanie danych dla urządzenia

Generuje informacje czytelne dla urządzenia.
Po wczytaniu na urządzenie dane są wyświetlane po zeskanowaniu kodu kreskowego.

2️⃣ Wczytywanie danych Lookup Table do urządzenia

Wymaga wcześniej wygenerowanego pliku CSV (z trybu 1).

Wymaga uruchomienia trybu wczytywania lookup table na urządzeniu.

3️⃣ Wgrywanie oprogramowania na urządzenie

Wgrywa oprogramowanie odpowiedzialne za:

język interfejsu

liczbę kolumn wyświetlanych na urządzeniu

format prezentacji informacji