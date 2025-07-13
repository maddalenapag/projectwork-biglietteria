1. Ricerca tratte disponibili:

Visualizzo tutte le tratte con le informazioni complete (stazioni, orari, mezzo)

SELECT tratta.ID AS ID_tratta, stazione_partenza.nome AS stazione_di_partenza,
    stazione_partenza.città AS città_di_partenza, stazione_arrivo.nome AS stazione_di_arrivo,
    stazione_arrivo.città AS città_di_arrivo, tratta.orario_partenza, tratta.orario_arrivo,
    mezzo.tipo AS tipo_mezzo, mezzo.codice_identificativo AS codice_mezzo
FROM Tratta tratta
JOIN Stazione stazione_partenza ON tratta.stazione_partenza = stazione_partenza.ID
JOIN Stazione stazione_arrivo ON tratta.stazione_arrivo = stazione_arrivo.ID
JOIN Mezzo mezzo ON tratta.mezzo_id = mezzo.ID;

2. Storico prenotazioni di un passeggero:

Mostro tutti i biglietti di un passeggero specifico (esempio: ID passeggero = 1), con dettagli della tratta e stato.

SELECT 
    biglietto.ID AS ID_biglietto,
    tratta.ID AS ID_tratta,
    stazione_partenza.nome AS stazione_di_partenza,
    stazione_arrivo.nome AS stazione_di_arrivo,
    biglietto.data_acquisto,
    biglietto.stato
FROM Biglietto biglietto
JOIN Tratta tratta ON biglietto.tratta_id = tratta.ID
JOIN Stazione stazione_partenza ON tratta.stazione_partenza = stazione_partenza.ID
JOIN Stazione stazione_arrivo ON tratta.stazione_arrivo = stazione_arrivo.ID
WHERE biglietto.passeggero_id = 1;


3. Verifica validità biglietto:

Controllo se un biglietto è valido e confermato (esempio biglietto con ID 3):

SELECT  biglietto.ID AS ID_biglietto,passeggero.nome, passeggero.cognome,biglietto.stato
FROM Biglietto biglietto
JOIN Passeggero passeggero ON biglietto.passeggero_id = passeggero.ID
WHERE biglietto.ID = 3 AND biglietto.stato = 'confermato';

4. Elenco passeggeri su una tratta:
  
Mostro i passeggeri che hanno prenotato un biglietto per una tratta specifica (esempio tratta ID 1):
  
SELECT  passeggero.ID AS ID_passeggero, passeggero.nome, passeggero.cognome, passeggero.email, biglietto.stato
FROM Biglietto biglietto
JOIN Passeggero passeggero ON biglietto.passeggero_id = passeggero.ID
WHERE biglietto.tratta_id = 1;

5. Report vendite per periodo:

Conta i biglietti venduti (confermati) in un intervallo di date (esempio dal 2025-07-01 al 2025-07-31):

SELECT COUNT(*) AS numero_biglietti_venduti, tratta.ID AS ID_tratta,stazione_partenza.nome AS stazione_di_partenza, stazione_arrivo.nome AS stazione_di_arrivo
FROM Biglietto biglietto
JOIN Tratta tratta ON biglietto.tratta_id = tratta.ID
JOIN Stazione stazione_partenza ON tratta.stazione_partenza = stazione_partenza.ID
JOIN Stazione stazione_arrivo ON tratta.stazione_arrivo = stazione_arrivo.ID
WHERE biglietto.data_acquisto BETWEEN '2025-07-01' AND '2025-07-31'
AND biglietto.stato = 'confermato'
GROUP BY tratta.ID;
