CREATE DATABASE IF NOT EXISTS biglietteria;
USE biglietteria;
Passeggero (
    ID INT PRIMARY KEY,
    nome VARCHAR(50),
    cognome VARCHAR(50),
    email VARCHAR(100)
);
Biglietto (
    ID INT PRIMARY KEY,
    passeggero_id INT,
    tratta_id INT,
    data_acquisto DATE,
    stato VARCHAR(20),
    FOREIGN KEY (passeggero_id) REFERENCES Passeggero(ID),
    FOREIGN KEY (tratta_id) REFERENCES Tratta(ID)
);
Tratta (
    ID INT PRIMARY KEY,
    stazione_partenza INT,
    stazione_arrivo INT,
    orario_partenza DATETIME,
    orario_arrivo DATETIME,
    mezzo_id INT,
    FOREIGN KEY (stazione_partenza) REFERENCES Stazione(ID),
    FOREIGN KEY (stazione_arrivo) REFERENCES Stazione(ID),
    FOREIGN KEY (mezzo_id) REFERENCES Mezzo(ID)
);
Stazione (
    ID INT PRIMARY KEY,
    nome VARCHAR(100),
    città VARCHAR(100)
);
Mezzo (
    ID INT PRIMARY KEY,
    tipo VARCHAR(50),
    codice_identificativo VARCHAR(50)
);