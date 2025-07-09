# Gestione Biglietteria - Database MySQL

Questo progetto contiene lo script SQL per creare e popolare un database per la gestione dei biglietti.

## Contenuti

- `dump.sql`: struttura del database
- `popola_dati.sql`: script per inserire dati di esempio

## Istruzioni

1. Esegui il file dump:
```bash
mysql -u root -p < dump.sql
mysql -u root -p < popola_dati.sql