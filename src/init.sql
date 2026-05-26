-- init.sql

-- UNIESP Faculdades
-- Banco de Dados I

BEGIN;

CREATE TABLE departamentos (
    codigo INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    nome VARCHAR(48)
);

CREATE TABLE empregados (
    codigo INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    nome VARCHAR(48)
);

CREATE TABLE gerentes (
    codigo INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    nome VARCHAR(48)
);

CREATE TABLE projetos (
    codigo INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    nome VARCHAR(48),
    data_inicio DATE,
    data_fim DATE,
    codigo_departamento INT REFERENCES departamentos (codigo),
    codigo_gerente INT REFERENCES gerentes (codigo)
);

CREATE TABLE empregados_projetos (
    codigo_empregado INT REFERENCES empregados (codigo),
    codigo_projeto INT REFERENCES projetos (codigo),
    horas_trabalhadas NUMERIC(2) DEFAULT 0,
    PRIMARY KEY (codigo_empregado, codigo_projeto)
);

COMMIT;
