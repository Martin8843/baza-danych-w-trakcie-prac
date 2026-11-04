# Relacyjna Baza Danych Apteki | SQL & PL/SQL

![Docker](https://img.shields.io/badge/Docker-2496ED?style=flat-square&logo=docker&logoColor=white)
![Oracle Database](https://img.shields.io/badge/Oracle_Database-0F7843?style=flat-square&logo=oracle&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-2E7D32?style=flat-square&logo=oracle&logoColor=white)
![PL/SQL](https://img.shields.io/badge/PL%2FSQL-0F7843?style=flat-square&logo=oracle&logoColor=white)
![Oracle Data Modeler](https://img.shields.io/badge/Data_Modeler-1B5E20?style=flat-square&logo=oracle&logoColor=white)

<br>

*Autorski projekt relacyjnej bazy danych apteki, obejmujący pełne modelowanie ERD do normalizacji tabel 3NF, skrypty DDL/DML oraz logikę napisaną w PL/SQL* <br>
*Stworzony z myślą o dalszej rozbudowie*

<br>

---

### 📚 Spis treści
<div id="1-Cel projektu"></div>
<details>
<summary><b>1. Cel projektu</i></summary>
<br>

<p>
Głównym celem projektu było zaprojektowanie i wdrożenie relacyjnej bazy danych dla apteki. W ramach architektury kluczowa logika biznesowa została przeniesiona bezpośrednio do warstwy bazy danych Oracle, co pozwoliło rozwiązać następujące wyzwania:
</p>
<br>
<br>
<br>
<br>


</details>

<div id="2-Wymagania wstepne i narzedzia"></div>
<details>
  
<summary><b> 2. Wymagania wstępne</b> <i></i></summary>
<br>
Do uruchomienia oraz analizy projektu wymagany jest silnik bazy danych Oracle Database (zalecana wersja 18c / 21c lub starsza, np. 11g) oraz narzędzia do zarządzania obiektami bazy.
<br>
<br>
W projekcie wykorzystano:
<br>
<br>

&emsp; 1. Środowisko Uruchomieniowe (Engine)

* **Oracle Database 21c Express Edition** (Release 21.0.0.0.0 - Production) – główny silnik bazodanowy.
* **Docker Desktop (WSL2 na Windows 11)** – użyty do konteneryzacji silnika bazy danych. *Użycie Dockera nie jest obligatoryjne (serwer można zainstalować bezpośrednio na systemie operacyjnym), jednak kontener izoluje środowisko i znacznie ułatwia proces wdrażania.*

&emsp; 2. Narzędzia Klienta & Projektowe

* **Oracle SQL Developer** – do nawiązywania połączeń z bazą, wykonywania skryptów DDL/DML oraz tworzenia i debugowania obiektów PL/SQL (procedury, funkcje, wyzwalacze).
* **Oracle SQL Developer Data Modeler** – do projektowania schematów oraz edycji plików źródłowych diagramu ERD.

<br>
<br>
<br>
<br>

</details>

<div id="3-Konfiguracja połaczenia z serwerem"></div>
<details>
<summary><b> 3. Instrukcja - połączenie z kontenerem pdb i uruchomienie skryptu </b> <i></i></summary>

<br>

### Konfiguracja bazy danych i uprawnień

&emsp; 1. Przed uruchomieniem skryptu DDL należy utworzyć dedykowanego użytkownika (schemat) w bazie Oracle oraz nadać mu odpowiednie uprawnienia. <br>
Wykonaj poniższe polecenia jako administrator (np. jako użytkownik `SYS` lub `SYSTEM` w kontenerze `XEPDB1`):

```sql
-- 1. Utworzenie użytkownika bazy danych
CREATE USER apteka IDENTIFIED BY Haslo1234;

-- 2. Nadanie podstawowych ról do połączenia i tworzenia obiektów
GRANT CONNECT, RESOURCE TO apteka;

-- 3. Nadanie uprawnień do tworzenia procedur i funkcji PL/SQL
GRANT CREATE PROCEDURE TO apteka;

-- 4. Przyznanie nielimitowanego miejsca na przestrzeni tabel (tablespace) USERS
ALTER USER apteka QUOTA UNLIMITED ON USERS;
```

&emsp; 2. Poniższy zrzut przedstawia poprawne ustawienia połączenia z kontenerem PDB w SQL Developerze:

<p align="center">
  <img src="/dokumentacja/konfiguracja_klient.png" alt="Diagram ERD" width="650">
</p>

&emsp; 3. Uruchomienie skryptu DDL (Utworzenie struktur bazy)
   
<br>

Po pomyślnym skonfigurowaniu połączenia z bazą w SQL Developerze (`apteka_pdb`), należy wykonać skrypt tworzący tabele, relacje oraz ograniczenia biznesowe.

<br>

Otwórz nowe okno SQL Worksheet dla połączenia apteka_pdb w SQL Developerze, wklej tam zawartość pliku ze skryptem DDL i uruchom go za pomocą skrótu F5.
<br>
Plik znajduje się w repozytorium pod nazwą `apteka_schemat_ddl`.





<br>
<br>
<br>
<br>
</details>

<div id="4-Projektowanie"></div>
<details>
<summary><b> 4. Projektowanie w 3 krokach modelu bazy danych </b></summary>
<br>

<details>
<summary><b>1. Założenia biznesowe </b></summary>
<p>
    
W ujęciu biznesowym system bazy danych apteki odwzorowuje standardowy proces e-commerce.
W modelu koncepcyjnym wyodrębniono następujące powiązania między obiektami:

* **`uzytkownicy` i `adresy`** – Klient rejestruje się w systemie i może zarządzać wieloma adresami dostawy.
* **`kategorie_produktow` i `produkty`** – Asortyment apteki jest podzielony na kategorie, a każdy produkt należy do jednej z nich.
* **`stan_magazynu`** – Reprezentuje bieżącą dostępność ilościową poszczególnych produktów.
* **`zamowienia` oraz `szczegoly_zamowien`** – Klient składa zamówienia; każde zamówienie składa się z jednej lub wielu pozycji (produktów w określonych ilościach i cenach).
* **`platnosci`** – Każde zamówienie powiązane jest z transakcją odnotowującą status i metodę płatności.
* 
 &nbsp;&nbsp;&nbsp;&nbsp; </details>

  <details>
  &emsp;  <summary><b>2. Model logiczny (diagram ERD, normalizacja do Trzeciej Postaci Normalnej) </b></summary>
  <p>
  Projekt opiera się na relacyjnym modelu bazy danych, w którym kluczową rolę odgrywa tabela łącznikowa `szczegoly_zamowien`, rozwiązująca relację wiele do wielu (M:N) <br>
  pomiędzy zamówieniami a produktami.
   
  ### Kardynalność i relacje:
  * **`uzytkownicy` (1) ──do──> (N) `adresy`** – jeden użytkownik może posiadać wiele adresów (relacja 1:N z kaskadowym usuwaniem).
  * **`kategorie_produktow` (1) ──do──> (N) `produkty`** – w jednej kategorii znajduje się wiele produktów.
  * **`produkty` (1) ──do──> (1) `stan_magazynu`** – każdy produkt ma dokładnie jeden wpis określający jego stan magazynowy.
  * **`uzytkownicy` (1) ──do──> (N) `zamowienia`** – użytkownik może składać wiele zamówień.
  * **`zamowienia` (1) ──do──> (N) `szczegoly_zamowien`** – zamówienie składa się z wielu pozycji.
  * **`produkty` (1) ──do──> (N) `szczegoly_zamowien`** – produkt może występować w wielu pozycjach różnych zamówie.
  * **`zamowienia` (1) ──do──> (1) `platnosci`** – każdemu zamówieniu odpowiada jedna płatność.
  * **`logi_systemowe` (N) ──do──> (1) (`uzytkownicy`, `produkty`, `zamowienia`)** – tabela audytowa rejestrująca zdarzenia w systemie. <br>
  Posiada luźne powiązania typu wiele do jednego (opcjonalne, z regułą `SET NULL` przy usuwaniu obiektu nadrzędnego), dzięki czemu historia logów pozostaje nienaruszona.
    
  Diagram ERD utworzony w narzędziu SQL Data Modeler.

  <p align="center">
  <img src="/dokumentacja/diagram_erd.png" alt="Diagram ERD" width="650">
  </p>

  ### Normalizacja schematu (3NF)
  <br>
  Zaprojektowany schemat bazy danych spełnia zasady Trzeciej Postaci Normalnej (3NF)
  <br>
 #### Jak znormalizowano kluczowe tabele?

  * **1. Rozdzielenie użytkowników od adresów (`uzytkownicy` ──> `adresy`)**

  Dane adresowe wyciągnięto do osobnej tabeli, co zapobiega dublowaniu lokalizacji i pozwala jednemu użytkownikowi posiadać wiele adresów (relacja 1:N) bez powielania danych osobowych.

  * **2. Katalogowanie produktów (`kategorie_produktow` ──> `produkty`)**
    
  Nazwa i opis kategorii zależą wyłącznie od klucza kategorii (`kategoria_id`), a nie od konkretnego leku.<br>
  Dzięki wydzieleniu słownika opis kategorii nie powtarza się przy każdym produkcie.

  * **3. Historia cen transakcyjnych (`szczegoly_zamowien`)**
    
  Tabela łącznikowa przechowuje własną `cena_jednostkowa` oraz `ilosc` z momentu zakupu.<br>
  Odcina to zależność od dynamicznej ceny w tabeli `produkty` – cena na zamówieniu jest atrybutem historycznym konkretnej transakcji.

  * **4. Izolacja stanu magazynowego (`stan_magazynu` ──> `produkty`)**
    
  Dane katalogowe leku (opis, nazwa) zmieniają się rzadko, podczas gdy stan magazynowy (liczba sztuk) ulega stałym zmianom przy sprzedaży.<br>
  Wydzielenie tej relacji odciąża główny słownik produktów i rozdziela dane statyczne od operacyjnych.
     
     
     
     
  

    
  </p>
  </details>

  <details>
  <summary><b>3. Model fizyczny</b></summary>
  
  Kod źródłowy znajduje się w katalogu `skrypy_sql/apteka_schemat.ddl`

  👉 [Kliknij tutaj, aby przejrzeć pełny kod DDL](./skrypty_sql/apteka_schemat.ddl)
  
  <br>

  Przykładowy DDL
  
  ```sql
  CREATE TABLE szczegoly_zamowien (
      szczegoly_id       NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
      zamowienie_id     NUMBER NOT NULL,
      produkt_id        NUMBER NOT NULL,
      ilosc             NUMBER(5) NOT NULL CHECK (ilosc > 0),
      cena_jednostkowa  NUMBER(10, 2) NOT NULL
  );
  ```
    
  </details>
  <br>
<br><br>
<br>

</details>

<div id="5-implementacja-logiki-biznesowej"></div>
<details>
<summary><b>5. Implementacja logiki biznesowej w warstwie bazy danych (programy PL/SQL)</b></summary>
<br>
  
**Dane testowe**

Aby ułatwić testowanie mechanizmów bazy danych, przygotowałem dedykowany zestaw danych testowych.

👉 [Dane testowe](./skrypty_sql/apteka_dane_testowe.sql)

W warstwie bazy danych zastosowano zróżnicowane mechanizmy ochrony i logiki. Oto najważniejsze z nich, które zostały wdrożone na tym etapie.



<b>1. Więzy integralności (Constraints & CHECK)</b>
- <b>Ograniczenia wartości (<code>CHECK</code>):</b> Weryfikacja dodatnich ilości produktów, cen oraz dopuszczalnych statusów zamówień bezpośrednio w tabelach.
- <b>Klucze i relacje (<code>PRIMARY KEY</code>, <code>FOREIGN KEY</code>):</b> Gwarancja unikalności rekordów i spójności  z regułami usuwania (np. <code>ON DELETE CASCADE</code> lub <code>SET NULL</code>).

Przykłady
<br>
```sql
ALTER TABLE szczegoly_zamowien 
ADD CONSTRAINT chk_ilosc CHECK (ilosc > 0);
```
<br>

```sql
ALTER TABLE logi_systemowe 
    ADD CONSTRAINT fk_log_zamowienie FOREIGN KEY 
    ( 
     zamowienie_id
    ) 
    REFERENCES zamowienia 
    ( 
     zamowienie_id
    ) 
    ON DELETE SET NULL 
    NOT DEFERRABLE 
;
```
<br>

<br>2. Logika proceduralna (PL/SQL)<br>

W projekcie zaimplementowano kilka dedykowanych obiekty PL/SQL. *W pliku sql znajdują się szczegółowe komentarze z opisem działania kodu*

- **Procedury**
  1. 

- Bezpieczna obsługa transakcji (składanie zamówienia z walidacją dostępności) oraz wyliczanie wartości zamówień.
- **Widoki (Views):** Uproszczone zestawienia analityczne (np. najczęściej zamawiane produkty).



- **Wyzwalacze (Triggers):** Automatyczna aktualizacja stanów magazynowych (`stan_magazynu`) po złożeniu zamówienia oraz rejestracja zdarzeń w tabeli `logi_systemowe`.

</details>



<div id="7-rozwiazania"></div>
<details>
<summary><b> 7. Rozwiązania biznesowe</b></summary>

<br>



</details>
