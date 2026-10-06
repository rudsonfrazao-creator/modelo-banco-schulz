-- =============================================================================
-- UNIDADE CURRICULAR: PROJETO APLICADO I
-- TEMA 02: MODELAGEM E IMPLEMENTAÇÃO DE BANCO DE DADOS (SQLITE)
-- EMPRESA PARCEIRA: SCHULZ S.A.
-- =============================================================================

-- Habilitação da verificação de Chaves Estrangeiras no SQLite
PRAGMA foreign_keys = ON;

-- 1. Tabela: tecnico
CREATE TABLE IF NOT EXISTS tecnico (
    id_tecnico INTEGER PRIMARY KEY AUTOINCREMENT,
    nome_tecnico TEXT NOT NULL,
    cpf_tecnico TEXT NOT NULL UNIQUE,
    cargo TEXT
);

-- 2. Tabela: equipamento
CREATE TABLE IF NOT EXISTS equipamento (
    id_equipamento INTEGER PRIMARY KEY AUTOINCREMENT,
    codigo_equipamento TEXT NOT NULL UNIQUE,
    descricao_equipamento TEXT NOT NULL,
    fabricante TEXT,
    modelo TEXT
);

-- 3. Tabela: medicao
CREATE TABLE IF NOT EXISTS medicao (
    id_medicao INTEGER PRIMARY KEY AUTOINCREMENT,
    id_equipamento INTEGER NOT NULL,
    id_tecnico INTEGER NOT NULL,
    data_medicao TEXT NOT NULL DEFAULT (datetime('now', 'localtime')),
    parametro TEXT NOT NULL,
    valor_nominal REAL NOT NULL,
    tolerancia_inferior REAL NOT NULL,
    tolerancia_superior REAL NOT NULL,
    valor_obtido REAL NOT NULL,
    status TEXT NOT NULL CHECK (status IN ('Aprovado', 'Reprovado', 'Em Análise')),
    FOREIGN KEY (id_equipamento) REFERENCES equipamento (id_equipamento) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (id_tecnico) REFERENCES tecnico (id_tecnico) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);
