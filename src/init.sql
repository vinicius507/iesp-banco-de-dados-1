-- init.sql

-- UNIESP Faculdades
-- Banco de Dados I

CREATE TABLE departamentos (
    codigo INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE empregados (
    codigo INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE gerentes (
    codigo INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE projetos (
    codigo INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    nome VARCHAR(100) NOT NULL,
    data_inicio DATE,
    data_fim DATE,
    codigo_departamento INT REFERENCES departamentos (codigo) NOT NULL,
    codigo_gerente INT REFERENCES gerentes (codigo) NOT NULL
);

CREATE TABLE empregados_projetos (
    codigo_empregado INT REFERENCES empregados (codigo) NOT NULL,
    codigo_projeto INT REFERENCES projetos (codigo) NOT NULL,
    horas_trabalhadas NUMERIC(2) DEFAULT 0,
    PRIMARY KEY (codigo_empregado, codigo_projeto)
);
