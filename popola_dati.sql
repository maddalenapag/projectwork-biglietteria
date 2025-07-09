INSERT INTO Passeggero (nome, cognome, email) VALUES
('Maddalena', 'Pagliarulo', 'maddalena.pagliarulo@gmail.com),
('Maria', 'Cipriano', 'maria.cipriano@gmail.com),
('Gerardo', 'Pizzulo', 'gerardo.pizzulo@gmail.com),
('Rocco', 'Russo', 'rocco.russo@gmail.com),
('Ilaria', 'Saporito', 'ilaria.saporito@gmail.com.com');


INSERT INTO Biglietto (passeggero_id, tratta_id, data_acquisto, stato) VALUES
(1, 1, '2025-07-01', 'confermato'),
(2, 2, '2025-07-02', 'in attesa'),
(3, 3, '2025-07-03', 'confermato'),
(4, 4, '2025-07-04', 'annullato'),
(5, 5, '2025-07-05', 'confermato');

INSERT INTO Tratta (stazione_partenza_id, stazione_arrivo_id, orario_partenza, orario_arrivo, mezzo_id) VALUES
(1, 2, '2025-06-10 08:00:00', '2025-06-10 12:30:00', 1),
(2, 3, '2025-06-15 08:00:00', '2025-06-15 13:30:00', 2),
(3, 4, '2025-06-25 10:00:00', '2025-06-25 14:30:00', 3),
(4, 5, '2025-07-04 08:00:00', '2025-07-04 12:30:00', 4),
(5, 1, '2025-07-10 12:00:00', '2025-07-10 16:30:00', 5);

INSERT INTO Stazione (nome, citta) VALUES
('Stazione Centrale', 'Milano'),
('Stazione Santa Lucia', 'Venezia'),
('Stazione Centrale', 'Napoli'),
('Stazione Porta Nuova', 'Torino'),
('Stazione Termini', 'Roma');

INSERT INTO Mezzo (tipo, codice_identificativo) VALUES
('Treno', 'TR101'),
('Treno', 'TR123'),
('Treno', 'TR783'),
('Treno', 'TR040'),
('Treno', 'TR303');

