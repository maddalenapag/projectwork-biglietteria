1. Ricerca tratte disponibili:

Visualizzo tutte le tratte con dettagli stazioni, orari e mezzo

SELECT 
    tratta.ID AS id_tratta,
    stazione_partenza.nome AS stazione_di_partenza,
    stazione_partenza.città AS città_di_partenza,
    stazione_arrivo.nome AS stazione_di_arrivo,
    stazione_arrivo.città AS città_di_arrivo,
    tratta.orario_partenza,
    tratta.orario_arrivo,
    mezzo.tipo AS tipo_mezzo,
    mezzo.codice_identificativo AS codice_mezzo
FROM 
    Tratta
JOIN 
    Stazione AS stazione_partenza ON Tratta.stazione_partenza = stazione_partenza.ID
JOIN 
    Stazione AS stazione_arrivo ON Tratta.stazione_arrivo = stazione_arrivo.ID
JOIN 
    Mezzo ON Tratta.mezzo_id = Mezzo.ID;


2. Storico prenotazioni di un passeggero:

Mostro tutti i biglietti di un passeggero specifico (esempio: ID passeggero = 1), con dettagli della tratta e stato.

SELECT 
    biglietto.ID AS id_biglietto,
    tratta.ID AS id_tratta,
    stazione_partenza.nome AS stazione_di_partenza,
    stazione_partenza.città AS città_di_partenza,
    stazione_arrivo.nome AS stazione_di_arrivo,
    stazione_arrivo.città AS città_di_arrivo,
    biglietto.data_acquisto,
    biglietto.stato
FROM 
    Biglietto
JOIN 
    Tratta ON Biglietto.tratta_id = Tratta.ID
JOIN 
    Stazione AS stazione_partenza ON Tratta.stazione_partenza = stazione_partenza.ID
JOIN 
    Stazione AS stazione_arrivo ON Tratta.stazione_arrivo = stazione_arrivo.ID
WHERE 
    Biglietto.passeggero_id = 1;

3. Verifica validità biglietto:

Controllo se un biglietto è valido e confermato (esempio biglietto con ID 3):

SELECT  
    Biglietto.ID AS id_biglietto,
    Passeggero.nome AS nome_passeggero,
    Passeggero.cognome AS cognome_passeggero,
    Biglietto.stato
FROM 
    Biglietto
JOIN 
    Passeggero ON Biglietto.passeggero_id = Passeggero.ID
WHERE 
    Biglietto.ID = 3
    AND Biglietto.stato = 'confermato';


4. Elenco passeggeri su una tratta:
Mostro i passeggeri che hanno prenotato un biglietto per una tratta specifica (esempio tratta ID 1):
SELECT  passeggero.ID AS ID_passeggero, 
                passeggero.nome, 
                passeggero.cognome, 
                passeggero.email, 
                biglietto.stato
FROM Biglietto 
JOIN Passeggero passeggero ON biglietto.passeggero_id = passeggero.ID
WHERE biglietto.tratta_id = 1;


5. Report vendite per periodo:

Conta i biglietti venduti (confermati) in un intervallo di date (esempio dal 2025-07-01 al 2025-07-31):

SELECT 
    COUNT(*) AS numero_biglietti_venduti,
    Tratta.ID AS id_tratta,
    stazione_partenza.nome AS stazione_di_partenza,
    stazione_partenza.città AS città_di_partenza,
    stazione_arrivo.nome AS stazione_di_arrivo,
    stazione_arrivo.città AS città_di_arrivo
FROM 
    Biglietto
JOIN 
    Tratta ON Biglietto.tratta_id = Tratta.ID
JOIN 
    Stazione AS stazione_partenza ON Tratta.stazione_partenza = stazione_partenza.ID
JOIN 
    Stazione AS stazione_arrivo ON Tratta.stazione_arrivo = stazione_arrivo.ID
WHERE 
    Biglietto.data_acquisto BETWEEN '2025-07-01' AND '2025-07-31'
    AND Biglietto.stato = 'confermato'
GROUP BY 
    Tratta.ID,
    stazione_partenza.nome,
    stazione_partenza.città,
    stazione_arrivo.nome,
    stazione_arrivo.città;

