CREATE DATABASE IF NOT EXISTS biglietteria;
USE biglietteria;
CREATE TABLE Passeggero (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    cognome VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Stazione (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    citta VARCHAR(100) NOT NULL
);
CREATE TABLE Mezzo (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL CHECK (tipo = 'Treno'),
    codice_identificativo VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Tratta (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    stazione_partenza INT NOT NULL,
    stazione_arrivo INT NOT NULL,
    orario_partenza DATETIME NOT NULL,
    orario_arrivo DATETIME NOT NULL,
    mezzo_id INT NOT NULL,
    FOREIGN KEY (stazione_partenza) REFERENCES Stazione(ID),
    FOREIGN KEY (stazione_arrivo) REFERENCES Stazione(ID),
    FOREIGN KEY (mezzo_id) REFERENCES Mezzo(ID)
);

CREATE TABLE ClasseViaggio (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    nome_classe VARCHAR(50) NOT NULL,
    descrizione VARCHAR(255)
);

CREATE TABLE Biglietto (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    passeggero_id INT NOT NULL,
    tratta_id INT NOT NULL,
    data_acquisto DATE NOT NULL,
    stato VARCHAR(20),
    classe_id INT,
    FOREIGN KEY (passeggero_id) REFERENCES Passeggero(ID),
    FOREIGN KEY (tratta_id) REFERENCES Tratta(ID),
    FOREIGN KEY (classe_id) REFERENCES ClasseViaggio(ID)
);

CREATE TABLE Pagamento (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    biglietto_id INT NOT NULL,
    metodo_pagamento VARCHAR(50) NOT NULL,
    data_pagamento DATE NOT NULL,
    esito VARCHAR(20),
    FOREIGN KEY (biglietto_id) REFERENCES Biglietto(ID)
);

CREATE TABLE FermataIntermedia (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    tratta_id INT NOT NULL,
    stazione_id INT NOT NULL,
    ordine INT NOT NULL,
    FOREIGN KEY (tratta_id) REFERENCES Tratta(ID),
    FOREIGN KEY (stazione_id) REFERENCES Stazione(ID)
);

CREATE INDEX idx_tratta_partenza ON Tratta(stazione_partenza);
CREATE INDEX idx_tratta_arrivo ON Tratta(stazione_arrivo);
CREATE INDEX idx_biglietto_passeggero ON Biglietto(passeggero_id);
CREATE INDEX idx_biglietto_tratta ON Biglietto(tratta_id);
CREATE INDEX idx_pagamento_biglietto ON Pagamento(biglietto_id);
