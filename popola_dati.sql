INSERT INTO Passeggero (nome, cognome, email) VALUES
('Maddalena', 'Pagliarulo', 'maddalena.pagliarulo@gmail.com'),
('Maria', 'Cipriano', 'maria.cipriano@gmail.com'),
('Gerardo', 'Pizzulo', 'gerardo.pizzulo@gmail.com'),
('Rocco', 'Russo', 'rocco.russo@gmail.com'),
('Ilaria', 'Saporito', 'ilaria.saporito@gmail.com');

INSERT INTO Stazione (nome, citta) VALUES
('Stazione Centrale', 'Milano'),
('Stazione Santa Lucia', 'Venezia'),
('Stazione Centrale', 'Napoli'),
('Stazione Porta Nuova', 'Torino'),
('Stazione Termini', 'Roma'),
('Stazione Santa Maria Novella', 'Firenze'),
('Stazione Centrale', 'Bologna');

INSERT INTO Mezzo (tipo, codice_identificativo) VALUES
('Treno', 'TR101'),
('Treno', 'TR123'),
('Treno', 'TR783'),
('Treno', 'TR040'),
('Treno', 'TR303');

INSERT INTO Tratta (stazione_partenza, stazione_arrivo, orario_partenza, orario_arrivo, mezzo_id) VALUES
(1, 2, '2025-06-10 08:00:00', '2025-06-10 12:30:00', 1), -- Milano → Venezia
(2, 3, '2025-06-15 08:00:00', '2025-06-15 13:30:00', 2), -- Venezia → Napoli
(3, 4, '2025-06-25 10:00:00', '2025-06-25 14:30:00', 3), -- Napoli → Torino
(4, 5, '2025-07-04 08:00:00', '2025-07-04 12:30:00', 4), -- Torino → Roma
(5, 1, '2025-07-10 12:00:00', '2025-07-10 16:30:00', 5), -- Roma → Milano
(1, 5, '2025-07-15 09:00:00', '2025-07-15 13:00:00', 2); -- Milano → Roma

INSERT INTO ClasseViaggio (nome_classe, descrizione) VALUES
('Prima Classe', 'Maggior comfort e servizi aggiuntivi'),
('Seconda Classe', 'Soluzione standard ed economica'),
('Business', 'Servizio premium per viaggi di lavoro');

INSERT INTO Biglietto (passeggero_id, tratta_id, data_acquisto, stato, classe_id) VALUES
(1, 1, '2025-07-01', 'confermato', 1),
(2, 2, '2025-07-02', 'in attesa', 2),
(3, 3, '2025-07-03', 'confermato', 3),
(4, 4, '2025-07-04', 'annullato', 2),
(5, 5, '2025-07-05', 'confermato', 1);

INSERT INTO Pagamento (biglietto_id, metodo_pagamento, data_pagamento, esito) VALUES
(1, 'Carta di credito', '2025-07-01', 'OK'),
(2, 'PayPal', '2025-07-02', 'OK'),
(3, 'Bonifico', '2025-07-03', 'OK'), 
(4, ' Carta di credito ', '2025-07-04', 'KO'), -- Pagamento non riuscito
(5, 'PayPal', '2025-07-05', 'OK');

INSERT INTO FermataIntermedia (tratta_id, stazione_id, ordine) VALUES
 (1, 6, 1),  -- Milano → Roma con fermata a Firenze
(2, 7, 1),  -- Venezia → Napoli con fermata a Bologna
(3, 5, 1);  -- Torino → Napoli con fermata a Roma
