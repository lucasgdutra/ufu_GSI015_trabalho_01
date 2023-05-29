
CREATE TABLE questionarios (
	id int8 NOT NULL,
	titulo varchar(255) NOT NULL,
	CONSTRAINT questionarios_pkey PRIMARY KEY (id)
);

CREATE TABLE questoes (
	id int8 NOT NULL,
	pergunta varchar(255) NULL,
	pontuacao int4 NULL,
	questionario_id int8 NULL,
	CONSTRAINT questoes_pkey PRIMARY KEY (id),
	CONSTRAINT questoes_pontuacao_check CHECK ((pontuacao >= 0)),
	CONSTRAINT fk2byaekmoemg34p8hu9gvwfdw4 FOREIGN KEY (questionario_id) REFERENCES questionarios(id)
);

CREATE TABLE respostas (
	id int8 NOT NULL,
	correta bool NOT NULL,
	resposta varchar(255) NOT NULL,
	questao_id int8 NULL,
	CONSTRAINT respostas_pkey PRIMARY KEY (id),
	CONSTRAINT fk6sapsmqsahkclvxenv57owrsk FOREIGN KEY (questao_id) REFERENCES questoes(id)
);

CREATE TABLE usuarios (
	user_type varchar(31) NOT NULL,
	id int8 NOT NULL,
	email varchar(255) NULL,
	nome varchar(255) NULL,
	pontuacao int8 NULL,
	CONSTRAINT usuarios_pkey PRIMARY KEY (id)
);

CREATE TABLE jogos (
	id int8 NOT NULL,
	pontuacao int4 NULL,
	jogador_id int8 NOT NULL,
	questionario_id int8 NOT NULL,
	CONSTRAINT jogos_pkey PRIMARY KEY (id),
	CONSTRAINT fkdjmtuq900fl0ldhxwjks0kdpa FOREIGN KEY (questionario_id) REFERENCES questionarios(id),
	CONSTRAINT fkroy863srmd9xv7tlqr8hmv2ok FOREIGN KEY (jogador_id) REFERENCES usuarios(id)
);

-- Inserindo na tabela 'usuarios'
INSERT INTO usuarios(user_type, id, email, nome, pontuacao) VALUES
('Administrador', 1, 'admin@exemplo.com', 'Usuário Admin', 500),
('Jogador', 2, 'jogador@exemplo.com', 'Usuário Jogador', 300),
('Jogador', 3, 'jogador2@exemplo.com', 'Usuário Jogador 2', 250),
('Jogador', 4, 'jogador3@exemplo.com', 'Usuário Jogador 3', 400);


-- Inserindo na tabela 'questionarios'
INSERT INTO questionarios(id, titulo) VALUES
(1, 'Questionário de História'),
(2, 'Questionário de Ciências'),
(3, 'Questionário de Geografia'),
(4, 'Questionário de Matemática');

-- Inserindo na tabela 'questoes'
INSERT INTO questoes(id, pergunta, pontuacao, questionario_id) VALUES
(1, 'Quem foi o primeiro presidente do Brasil?', 10, 1),
(2, 'Qual é o número atômico do Hidrogênio?', 10, 2),
(3, 'Qual o nome da capital do Brasil?', 10, 3),
(4, 'Qual o maior continente do mundo?', 10, 3),
(5, 'Quanto é 2 + 2?', 10, 4),
(6, 'Quanto é 5 * 5?', 10, 4);

-- Inserindo na tabela 'respostas'
INSERT INTO respostas(id, correta, resposta, questao_id) VALUES
(1, true, 'Marechal Deodoro da Fonseca', 1),
(2, false, 'Getúlio Vargas', 1),
(3, true, '1', 2),
(4, false, '2', 2),
(5, true, 'Brasília', 3),
(6, false, 'São Paulo', 3),
(7, true, 'Ásia', 4),
(8, false, 'América', 4),
(9, true, '4', 5),
(10, false, '5', 5),
(11, true, '25', 6),
(12, false, '30', 6);;

-- Inserindo na tabela 'jogos'
INSERT INTO jogos(id, pontuacao, jogador_id, questionario_id) VALUES
(1, 100, 2, 1),
(2, 200, 2, 2),
(3, 50, 3, 3),
(4, 150, 4, 4);
