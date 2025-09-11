Project Work – Biglietteria Ferroviaria
Descrizione del progetto

Il presente lavoro ha l’obiettivo di progettare e implementare un sistema informativo per la gestione della biglietteria ferroviaria.
Il progetto segue un approccio metodologico che parte dalla modellazione concettuale (diagramma E/R), passa alla traduzione in modello relazionale e arriva fino all’implementazione fisica in SQL.

Il database consente di gestire:

    - Passeggeri e biglietti acquistati

    - Tratte ferroviarie con stazioni di partenza, arrivo e fermate intermedie

    - Mezzi di trasporto e relative caratteristiche

    - Classi di viaggio

    - Pagamenti con esito delle transazioni

Struttura del repository

dump.sql → Creazione del database e delle tabelle.

popolamento.sql → Inserimento dati di esempio (passeggeri, stazioni, tratte, biglietti, pagamenti, fermate intermedie).

query.sql → Set di query dimostrative (ricerca tratte, storico prenotazioni, verifica biglietto, elenco passeggeri per tratta, report vendite, gestione fermate intermedie).

.gitignore → File di esclusione (configurazioni locali, file temporanei).

Query implementate

  1) Ricerca tratte disponibili (es. Milano → Roma in una data specifica).

  2) Storico prenotazioni di un passeggero.

  3) Verifica validità di un biglietto.

  4) Elenco passeggeri su una tratta.

  5) Report vendite biglietti in un periodo.

  6) Gestione fermate intermedie per le tratte.

Tecnologie utilizzate

Database: MySQL (testato in ambiente XAMPP)

Linguaggio SQL per definizione, manipolazione e interrogazione dei dati

Requisiti

Installazione di XAMPP o MySQL server

Importare dump.sql per creare le tabelle

Eseguire popolamento.sql per inserire i dati di esempio

Testare le query tramite query.sql

Autore

Maddalena Pagliarulo – Project Work universitario presso UniPegaso
Anno accademico: 2024-2025
