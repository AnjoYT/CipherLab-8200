## 📦 Konfiguracja

Parametry
1. Nazwa pliku

Maksymalna długość: 256 bajtów

Wymagana pełna ścieżka, jeśli plik nie znajduje się w bieżącym katalogu roboczym

2. Port COM

Zakres: 1–255

Domyślnie: 1

3. Szybkość transmisji (Baudrate)

Zakres: 1–5

Domyślnie: 1 (115200 bps)

Dostępne opcje:

1 → 115200 bps

2 → 57600 bps

3 → 38400 bps

4 → 19200 bps

5 → 9600 bps

4. Pobieranie przez (Download via)

Zakres: 1–3

Domyślnie: 1

1 → RS-232 lub IrDA

2 → Cradle-IR (podstawka IR)

3 → Modem

5. Pokaż okno wiadomości (Show Msg Box)

Zakres: 0–1

Domyślnie: 1 (Włączone)

0 → Wyłącz

1 → Włącz

6. Pokaż okno dialogowe postępu (Show Progress Dialog)

Zakres: 0–1

Domyślnie: 1 (Włączone)

0 → Wyłącz

1 → Włącz

## ⚙️ Wymagania


Skrypt wymaga:

PowerShell uruchomionego jako Administrator

Polityki wykonywania skryptów ustawionej na Bypass

Ustawienie polityki:

Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope LocalMachine

## ▶ Uruchomienie

.\ParseCsv.ps1

## 🔧 Tryby działania


1️⃣ Generowanie danych


Generuje dane czytelne dla urządzenia.
Po wgraniu na urządzenie będą wyświetlane po zeskanowaniu kodu kreskowego.

2️⃣ Wczytywanie Lookup Table


Wymaga wygenerowanego pliku CSV z trybu 1

Wymaga uruchomienia trybu wczytywania lookup table na urządzeniu

3️⃣ Wgrywanie oprogramowania


Wgrywa oprogramowanie odpowiedzialne za:

język

liczbę kolumn

format wyświetlania informacji
