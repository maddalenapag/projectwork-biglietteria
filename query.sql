-- 1. Ricerca tratte disponibili:
SELECT 
    Tratta.ID AS ID_tratta,
    stazione_partenza.nome AS stazione_di_partenza,
    stazione_partenza.citta AS citta_di_partenza,
    stazione_arrivo.nome AS stazione_di_arrivo,
    stazione_arrivo.citta AS citta_di_arrivo,
    Tratta.orario_partenza,
    Tratta.orario_arrivo,
    Mezzo.tipo AS tipo_mezzo,
    Mezzo.codice_identificativo AS codice_mezzo
FROM Tratta
JOIN Stazione stazione_partenza ON Tratta.stazione_partenza = stazione_partenza.ID
JOIN Stazione stazione_arrivo ON Tratta.stazione_arrivo = stazione_arrivo.ID
JOIN Mezzo ON Tratta.mezzo_id = Mezzo.ID
WHERE stazione_partenza.citta = 'Milano'
  AND stazione_arrivo.citta = 'Roma'
  AND DATE(Tratta.orario_partenza) = '2025-07-15';

-- 2. Storico prenotazioni di un passeggero:
SELECT 
    Biglietto.ID AS ID_biglietto,
    Passeggero.nome AS nome_passeggero,
    Passeggero.cognome AS cognome_passeggero,
    Tratta.ID AS ID_tratta,
    stazione_partenza.nome AS stazione_di_partenza,
    stazione_partenza.citta AS citta_di_partenza,
    stazione_arrivo.nome AS stazione_di_arrivo,
    stazione_arrivo.citta AS citta_di_arrivo,
    Biglietto.data_acquisto,
    Biglietto.stato
FROM Biglietto
JOIN Passeggero ON Biglietto.passeggero_id = Passeggero.ID
JOIN Tratta ON Biglietto.tratta_id = Tratta.ID
JOIN Stazione stazione_partenza ON Tratta.stazione_partenza = stazione_partenza.ID
JOIN Stazione stazione_arrivo ON Tratta.stazione_arrivo = stazione_arrivo.ID
WHERE Biglietto.passeggero_id = 1
ORDER BY Biglietto.data_acquisto DESC;

-- 3. Verifica validità biglietto:
SELECT  
    Biglietto.ID AS ID_biglietto,
    Passeggero.nome AS Nome_passeggero,
    Passeggero.cognome AS Cognome_passeggero,
    Biglietto.stato AS Stato,
    Pagamento.metodo_pagamento AS Metodo_pagamento,
    Pagamento.esito AS Esito,
    stazione_partenza.nome AS Stazione_di_partenza,
    stazione_partenza.citta AS Citta_partenza,
    stazione_arrivo.nome AS Stazione_di_arrivo,
    stazione_arrivo.citta AS Citta_arrivo
FROM Biglietto
JOIN Passeggero ON Biglietto.passeggero_id = Passeggero.ID
LEFT JOIN Pagamento ON Biglietto.ID = Pagamento.biglietto_id
JOIN Tratta ON Biglietto.tratta_id = Tratta.ID
JOIN Stazione stazione_partenza ON Tratta.stazione_partenza = stazione_partenza.ID
JOIN Stazione stazione_arrivo ON Tratta.stazione_arrivo = stazione_arrivo.ID
WHERE Biglietto.ID = 1 
  AND Biglietto.stato = 'confermato';

-- 4. Elenco passeggeri su una tratta:
SELECT 
    Passeggero.ID AS ID_passeggero,
    Passeggero.nome,
    Passeggero.cognome,
    Passeggero.email,
    Biglietto.stato,
    ClasseViaggio.nome_classe AS Classe
FROM Biglietto
JOIN Passeggero ON Biglietto.passeggero_id = Passeggero.ID
JOIN ClasseViaggio ON Biglietto.classe_id = ClasseViaggio.ID
WHERE Biglietto.tratta_id = 1;

-- 5. Report vendite per periodo:
SELECT 
    Tratta.ID AS ID_tratta,
    StazionePartenza.nome AS stazione_di_partenza,
    StazionePartenza.citta AS citta_di_partenza,
    StazioneArrivo.nome AS stazione_di_arrivo,
    StazioneArrivo.citta AS citta_di_arrivo,
    COUNT(Biglietto.ID) AS numero_biglietti_venduti
FROM Biglietto
JOIN Tratta ON Biglietto.tratta_id = Tratta.ID
JOIN Stazione AS StazionePartenza ON Tratta.stazione_partenza = StazionePartenza.ID
JOIN Stazione AS StazioneArrivo ON Tratta.stazione_arrivo = StazioneArrivo.ID
JOIN Pagamento ON Biglietto.ID = Pagamento.biglietto_id
WHERE Biglietto.data_acquisto BETWEEN '2025-07-01' AND '2025-07-31'
  AND Biglietto.stato = 'confermato'
  AND Pagamento.esito = 'OK'
GROUP BY Tratta.ID, StazionePartenza.nome, StazionePartenza.citta, StazioneArrivo.nome, StazioneArrivo.citta;

-- 6. Dettagliato fermate intermedie associate alle diverse tratte ferroviarie.
SELECT 
    Tratta.ID AS ID_tratta,
    StazionePartenza.nome AS stazione_di_partenza,
    StazionePartenza.citta AS citta_di_partenza,
    StazioneArrivo.nome AS stazione_di_arrivo,
    StazioneArrivo.citta AS citta_di_arrivo,
    FermataIntermedia.ordine AS ordine_fermata,
    StazioneFermata.nome AS stazione_fermata_intermedia,
    StazioneFermata.citta AS citta_fermata_intermedia
FROM Tratta
JOIN Stazione AS StazionePartenza ON Tratta.stazione_partenza = StazionePartenza.ID
JOIN Stazione AS StazioneArrivo ON Tratta.stazione_arrivo = StazioneArrivo.ID
JOIN FermataIntermedia ON Tratta.ID = FermataIntermedia.tratta_id
JOIN Stazione AS StazioneFermata ON FermataIntermedia.stazione_id = StazioneFermata.ID
ORDER BY Tratta.ID, FermataIntermedia.ordine;

