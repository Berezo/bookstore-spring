# bookstore-spring
## Spis treści
* [Przykładowe konta](#przykladowe-konta)
* [Funkcjonalności](#funkcjonalnosci)
* [Baza danych](#baza-danych)
* [Uruchomienie](#uruchomienie)

## Przykładowe konta
Projekt posiada dwa rodzaje kont:
Konto o uprawnieniach **user**:
 - Login: user
 - Hasło: user
 Konto o uprawnieniach **admin**:
 - Login: admin
 - Hasło: admin

## Funkcjonalności
3 CRUD + Spring Security:
 - admin - dodaje, edytuje i usuwa ksiazki z ksiegarni
 - user możne przeglądać książki z listy wszystkich lub listy książek ograniczonej do konkretnego autora lub kategorii.

3.5 koszyk 
- User może dodawać, usuwać itemy z koszyka oraz potwierdzić itemy z koszyka jako zamówienie.

4 Zamówienia 
- User - może składać zamówienia na książki poprzez koszyk
- Admin - zmienia statusu zamówienia wysłanego przez użytkownika.

4.5 Wygląd aplikacji został oparty na Boostrapie

5 Płatności 
- User po złożeniu zamówienia dostaje maila z danymi do przelewu
- Po zmianie statusu przez admina, uset dostaje maila z potwierdzeniem wysłania zamówienia wraz z szczegółami 
## Baza danych
Skrypt bazy danych z przykładowymi wynikami został umieszczony w folderze 
```
/src/main/resources/database
```
## Uruchomienie

Aplikacja uruchamia się za pomocą podstawowej konfiguracji
```
gradle apprun
```
