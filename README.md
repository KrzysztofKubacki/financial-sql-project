# Banking Loans Analysis (SQL Project)

### Cel projektu

Celem projektu jest analiza danych finansowych banku na podstawie przykładowej bazy financial. Projekt koncentruje się na:

- zrozumieniu trendów w udzielaniu pożyczek,

- analizie klientów według płci, wieku i regionów,

- wykrywaniu potencjalnych ryzyk (niespłacone pożyczki, młodzi klienci z wysokim zadłużeniem),

- budowie procedur wspierających procesy operacyjne (np. monitorowanie kart wygasających).

Dzięki temu projekt pokazuje umiejętności SQL w praktycznym case biznesowym: agregacje, KPI, ranking klientów, walidacje danych i procedury.

---


### Stack technologiczny

MySQL 8.0+ (testowane w DataGrip)

SQL (CTE, agregacje, okna analityczne, procedury, walidacje)

---
### Struktura repozytorium
```bash
sql-project-banking/
├── 01_trend_loans.sql          # trendy pożyczek w czasie
├── 02_status_breakdown.sql     # statusy pożyczek
├── 03_accounts_ranking.sql     # ranking kont wg liczby/kwoty pożyczek
├── 04_loans_by_gender.sql      # pożyczki wg płci + walidacja
├── 05_age_gender_kpis.sql      # KPI: średni wiek klientów wg płci
├── 06_district_kpis.sql        # KPI po regionach (klienci, kwoty, liczba pożyczek)
├── 07_district_shares.sql      # udział rynkowy regionów
├── 08_strict_selection.sql     # selekcja klientów wysokiego ryzyka
├── 09_diagnostics.sql          # diagnostyka: rozkład wieku i max liczba pożyczek
└── 10_cards_procedure.sql      # procedura monitorująca wygasanie kart
```
### Analizy biznesowe
**1. Trendy w udzielaniu pożyczek**

Plik: 01_trend_loans.sql

Agregacja pożyczek w ujęciu rok–kwartał–miesiąc.

KPI: łączna wartość, średnia wartość oraz liczba pożyczek.

&rarr; Pozwala ocenić sezony większej akcji kredytowej (np. wzrosty na koniec roku).

---

**2. Statusy pożyczek**

Plik: 02_status_breakdown.sql

Rozbicie po statusie (A,C = spłacone, B,D = niespłacone).

&rarr; Pozwala oszacować poziom ryzyka portfela kredytowego.

---

**3. Ranking kont według pożyczek**

Plik: 03_accounts_ranking.sql

Ranking kont wg sumy i liczby pożyczek (ROW_NUMBER).

&rarr; Identyfikacja najbardziej aktywnych klientów lub kluczowych źródeł przychodu.

---

**4. Pożyczki wg płci (+ walidacja)**

Plik: 04_loans_by_gender.sql

Podział sumy pożyczek wg płci właściciela konta.

Dodana walidacja: suma musi zgadzać się z sumą globalną.

&rarr; Użyteczne przy marketingu ukierunkowanym (np. różne kampanie dla kobiet/mężczyzn).

---

**5. KPI: wiek i płeć**

Plik: 05_age_gender_kpis.sql

Liczba i suma pożyczek per płeć i wiek.

Obliczono średni wiek ważony liczbą pożyczek.

&rarr;Przydatne dla polityki kredytowej – które grupy wiekowe częściej się zadłużają.

---

**6. KPI regionalne**

Plik: 06_district_kpis.sql

Liczba klientów, kwota i liczba pożyczek per region (district_id).

&rarr; Pozwala ocenić potencjał sprzedażowy regionów i planować rozwój sieci oddziałów.

---

**7. Udział rynkowy regionów**

Plik: 07_district_shares.sql

Obliczono udział wartości pożyczek regionu w całości portfela.

&rarr; Użyteczne w raportach strategicznych (który region generuje największe wolumeny).

---

**8. Selekcja klientów wysokiego ryzyka**

Plik: 08_strict_selection.sql

Klienci urodzeni po 1990 r., którzy mają >5 pożyczek i zadłużenie >1000.

&rarr; Flagowanie młodych klientów z wysokim obciążeniem – potencjalne ryzyko.

---

**9. Diagnostyka**

Plik: 09_diagnostics.sql

Top 10 klientów wg liczby pożyczek.

Rozkład roku urodzenia klientów.

&rarr; Analiza jakości danych i wykrywanie anomalii w bazie.

**10. Procedura: karty przy wygaśnięciu**

Plik: 10_cards_procedure.sql

Procedura generuje raport klientów, których karty wygasają w ciągu 7 dni.

&rarr; Wsparcie operacyjne – bank może wysłać przypomnienie do klienta.

---

### Wartość biznesowa

Zarządzanie ryzykiem – identyfikacja niespłaconych pożyczek, klientów z nadmiernym zadłużeniem.

Rozwój biznesu – ranking klientów i regionów, analiza trendów w czasie.

Obsługa klienta – monitorowanie kart wygasających, targetowane kampanie marketingowe.

Projekt pokazuje pełne wykorzystanie SQL w analizie biznesowej: agregacje, KPI, rankingi, walidacje, procedury składowane.

---

### Dodatki  
W folderze `screenshots/` znajdują się przykładowe wyniki kwerend w formie zrzutów ekranu.

---

### Autor

Projekt stworzony jako portfolio / CV project – Krzysztof Kubacki