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
	CONSTRAINT questoes_references_questionarios FOREIGN KEY (questionario_id) REFERENCES questionarios(id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE respostas (
	id int8 NOT NULL,
	correta bool NOT NULL,
	resposta varchar(255) NOT NULL,
	questao_id int8 NULL,
	CONSTRAINT respostas_pkey PRIMARY KEY (id),
	CONSTRAINT respostas_references_questoes FOREIGN KEY (questao_id) REFERENCES questoes(id) ON DELETE CASCADE ON UPDATE CASCADE
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
	CONSTRAINT jogos_references_questionarios FOREIGN KEY (questionario_id) REFERENCES questionarios(id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT jogos_references_usuarios FOREIGN KEY (jogador_id) REFERENCES usuarios(id) ON DELETE CASCADE ON UPDATE CASCADE
);
-- Inserindo na tabela 'usuarios'
INSERT INTO usuarios (id, user_type, nome, email, pontuacao)
VALUES (
		1,
		'Administrador',
		'Lucas Silva',
		'lucas.silva@example.com',
		500
	),
	(
		2,
		'Jogador',
		'Ana Santos',
		'ana.santos@example.com',
		300
	),
	(
		3,
		'Jogador',
		'João Oliveira',
		'joao.oliveira@example.com',
		250
	),
	(
		4,
		'Jogador',
		'Maria Pereira',
		'maria.pereira@example.com',
		400
	),
	(
		5,
		'Jogador',
		'Bruno Costa',
		'bruno.costa@example.com',
		0
	);
INSERT INTO public.questionarios (id, titulo)
VALUES (1, 'animais - dificil'),
	(2, 'animais - fácil'),
	(3, 'animais - médio'),
	(4, 'Arte - dificil'),
	(5, 'Arte - fácil'),
	(6, 'Arte - médio'),
	(7, 'celebridades - dificil'),
	(8, 'celebridades - fácil'),
	(9, 'celebridades - médio'),
	(10, 'celebridades - médio 2');
INSERT INTO public.questionarios (id, titulo)
VALUES (11, 'Ciência e Natureza - dificil'),
	(12, 'Ciência e Natureza - dificil 2'),
	(13, 'Ciência e Natureza - dificil 3'),
	(14, 'Ciência e Natureza - dificil 4'),
	(15, 'Ciência e Natureza - fácil'),
	(16, 'Ciência e Natureza - fácil 2'),
	(17, 'Ciência e Natureza - fácil 3'),
	(18, 'Ciência e Natureza - médio'),
	(19, 'Ciência e Natureza - médio 2'),
	(20, 'Ciência e Natureza - médio 3');
INSERT INTO public.questionarios (id, titulo)
VALUES (21, 'Ciência e Natureza - médio 4'),
	(22, 'Ciência: Computadores - dificil'),
	(23, 'Ciência: Computadores - dificil 2'),
	(24, 'Ciência: Computadores - fácil'),
	(25, 'Ciência: Computadores - fácil 2'),
	(26, 'Ciência: Computadores - médio'),
	(27, 'Ciência: Computadores - médio 2'),
	(28, 'Ciência: Computadores - médio 3'),
	(29, 'Ciência: Dispositivos - fácil'),
	(30, 'Ciência: Dispositivos - médio');
INSERT INTO public.questionarios (id, titulo)
VALUES (31, 'Ciências: matemática - dificil'),
	(32, 'Ciências: matemática - fácil'),
	(33, 'Ciências: matemática - médio'),
	(34, 'Conhecimento geral - dificil'),
	(35, 'Conhecimento geral - dificil 2'),
	(36, 'Conhecimento geral - dificil 3'),
	(37, 'Conhecimento geral - fácil'),
	(38, 'Conhecimento geral - fácil 2'),
	(39, 'Conhecimento geral - fácil 3'),
	(40, 'Conhecimento geral - fácil 4');
INSERT INTO public.questionarios (id, titulo)
VALUES (41, 'Conhecimento geral - médio'),
	(42, 'Conhecimento geral - médio 2'),
	(43, 'Conhecimento geral - médio 3'),
	(44, 'Conhecimento geral - médio 4'),
	(45, 'Conhecimento geral - médio 5'),
	(
		46,
		'Entretenimento: anime e mangá japonês - dificil'
	),
	(
		47,
		'Entretenimento: anime e mangá japonês - dificil 2'
	),
	(
		48,
		'Entretenimento: anime e mangá japonês - fácil'
	),
	(
		49,
		'Entretenimento: anime e mangá japonês - fácil 2'
	),
	(
		50,
		'Entretenimento: anime e mangá japonês - médio'
	);
INSERT INTO public.questionarios (id, titulo)
VALUES (
		51,
		'Entretenimento: anime e mangá japonês - médio 2'
	),
	(
		52,
		'Entretenimento: anime e mangá japonês - médio 3'
	),
	(
		53,
		'Entretenimento: anime e mangá japonês - médio 4'
	),
	(
		54,
		'Entretenimento: desenhos animados e animações - dificil'
	),
	(
		55,
		'Entretenimento: desenhos animados e animações - fácil'
	),
	(
		56,
		'Entretenimento: desenhos animados e animações - fácil 2'
	),
	(
		57,
		'Entretenimento: desenhos animados e animações - médio'
	),
	(
		58,
		'Entretenimento: desenhos animados e animações - médio 2'
	),
	(59, 'Entretenimento: Filme - dificil'),
	(60, 'Entretenimento: Filme - dificil 2');
INSERT INTO public.questionarios (id, titulo)
VALUES (61, 'Entretenimento: Filme - fácil'),
	(62, 'Entretenimento: Filme - fácil 2'),
	(63, 'Entretenimento: Filme - fácil 3'),
	(64, 'Entretenimento: Filme - fácil 4'),
	(65, 'Entretenimento: Filme - médio'),
	(66, 'Entretenimento: Filme - médio 2'),
	(67, 'Entretenimento: Filme - médio 3'),
	(68, 'Entretenimento: Filme - médio 4'),
	(69, 'Entretenimento: Filme - médio 5'),
	(70, 'Entretenimento: Filme - médio 6');
INSERT INTO public.questionarios (id, titulo)
VALUES (
		71,
		'Entretenimento: jogos de tabuleiro - dificil'
	),
	(72, 'Entretenimento: jogos de tabuleiro - fácil'),
	(73, 'Entretenimento: jogos de tabuleiro - médio'),
	(74, 'Entretenimento: Livros - dificil'),
	(75, 'Entretenimento: Livros - fácil'),
	(76, 'Entretenimento: Livros - médio'),
	(77, 'Entretenimento: Livros - médio 2'),
	(
		78,
		'Entretenimento: Musicais e Teatros - dificil'
	),
	(79, 'Entretenimento: Musicais e Teatros - fácil'),
	(80, 'Entretenimento: Musicais e Teatros - médio');
INSERT INTO public.questionarios (id, titulo)
VALUES (81, 'Entretenimento: Música - dificil'),
	(82, 'Entretenimento: Música - dificil 2'),
	(83, 'Entretenimento: Música - dificil 3'),
	(84, 'Entretenimento: Música - fácil'),
	(85, 'Entretenimento: Música - fácil 2'),
	(86, 'Entretenimento: Música - fácil 3'),
	(87, 'Entretenimento: Música - fácil 4'),
	(88, 'Entretenimento: Música - fácil 5'),
	(89, 'Entretenimento: Música - médio'),
	(90, 'Entretenimento: Música - médio 2');
INSERT INTO public.questionarios (id, titulo)
VALUES (91, 'Entretenimento: Música - médio 3'),
	(92, 'Entretenimento: Música - médio 4'),
	(93, 'Entretenimento: Música - médio 5'),
	(94, 'Entretenimento: Música - médio 6'),
	(95, 'Entretenimento: Música - médio 7'),
	(96, 'Entretenimento: Música - médio 8'),
	(97, 'Entretenimento: Quadrinhos - dificil'),
	(98, 'Entretenimento: Quadrinhos - fácil'),
	(99, 'Entretenimento: Quadrinhos - médio'),
	(100, 'Entretenimento: Quadrinhos - médio 2');
INSERT INTO public.questionarios (id, titulo)
VALUES (101, 'Entretenimento: Televisão - dificil'),
	(102, 'Entretenimento: Televisão - dificil 2'),
	(103, 'Entretenimento: Televisão - fácil'),
	(104, 'Entretenimento: Televisão - fácil 2'),
	(105, 'Entretenimento: Televisão - fácil 3'),
	(106, 'Entretenimento: Televisão - fácil 4'),
	(107, 'Entretenimento: Televisão - médio'),
	(108, 'Entretenimento: Televisão - médio 2'),
	(109, 'Entretenimento: Televisão - médio 3'),
	(110, 'Entretenimento: videogames - dificil');
INSERT INTO public.questionarios (id, titulo)
VALUES (111, 'Entretenimento: videogames - dificil 2'),
	(112, 'Entretenimento: videogames - dificil 3'),
	(113, 'Entretenimento: videogames - dificil 4'),
	(114, 'Entretenimento: videogames - dificil 5'),
	(115, 'Entretenimento: videogames - dificil 6'),
	(116, 'Entretenimento: videogames - dificil 7'),
	(117, 'Entretenimento: videogames - dificil 8'),
	(118, 'Entretenimento: videogames - dificil 9'),
	(119, 'Entretenimento: videogames - fácil'),
	(120, 'Entretenimento: videogames - fácil 10');
INSERT INTO public.questionarios (id, titulo)
VALUES (121, 'Entretenimento: videogames - fácil 11'),
	(122, 'Entretenimento: videogames - fácil 12'),
	(123, 'Entretenimento: videogames - fácil 13'),
	(124, 'Entretenimento: videogames - fácil 2'),
	(125, 'Entretenimento: videogames - fácil 3'),
	(126, 'Entretenimento: videogames - fácil 4'),
	(127, 'Entretenimento: videogames - fácil 5'),
	(128, 'Entretenimento: videogames - fácil 6'),
	(129, 'Entretenimento: videogames - fácil 7'),
	(130, 'Entretenimento: videogames - fácil 8');
INSERT INTO public.questionarios (id, titulo)
VALUES (131, 'Entretenimento: videogames - fácil 9'),
	(132, 'Entretenimento: videogames - médio'),
	(133, 'Entretenimento: videogames - médio 10'),
	(134, 'Entretenimento: videogames - médio 11'),
	(135, 'Entretenimento: videogames - médio 12'),
	(136, 'Entretenimento: videogames - médio 13'),
	(137, 'Entretenimento: videogames - médio 14'),
	(138, 'Entretenimento: videogames - médio 15'),
	(139, 'Entretenimento: videogames - médio 16'),
	(140, 'Entretenimento: videogames - médio 17');
INSERT INTO public.questionarios (id, titulo)
VALUES (141, 'Entretenimento: videogames - médio 18'),
	(142, 'Entretenimento: videogames - médio 19'),
	(143, 'Entretenimento: videogames - médio 2'),
	(144, 'Entretenimento: videogames - médio 3'),
	(145, 'Entretenimento: videogames - médio 4'),
	(146, 'Entretenimento: videogames - médio 5'),
	(147, 'Entretenimento: videogames - médio 6'),
	(148, 'Entretenimento: videogames - médio 7'),
	(149, 'Entretenimento: videogames - médio 8'),
	(150, 'Entretenimento: videogames - médio 9');
INSERT INTO public.questionarios (id, titulo)
VALUES (151, 'Esportes - dificil'),
	(152, 'Esportes - fácil'),
	(153, 'Esportes - fácil 2'),
	(154, 'Esportes - fácil 3'),
	(155, 'Esportes - médio'),
	(156, 'Esportes - médio 2'),
	(157, 'Esportes - médio 3'),
	(158, 'Geografia - dificil'),
	(159, 'Geografia - dificil 2'),
	(160, 'Geografia - dificil 3');
INSERT INTO public.questionarios (id, titulo)
VALUES (161, 'Geografia - fácil'),
	(162, 'Geografia - fácil 2'),
	(163, 'Geografia - fácil 3'),
	(164, 'Geografia - médio'),
	(165, 'Geografia - médio 2'),
	(166, 'Geografia - médio 3'),
	(167, 'Geografia - médio 4'),
	(168, 'Geografia - médio 5'),
	(169, 'Geografia - médio 6'),
	(170, 'História - dificil');
INSERT INTO public.questionarios (id, titulo)
VALUES (171, 'História - dificil 2'),
	(172, 'História - dificil 3'),
	(173, 'História - dificil 4'),
	(174, 'História - fácil'),
	(175, 'História - fácil 2'),
	(176, 'História - fácil 3'),
	(177, 'História - médio'),
	(178, 'História - médio 2'),
	(179, 'História - médio 3'),
	(180, 'História - médio 4');
INSERT INTO public.questionarios (id, titulo)
VALUES (181, 'História - médio 5'),
	(182, 'História - médio 6'),
	(183, 'História - médio 7'),
	(184, 'Mitologia - dificil'),
	(185, 'Mitologia - fácil'),
	(186, 'Mitologia - médio'),
	(187, 'Política - dificil'),
	(188, 'Política - fácil'),
	(189, 'Política - médio'),
	(190, 'Veículos - dificil');
INSERT INTO public.questionarios (id, titulo)
VALUES (191, 'Veículos - fácil'),
	(192, 'Veículos - médio');
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1,
		'A qual filo biológico pertencem todos os mamíferos, aves e répteis?',
		20,
		1
	),
	(
		2,
		'A que família científica pertence o Aardwolf?',
		20,
		1
	),
	(
		3,
		'Ao contrário da maioria das salamandras, esta parte do tritão é plana?',
		20,
		1
	),
	(
		4,
		'Qual desses animais NÃO é um lagarto?',
		20,
		1
	),
	(
		5,
		'Qual destes é uma colônia de pólipos e não uma água-viva?',
		20,
		1
	),
	(
		6,
		'Qual dos seguintes é outro nome para a "Poecilotheria Metallica Tarantula"?',
		20,
		1
	),
	(
		7,
		'Qual era o nome do lobo etíope antes de saberem que era parente dos lobos?',
		20,
		1
	),
	(
		8,
		'Qual espécie de urso pardo não está extinta?',
		20,
		1
	),
	(9, 'Qual é o nome científico da chita?', 20, 1),
	(
		10,
		'Qual é o nome científico do Budgerigar?',
		20,
		1
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		11,
		'Qual é o nome científico do Lobo Cinzento?',
		20,
		1
	),
	(
		12,
		'Qual é o nome da proteína rica em cobre que cria o sangue azul no polvo antártico?',
		20,
		1
	),
	(
		13,
		'Que pássaro nasce com garras nos dedos das asas?',
		20,
		1
	),
	(
		14,
		'que subordem científica pertence a família Hyaenidae?',
		20,
		1
	),
	(15, 'Que tipo de criatura é um Bonobo?', 20, 1),
	(
		16,
		'A que classe de animais pertencem os tritões?',
		10,
		2
	),
	(17, 'Como você chama um bebê morcego?', 10, 2),
	(
		18,
		'Por definição, onde vive um animal abissopelágico?',
		10,
		2
	),
	(19, 'Qual é a cor do melro fêmea?', 10, 2),
	(
		20,
		'Qual é o animal terrestre mais rápido?',
		10,
		2
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		21,
		'Qual é o nome científico dos humanos modernos?',
		10,
		2
	),
	(
		22,
		'Qual é o nome da morada de um coelho?',
		10,
		2
	),
	(
		23,
		'Qual é o substantivo coletivo para um grupo de corvos?',
		10,
		2
	),
	(
		24,
		'Qual é o verdadeiro nome do Grumpy Cat?',
		10,
		2
	),
	(25, 'Quantas patas têm as borboletas?', 10, 2),
	(
		26,
		'Quantos dentes tem um coelho adulto?',
		10,
		2
	),
	(
		27,
		'"Decápodes" são uma ordem de crustáceos de dez pés. Quais destes NÃO são decápodes?',
		15,
		3
	),
	(
		28,
		'A agora extinta espécie "Thylacine" era nativa de onde?',
		15,
		3
	),
	(
		29,
		'Caxemira é a lã de que tipo de animal?',
		15,
		3
	),
	(
		30,
		'De que são feitos os chifres do rinoceronte?',
		15,
		3
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		31,
		'Por que motivo uma hiena-malhada "ria"?',
		15,
		3
	),
	(
		32,
		'Qual dessas espécies não está extinta?',
		15,
		3
	),
	(
		33,
		'Qual é a maior cobra venenosa do mundo?',
		15,
		3
	),
	(34, 'Qual é o animal mais rápido?', 15, 3),
	(
		35,
		'Qual é o nome científico do "Urso Polar"?',
		15,
		3
	),
	(
		36,
		'Qual é o nome científico do chimpanzé comum?',
		15,
		3
	),
	(
		37,
		'Qual é o nome da família da qual o gato doméstico é membro?',
		15,
		3
	),
	(
		38,
		'Qual é o nome de uma abelha macho que vem de um ovo não fertilizado?',
		15,
		3
	),
	(
		39,
		'Qual é o substantivo coletivo de ratos?',
		15,
		3
	),
	(
		40,
		'Que cor/cor é a pele de um urso polar?',
		15,
		3
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (41, 'Que tipo de animal é um natterjack?', 15, 3),
	(
		42,
		' Que escultor francês projetou a Estátua da Liberdade?',
		20,
		4
	),
	(
		43,
		'A pintura "A Noite Estrelada" de Vincent van Gogh fez parte de qual movimento artístico?',
		20,
		4
	),
	(
		44,
		'Em que ano a Mona Lisa foi concluída?',
		20,
		4
	),
	(
		45,
		'O local de nascimento e local de morte de Albrecht Dürer estavam em...',
		20,
		4
	),
	(
		46,
		'O pintor Piet Mondrian (1872 - 1944) fez parte de qual movimento?',
		20,
		4
	),
	(
		47,
		'Qual destas não é uma variação adicional da cor roxa?',
		20,
		4
	),
	(
		48,
		'Quantas versões em tinta e pastel de "O Grito" o pintor norueguês Edvard Munch acredita ter produzido?',
		20,
		4
	),
	(
		49,
		'Qual pintura de Van Gogh retrata a vista de seu asilo em Saint-Rémy-de-Provence, no sul da França?',
		10,
		5
	),
	(
		50,
		'Qual pintura não foi feita por Vincent Van Gogh?',
		10,
		5
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		51,
		'Quem pintou "Cisnes Refletindo Elefantes", "Sono" e "A Persistência da Memória"?',
		10,
		5
	),
	(52, 'Quem pintou a Mona Lisa?', 10, 5),
	(53, 'Quem pintou A Noite Estrelada?', 10, 5),
	(
		54,
		'Quem pintou o afresco bíblico A Criação de Adão?',
		10,
		5
	),
	(
		55,
		'De que nacionalidade era o pintor surrealista Salvador Dali?',
		15,
		6
	),
	(
		56,
		'estúdio de qual artista era conhecido como ''The Factory''?',
		15,
		6
	),
	(
		57,
		'Qual dessas pinturas não é de Caspar David Friedrich?',
		15,
		6
	),
	(
		58,
		'Qual destes é o nome de uma marca de marcadores famosa?',
		15,
		6
	),
	(
		59,
		'Quem desenhou o logo da Chupa Chups?',
		15,
		6
	),
	(60, 'Quem pintou o mural épico Guernica?', 15, 6);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		61,
		'Billy Herrington é de qual estado dos EUA?',
		20,
		7
	),
	(
		62,
		'O excêntrico filósofo natural Tycho Brahe mantinha o quê como animal de estimação?',
		20,
		7
	),
	(
		63,
		'Qual era a religião do famoso cantor "Freddie Mercury"?',
		20,
		7
	),
	(
		64,
		'Qual escola em Surrey, Inglaterra, Steve Backshall frequentou?',
		20,
		7
	),
	(65, 'Qual é a altura de Tom Cruise?', 20, 7),
	(
		66,
		' Por qual nome é mais conhecido Carlos Estevez?',
		10,
		8
	),
	(67, 'Aubrey Graham é mais conhecido como', 10, 8),
	(
		68,
		'Com o nome de um personagem que ele interpretou em um filme de 1969, qual é o nome da estação de esqui em Utah que Robert Redford comprou em 1968?',
		10,
		8
	),
	(
		69,
		'Em que o cineasta Dan Bell costuma focar seus filmes?',
		10,
		8
	),
	(
		70,
		'Neil Hamburger é interpretado por qual comediante?',
		10,
		8
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		71,
		'Por qual nome Ramon Estevez é mais conhecido?',
		10,
		8
	),
	(
		72,
		'Qual atriz se casou com Michael Douglas em 2000?',
		10,
		8
	),
	(
		73,
		'Qual celebridade anunciou sua presidência em 2015?',
		10,
		8
	),
	(
		74,
		'Qual foi a causa do suicídio de Marilyn Monroe?',
		10,
		8
	),
	(
		75,
		'Qual foi o último papel de James Coburn no cinema antes de sua morte?',
		10,
		8
	),
	(
		76,
		' Paul McCartney sempre usou seu nome do meio. Qual é o seu verdadeiro primeiro nome?',
		15,
		9
	),
	(
		77,
		'Antes de dublar a Pérola em Steven Universo, Deedee Magno Hall fazia parte de qual banda americana?',
		15,
		9
	),
	(
		78,
		'Com qual famoso outfielder do New York Yankees Marilyn Monroe se casou?',
		15,
		9
	),
	(
		79,
		'Como é mais conhecido "James Rolfe"?',
		15,
		9
	),
	(
		80,
		'Em 2014, este novo rapper top 100 que apareceu em "Computers" e "Body Dance" foi preso em uma armação do NYPD por assassinato.',
		15,
		9
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		81,
		'Em qual programa de televisão Dan Gheesling participou?',
		15,
		9
	),
	(82, 'Em que ano "Bob Ross" morreu?', 15, 9),
	(
		83,
		'Em que ano o ícone do rádio Howard Stern começou a trabalhar na estação de rádio WNBC?',
		15,
		9
	),
	(
		84,
		'Em que ano OJ Simpson foi absolvido de suas acusações de assassinato?',
		15,
		9
	),
	(
		85,
		'Nikki Diamond interpretou qual Gladiador no programa de TV de 1992 "Gladiadores"?',
		15,
		9
	),
	(
		86,
		'O nome do meio de Donald J. Trump é...',
		15,
		9
	),
	(
		87,
		'O que fez Jake Lloyd, que interpretou Anakin Skywalker em A Ameaça Fantasma, parar de atuar?',
		15,
		9
	),
	(88, 'Onde Kanye West nasceu?', 15, 9),
	(
		89,
		'Qual celebridade americana morreu em 1977 jogando golfe em La Moraleja, Madri?',
		15,
		9
	),
	(
		90,
		'Qual chef de TV escreveu uma autobiografia intitulada "Humble Pie"?',
		15,
		9
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		91,
		'Qual dessas pessoas NÃO faz parte do grupo de comédia da Internet Mega64?',
		15,
		10
	),
	(
		92,
		'Qual era o nome do primeiro marido de Marilyn Monroe?',
		15,
		10
	),
	(
		93,
		'Qual é geralmente considerada a data de nascimento de William Shakespeare?',
		15,
		10
	),
	(
		94,
		'Qual é o nome do YouTube de Doug Walker?',
		15,
		10
	),
	(
		95,
		'Qual é o verdadeiro nome de "moot", fundador do imageboard 4chan?',
		15,
		10
	),
	(96, 'Quando Elvis Presley nasceu?', 15, 10),
	(
		97,
		'Quanto peso Chris Pratt perdeu por seu papel como Star-Lord em "Guardiões da Galáxia"?',
		15,
		10
	),
	(
		98,
		'Quantos anos Muhammad Ali tinha quando morreu?',
		15,
		10
	),
	(
		99,
		'"The Big Bang Theory" foi teorizada pela primeira vez por um padre de que ideologia religiosa?',
		20,
		11
	),
	(
		100,
		'A palavra "ciência" deriva da palavra "scire" que significa o quê?',
		20,
		11
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		101,
		'A que se refere o termo "isolamento" em microbiologia?',
		20,
		11
	),
	(
		102,
		'A queima de qual desses metais produzirá uma chama branca brilhante?',
		20,
		11
	),
	(
		103,
		'As ''Ilhotas de Langerhans'' são encontradas em qual órgão humano?',
		20,
		11
	),
	(
		104,
		'Botanicamente falando, qual dessas frutas NÃO é uma baga?',
		20,
		11
	),
	(
		105,
		'Como se chama a ilusão auditiva de uma nota que parece subir infinitamente?',
		20,
		11
	),
	(
		106,
		'Como é mais comumente conhecido o ácido isobutilfenilpropanóico?',
		20,
		11
	),
	(
		107,
		'Coulrofobia é o medo irracional de quê?',
		20,
		11
	),
	(
		108,
		'Na Escala Beaufort de força do vento, que nome de vento é dado ao número 8?',
		20,
		11
	),
	(
		109,
		'Na escala Scoville, qual é o produto químico mais quente?',
		20,
		11
	),
	(
		110,
		'Na física, a conservação da energia e a conservação do momento são consequências de qual das seguintes opções?',
		20,
		11
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		111,
		'núcleo do Sol pode atingir que temperatura?',
		20,
		11
	),
	(
		112,
		'O envelope gasoso de um cometa (que cria a cauda) é chamado de quê?',
		20,
		11
	),
	(
		113,
		'O gorila da planície ocidental é cientificamente conhecido como?',
		20,
		11
	),
	(114, 'O que é "Estenoma"?', 20, 12),
	(
		115,
		'O ácido fólico é a forma sintética de qual vitamina?',
		20,
		12
	),
	(
		116,
		'Onde está localizado o músculo glúteo máximo?',
		20,
		12
	),
	(
		117,
		'Quais das seguintes são células do sistema imune adaptativo?',
		20,
		12
	),
	(
		118,
		'Qual das alternativas a seguir é considerada condicionamento clássico?',
		20,
		12
	),
	(
		119,
		'Qual das seguintes NÃO é uma palavra usada para descrever um terremoto?',
		20,
		12
	),
	(
		120,
		'Qual desses animais pertence à classe Chondrichthyes?',
		20,
		12
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		121,
		'Qual desses compostos químicos NÃO é encontrado no ácido gástrico?',
		20,
		12
	),
	(
		122,
		'Qual destes é um códon de parada no DNA?',
		20,
		12
	),
	(
		123,
		'Qual dos seguintes elementos é normalmente usado na dopagem do silício semicondutor?',
		20,
		12
	),
	(
		124,
		'Qual dos seguintes NÃO é um elemento real?',
		20,
		12
	),
	(
		125,
		'Qual dos seguintes é um dos principais músculos das costas?',
		20,
		12
	),
	(
		126,
		'Qual elemento da tabela periódica tem 92 elétrons?',
		20,
		12
	),
	(
		127,
		'Qual foi o primeiro composto orgânico a ser sintetizado a partir de compostos inorgânicos?',
		20,
		12
	),
	(
		128,
		'Qual grande evento de extinção foi causado por uma colisão de asteroides e eliminou a maioria dos dinossauros não aviários?',
		20,
		12
	),
	(
		129,
		'Qual horizonte em um perfil de solo consiste em leito rochoso?',
		20,
		12
	),
	(
		130,
		'Qual lua é o único satélite em nosso sistema solar a possuir uma atmosfera densa?',
		20,
		13
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		131,
		'Qual unidade científica leva o nome de um nobre italiano?',
		20,
		13
	),
	(
		132,
		'Qual é a fórmula molecular da glicose?',
		20,
		13
	),
	(
		133,
		'Qual é a fórmula molecular do ozônio?',
		20,
		13
	),
	(
		134,
		'Qual é a toxina mais potente conhecida?',
		20,
		13
	),
	(
		135,
		'Qual é a unidade de indutância elétrica?',
		20,
		13
	),
	(
		136,
		'Qual é considerada a forma rara de daltonismo?',
		20,
		13
	),
	(
		137,
		'Qual é o nome científico da raposa vermelha?',
		20,
		13
	),
	(
		138,
		'Qual é o nome científico da rótula?',
		20,
		13
	),
	(
		139,
		'Qual é o nome científico do hominídeo extinto conhecido como "Lucy"?',
		20,
		13
	),
	(140, 'Qual é o nome químico de H2O?', 20, 13);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (141, 'Quanta radiação uma banana emite?', 20, 13),
	(
		142,
		'Quantas pernas é biologicamente impossível para uma centopéia ter?',
		20,
		13
	),
	(143, 'Quanto tempo dura um ano-luz?', 20, 13),
	(
		144,
		'Quantos objetos são equivalentes a um mol?',
		20,
		13
	),
	(
		145,
		'Que doença genética é causada por ter um cromossomo Y extra (XYY)?',
		20,
		13
	),
	(
		146,
		'Que nome comum é dado à condição medial, síndrome do estresse tibial (MTSS)?',
		20,
		14
	),
	(
		147,
		'Que nucleotídeo pareia com a guanina?',
		20,
		14
	),
	(
		148,
		'Que princípio físico relaciona o fluxo elétrico resultante de uma superfície fechada com a carga encerrada por essa superfície?',
		20,
		14
	),
	(
		149,
		'que é o mesmo em Celsius e Fahrenheit?',
		20,
		14
	),
	(
		150,
		'Se você plantasse as sementes de Quercus robur, o que cresceria?',
		20,
		14
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		151,
		'Síndrome autossômica dominante Compelling Helio-Ophthalmic Outburst é a necessidade de fazer o que ao ver o Sol?',
		20,
		14
	),
	(
		152,
		'Um composto orgânico é considerado um álcool se possuir qual grupo funcional?',
		20,
		14
	),
	(
		153,
		' Qual é o osso mais longo do corpo humano?',
		10,
		15
	),
	(
		154,
		'A doença de Alzheimer afeta principalmente qual parte do corpo humano?',
		10,
		15
	),
	(
		155,
		'A maior distinção entre uma célula eucariótica e uma célula procariótica é:',
		10,
		15
	),
	(
		156,
		'A rinoplastia é um procedimento cirúrgico em que parte do corpo humano?',
		10,
		15
	),
	(
		157,
		'As células humanas normalmente têm quantas cópias de cada gene?',
		10,
		15
	),
	(
		158,
		'Este elemento, quando superado com calor e pressão extremos, cria diamantes.',
		10,
		15
	),
	(
		159,
		'O cinturão de asteróides está localizado entre quais dois planetas?',
		10,
		15
	),
	(
		160,
		'O gelo seco é a forma sólida de qual substância?',
		10,
		15
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		161,
		'O que está no centro da nossa galáxia?',
		10,
		15
	),
	(
		162,
		'O que significa a letra ''S'' em ''NASA''?',
		10,
		15
	),
	(163, 'O que significa o DNA?', 10, 15),
	(
		164,
		'O termo médico para o umbigo é qual dos seguintes?',
		10,
		15
	),
	(165, 'Para que serve o LASER?', 10, 15),
	(
		166,
		'Qual desses elementos é um metalóide?',
		10,
		15
	),
	(
		167,
		'Qual desses ossos é mais difícil de quebrar?',
		10,
		15
	),
	(
		168,
		'Qual dos seguintes ossos não está na perna?',
		10,
		16
	),
	(
		169,
		'Qual elemento tem o símbolo químico ''Fe''?',
		10,
		16
	),
	(
		170,
		'Qual gás forma cerca de 78% da atmosfera da Terra?',
		10,
		16
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		171,
		'Qual missão Apollo foi a primeira a pousar na Lua?',
		10,
		16
	),
	(
		172,
		'Qual é a "potência" da célula animal eucariótica?',
		10,
		16
	),
	(
		173,
		'Qual é a massa atômica do carbono?',
		10,
		16
	),
	(174, 'Qual é a potência da célula?', 10, 16),
	(
		175,
		'Qual é a principal substância viciante encontrada no tabaco?',
		10,
		16
	),
	(
		176,
		'Qual é a velocidade da luz no vácuo?',
		10,
		16
	),
	(
		177,
		'Qual é o elemento mais abundante no universo?',
		10,
		16
	),
	(
		178,
		'Qual é o maior animal atualmente na Terra?',
		10,
		16
	),
	(
		179,
		'Qual é o nome oficial da estrela localizada mais próxima do Pólo Norte Celestial?',
		10,
		16
	),
	(
		180,
		'Qual é o peso atômico padrão de um núcleo de plutônio?',
		10,
		16
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		181,
		'Qual é o planeta mais quente do Sistema Solar?',
		10,
		16
	),
	(
		182,
		'Qual é o primeiro elemento da tabela periódica?',
		10,
		16
	),
	(
		183,
		'Qual é o símbolo elementar do mercúrio?',
		10,
		16
	),
	(
		184,
		'Quantos cromossomos existem nas células do seu corpo?',
		10,
		17
	),
	(
		185,
		'Quantos ossos existem no corpo humano?',
		10,
		17
	),
	(
		186,
		'Quantos planetas compõem nosso Sistema Solar?',
		10,
		17
	),
	(
		187,
		'Quantos planetas existem em nosso Sistema Solar?',
		10,
		17
	),
	(
		188,
		'Que animal participa do experimento mental mais famoso de Schrödinger?',
		10,
		17
	),
	(
		189,
		'Que tipo de rocha é criada por intenso calor E pressão?',
		10,
		17
	),
	(
		190,
		'Quem descobriu a Lei da Gravidade?',
		10,
		17
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		191,
		' Quantos graus Fahrenheit tem 100 graus Celsius?',
		15,
		18
	),
	(
		192,
		'"Tibia" é encontrado em qual parte do corpo?',
		15,
		18
	),
	(
		193,
		'A condição médica osteoporose afeta qual parte do corpo?',
		15,
		18
	),
	(194, 'A que temperatura a água ferve?', 15, 18),
	(
		195,
		'A água deionizada é a água com qual das seguintes opções é removida?',
		15,
		18
	),
	(
		196,
		'As luas Miranda, Ariel, Umbriel, Titânia e Oberon orbitam qual planeta?',
		15,
		18
	),
	(
		197,
		'Au na Tabela Periódica refere-se a qual elemento?',
		15,
		18
	),
	(
		198,
		'De onde surgiu a raça de cães "Chihuahua"?',
		15,
		18
	),
	(
		199,
		'De qual cidade dinamarquesa é nomeado o 72º elemento da tabela periódica?',
		15,
		18
	),
	(
		200,
		'Do que são feitas as unhas humanas?',
		15,
		18
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		201,
		'Em qual missão o ônibus espacial Columbia quebrou na reentrada?',
		15,
		18
	),
	(
		202,
		'Em que estágio de desenvolvimento a maioria das células eucarióticas permanece durante a maior parte de sua vida?',
		15,
		18
	),
	(
		203,
		'Em que medida a radiação é medida?',
		15,
		18
	),
	(
		204,
		'Em Química, quantos isômeros tem o Butanol (C4H9OH)?',
		15,
		18
	),
	(
		205,
		'Junto com o oxigênio, qual elemento é o principal responsável pelo azul do céu?',
		15,
		18
	),
	(
		206,
		'Miopia é o termo científico para qual condição?',
		15,
		19
	),
	(
		207,
		'Na biologia humana, um ritmo circadiano refere-se a um período de aproximadamente quantas horas?',
		15,
		19
	),
	(
		208,
		'Na tabela periódica dos elementos, qual é o símbolo do estanho?',
		15,
		19
	),
	(
		209,
		'O Axioma da Medicina Preventiva afirma que as pessoas com ___ risco de uma doença devem ser rastreadas e devemos tratar ___ dessas pessoas.',
		15,
		19
	),
	(
		210,
		'O deutério é um isótopo de qual elemento?',
		15,
		19
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		211,
		'O menisco medial forma qual parte de qual articulação no corpo humano?',
		15,
		19
	),
	(
		212,
		'O pulmão direito humano tem quantos lobos?',
		15,
		19
	),
	(
		213,
		'O que representa o diamante amarelo no diamante de fogo NFPA 704?',
		15,
		19
	),
	(
		214,
		'O que você estuda se estiver estudando entomologia?',
		15,
		19
	),
	(
		215,
		'O Sol consiste principalmente de quais dois elementos?',
		15,
		19
	),
	(
		216,
		'O úmero, o rádio emparelhado e a ulna se unem para formar qual articulação?',
		15,
		19
	),
	(
		217,
		'Qual das seguintes espaçonaves nunca tocou a lua?',
		15,
		19
	),
	(
		218,
		'Qual deserto é o único deserto do mundo onde o cacto "Saguaro" cresce de forma indígena?',
		15,
		19
	),
	(219, 'Qual dessas estrelas é a maior?', 15, 19),
	(
		220,
		'Qual dessas opções não é uma das fases da mitose?',
		15,
		19
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (420, 'Quem fundou a Khan Academy?', 20, 36),
	(
		221,
		'Qual desses cientistas conduziu o experimento da folha de ouro que concluiu que os átomos são feitos principalmente de espaço vazio?',
		15,
		19
	),
	(
		222,
		'Qual destes NÃO faz parte da estrutura de um neurônio típico?',
		15,
		20
	),
	(
		223,
		'Qual destes é um tipo de estiramento/reflexo tendinoso profundo?',
		15,
		20
	),
	(
		224,
		'Qual dos seguintes homens não tem um elemento químico com o seu nome?',
		15,
		20
	),
	(
		225,
		'Qual dos seguintes NÃO é um componente elétrico passivo?',
		15,
		20
	),
	(
		226,
		'Qual elemento químico era originalmente conhecido como alabamina?',
		15,
		20
	),
	(
		227,
		'Qual elemento químico tem o menor ponto de ebulição?',
		15,
		20
	),
	(
		228,
		'Qual elemento tem o número atômico 7?',
		15,
		20
	),
	(
		229,
		'Qual foi a primeira criatura viva no espaço?',
		15,
		20
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		230,
		'Qual mineral tem o menor número na escala de Mohs?',
		15,
		20
	),
	(
		231,
		'Qual parte da planta da maconha produz a substância psicoativa conhecida como THC?',
		15,
		20
	),
	(
		232,
		'Qual parte do corpo o glaucoma afeta?',
		15,
		20
	),
	(
		233,
		'Qual termo psicológico se refere ao estresse de manter crenças contrastantes?',
		15,
		20
	),
	(
		234,
		'Qual termo é melhor associado a Sigmund Freud?',
		15,
		20
	),
	(
		235,
		'Qual é a cor do sangue não oxidado?',
		15,
		20
	),
	(
		236,
		'Qual é a fórmula molecular do componente ativo da pimenta malagueta (capsaicina)?',
		15,
		20
	),
	(
		237,
		'Qual é a fórmula química da amônia?',
		15,
		20
	),
	(
		238,
		'Qual é a unidade de capacitância elétrica?',
		15,
		21
	),
	(
		239,
		'Qual é o estudo das células e tecidos de plantas e animais?',
		15,
		21
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		240,
		'Qual é o maior organismo vivo atualmente conhecido pelo homem?',
		15,
		21
	),
	(
		241,
		'Qual é o nome do viés cognitivo em que uma pessoa com baixa habilidade em uma habilidade específica se confunde como sendo superior?',
		15,
		21
	),
	(
		242,
		'Qual é o nome Linneano da macieira doméstica?',
		15,
		21
	),
	(
		243,
		'Qual é o número atômico do elemento estrôncio?',
		15,
		21
	),
	(
		244,
		'Qual é o termo científico para ''gosto''?',
		15,
		21
	),
	(
		245,
		'Qual é um nome alternativo para transtorno de personalidade múltipla?',
		15,
		21
	),
	(
		246,
		'Quando o Falcon Heavy foi lançado em seu voo de teste, qual foi a única parte da operação que falhou?',
		15,
		21
	),
	(
		247,
		'Quando o primeiro mamífero foi clonado com sucesso?',
		15,
		21
	),
	(248, 'Quantos anos tem a Terra?', 15, 21),
	(
		249,
		'Quantos planetas anões oficialmente reconhecidos no sistema solar têm nomes de divindades polinésias?',
		15,
		21
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		250,
		'Que parte do cérebro leva o nome do grego para cavalo-marinho?',
		15,
		21
	),
	(
		251,
		'Que polímero é usado para fazer CDs, óculos de segurança e escudos antimotim?',
		15,
		21
	),
	(
		252,
		'Quem desenvolveu a primeira vacina bem-sucedida contra a poliomielite na década de 1950?',
		15,
		21
	),
	(
		253,
		'Quem fez a descoberta dos raios X?',
		15,
		21
	),
	(
		254,
		'A America Online (AOL) começou como qual desses provedores de serviços online?',
		20,
		22
	),
	(
		255,
		'A arquitetura de Harvard para microcontroladores adicionou qual barramento adicional?',
		20,
		22
	),
	(
		256,
		'A Lenovo adquiriu a divisão de computadores pessoais da IBM, incluindo a linha ThinkPad de laptops e tablets, em que ano?',
		20,
		22
	),
	(
		257,
		'Como o Sistema Internacional de Quantidades se refere a 1024 bytes?',
		20,
		22
	),
	(
		258,
		'De acordo com o Teorema de DeMorgan, a expressão booleana (AB)'' é equivalente a:',
		20,
		22
	),
	(
		259,
		'Lançada em 2001, a primeira edição do sistema operacional Mac OS X da Apple (versão 10.0) recebeu qual nome de código animal?',
		20,
		22
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		260,
		'O cientista da computação holandês Mark Overmars é conhecido por criar qual engine de desenvolvimento de jogos?',
		20,
		22
	),
	(
		261,
		'O domínio da Internet .fm é o domínio de nível superior com código de país para qual nação insular do Oceano Pacífico?',
		20,
		22
	),
	(
		262,
		'Qual desses interruptores de teclado mecânico Cherry MX é tátil e clicável?',
		20,
		22
	),
	(
		263,
		'Qual desses nomes era um codinome real para um projeto cancelado da Microsoft?',
		20,
		22
	),
	(
		264,
		'Qual destes era o nome de um bug encontrado em abril de 2014 na biblioteca de criptografia OpenSSL disponível publicamente?',
		20,
		22
	),
	(
		265,
		'Qual destes não é um valor chave do desenvolvimento de software Agile?',
		20,
		22
	),
	(
		266,
		'Qual destes não é uma camada no modelo OSI para comunicações de dados?',
		20,
		22
	),
	(
		267,
		'Qual dos seguintes componentes de computador pode ser construído usando apenas portas NAND?',
		20,
		22
	),
	(
		268,
		'Qual dos seguintes é o mais antigo desses computadores até a data de lançamento?',
		20,
		22
	),
	(
		269,
		'qual estrutura de dados o FILO se aplica?',
		20,
		23
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		270,
		'Qual foi a primeira empresa a usar o termo "Golden Master"?',
		20,
		23
	),
	(
		271,
		'Qual linguagem de programação principal o Unreal Engine 4 usa?',
		20,
		23
	),
	(
		272,
		'Qual protocolo de internet foi documentado no RFC 1459?',
		20,
		23
	),
	(
		273,
		'Qual vulnerabilidade ficou em primeiro lugar no Top 10 da OWASP em 2013?',
		20,
		23
	),
	(
		274,
		'Qual é o codinome da microarquitetura Intel Core de oitava geração lançada em outubro de 2017?',
		20,
		23
	),
	(
		275,
		'Qual é o nome dado à camada 4 do modelo Open Systems Interconnection (ISO)?',
		20,
		23
	),
	(
		276,
		'Qual é o nome do processo que envia um qubit de informação usando dois bits de informação clássica?',
		20,
		23
	),
	(
		277,
		'Quantos Hz o padrão de vídeo PAL suporta?',
		20,
		23
	),
	(
		278,
		'Que tipo de algoritmo Ron Rivest não é famoso por criar?',
		20,
		23
	),
	(
		279,
		'Que tipo de chip de som o Super Nintendo Entertainment System (SNES) possui?',
		20,
		23
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		280,
		'Quem inventou o "Protocolo Spanning Tree"?',
		20,
		23
	),
	(
		281,
		'Quem é o autor original do mecanismo de física em tempo real chamado PhysX?',
		20,
		23
	),
	(282, 'Quem é o fundador da Palantir?', 20, 23),
	(
		283,
		' A linguagem de programação C foi criada por este cientista da computação americano.',
		10,
		24
	),
	(
		284,
		' O sistema de numeração com uma raiz de 16 é mais comumente referido como',
		10,
		24
	),
	(
		285,
		'De acordo com o Sistema Internacional de Unidades, quantos bytes há em um kilobyte de RAM?',
		10,
		24
	),
	(
		286,
		'Em "Hexadecimal", que cor seria exibida a partir do código de cores? "#00FF00"?',
		10,
		24
	),
	(
		287,
		'Em web design, o que significa CSS?',
		10,
		24
	),
	(288, 'HTML é que tipo de linguagem?', 10, 24),
	(
		289,
		'Na computação, o que significa MIDI?',
		10,
		24
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		290,
		'Na linguagem de programação Java, qual dessas palavras-chave você colocaria em uma variável para garantir que ela não fosse modificada?',
		10,
		24
	),
	(
		291,
		'No Twitter, qual era o limite original de caracteres para um Tweet?',
		10,
		24
	),
	(292, 'O que significa "MP" em MP3?', 10, 24),
	(293, 'O que significa GHz?', 10, 24),
	(
		294,
		'O que significa o acrônimo de software de computador JVM?',
		10,
		24
	),
	(
		295,
		'Qual dispositivo de hardware de computador fornece uma interface para todos os outros dispositivos conectados se comunicarem?',
		10,
		24
	),
	(
		296,
		'Qual linguagem de programação compartilha seu nome com uma ilha na Indonésia?',
		10,
		24
	),
	(297, 'Qual linguagem o Node.js usa?', 10, 24),
	(
		298,
		'Qual é o formato de imagem preferido usado para logotipos no banco de dados da Wikimedia?',
		10,
		25
	),
	(
		299,
		'Quando o Gmail foi lançado, quanto espaço de armazenamento ele fornecia para o seu e-mail?',
		10,
		25
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		300,
		'Quanto tempo dura um endereço IPv6?',
		10,
		25
	),
	(
		301,
		'Quantos kilobytes tem um gigabyte (em decimal)?',
		10,
		25
	),
	(
		302,
		'Quantos valores um único byte pode representar?',
		10,
		25
	),
	(
		303,
		'Que quantidade de bits geralmente equivale a um byte?',
		10,
		25
	),
	(
		304,
		'Se você codificasse o software neste idioma, só seria capaz de digitar 0 e 1.',
		10,
		25
	),
	(
		305,
		' O que significa AD em relação aos sistemas operacionais Windows?',
		15,
		26
	),
	(
		306,
		'.at é o domínio de nível superior de qual país?',
		15,
		26
	),
	(
		307,
		'.rs é o domínio de nível superior de qual país?',
		15,
		26
	),
	(
		308,
		'Aproximadamente quantos computadores pessoais Apple I foram criados?',
		15,
		26
	),
	(
		309,
		'Em HTML, qual tag não padrão costumava ser usada para fazer os elementos rolarem pela viewport?',
		15,
		26
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		310,
		'Em termos de computação, normalmente o que CLI significa?',
		15,
		26
	),
	(
		311,
		'Enquanto a Apple foi formada na Califórnia, em que estado ocidental a Microsoft foi fundada?',
		15,
		26
	),
	(
		312,
		'Geralmente, qual componente de um computador consome mais energia?',
		15,
		26
	),
	(
		313,
		'Na linguagem de programação "Python", qual dessas instruções exibiria a string "Hello World" corretamente?',
		15,
		26
	),
	(
		314,
		'Na programação, como você chama as funções com o mesmo nome, mas implementações diferentes?',
		15,
		26
	),
	(
		315,
		'Na programação, o operador ternário é definido principalmente com que símbolo(s)?',
		15,
		26
	),
	(
		316,
		'O bule frequentemente visto em muitos aplicativos de modelagem 3D é chamado de quê?',
		15,
		26
	),
	(
		317,
		'O nome da empresa de tecnologia HP significa o quê?',
		15,
		26
	),
	(318, 'O que significa "LCD"?', 15, 26),
	(
		319,
		'O que significa a sigla CDN em termos de rede?',
		15,
		26
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		320,
		'O que significa o ''S'' no algoritmo de criptografia RSA?',
		15,
		27
	),
	(321, 'O que significa o termo GPU?', 15, 27),
	(
		322,
		'O que significa o termo MIME, em relação à computação?',
		15,
		27
	),
	(
		323,
		'O que é conhecido como "o cérebro" do Computador?',
		15,
		27
	),
	(
		324,
		'Qual dessas linguagens de programação é uma linguagem de baixo nível?',
		15,
		27
	),
	(
		325,
		'Qual destes não é um nome de desenvolvimento oficial para uma versão do Ubuntu?',
		15,
		27
	),
	(
		326,
		'Qual dos seguintes é um computador pessoal fabricado pela empresa japonesa Fujitsu?',
		15,
		27
	),
	(
		327,
		'Qual empresa de internet começou como uma livraria online chamada ''Cadabra''?',
		15,
		27
	),
	(
		328,
		'Qual era o significado original do nome Tor Anonymity Network?',
		15,
		27
	),
	(
		329,
		'Qual foi a primeira versão do Android otimizada especificamente para tablets?',
		15,
		27
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		330,
		'Qual foi o nome dado ao Android 4.3?',
		15,
		27
	),
	(
		331,
		'Qual foi o primeiro processador de computador disponível comercialmente?',
		15,
		27
	),
	(
		332,
		'Qual linguagem de codificação foi a linguagem de programação nº 1 em termos de uso no GitHub em 2015?',
		15,
		27
	),
	(
		333,
		'Qual sistema operacional foi lançado primeiro?',
		15,
		27
	),
	(
		334,
		'Qual é o nome do tema padrão instalado com o Windows XP?',
		15,
		27
	),
	(
		335,
		'Qual é o termo correto para o objeto de metal entre a CPU e o ventilador da CPU em um sistema de computador?',
		15,
		27
	),
	(
		336,
		'Quando foi lançado o serviço de streaming online "Mixer"?',
		15,
		28
	),
	(
		337,
		'Quantos bits compõem a parte do significando de um único número de ponto flutuante de precisão?',
		15,
		28
	),
	(
		338,
		'Quantos bytes existem em um único Kibibyte?',
		15,
		28
	),
	(
		339,
		'Todos os programas a seguir são classificados como editores gráficos raster, EXCETO:',
		15,
		28
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		340,
		'Whistler era o codinome desse sistema operacional da Microsoft.',
		15,
		28
	),
	(
		341,
		'Em que rodada um AK-47 clássico é compartimentado?',
		10,
		29
	),
	(
		342,
		'O termo "bateria" para descrever um dispositivo de armazenamento elétrico foi cunhado por?',
		10,
		29
	),
	(
		343,
		'Qual palavra da moda a Apple Inc. usou para descrever a remoção do fone de ouvido?',
		10,
		29
	),
	(
		344,
		'Quando o animal de estimação digital Tamagotchi foi lançado?',
		10,
		29
	),
	(
		345,
		'Quando o CD começou a aparecer no mercado de consumo?',
		10,
		29
	),
	(346, 'Quando o DVD foi inventado?', 10, 29),
	(347, 'Quando o iPhone foi lançado?', 10, 29),
	(
		348,
		'Como são chamados os rastreadores de estação base usados para o HTC Vive?',
		15,
		30
	),
	(
		349,
		'De todos os ônibus espaciais da NASA, quais 2 foram destruídos em desastres?',
		15,
		30
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		350,
		'Em que ano o Oculus Rift foi revelado ao público por meio de uma campanha do Kickstarter?',
		15,
		30
	),
	(351, 'O que é o "Mitsubishi Wakamaru"?', 15, 30),
	(
		352,
		'Qual empresa desenvolveu o Hololens?',
		15,
		30
	),
	(
		353,
		'Qual empresa projetou o formato de videocassete "Betamax"?',
		15,
		30
	),
	(
		421,
		'Se alguém disser "você é velho", o que eles querem dizer?',
		20,
		36
	),
	(
		354,
		'Qual é o empreendimento paralelo mais significativo que a popular empresa de armas de fogo Remington realizou?',
		15,
		30
	),
	(
		355,
		'Quem patenteou uma máquina a vapor que produzia movimento rotativo contínuo?',
		15,
		30
	),
	(
		356,
		'A noção de um "conjunto que contém todos os conjuntos que não contêm a si mesmos" é uma ideia paradoxal atribuída a qual filósofo inglês?',
		20,
		31
	),
	(
		357,
		'Como é chamada a curva plana proposta por Descartes para desafiar as técnicas de descoberta de extremos de Fermat?',
		20,
		31
	),
	(
		358,
		'O matemático francês Évariste Galois é conhecido principalmente por seu trabalho em que?',
		20,
		31
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		359,
		'O número decimal 31 em hexadecimal seria o que?',
		20,
		31
	),
	(
		360,
		'Qual desses números está mais próximo do número total de estados possíveis para uma Máquina Enigma padrão do exército?',
		20,
		31
	),
	(
		361,
		'Qual dos seguintes matemáticos famosos morreu em um duelo aos 20 anos?',
		20,
		31
	),
	(
		362,
		'Qual dos seguintes matemáticos fez grandes contribuições para a teoria dos jogos?',
		20,
		31
	),
	(
		363,
		'Qual é a derivada da aceleração em relação ao tempo?',
		20,
		31
	),
	(
		364,
		'Qual é o menor número que pode ser expresso como a soma de dois cubos positivos de duas maneiras diferentes?',
		20,
		31
	),
	(365, 'Qual é o quarto dígito de π?', 20, 31),
	(
		366,
		'Qual é o valor aproximado da constante matemática e?',
		20,
		31
	),
	(
		367,
		'Em algarismos romanos, o que significa XL?',
		10,
		32
	),
	(
		368,
		'O prefixo métrico "atto-" faz uma medida quanto menor que a unidade base?',
		10,
		32
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		369,
		'Qual número primo vem depois de 19?',
		10,
		32
	),
	(
		370,
		'Qual é a ordem correta das operações para resolver equações?',
		10,
		32
	),
	(371, 'Qual é o símbolo de Deslocamento?', 10, 32),
	(372, 'Quantos lados tem um heptágono?', 10, 32),
	(
		373,
		'No plano complexo, multiplicar uma dada função por i gira no sentido anti-horário em quantos graus?',
		15,
		33
	),
	(
		374,
		'No sistema hexadecimal, que número vem depois do 9?',
		15,
		33
	),
	(
		375,
		'Quais são os 6 primeiros dígitos do número "Pi"?',
		15,
		33
	),
	(
		376,
		'Qual dos seguintes dados não é um sólido platônico?',
		15,
		33
	),
	(
		377,
		'Qual matemático grego correu nu pelas ruas de Siracusa gritando "Eureka" depois de descobrir o princípio do deslocamento?',
		15,
		33
	),
	(
		378,
		'Qual matemático recusou a Medalha Fields?',
		15,
		33
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		379,
		'Qual é a representação alfanumérica do número imaginário?',
		15,
		33
	),
	(
		380,
		'Qual é a área de um círculo com diâmetro de 20 polegadas se π= 3,1415?',
		15,
		33
	),
	(
		381,
		'Qual é o primeiro expoente primo de Mersenne acima de 1000?',
		15,
		33
	),
	(
		382,
		'Quantos livros há nos Elementos de Geometria de Euclides?',
		15,
		33
	),
	(383, 'Quantos zeros tem um googol?', 15, 33),
	(
		384,
		'Que letra grega é usada para significar soma?',
		15,
		33
	),
	(385, 'Que tipo de função é x²+2x+1?', 15, 33),
	(
		386,
		'A empresa de realidade virtual Oculus VR perdeu qual de seus co-fundadores em um acidente de carro em 2013?',
		20,
		34
	),
	(
		387,
		'A Mansão Assombrada da Disney é o lar de um trio de fantasmas que pedem carona. Qual destes NÃO é um deles?',
		20,
		34
	),
	(
		388,
		'A palavra "abulia" significa qual dos seguintes?',
		20,
		34
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		389,
		'A popularidade do produtor de música eletrônica Kygo disparou após um certo remix. Qual música ele remixou?',
		20,
		34
	),
	(
		390,
		'Antes do século 19, a "Sala de estar" era originalmente chamada de...',
		20,
		34
	),
	(
		391,
		'As palavras "bangalô" e "shampoo" são originárias das línguas de qual país?',
		20,
		34
	),
	(
		392,
		'Como foi originalmente estabelecido o Bank of America?',
		20,
		34
	),
	(
		393,
		'De acordo com o Australian Bureau of Statistics de 2014-2015, que porcentagem de australianos nasceu no exterior?',
		20,
		34
	),
	(
		394,
		'De Eemhof, Port Zelande e Het Heijderbos são casas de férias pertencentes a que empresa?',
		20,
		34
	),
	(
		395,
		'Em "Battle Cats", qual é a taxa de porcentagem crítica de Moneko / MISS Moneko?',
		20,
		34
	),
	(
		396,
		'Em que ano foi lançado o robô de brinquedo RoboSapien?',
		20,
		34
	),
	(
		397,
		'Em que ano nasceu a Rainha Elizabeth II?',
		20,
		34
	),
	(
		398,
		'Em sistemas de voo, o que significa o inicialismo "TCAS"?',
		20,
		34
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		399,
		'Nefelococcygia é a prática de fazer o quê?',
		20,
		34
	),
	(
		400,
		'No RPG MMO "Realm of the Mad God", qual masmorra é amplamente considerada a mais difícil?',
		20,
		34
	),
	(
		401,
		'O Quadrangularis Reversum é melhor descrito como qual dos seguintes?',
		20,
		35
	),
	(
		402,
		'O que a frase latina "Veni, vidi, vici" traduz para o português?',
		20,
		35
	),
	(403, 'Onde está a sede da Apple Inc.?', 20, 35),
	(
		404,
		'Originalmente outra palavra para papoula, coquelicot é uma sombra de quê?',
		20,
		35
	),
	(
		405,
		'Quais destes bancos NÃO estão autorizados a emitir notas de dinheiro em Hong Kong?',
		20,
		35
	),
	(
		406,
		'Qual das opções a seguir é uma família existente em "The Sims"?',
		20,
		35
	),
	(
		407,
		'Qual das seguintes línguas NÃO usa gênero como parte de sua gramática?',
		20,
		35
	),
	(
		408,
		'Qual dessas empresas suecas foi fundada em 1943?',
		20,
		35
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		409,
		'Qual dos seguintes monarcas britânicos nunca apareceu em uma moeda de libra esterlina circulada?',
		20,
		35
	),
	(
		410,
		'Qual dos seguintes não é outro nome para a berinjela?',
		20,
		35
	),
	(
		411,
		'Qual músico colaborou com o produtor americano Porter Robinson e lançou a música "Shelter" em 2016?',
		20,
		35
	),
	(
		412,
		'Qual produto a Nokia, empresa de telecomunicações, vendia originalmente?',
		20,
		35
	),
	(
		413,
		'Qual é a palavra chinesa romanizada para "avião"?',
		20,
		35
	),
	(
		414,
		'Qual é a palavra árabe romanizada para "lua"?',
		20,
		35
	),
	(
		415,
		'Qual é o peso de uma barra de ouro em Fallout: New Vegas?',
		20,
		35
	),
	(
		416,
		'Qual é o substantivo mais usado na língua inglesa?',
		20,
		35
	),
	(417, 'Quando o "YouTube" foi fundado?', 20, 36),
	(
		418,
		'Quanto tempo os lava-vidros motorizados do World Trade Center original levaram para limpar todo o exterior do edifício?',
		20,
		36
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		419,
		'Que tipo de cachorro é ''Handsome Dan'', o mascote da Universidade de Yale?',
		20,
		36
	),
	(
		422,
		'Se você plantasse as sementes de Quercus robur, o que cresceria?',
		20,
		36
	),
	(
		423,
		' O que significa o ''S'' na abreviação SIM, como no cartão SIM?',
		10,
		37
	),
	(
		424,
		' Virgin Trains, Virgin Atlantic e Virgin Racing, todas as empresas pertencem a qual empresário famoso?',
		10,
		37
	),
	(
		425,
		'A bandeira da União Europeia tem quantas estrelas?',
		10,
		37
	),
	(
		426,
		'A imagem de qual presidente aparece na rara nota de US$ 2 da moeda americana?',
		10,
		37
	),
	(
		427,
		'A moeda canadense de $ 1 é coloquialmente conhecida como o quê?',
		10,
		37
	),
	(
		428,
		'A primeira aparição de Waluigi foi em que jogo?',
		10,
		37
	),
	(
		429,
		'A Terra está localizada em qual galáxia?',
		10,
		37
	),
	(
		430,
		'cartel de drogas dirigido por Pablo Escobar se originou em qual cidade sul-americana?',
		10,
		37
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		431,
		'Cinco dólares valem quantos centavos?',
		10,
		37
	),
	(
		432,
		'Com qual empresa a Valve cooperou na criação do Vive?',
		10,
		37
	),
	(
		433,
		'Como alguém diria adeus em espanhol?',
		10,
		37
	),
	(
		434,
		'De acordo com Sherlock Holmes, "Se você eliminar o impossível, o que sobrar, por mais improvável que seja, deve ser o..."',
		10,
		37
	),
	(
		435,
		'De que são feitos os chapéus Panamá?',
		10,
		37
	),
	(436, 'Do que a cinofobia tem medo?', 10, 37),
	(
		437,
		'Em aerodinâmica, qual força empurra um objeto para cima?',
		10,
		37
	),
	(
		438,
		'Em tempos passados, o que um cavalheiro guardaria em seu bolso?',
		10,
		38
	),
	(
		439,
		'O foie gras é uma iguaria francesa tipicamente feita de que parte de um pato ou ganso?',
		10,
		38
	),
	(
		440,
		'O mascote de qual restaurante é um palhaço?',
		10,
		38
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		441,
		'O que significam as letras no fuso horário GMT?',
		10,
		38
	),
	(442, 'O que um funambulista anda?', 10, 38),
	(
		443,
		'O slogan do New York Times é: “Todas as notícias adequadas”',
		10,
		38
	),
	(
		444,
		'Onde fica a estação de trem "Llanfair-pwllgwyngyll-gogery-chwyrn-drobwll-llan-tysilio-gogo-goch"?',
		10,
		38
	),
	(
		445,
		'Quais nozes são usadas na produção de maçapão?',
		10,
		38
	),
	(
		446,
		'Qual cervejaria de propriedade americana liderou o país em volume de vendas em 2015?',
		10,
		38
	),
	(
		447,
		'Qual companhia aérea era a proprietária do avião que caiu na costa da Nova Escócia em 1998?',
		10,
		38
	),
	(
		448,
		'Qual das opções a seguir não é uma universidade da Ivy League?',
		10,
		38
	),
	(
		449,
		'Qual das seguintes opções é o código IATA do Aeroporto de Manchester?',
		10,
		38
	),
	(
		450,
		'Qual destes não é um típico desenho europeu de espada?',
		10,
		38
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (451, 'Qual doce NÃO é feito pela Mars?', 10, 38),
	(
		452,
		'Qual dos seguintes componentes do sangue forma um tampão no local das lesões?',
		10,
		38
	),
	(
		453,
		'Qual dos seguintes jogos de cartas gira em torno de números e matemática básica?',
		10,
		38
	),
	(
		454,
		'Qual dos seguintes jogos de ritmo foi feito pela Harmonix?',
		10,
		39
	),
	(
		455,
		'Qual dos seguintes não é o anfitrião de um programa na NPR?',
		10,
		39
	),
	(
		456,
		'Qual dos seguintes presidentes não está no Monte Rushmore?',
		10,
		39
	),
	(
		457,
		'Qual elemento da máquina está localizado no centro dos fidget spinners?',
		10,
		39
	),
	(
		458,
		'Qual empresa desenvolveu o vocaloid Hatsune Miku?',
		10,
		39
	),
	(
		459,
		'Qual era o nome da tag team de wrestling profissional da WWF composta pelos lutadores Axe e Smash?',
		10,
		39
	),
	(
		460,
		'Qual foi a primeira linha do metrô de Londres a ser construída?',
		10,
		39
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		461,
		'Qual país tem a Union Jack em sua bandeira?',
		10,
		39
	),
	(
		462,
		'Qual país, sem incluir o Japão, tem o maior número de descendentes de japoneses?',
		10,
		39
	),
	(
		463,
		'Qual presidente americano aparece em uma nota de um dólar?',
		10,
		39
	),
	(
		464,
		'Qual é a forma do brinquedo inventado pelo professor húngaro Ernő Rubik?',
		10,
		39
	),
	(
		465,
		'Qual é a língua oficial do Brasil?',
		10,
		39
	),
	(
		466,
		'Qual é a palavra espanhola para "burro"?',
		10,
		39
	),
	(
		467,
		'Qual é a palavra francesa para "chapéu"?',
		10,
		39
	),
	(
		468,
		'Qual é a palavra francesa para "peixe"?',
		10,
		39
	),
	(
		469,
		'Qual é o apelido do estado americano da Califórnia?',
		10,
		39
	),
	(
		470,
		'Qual é o nome da Polônia em polonês?',
		10,
		40
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		471,
		'Qual é o nome do Ano Novo Judaico?',
		10,
		40
	),
	(
		472,
		'Qual é o nome do telescópio espacial mais famoso da NASA?',
		10,
		40
	),
	(
		473,
		'Qual é o planeta mais próximo do sol do nosso sistema solar?',
		10,
		40
	),
	(
		474,
		'Qual é o sobrenome do famoso Papa John?',
		10,
		40
	),
	(
		475,
		'Qual é o símbolo do zodíaco para Gêmeos?',
		10,
		40
	),
	(
		476,
		'Quando alguém é "invejoso", dizem que são de que cor?',
		10,
		40
	),
	(
		477,
		'Quando alguém é covarde, dizem que tem barriga de que cor?',
		10,
		40
	),
	(
		478,
		'Quando alguém é inexperiente, diz-se que é de que cor?',
		10,
		40
	),
	(
		479,
		'Quando foi lançado o Playstation 3?',
		10,
		40
	),
	(
		480,
		'que significam as letras da rede de fast food KFC?',
		10,
		40
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		481,
		'Quem inventou a primeira barra de chocolate, em 1847?',
		10,
		40
	),
	(
		482,
		'Quem é a pessoa mais jovem a receber um Prêmio Nobel?',
		10,
		40
	),
	(483, 'Quem é o autor de Jurrasic Park?', 10, 40),
	(
		484,
		'Red Vines é uma marca de que tipo de doce?',
		10,
		40
	),
	(
		485,
		'Terry Gilliam foi um animador que trabalhou com qual grupo de comédia britânico?',
		10,
		40
	),
	(
		486,
		' No código Morse, qual letra é indicada por 3 pontos?',
		15,
		41
	),
	(
		487,
		' novo One World Trade Center em Manhattan, Nova York, foi projetado por qual arquiteto?',
		15,
		41
	),
	(
		488,
		' Qual cadeia de fast food tem mais locais no mundo?',
		15,
		41
	),
	(
		489,
		'A cerveja mexicana "Corona" é que tipo de cerveja?',
		15,
		41
	),
	(
		490,
		'A Medalha Fields, um dos prêmios mais cobiçados da matemática, é concedida a cada quantos anos?',
		15,
		41
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		491,
		'A Rolex é uma empresa especializada em que tipo de produto?',
		15,
		41
	),
	(
		492,
		'Como foi originalmente introduzido o refrigerante Pepsi?',
		15,
		41
	),
	(
		493,
		'Como se chama a comida indiana cozida na brasa no forno de barro?',
		15,
		41
	),
	(
		494,
		'De acordo com o CDC dos Estados Unidos, um em quantos americanos morre anualmente devido ao fumo?',
		15,
		41
	),
	(
		495,
		'De onde vem a água das garrafas de água da Poland Spring?',
		15,
		41
	),
	(
		496,
		'De quem é o rosto em tons de cinza no emoticon kappa no Twitch?',
		15,
		41
	),
	(
		497,
		'Depois de quantos anos você comemoraria suas bodas de cristal?',
		15,
		41
	),
	(
		498,
		'Do que são feitos os verdadeiros haggis?',
		15,
		41
	),
	(
		499,
		'Em 2013, quanto dinheiro foi perdido por golpes nigerianos?',
		15,
		41
	),
	(
		500,
		'Em média, os americanos consomem 100 libras de quê por segundo?',
		15,
		41
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		501,
		'Em que ano a Apple Inc. foi fundada?',
		15,
		42
	),
	(
		502,
		'Em um jogo padrão de cartas, qual é o único rei sem bigode?',
		15,
		42
	),
	(
		503,
		'Em uma entrevista para a CBS em 1994, o co-fundador da Microsoft, Bill Gates, realizou qual truque incomum diante das câmeras?',
		15,
		42
	),
	(
		504,
		'Este campo às vezes é conhecido como “The Dismal Science”',
		15,
		42
	),
	(
		505,
		'fabricante de computadores Compaq foi adquirida por US$ 25 bilhões em 2002 por qual empresa?',
		15,
		42
	),
	(
		506,
		'Frank Lloyd Wright foi o arquiteto por trás de qual edifício famoso?',
		15,
		42
	),
	(
		507,
		'Linus Pauling, um dos únicos vencedores de vários prêmios Nobel, ganhou seus prêmios Nobel de Química e o quê?',
		15,
		42
	),
	(
		508,
		'Na Grécia antiga, se o seu trabalho fosse um "hippeus", qual desses você teria?',
		15,
		42
	),
	(
		509,
		'O arquiteto conhecido como Le Corbusier foi uma figura importante em que estilo de arquitetura?',
		15,
		42
	),
	(
		510,
		'O chá Earl Grey é chá preto aromatizado com o quê?',
		15,
		42
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (511, 'O que significa o "G" em "G-Man"?', 15, 42),
	(512, 'O que é um Burgee?', 15, 42),
	(513, 'O que é um shopping morto?', 15, 42),
	(
		514,
		'O site "Shut Up & Sit Down" analisa qual tipo de mídia?',
		15,
		42
	),
	(
		515,
		'Quais são os três Pokémon iniciais disponíveis em Pokémon Black and White?',
		15,
		42
	),
	(
		516,
		'Qual atração icônica da Disneylândia foi fechada em 2017 para ser remodelada como um passeio temático de "Guardiões da Galáxia"?',
		15,
		42
	),
	(
		517,
		'Qual condimento essencial também é conhecido como raiz-forte japonesa?',
		15,
		43
	),
	(
		518,
		'Qual das seguintes universidades da Ivy League tem seu lema oficial tanto em hebraico quanto em latim?',
		15,
		43
	),
	(
		519,
		'Qual dessas empresas NÃO fabrica automóveis?',
		15,
		43
	),
	(
		520,
		'Qual dessas palavras significa "espectador ocioso"?',
		15,
		43
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		521,
		'Qual destes é o nome de um sistema japonês de medicina alternativa, que significa literalmente "pressão dos dedos"?',
		15,
		43
	),
	(
		522,
		'Qual dos cereais monstruosos da General Mills Corporation foi o último a ser lançado na década de 1970?',
		15,
		43
	),
	(
		523,
		'Qual dos seguintes refrigerantes carbonatados foi introduzido primeiro?',
		15,
		43
	),
	(
		524,
		'Qual era o nome original do mecanismo de busca "Google"?',
		15,
		43
	),
	(
		525,
		'Qual falácia lógica significa atacar o caráter de seu oponente em vez de seus argumentos?',
		15,
		43
	),
	(526, 'Qual idioma NÃO é indo-europeu?', 15, 43),
	(
		527,
		'Qual país dirige do lado esquerdo da estrada?',
		15,
		43
	),
	(
		528,
		'Qual país tem mais cervejarias trapistas?',
		15,
		43
	),
	(
		529,
		'Qual peça de roupa geralmente é usada por um escocês em um casamento?',
		15,
		43
	),
	(
		530,
		'Qual slogan a empresa de fast food, McDonald''s, usou antes de seu slogan "I''m Lovin'' It"?',
		15,
		43
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		531,
		'Qual submetralhadora de fabricação americana era informalmente conhecida pelos soldados americanos que a usavam como "Grease Gun"?',
		15,
		43
	),
	(
		532,
		'Qual é a característica definidora de alguém descrito como hirsuto?',
		15,
		43
	),
	(533, 'Qual é a moeda da Polônia?', 15, 44),
	(
		534,
		'Qual é a palavra em português para "Brasil"?',
		15,
		44
	),
	(
		535,
		'Qual é a palavra italiana para "tomate"?',
		15,
		44
	),
	(
		536,
		'Qual é a palavra japonesa romanizada para "universidade"?',
		15,
		44
	),
	(
		537,
		'Qual é a palavra russa romanizada para "inverno"?',
		15,
		44
	),
	(
		538,
		'Qual é a unidade monetária em Laos?',
		15,
		44
	),
	(
		539,
		'Qual é o maior número de estrelas Michelin que um restaurante pode receber?',
		15,
		44
	),
	(
		540,
		'Qual é o nome do popular peixe cantante animatrônico, cantando sucessos como "Don''t Worry, Be Happy"?',
		15,
		44
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		541,
		'Qual é o nome do primeiro vídeo carregado no YouTube?',
		15,
		44
	),
	(
		542,
		'Qual é o signo de quem nasceu no dia dos namorados?',
		15,
		44
	),
	(
		543,
		'Qual é o tempero mais caro do mundo em peso?',
		15,
		44
	),
	(544, 'Quando a Nintendo foi fundada?', 15, 44),
	(
		545,
		'Quando Hubba Bubba foi introduzido pela primeira vez?',
		15,
		44
	),
	(
		546,
		'Quando o site "Facebook" foi lançado?',
		15,
		44
	),
	(
		547,
		'Que bebida alcoólica é feita principalmente de bagas de zimbro?',
		15,
		44
	),
	(
		548,
		'Que caractere já foi considerado a 27ª letra do alfabeto?',
		15,
		44
	),
	(
		549,
		'Que nome representa a letra "M" no alfabeto fonético da OTAN?',
		15,
		45
	),
	(
		550,
		'Que país viu um recorde mundial de 315 milhões de eleitores comparecerem às eleições em 20 de maio de 1991?',
		15,
		45
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		551,
		'Que rio atravessa a cidade escocesa de Glasgow?',
		15,
		45
	),
	(552, 'Quem inventou o pastafarianismo?', 15, 45),
	(
		553,
		'Quem é o fundador do "The Lego Group"?',
		15,
		45
	),
	(
		554,
		'Um médico com doutorado é médico de quê?',
		15,
		45
	),
	(
		555,
		'Uma estátua de Charles Darwin fica em que museu de Londres?',
		15,
		45
	),
	(
		556,
		'Uísque escocês e Drambuie compõem qual coquetel?',
		15,
		45
	),
	(
		557,
		'A subclasse da Akatsuki em "Log Horizon" é o quê?',
		20,
		46
	),
	(
		558,
		'De qual mangá surgiu a "Garota 404" do 4chan?',
		20,
		46
	),
	(
		559,
		'Em "Highschool of the Dead", onde Komuro e Saeko marcaram para se encontrar após a explosão do ônibus?',
		20,
		46
	),
	(
		560,
		'Em "Hunter x Hunter", quais são os membros da família de Killua conhecidos por serem?',
		20,
		46
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		561,
		'Em "Hunter x Hunter", qual das opções a seguir NÃO é um tipo de aura Nen?',
		20,
		46
	),
	(
		691,
		'A música ''Little April Shower'' aparece em qual desenho animado da Disney?',
		10,
		55
	),
	(
		562,
		'Em "Jewelpet Sunshine", qual é a música que toca quando Kanon e seus amigos fogem da prisão?',
		20,
		46
	),
	(
		563,
		'Em "One Piece", o que "o Rei dos Piratas" significa para o capitão dos Piratas do Chapéu de Palha?',
		20,
		46
	),
	(
		564,
		'Em "One Piece", quem confirma a existência do lendário tesouro One Piece?',
		20,
		46
	),
	(
		565,
		'Em "One Piece", quem é a garota que superou seu passado escravizado e se tornou agente de um exército para combater o governo corrupto?',
		20,
		46
	),
	(
		566,
		'Em qual dos seguintes países "JoJo''s Bizarre Adventure: Stardust Crusaders" não ocorre?',
		20,
		46
	),
	(
		567,
		'Em que ano "JoJo''s Bizarre Adventure: Phantom Blood" foi lançado pela primeira vez?',
		20,
		46
	),
	(
		568,
		'Em que ano começou a serialização do mangá "Ping Pong"?',
		20,
		46
	),
	(
		569,
		'mangá "To Love-Ru" foi iniciado em que ano?',
		20,
		46
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		570,
		'Medaka Kurokami de "Medaka Box" tem que anormalidade?',
		20,
		46
	),
	(
		571,
		'Na franquia "Dragon Ball", qual é o nome do irmão de Goku?',
		20,
		46
	),
	(
		572,
		'No anime Full Metal Panic!, quem é o melhor amigo de Kaname?',
		20,
		47
	),
	(
		573,
		'No anime Initial D, como Takumi Fujiwara descreve um drift?',
		20,
		47
	),
	(
		574,
		'Quais desses animes têm mais de 7.500 episódios?',
		20,
		47
	),
	(
		575,
		'Qual desses personagens é de "Legendz: Tale of the Dragon Kings"?',
		20,
		47
	),
	(
		576,
		'Qual estúdio animou o Afro Samurai?',
		20,
		47
	),
	(
		577,
		'Qual estúdio de animação animou "Hidamari Sketch"?',
		20,
		47
	),
	(
		578,
		'Qual estúdio de animação animou "Psycho Pass"?',
		20,
		47
	),
	(
		579,
		'Qual estúdio de animação animou "To Love-Ru"?',
		20,
		47
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		580,
		'Qual estúdio de animação produziu "Log Horizon"?',
		20,
		47
	),
	(
		581,
		'Qual estúdio de animação produziu a adaptação para anime de "xxxHolic"?',
		20,
		47
	),
	(
		582,
		'Qual música era o indicativo da estação de rádio KWFM de Stefan Verdemann em "Monster" de Urasawa Naoki?',
		20,
		47
	),
	(
		583,
		'Qual pessoa de "JoJo''s Bizarre Adventure" NÃO contém uma referência a uma banda, artista ou música anterior a 1980?',
		20,
		47
	),
	(
		584,
		'Qual é a última linha murmurada no filme de anime "The End of Evangelion"?',
		20,
		47
	),
	(
		585,
		'Quem foi o autor do mangá Uzumaki?',
		20,
		47
	),
	(
		586,
		'Quem foi o diretor do filme de anime de 1988 "Túmulo dos Vaga-lumes"?',
		20,
		47
	),
	(
		587,
		'Winch desses nomes não é um personagem de JoJo''s Bizarre Adventure?',
		20,
		47
	),
	(
		588,
		'Em "A Certain Scientific Railgun", quantas "irmãs" o Accelerator teve que matar para atingir o suposto nível 6?',
		10,
		48
	),
	(
		589,
		'Em "Fairy Tail", qual é o apelido de Natsu Dragneel?',
		10,
		48
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		590,
		'Em "Future Diary", qual é o nome do Phone Diary de Yuno Gasai?',
		10,
		48
	),
	(
		591,
		'Em "Inuyasha", o que os heróis procuram coletar?',
		10,
		48
	),
	(
		592,
		'Em 2013, a estrela pop virtual Hatsune Miku tinha patrocínio de qual rede de pizzarias?',
		10,
		48
	),
	(
		593,
		'Em Digimon, qual é o nome japonês para o estágio evolutivo final?',
		10,
		48
	),
	(
		594,
		'Em Dragon Maid da Sra. Kobayashi, quem é a empregada de Kobayashi?',
		10,
		48
	),
	(
		595,
		'Em que ano "Attack on Titan" foi ao ar pela primeira vez?',
		10,
		48
	),
	(
		596,
		'Na série "A melancolia de Haruhi Suzumiya", a líder do clube da Brigada SOS é tratada como uma (n) __ por seus colegas, sem saber.',
		10,
		48
	),
	(
		597,
		'No anime "My Hero Academia", qual personagem é mostrado com a habilidade de manipular a gravidade?',
		10,
		48
	),
	(
		598,
		'No anime Noragami quem é um dos principais protagonistas?',
		10,
		48
	),
	(
		599,
		'No anime Seven Deadly Sins qual é o nome de um dos pecados?',
		10,
		48
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		600,
		'No filme de animação de 2012 "Wolf Children", quais são os nomes das crianças lobo?',
		10,
		48
	),
	(
		601,
		'No nono filme de Pokémon, quem é o Príncipe do Mar?',
		10,
		48
	),
	(
		602,
		'O nome do impostor de Junko Enoshima no início de Danganronpa: Trigger Happy Havoc é?',
		10,
		48
	),
	(
		603,
		'O que fez com que o mascote titular de Yo-Kai Watch, Jibanyan, se tornasse um yokai?',
		10,
		49
	),
	(
		604,
		'Os dois personagens principais de "No Game No Life", Sora e Shiro, juntos atendem por qual nome?',
		10,
		49
	),
	(
		605,
		'Qual anime apresenta fortemente músicas do gênero "Eurobeat"?',
		10,
		49
	),
	(
		606,
		'Qual foi o segundo Pokémon de Ash Ketchum?',
		10,
		49
	),
	(
		607,
		'Qual é a idade de Ash Ketchum em Pokémon quando ele inicia sua jornada?',
		10,
		49
	),
	(
		608,
		'Qual é a música tema de "Neon Genesis Evangelion"?',
		10,
		49
	),
	(
		609,
		'Qual é o nome do corgi em Cowboy Bebop?',
		10,
		49
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		610,
		'Qual é o nome do stand de Funny Valentine em Jojo''s Bizarre Adventure Part 7, Steel Ball Run?',
		10,
		49
	),
	(
		611,
		'Qual é o sobrenome de Edward e Alphonse na série Fullmetal Alchemist.',
		10,
		49
	),
	(
		612,
		'Quantos "JoJos" que são protagonistas existem na série "Jojo''s Bizarre Adventure"?',
		10,
		49
	),
	(
		613,
		'Quem recebeu o título "Full Metal" na série de anime "Full Metal Alchemist"?',
		10,
		49
	),
	(
		614,
		'Quem é a heroína principal do anime, Full Metal Panic!',
		10,
		49
	),
	(
		615,
		'Quem é a verdadeira princesa da lua em Sailor Moon?',
		10,
		49
	),
	(
		616,
		'Quem é o autor da série de mangá "Astro Boy"?',
		10,
		49
	),
	(
		617,
		'Quem é o personagem principal de cabelo amarelo no anime Naruto?',
		10,
		49
	),
	(
		618,
		'Quem é o titã colossal em "Attack On Titan"?',
		10,
		49
	),
	(
		619,
		'"Silhouette", uma música interpretada pelo grupo ''KANA-BOON'' é apresentada como a décima sexta abertura de qual anime?',
		15,
		50
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		620,
		'A heroína de "Humanity Has Declined" é uma mediadora entre humanos e o quê?',
		15,
		50
	),
	(
		621,
		'Aoi Miyamori é o gerente de produção de qual anime em "Shirobako"?',
		15,
		50
	),
	(
		622,
		'Como o personagem Dragowizard, de Qinus Axia do anime "Buddyfight" difere entre as dublagens japonesa e inglesa?',
		15,
		50
	),
	(
		623,
		'De que cor de cabelo o personagem principal do Yu-Gi-Oh! série de anime original tem?',
		15,
		50
	),
	(
		624,
		'Em "Black Lagoon", de que cor é a gravata de Rock?',
		15,
		50
	),
	(
		625,
		'Em "Highschool DxD", Koneko Toujou é de qual raça?',
		15,
		50
	),
	(
		626,
		'Em "Highschool DxD", qual é o nome do item com o qual alguns humanos nascem?',
		15,
		50
	),
	(
		627,
		'Em "JoJo''s Bizarre Adventure", qual dos seguintes Stands NÃO tem uma habilidade baseada no tempo?',
		15,
		50
	),
	(
		628,
		'Em "JoJo''s Bizzare Adventure: Stardust Crusaders", qual é o sobrenome do protagonista Jotaro?',
		15,
		50
	),
	(
		629,
		'Em "Little Witch Academia", qual é o pseudônimo de Shiny Chariot na Luna Nova Academy?',
		15,
		50
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		630,
		'Em "Love Live: School Idol Project", qual pseudônimo Kotori Minami usa em seu trabalho como empregada doméstica?',
		15,
		50
	),
	(
		631,
		'Em "Puella Magi Madoka Magica", qual é o primeiro nome do irmão mais novo de Madoka?',
		15,
		50
	),
	(
		632,
		'Em "Shakugan no Shana", como o Shana era geralmente referido?',
		15,
		50
	),
	(
		633,
		'Em "To Love-Ru", quem é o primeiro a ouvir dela o passado de Yami?',
		15,
		50
	),
	(
		634,
		'Em "Toriko", qual dos seguintes alimentos é compatível com Toriko?',
		15,
		51
	),
	(
		635,
		'Em "Toriko", qual dos seguintes Reis Celestiais tem um senso de audição aprimorado?',
		15,
		51
	),
	(
		636,
		'Em "Um Certo Índice Mágico", o que o Acelerador é capaz de controlar?',
		15,
		51
	),
	(
		637,
		'Em Dragon Ball Z, quem foi o primeiro personagem a se transformar em Super Saiyajin 2?',
		15,
		51
	),
	(
		638,
		'Em JoJo''s Bizarre Adventure, personagem do guincho consegue acelerar o tempo?',
		15,
		51
	),
	(
		639,
		'Em JoJo''s Bizarre Adventure, quem diz "Yare yare daze"?',
		15,
		51
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		640,
		'Em Pokémon Chronicles, por que Misty tinha medo de Gyarados?',
		15,
		51
	),
	(
		641,
		'Em que ano "Bishoujo Senshi Sailor Moon" foi ao ar no Japão?',
		15,
		51
	),
	(
		642,
		'Em que ano a segunda temporada de "Attack on Titan" começou a ser exibida?',
		15,
		51
	),
	(
		643,
		'Em que ano acontece a Parte 7 de "JoJo''s Bizarre Adventure"?',
		15,
		51
	),
	(
		644,
		'Krusty é o mestre de qual guilda em "Log Horizon"?',
		15,
		51
	),
	(
		645,
		'Na série "Sailor Moon", qual é o nome civil de Sailor Júpiter?',
		15,
		51
	),
	(
		646,
		'Na série "To Love-Ru", quantas Trans-armas foram criadas?',
		15,
		51
	),
	(
		647,
		'Na série de anime de TV de 2011, "THE iDOLM@STER", qual era o nome do coelho de pelúcia de Iori?',
		15,
		51
	),
	(
		648,
		'Na série de mangá "Re:Zero", qual dos seguintes Arcebispos do Pecado come a existência de Rem?',
		15,
		51
	),
	(
		649,
		'Na série JoJo''s Bizarre Adventure, qual personagem principal faz o maior número de aparições recorrentes?',
		15,
		51
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		650,
		'No anime "Mr. Osomatsu", quantos irmãos Osomatsu-san tem?',
		15,
		52
	),
	(
		651,
		'No anime "Toaru Majutsu no Index", Touma Kamijou é um esper nível 0 que tem a habilidade de fazer o quê?',
		15,
		52
	),
	(
		652,
		'No anime Assassination Classroom qual é a aula que o Korosensei ensina?',
		15,
		52
	),
	(
		653,
		'No anime, "Super Sonico", qual é a comida favorita do Super Sonico?',
		15,
		52
	),
	(
		654,
		'O mangá JoJo''s Bizarre Adventure é dividido em quantas partes?',
		15,
		52
	),
	(
		655,
		'O personagem Plum de "No Game No Life" é de que raça?',
		15,
		52
	),
	(
		656,
		'O principal protagonista da quinta parte de JoJo''s Bizarre Adventure é qual dos seguintes?',
		15,
		52
	),
	(
		657,
		'Qual desses títulos de mangá não foi criado por Urasawa Naoki?',
		15,
		52
	),
	(
		658,
		'Qual destes não é um mundo no anime "Buddyfight"?',
		15,
		52
	),
	(
		659,
		'Qual dos seguintes animes do gênero mecha começou a ser exibido em 1982?',
		15,
		52
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		660,
		'Qual dos seguintes mangás tem mais volumes tankouban?',
		15,
		52
	),
	(661, 'Qual estúdio animou Soul Eater?', 15, 52),
	(662, 'Qual estúdio fez Cowboy Bebop?', 15, 52),
	(
		663,
		'Qual foi a primeira série animada original de formato longo do estúdio Trigger para a televisão?',
		15,
		52
	),
	(
		664,
		'Qual grupo musical japonês foi formado para produzir a música tema do anime "Guilty Crown"?',
		15,
		52
	),
	(
		665,
		'Qual música toca nos créditos finais do anime "Ergo Proxy"?',
		15,
		52
	),
	(
		666,
		'Qual nome de banda não é um Stand em "JoJo''s Bizzare Adventure"?',
		15,
		53
	),
	(
		667,
		'Qual personagem de JoJo''s Bizarre Adventure possui o Stand chamado Silver Chariot?',
		15,
		53
	),
	(
		668,
		'Qual é o nome do dispositivo que permite energia infinita no anime "Dimensão W"?',
		15,
		53
	),
	(
		669,
		'Qual é o nome do protagonista do anime de 2017 "Land of the Lustrous"?',
		15,
		53
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		670,
		'Quando foi lançado o primeiro episódio de Soul Eater?',
		15,
		53
	),
	(
		671,
		'Que esporte está sendo praticado no Anime Eyeshield 21?',
		15,
		53
	),
	(
		672,
		'Que estúdio animou Fullmetal Alchemist?',
		15,
		53
	),
	(
		673,
		'Quem dubla o personagem "Reigen" na dublagem inglesa de "Mob Psycho 100"?',
		15,
		53
	),
	(
		674,
		'Quem escreveu e dirigiu o filme de animação "Spirited Away" (2001)?',
		15,
		53
	),
	(
		675,
		'Quem é o criador da série de mangá "One Piece"?',
		15,
		53
	),
	(
		676,
		'Quem é o personagem principal de One Piece?',
		15,
		53
	),
	(
		677,
		'De que cidade foi originalmente nomeada "Springfield" de "Os Simpsons"?',
		20,
		54
	),
	(
		678,
		'Em "Gravity Falls", o personagem Bill Cipher comenta que "o universo é o quê?"',
		20,
		54
	),
	(
		679,
		'Em "Gravity Falls", o que Quentin Trembley faz quando é expulso da Casa Branca?',
		20,
		54
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		680,
		'Em "Gravity Falls", quanto Waddles pesa quando Mable o vence em "The Time Traveller''s Pig"?',
		20,
		54
	),
	(
		681,
		'Em "Rick and Morty", de qual dimensão Rick e Morty se originam?',
		20,
		54
	),
	(
		682,
		'No desenho animado de 1968 "Wacky Races", qual era o nome da dupla de homens das cavernas que montou no The Boulder Mobile?',
		20,
		54
	),
	(
		683,
		'No programa de TV "Rick and Morty", Rick usa a frase de efeito "Wubba Lubba Dub Dub", que significa o que em Birdperson?',
		20,
		54
	),
	(
		684,
		'No web-comic Homestuck, qual é o nome do jogo que as 4 crianças jogam?',
		20,
		54
	),
	(
		685,
		'Qual era o nome do cachorro de estimação de Jonny em The Adventures of Jonny Quest?',
		20,
		54
	),
	(
		686,
		'Qual foi a primeira palavra canônica de Maggie Simpson, sem incluir os shorts Tracey Ullman?',
		20,
		54
	),
	(
		687,
		'Quem dublou o personagem Soluço no filme "Como Treinar o Seu Dragão"?',
		20,
		54
	),
	(
		688,
		'Quem interpretou o cachorro de Stan no episódio de South Park "Big Gay Al''s Big Gay Boat Ride"?',
		20,
		54
	),
	(
		689,
		'Townsend Coleman forneceu a voz para qual tartaruga na série original de 1987 de "Teenage Mutant Ninja Turtles"?',
		20,
		54
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		690,
		' Quem é o único dublador a ter um papel falante em todos os longas-metragens da Disney Pixar?',
		10,
		55
	),
	(
		692,
		'Em "Avatar: The Last Airbender", qual elemento Aang começa a aprender depois de ser descongelado?',
		10,
		55
	),
	(
		693,
		'Em Os Simpsons, em qual guerra Seymour Skinner serviu no Exército dos EUA como Boina Verde?',
		10,
		55
	),
	(
		694,
		'No filme da Pixar, "Toy Story", qual era o nome da criança que possuía os brinquedos?',
		10,
		55
	),
	(
		695,
		'No programa "Foster''s Home For Imaginary Friends", qual personagem tinha uma obsessão por basquete?',
		10,
		55
	),
	(
		696,
		'O que se perde em havaiano e também é o nome de uma garotinha em um filme de 2002 que apresenta um alienígena chamado "Stitch"?',
		10,
		55
	),
	(
		697,
		'Qual desses personagens de "Bob Esponja Calça Quadrada" não é uma lula?',
		10,
		55
	),
	(
		698,
		'Qual desses personagens vive em um abacaxi no fundo do mar no desenho animado "Bob Esponja Calça Quadrada".',
		10,
		55
	),
	(
		699,
		'Qual destas NÃO é uma frase de efeito usada por Rick Sanchez no programa de TV "Rick and Morty"?',
		10,
		55
	),
	(
		700,
		'Qual dos seguintes não apareceu no desenho animado ''Wacky Races''?',
		10,
		55
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		701,
		'Qual dos seguintes não é um personagem dos Flintstones?',
		10,
		55
	),
	(
		702,
		'Qual era o nome da bruxa do mar no filme da Disney de 1989 "A Pequena Sereia"?',
		10,
		55
	),
	(
		703,
		'Qual foi o primeiro filme da Disney a usar CGI?',
		10,
		55
	),
	(
		704,
		'Qual personagem de ''Family Guy'' teve seu próprio spin-off em 2009?',
		10,
		55
	),
	(
		705,
		'Qual Teenage Mutant Ninja Turtle tradicionalmente usa uma bandana laranja?',
		10,
		56
	),
	(
		706,
		'Quando foi ao ar o último episódio de "Futurama"?',
		10,
		56
	),
	(
		707,
		'Quem criou a série do Cartoon Network "Adventure Time"?',
		10,
		56
	),
	(
		708,
		'Quem dubla Ruby na série animada RWBY?',
		10,
		56
	),
	(
		709,
		'Quem era o vilão de ''''O Rei Leão''''?',
		10,
		56
	),
	(
		710,
		'Wendy O. Koopa apareceu no Super Mario DIC Cartoons, mas como ela era conhecida?',
		10,
		56
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		711,
		'A Nickelodeon pertence a qual empresa-mãe?',
		15,
		57
	),
	(
		712,
		'Como é conhecido o personagem de desenho animado Andy Capp na Alemanha?',
		15,
		57
	),
	(
		713,
		'Em "Bob Esponja Calça Quadrada", qual é o nome da residência de Sandy Cheek?',
		15,
		57
	),
	(
		714,
		'Em "O Incrível Mundo de Gumball", quem é o diretor da Elmore Junior High?',
		15,
		57
	),
	(
		715,
		'Em "Os Simpsons", onde Homer e Marge se conheceram?',
		15,
		57
	),
	(
		716,
		'Em que ano foi lançado o filme da Disney "A Goofy Movie"?',
		15,
		57
	),
	(
		717,
		'Na série animada RWBY, qual é o nome da arma usada por Weiss Schnee?',
		15,
		57
	),
	(
		718,
		'No seriado "Fat Albert and the Cosby Kids", qual é o nome da gangue fictícia dos personagens?',
		15,
		57
	),
	(
		719,
		'Qual cantor forneceu a voz do Mother Brain de Metroid na série animada "Captain N: The Game Master"?',
		15,
		57
	),
	(
		720,
		'Qual cidade Anger repreendeu por estragar a pizza em "Inside Out"?',
		15,
		57
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		721,
		'Qual desses personagens de desenhos animados NÃO é dublado por Rob Paulsen?',
		15,
		57
	),
	(
		722,
		'Qual destes não é um personagem real da série de desenhos animados My Little Pony: Friendship is Magic?',
		15,
		57
	),
	(
		723,
		'Qual episódio de O Incrível Mundo de Gumball ganhou o Children''s Choice Award no British Animation Awards em 2016?',
		15,
		57
	),
	(
		724,
		'Qual era o número na camisa de Gerald em "Hey Arnold!"?',
		15,
		57
	),
	(
		725,
		'Qual personagem da Sanrio foi introduzido em 1996?',
		15,
		57
	),
	(
		726,
		'Qual personagem de "Toy Story" foi dublado por Don Rickles?',
		15,
		58
	),
	(
		727,
		'Qual personagem de desenho animado da Hanna-Barbera viajou com um companheiro canino chamado Beegle Beagle?',
		15,
		58
	),
	(
		728,
		'Qual é a taxa de quadros padrão para animação?',
		15,
		58
	),
	(
		729,
		'Qual é o nome do cachorro de Sid em "Toy Story"?',
		15,
		58
	),
	(
		730,
		'Qual é o nome do jacaré que os Simpsons "mataram" no episódio "Kill The Alligator and Run"?',
		15,
		58
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		731,
		'Qual é o verdadeiro nome de Scooby-Doo?',
		15,
		58
	),
	(
		732,
		'Que habilidade a princesa Sofia Primeira tem em seu amuleto que permite que ela respire debaixo d''água?',
		15,
		58
	),
	(
		733,
		'Que personagem animado da internet é conhecido por responder e-mails com suas luvas de boxe?',
		15,
		58
	),
	(734, 'Quem criou "RWBY"?', 15, 58),
	(
		735,
		'Quem dublou Finn em Hora de Aventura?',
		15,
		58
	),
	(
		736,
		'Quem é a personagem "loira burra" em "The Loud House" da Nickelodeon?',
		15,
		58
	),
	(
		737,
		'Antes de "Jurassic Park III" ser finalizado e o Spinosaurus ser escolhido, qual dinossauro seria a estrela?',
		20,
		59
	),
	(
		738,
		'De acordo com a tradição de "Guerra nas Estrelas", de que planeta Obi-Wan Kenobi vem?',
		20,
		59
	),
	(
		739,
		'Em "Star Trek Nemesis", por que o Praetor Shinzon foi criado?',
		20,
		59
	),
	(
		740,
		'Em 2012, qual filme ganhou todas as categorias no 32º "Prêmio Framboesa de Ouro"?',
		20,
		59
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		741,
		'Em Big Hero 6, quais foram os movimentos do Baymax modelados?',
		20,
		59
	),
	(
		742,
		'Em que ano Clint Eastwood estrelou como o inspetor Harry Callahan no filme "Dirty Harry"?',
		20,
		59
	),
	(
		743,
		'Em que ano o Jurassic World estreia no universo "Jurassic Park"?',
		20,
		59
	),
	(
		744,
		'Em que filme da Disney você consegue identificar o personagem "Pac-Man" se olhar bem de perto em algumas cenas?',
		20,
		59
	),
	(
		745,
		'No filme "Scream" quem é o Ghost Face?',
		20,
		59
	),
	(
		746,
		'No filme "Zulu" de 1964, que música a companhia do exército britânico canta antes da batalha final?',
		20,
		59
	),
	(
		747,
		'No filme ''Taxi Driver'' de 1976, quantas armas Travis comprou do vendedor?',
		20,
		59
	),
	(
		748,
		'No filme de Natal de 1974 "O Ano Sem Papai Noel", quais são os nomes dos dois elfos que ajudam a Mamãe Noel a salvar o Natal?',
		20,
		59
	),
	(
		749,
		'No universo "Jurassic Park", qual foi o primeiro dinossauro clonado pela InGen em 1986?',
		20,
		59
	),
	(
		750,
		'No universo "Jurassic Park", quando "Jurassic Park: San Diego" começou a ser construído?',
		20,
		59
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		751,
		'O que a primeira imagem em movimento representava?',
		20,
		59
	),
	(
		752,
		'Quais são os três filmes, em ordem a partir da data de lançamento, que compõem a "Trilogia dos Dólares"?',
		20,
		60
	),
	(
		753,
		'Qual atriz interpretou a Dra. Grace Augustine no filme de James Cameron "Avatar"?',
		20,
		60
	),
	(
		754,
		'Qual boxeador ficou famoso por golpear o gongo na introdução dos filmes de J. Arthur Rank?',
		20,
		60
	),
	(
		755,
		'Qual cantor é interpretado por Bruce Campbell no filme de 2002 ''Bubba Ho-Tep''?',
		20,
		60
	),
	(
		756,
		'Qual dos seguintes filmes foi dirigido por Ivan Reitman, escrito por Gary Ross, estrelado por Kevin Kline e lançado em 1993?',
		20,
		60
	),
	(
		757,
		'Qual era o nome do ator que interpretou Leatherface no filme de terror de 1974, The Texas Chainsaw Massacre?',
		20,
		60
	),
	(
		758,
		'Qual era o nome do meio de Humphrey Bogart?',
		20,
		60
	),
	(
		759,
		'Qual era o nome do planeta em "Aliens"?',
		20,
		60
	),
	(
		760,
		'Qual filme de 1994 Roger Ebert desprezou, dizendo "Eu odiava, odiava, odiava, odiava este filme".',
		20,
		60
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		761,
		'Qual foi o primeiro filme a usar um Wilhelm Scream?',
		20,
		60
	),
	(
		762,
		'Qual foi o último filme dos Irmãos Marx a apresentar Zeppo?',
		20,
		60
	),
	(
		763,
		'Qual é a espécie do "Predator" no filme "Predator" de 1987?',
		20,
		60
	),
	(
		764,
		'Qual é o nome do assassino no primeiro filme "Hellboy"?',
		20,
		60
	),
	(
		765,
		' Qual dos seguintes não é o nome de uma "Bond Girl"?',
		10,
		61
	),
	(
		766,
		'"A primeira regra é: não fale sobre isso" é uma referência a qual filme?',
		10,
		61
	),
	(
		767,
		'A música do Queen "A Kind Of Magic" é apresentada em qual filme de 1986?',
		10,
		61
	),
	(
		768,
		'Daniel Radcliffe se tornou uma estrela mundial na indústria cinematográfica devido a sua atuação em qual franquia de filmes?',
		10,
		61
	),
	(
		769,
		'Em "ALF", qual era o nome verdadeiro de ALF?',
		10,
		61
	),
	(
		770,
		'Em Big Hero 6, de que cidade fictícia é o Big Hero 6?',
		10,
		61
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		771,
		'Em qual filme Humphrey Bogart diz a famosa frase: "Aqui está olhando para você, garoto"?',
		10,
		61
	),
	(
		772,
		'Este filme contém a citação: "Houston, temos um problema".',
		10,
		61
	),
	(
		773,
		'Este filme contém a citação: "Ninguém coloca o bebê em um canto."',
		10,
		61
	),
	(
		774,
		'Este filme contém a citação: "Sinto a necessidade ... a necessidade de velocidade!"',
		10,
		61
	),
	(
		775,
		'No filme "Balto", de 1995, quem são os cúmplices de Steele?',
		10,
		61
	),
	(
		776,
		'No filme "Blade Runner", qual é o termo usado para andróides semelhantes a humanos?',
		10,
		61
	),
	(
		777,
		'No filme "Náufrago", o melhor amigo do protagonista enquanto está na ilha é chamado',
		10,
		61
	),
	(
		778,
		'No filme "Spaceballs", o que as Spaceballs estão tentando roubar do Planeta Druidia?',
		10,
		61
	),
	(
		779,
		'No filme de 2012, "The Lorax", quem é o antagonista?',
		10,
		61
	),
	(
		780,
		'No filme Gremlins, depois de que horas do dia você não deve alimentar Mogwai?',
		10,
		62
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		781,
		'No final do filme "Rat Race" de 2001, em qual show os competidores batem?',
		10,
		62
	),
	(
		782,
		'O filme de 2002 "28 Days Later" se passa principalmente em qual país europeu?',
		10,
		62
	),
	(
		783,
		'O filme de animação da Disney de 2016 ''Moana'' é baseado em qual cultura?',
		10,
		62
	),
	(
		784,
		'Para o filme "Caçadores da Arca Perdida", com o que Harrison Ford estava doente durante as filmagens da perseguição no Cairo?',
		10,
		62
	),
	(
		785,
		'Qual atriz dançou o twist com John Travolta em ''Pulp Fiction''?',
		10,
		62
	),
	(
		786,
		'Qual desses atores/atrizes NÃO faz parte do elenco do filme de 2016 "Esquadrão Suicida"?',
		10,
		62
	),
	(
		787,
		'Qual desses filmes Jeff Bridges não estrelou?',
		10,
		62
	),
	(
		788,
		'Qual desses filmes NÃO se passa em Los Angeles?',
		10,
		62
	),
	(
		789,
		'Qual destes filmes NÃO foi lançado em 1996?',
		10,
		62
	),
	(
		790,
		'Qual dos seguintes atores só esteve em um filme dirigido por Quentin Tarantino uma vez?',
		10,
		62
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		791,
		'Qual era o sobrenome de Dorothy em ''O Mágico de Oz''?',
		10,
		62
	),
	(
		792,
		'Qual filme de animação foi o primeiro a apresentar uma celebridade como dublador?',
		10,
		62
	),
	(
		793,
		'Qual filme lançado em 2016 apresenta Superman e Batman lutando?',
		10,
		62
	),
	(
		794,
		'Qual foi a frase icônica de Bruce Campbell depois de receber uma mão de motosserra em Evil Dead 2?',
		10,
		62
	),
	(
		795,
		'Qual foi o primeiro filme de James Bond?',
		10,
		62
	),
	(
		796,
		'Qual foi o primeiro longa-metragem animado por computador?',
		10,
		63
	),
	(
		797,
		'Qual foi o primeiro monstro a aparecer ao lado de Godzilla?',
		10,
		63
	),
	(
		798,
		'Qual período histórico foi o centro do filme Assassin''s Creed (2016)?',
		10,
		63
	),
	(
		799,
		'Qual é o filme mais antigo da Disney?',
		10,
		63
	),
	(
		800,
		'Qual é o nome da banda fictícia de mod retro estrelada por Austin Powers como vocalista principal?',
		10,
		63
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		801,
		'Qual é o nome da ilha em que "Jurassic Park" foi construído?',
		10,
		63
	),
	(
		802,
		'Qual é o nome do bot laranja e branco em "Star Wars: The Force Awakens"?',
		10,
		63
	),
	(
		803,
		'Quando "Rogue One: Uma História Star Wars" ocorre cronologicamente na série?',
		10,
		63
	),
	(
		804,
		'Quando foi lançado o filme ''Con Air''?',
		10,
		63
	),
	(
		805,
		'Que nome Tom Hanks deu ao seu companheiro de vôlei no filme ''Náufrago''?',
		10,
		63
	),
	(
		806,
		'Que raça de cachorro era Marley no filme "Marley & Me" (2008)?',
		10,
		63
	),
	(
		807,
		'Quem dirigiu "ET, o Extraterrestre" (1982)?',
		10,
		63
	),
	(
		808,
		'Quem dirigiu o filme de 2015 "The Revenant"?',
		10,
		63
	),
	(
		809,
		'Quem dirigiu os filmes "Pulp Fiction", "Reservoir Dogs" e "Django Unchained"?',
		10,
		63
	),
	(
		810,
		'Quem em Pulp Fiction diz "Não, eles têm o sistema métrico lá, eles não saberiam o que diabos é um Quarter Pounder."',
		10,
		63
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		811,
		'Quem escreveu e dirigiu o filme de 1986 ''Platoon''?',
		10,
		63
	),
	(
		812,
		'Quem estrelou como Bruce Wayne e Batman no filme de Tim Burton de 1989 "Batman"?',
		10,
		64
	),
	(
		813,
		'Quem estrelou o filme de 1973 "Enter The Dragon"?',
		10,
		64
	),
	(
		814,
		'Quem interpreta Alice nos filmes de Resident Evil?',
		10,
		64
	),
	(
		815,
		'Quem interpreta Jack Burton no filme "Big Trouble in Little China?"',
		10,
		64
	),
	(
		816,
		'Quem interpreta o personagem de Po nos filmes Kung Fu Panda?',
		10,
		64
	),
	(
		817,
		'Quem interpretou o vice-marechal Samuel Gerard no filme de 1993 "O Fugitivo"?',
		10,
		64
	),
	(
		818,
		'Quem é o protagonista principal do filme de 1985, De Volta para o Futuro?',
		10,
		64
	),
	(
		819,
		' Qual das alternativas a seguir NÃO é uma citação do filme Casablanca de 1942?',
		15,
		65
	),
	(
		820,
		'A famosa revelação de Darth Vader para Luke é icônica. Mas qual desses é o certo?',
		15,
		65
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		821,
		'Depois da Índia, que país produz o segundo maior número de filmes por ano?',
		15,
		65
	),
	(
		822,
		'Do que foram feitos os Chilled Monkey Brains durante Indiana Jones e o Templo da Perdição?',
		15,
		65
	),
	(
		823,
		'Ed Koch, prefeito de Nova York em 1984, interpretou a si mesmo em qual filme dos Muppets?',
		15,
		65
	),
	(
		824,
		'Em "Jurassic World", qual empresa compra a InGen e cria o Jurassic World?',
		15,
		65
	),
	(
		825,
		'Em Back to the Future Part II, Marty e Dr. Emmett Brown vão para qual data futura?',
		15,
		65
	),
	(
		826,
		'Em Mulan (1998), quem é o líder dos hunos?',
		15,
		65
	),
	(
		827,
		'Em O Senhor dos Anéis: A Sociedade do Anel, qual dos seguintes personagens do livro foi deixado de fora do filme?',
		15,
		65
	),
	(
		828,
		'Em Procurando Nemo, qual era o nome da mãe de Nemo?',
		15,
		65
	),
	(
		829,
		'Em qual filme de 1955 Frank Sinatra interpreta Nathan Detroit?',
		15,
		65
	),
	(
		830,
		'Em qual filme de 1973 Yul Brynner interpreta um cowboy robótico que apresenta problemas de funcionamento e começa uma matança?',
		15,
		65
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		831,
		'Em que ano foi lançado o filme "Academia de Polícia"?',
		15,
		65
	),
	(
		832,
		'Em que ano foi lançado o primeiro filme dos Transformers?',
		15,
		65
	),
	(
		833,
		'Em que ano o filme de James Cameron "Titanic" estreou nos cinemas?',
		15,
		65
	),
	(
		834,
		'Em Star Wars, qual é o nome do novo governo criado após a derrota do Império Galáctico?',
		15,
		66
	),
	(
		835,
		'Este filme contém a citação: "Adoro o cheiro de napalm pela manhã!"',
		15,
		66
	),
	(
		836,
		'Este filme contém a citação: "O que temos aqui é uma falha na comunicação".',
		15,
		66
	),
	(
		837,
		'Este tropo refere-se a personagens secundários que são mortos para mostrar como um monstro funciona.',
		15,
		66
	),
	(
		838,
		'Leonardo Di Caprio ganhou seu primeiro Oscar de Melhor Ator por sua atuação em qual filme?',
		15,
		66
	),
	(
		839,
		'Mark Wahlberg interpretou o personagem titular de qual adaptação de videogame de 2008?',
		15,
		66
	),
	(
		840,
		'Na franquia Mad Max, que tipo de carro é o Pursuit Special dirigido por Max?',
		15,
		66
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		841,
		'Na reinicialização de Nightmare on Elm Street de 2010, quem interpretou Freddy Kruger?',
		15,
		66
	),
	(
		842,
		'Na série Sexta-Feira 13, qual é o primeiro nome da mãe de Jason?',
		15,
		66
	),
	(
		843,
		'No filme "Birdman" de 2014, qual é o principal instrumento da partitura?',
		15,
		66
	),
	(
		844,
		'No filme "Requiem for a Dream", em que droga o personagem de Jared Leto se vicia?',
		15,
		66
	),
	(
		845,
		'No filme britânico de 1979 "Quadrophenia", qual é o nome da cidade litorânea que os mods estão visitando?',
		15,
		66
	),
	(
		846,
		'No filme Clube da Luta de 1999, qual dessas não é uma regra do "clube da luta"?',
		15,
		66
	),
	(
		847,
		'No filme de 1971 "Willy Wonka e a Fábrica de Chocolate", quem interpretou Willy Wonka?',
		15,
		66
	),
	(
		848,
		'No filme de 1984 "O Exterminador do Futuro", qual é o número do modelo do Exterminador retratado por Arnold Schwarzenegger?',
		15,
		66
	),
	(
		849,
		'O assassino do filme ''My Bloody Valentine'' de 1981 usa que tipo de roupa?',
		15,
		66
	),
	(
		850,
		'O filme de 1939 "O Mágico de Oz" continha um cavalo que mudava de cor, que material eles usaram para conseguir esse efeito?',
		15,
		67
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		851,
		'O que significa TIE em referência ao TIE Fighter em "Guerra nas Estrelas"?',
		15,
		67
	),
	(
		852,
		'Qual artista musical teve um papel de destaque no filme de 2017 "Kingsman: The Golden Circle"?',
		15,
		67
	),
	(
		853,
		'Qual ator e artista marcial estrelou como Coronel Guile na adaptação cinematográfica de ação de 1994 de Street Fighter?',
		15,
		67
	),
	(
		854,
		'Qual ator estrela estava em "Top Gun", "Jerry Maguire" e "Born on the Fourth of July"?',
		15,
		67
	),
	(
		855,
		'Qual ator interpreta o personagem "Tommy Jarvis" em "Sexta-Feira 13: O Capítulo Final" (1984)?',
		15,
		67
	),
	(
		856,
		'Qual ator interpretou o personagem principal no filme de 1990 "Edward Mãos de Tesoura"?',
		15,
		67
	),
	(
		857,
		'Qual cantor famoso foi interpretado pelo ator Kevin Spacey no filme biográfico de 2004 "Beyond the Sea"?',
		15,
		67
	),
	(
		858,
		'Qual cidade é o cenário do filme da Disney The Love Bug (1968)?',
		15,
		67
	),
	(
		859,
		'Qual clássico cult da comédia dos anos 90 apresenta participações especiais de Meat Loaf, Alice Cooper e Chris Farley?',
		15,
		67
	),
	(
		860,
		'Qual comediante de stand-up dublou o papagaio falante "Iago" na adaptação de Aladdin da Disney em 1992?',
		15,
		67
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		861,
		'Qual desses filmes de ação é filmado inteiramente em uma tomada?',
		15,
		67
	),
	(
		862,
		'Qual desses filmes é filmado inteiramente em uma tomada?',
		15,
		67
	),
	(
		863,
		'Qual destes clássicos da Disney foi lançado em 1970?',
		15,
		67
	),
	(
		864,
		'Qual documentarista escreveu e estrelou o filme "Meu Filme de Scientology", que estreou em 2015?',
		15,
		67
	),
	(
		865,
		'Qual dos seguintes atores não desempenha um papel no filme "The Usual Suspects?"',
		15,
		67
	),
	(
		866,
		'Qual dos seguintes filmes NÃO foi dirigido por Quentin Tarantino?',
		15,
		68
	),
	(
		867,
		'Qual dos seguintes vilões de James Bond não é afiliado à organização SPECTRE?',
		15,
		68
	),
	(
		868,
		'Qual era o nome do protagonista do filme Commando (1985)?',
		15,
		68
	),
	(
		869,
		'Qual era o primeiro nome da personagem de Marilyn Monroe no filme "Some Like It Hot"?',
		15,
		68
	),
	(
		870,
		'Qual ex-ator de Star Trek dirigiu Três Homens e um Bebê (1987)?',
		15,
		68
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		871,
		'Qual filme de 1958 estrelou Kirk Douglas e Tony Curtis como meio-irmãos Einar e Eric?',
		15,
		68
	),
	(
		872,
		'Qual filme de animação Steven Lisberger dirigiu em 1980 antes de dirigir Tron?',
		15,
		68
	),
	(
		873,
		'Qual foi outro nome sugerido para o filme de 1985, Back to the Future?',
		15,
		68
	),
	(
		874,
		'Qual personagem dos filmes do Ursinho Pooh foi adicionado pela Disney e não aparece nos livros originais?',
		15,
		68
	),
	(
		875,
		'Qual personagem icônico é apresentado em filmes como "The Enforcer", "Sudden Impact" e "The Dead Pool"?',
		15,
		68
	),
	(
		876,
		'Qual quarterback aposentado do futebol americano jogou sozinho em ''Ace Ventura: Pet Detective'' e ''Little Nicky''?',
		15,
		68
	),
	(
		877,
		'Qual sequência de filme melhorou os resultados de bilheteria em comparação com o filme original?',
		15,
		68
	),
	(
		878,
		'Qual é a frase correta para o ditado latino "Romanes Eunt Domus" em Life of Brian de Monty Python?',
		15,
		68
	),
	(
		879,
		'Qual é o nome de nascimento de Michael Caine?',
		15,
		68
	),
	(
		880,
		'Qual é o nome de nascimento de Michael Keaton?',
		15,
		68
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		881,
		'Qual é o nome do artista foley que criou os famosos sons de Star Wars, incluindo o rugido de Chewbacca e os bipes e assobios de R2-D2?',
		15,
		68
	),
	(
		882,
		'Qual é o nome do personagem de James Dean no filme de 1955 "Rebelde Sem Causa"?',
		15,
		69
	),
	(
		883,
		'Qual é o nome do personagem que Nicolas Cage interpreta no filme "National Treasure"?',
		15,
		69
	),
	(
		884,
		'Qual é o nome do sistema de Inteligência Artificial no filme de 1983, "WarGames"?',
		15,
		69
	),
	(
		885,
		'Qual é o nome do vilão no filme de ficção científica russo-americano de 2015 "Hardcore Henry"?',
		15,
		69
	),
	(
		886,
		'Qual é o sobrenome de Lilo de Lilo e Stitch?',
		15,
		69
	),
	(
		887,
		'Quanto dinheiro custou para Tommy Wiseau fazer sua obra-prima "The Room" (2003)?',
		15,
		69
	),
	(
		888,
		'Quanto dinheiro o filme da Marvel de 2019 "Vingadores: Ultimato" arrecadou por seu fim de semana de estreia mundial recorde?',
		15,
		69
	),
	(
		889,
		'Que filme o Avatar de James Cameron destronou como o filme de maior bilheteria de todos os tempos?',
		15,
		69
	),
	(
		890,
		'Que música do Queen toca durante a cena de luta final do filme "Hardcore Henry"?',
		15,
		69
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		891,
		'Quem dublou o personagem Draco no filme de 1996 ''DragonHeart''?',
		15,
		69
	),
	(
		892,
		'Quem expressou Metalbeard em "The Lego Movie"?',
		15,
		69
	),
	(
		893,
		'Quem fez a pontuação para o Blade Runner original?',
		15,
		69
	),
	(
		894,
		'Quem foi o diretor de "Scott Pilgrim contra o mundo (2010)"?',
		15,
		69
	),
	(
		895,
		'Quem interpreta "Bruce Wayne" no filme de 2008 "O Cavaleiro das Trevas"?',
		15,
		69
	),
	(
		896,
		'Quem interpretou a música tema de abertura do filme de James Bond 007 "Goldfinger"?',
		15,
		69
	),
	(
		897,
		'Quem interpretou o Barão Victor Frankestein no filme de terror Hammer de 1957 "A Maldição de Frankenstein"?',
		15,
		69
	),
	(
		898,
		'Quem interpretou o Batman no filme de 1997 "Batman e Robin"?',
		15,
		70
	),
	(
		899,
		'Quem interpretou o Cenobita chamado "Pinhead" nos filmes originais do Hellraiser?',
		15,
		70
	),
	(
		900,
		'Quem interpretou o sargento. Gordon Elias em ''Platoon'' (1986)?',
		15,
		70
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		901,
		'Quem é o diretor do filme de 1991 "O Silêncio dos Inocentes"?',
		15,
		70
	),
	(
		902,
		'Velma Kelly e Roxie Hart são as protagonistas de qual filme vencedor do Oscar?',
		15,
		70
	),
	(
		903,
		' O jogo de tabuleiro "Ra" foi desenhado por qual designer?',
		20,
		71
	),
	(
		904,
		'A rede Dice Tower de podcasts e vídeos de jogos de tabuleiro é administrada por qual indivíduo?',
		20,
		71
	),
	(
		905,
		'Em Magic: The Gathering, o texto de qual carta é "Catch!"?',
		20,
		71
	),
	(
		906,
		'Em Magic: The Gathering, qual dos seguintes foi o primeiro card foil lançado publicamente?',
		20,
		71
	),
	(
		907,
		'Em Magic: The Gathering, qual termo para bloqueio foi estabelecido no conjunto Portal?',
		20,
		71
	),
	(
		908,
		'Em um tabuleiro Monopoly padrão, quanto você tem que pagar pela Avenida Tennessee?',
		20,
		71
	),
	(
		909,
		'No Banco Imobiliário padrão, qual é o aluguel se você pousar em Park Place sem casas?',
		20,
		71
	),
	(
		910,
		'O jogo de tabuleiro "Monopólio" é uma variação de qual jogo de tabuleiro?',
		20,
		71
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		911,
		'Qual carta está na capa do livro de regras Beta de "Magic: The Gathering"?',
		20,
		71
	),
	(
		912,
		'Qual classe de personagem em Dungeons and Dragons 5ª edição ganha seus poderes ao fazer um pacto com um ser de poder superior?',
		20,
		71
	),
	(
		913,
		'Qual destas cartas de "Magic: The Gathering" tem um texto que começa com "Oi oi oi"?',
		20,
		71
	),
	(
		914,
		'Qual era o codinome de desenvolvimento da expansão "Weatherlight" para "Magic: The Gathering", lançada em 1997?',
		20,
		71
	),
	(
		915,
		'Qual foi o codinome de desenvolvimento da expansão "Urza''s Destiny" para "Magic: The Gathering", lançada em 1999?',
		20,
		71
	),
	(
		916,
		'Qual jogo de tabuleiro foi lançado pela primeira vez em 6 de fevereiro de 1935?',
		20,
		71
	),
	(
		917,
		'Qual é a soma de todas as peças em uma caixa padrão de Scrabble?',
		20,
		71
	),
	(
		918,
		' Em um tabuleiro de Banco Imobiliário padrão, qual quadrado é diagonalmente oposto a ''Go''?',
		10,
		72
	),
	(
		919,
		'Carcassonne é baseada em qual cidade francesa?',
		10,
		72
	),
	(
		920,
		'Em que ano foi lançado o RPG de papel e caneta "Deadlands"?',
		10,
		72
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		921,
		'Nos jogos de tabuleiro, uma regra adicional ou alterada que se aplica a um determinado grupo ou local é informalmente conhecida como regra "o que"?',
		10,
		72
	),
	(
		922,
		'O jogo de tabuleiro Monopoly leva seus nomes de ruas de qual cidade americana real?',
		10,
		72
	),
	(
		923,
		'Qual destes jogos inclui a frase "Não passe Go, não colete $ 200"?',
		10,
		72
	),
	(
		924,
		'Qual destes não é um jogo real da série Dungeons & Dragons?',
		10,
		72
	),
	(
		925,
		'Quando o jogo de tabuleiro Twister foi lançado ao público?',
		10,
		72
	),
	(
		926,
		'Quantas peças há no tabuleiro no início de uma partida de xadrez?',
		10,
		72
	),
	(
		927,
		'Quantos dados são usados no jogo de Yahtzee?',
		10,
		72
	),
	(
		928,
		'Quantos pontos há em um único dado?',
		10,
		72
	),
	(
		929,
		' No jogo de tabuleiro, Settlers of Catan, uma rolagem de dados de qual número faz com que o Ladrão ataque?',
		15,
		73
	),
	(
		930,
		'Em "Magic: The Gathering", durante o design de Planar Chaos, que cor os desenvolvedores pensaram em adicionar como a sexta cor?',
		15,
		73
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		931,
		'Em "Magic: The Gathering", qual carta instantânea tem o maior custo de mana convertido?',
		15,
		73
	),
	(
		932,
		'Em que ano o jogo de cartas Magic: the Gathering foi lançado pela primeira vez?',
		15,
		73
	),
	(
		933,
		'Em Yu-Gi-Oh, como um jogador realiza uma Invocação Xyz?',
		15,
		73
	),
	(
		934,
		'No início de um jogo padrão do Banco Imobiliário, se você lançar um duplo seis, em qual quadrado você cairá?',
		15,
		73
	),
	(
		935,
		'O jogo de tabuleiro Nightmare foi lançado em que ano?',
		15,
		73
	),
	(
		936,
		'Qual dos seguintes jogos de mesa é o mais antigo?',
		15,
		73
	),
	(
		937,
		'Quantos pontos vale a peça Z no Scrabble?',
		15,
		73
	),
	(
		938,
		'Que item especial os criadores de Cards Against Humanity enviaram para o pacote da Black Friday?',
		15,
		73
	),
	(
		939,
		'Quem é o personagem principal da fita VHS incluída no jogo de tabuleiro Nightmare?',
		15,
		73
	),
	(
		940,
		' O romance "Jane Eyre" foi escrito por qual autor?',
		20,
		74
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		941,
		'Abel Magwitch é um personagem de qual romance de Charles Dickens?',
		20,
		74
	),
	(
		942,
		'De onde vem o título do livro "O Silêncio dos Inocentes"?',
		20,
		74
	),
	(
		943,
		'Em qual romance clássico de Mark Twain um mendigo e o príncipe de Gales trocaram de roupa e aprenderam sobre a desigualdade de classe social?',
		20,
		74
	),
	(
		944,
		'Em qual romance clássico existe um personagem chamado Homer Simpson?',
		20,
		74
	),
	(
		945,
		'Em The Lies Of Locke Lamora, o que significa "Lamora" em Throne Therin?',
		20,
		74
	),
	(
		946,
		'Na série "Harry Potter", qual é o nome completo do diretor Dumbledore?',
		20,
		74
	),
	(
		947,
		'Na série de livros "Odd Thomas", Danny Jessup tem que doença genética?',
		20,
		74
	),
	(
		948,
		'No universo de Harry Potter, qual é o nome do meio de Cornelius Fudge?',
		20,
		74
	),
	(
		949,
		'No universo Magic: The Gathering, a expansão Fallen Empires ocorre em qual continente?',
		20,
		74
	),
	(
		950,
		'No universo Magic: The Gathering, as expansões Antiquities, Ice Age e Alliances acontecem em qual continente?',
		20,
		74
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		951,
		'Nos livros de Beatrix Potter, que tipo de animal é Tommy Brock?',
		20,
		74
	),
	(
		952,
		'Qual condado inglês fictício foi o cenário dos romances de Thomas Hardy?',
		20,
		74
	),
	(
		953,
		'Qual das alternativas a seguir NÃO é uma obra de Shakespeare?',
		20,
		74
	),
	(
		954,
		'Qual é o nome da cidade onde Lílian e Tiago Potter estão enterrados?',
		20,
		74
	),
	(
		955,
		'George Orwell escreveu este livro, que muitas vezes é considerado uma declaração sobre a supervisão do governo.',
		10,
		75
	),
	(
		956,
		'No romance 1984, escrito por George Orwell, qual é o nome do regime totalitário que controla a Oceania?',
		10,
		75
	),
	(
		957,
		'Qual dos seguintes é o livro mais vendido do mundo?',
		10,
		75
	),
	(
		958,
		'Qual era o nome do submarino do Capitão Nemo em "20.000 Léguas Submarinas"?',
		10,
		75
	),
	(
		959,
		'Qual famoso romancista de espionagem escreveu a história infantil "Chitty-Chitty-Bang-Bang"?',
		10,
		75
	),
	(
		960,
		'Qual livro famoso tem o subtítulo ''O Prometeu Moderno''?',
		10,
		75
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		961,
		'Qual é o nome do cachorro de três cabeças em Harry Potter e a Pedra Filosofal?',
		10,
		75
	),
	(
		962,
		'Qual é o nome do irmão de Sherlock Holmes?',
		10,
		75
	),
	(
		963,
		'Qual é o nome do pai de Harry Potter?',
		10,
		75
	),
	(
		964,
		'Qual é o nome do protagonista do romance de JD Salinger, O apanhador no campo de centeio?',
		10,
		75
	),
	(
		965,
		'Qual é o título do primeiro livro de Sherlock Holmes de Arthur Conan Doyle?',
		10,
		75
	),
	(966, 'Quem escreveu "Harry Potter"?', 10, 75),
	(
		967,
		'Quem escreveu "Um conto de duas cidades"?',
		10,
		75
	),
	(
		968,
		'Quem escreveu o romance ''Fear And Loathing In Las Vegas''?',
		10,
		75
	),
	(
		969,
		'Quem escreveu o romance para jovens adultos "A Culpa é das Estrelas"?',
		10,
		75
	),
	(
		970,
		' O romance "Of Mice And Men" foi escrito por qual autor?',
		15,
		76
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		971,
		' Qual dos seguintes autores não nasceu na Inglaterra?',
		15,
		76
	),
	(
		972,
		'De acordo com o livro O Guia do Mochileiro das Galáxias, a resposta para a vida, o universo e tudo mais é...',
		15,
		76
	),
	(
		973,
		'Em "Little Women", qual das irmãs March se casou com Laurie?',
		15,
		76
	),
	(
		974,
		'Em Alice no País das Maravilhas, qual é o nome do gatinho de Alice?',
		15,
		76
	),
	(
		975,
		'Em As Mentiras de Locke Lamora, por qual título Locke é conhecido no mundo do crime?',
		15,
		76
	),
	(
		976,
		'Em que posição Harry Potter joga no Quadribol?',
		15,
		76
	),
	(
		977,
		'JK Rowling completou "Harry Potter e as Relíquias da Morte" em qual hotel em Edimburgo, na Escócia?',
		15,
		76
	),
	(978, 'No "O Hobbit", quem mata Smaug?', 15, 76),
	(
		979,
		'No ano de 1818, a romancista Mary Shelly é creditada por escrever um romance de ficção e criar esse personagem infame.',
		15,
		76
	),
	(
		980,
		'No romance "Jurassic Park" de Michael Crichton, John Hammond encontra sua morte nas garras de qual dinossauro?',
		15,
		76
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		981,
		'No romance "O Senhor dos Anéis", quantos anéis de poder foram dados à raça humana?',
		15,
		76
	),
	(
		982,
		'No Senhor dos Anéis, quem é o pai do anão Gimli?',
		15,
		76
	),
	(
		983,
		'Nos romances de "Harry Potter", o que um aluno de Hogwarts deve fazer para entrar na Sala Comunal da Corvinal?',
		15,
		76
	),
	(
		984,
		'O livro "Fahrenheit 451" foi escrito por quem?',
		15,
		76
	),
	(
		985,
		'O livro "O Pequeno Príncipe" foi escrito por...',
		15,
		77
	),
	(
		986,
		'Por qual apelido Jack Dawkins é conhecido no romance de Charles Dickens, ''Oliver Twist''?',
		15,
		77
	),
	(
		987,
		'Por qual nome o autor Eric Blair era mais conhecido?',
		15,
		77
	),
	(
		988,
		'Qual das seguintes não é uma obra de autoria de Fiódor Dostoiévski?',
		15,
		77
	),
	(
		989,
		'Qual destas séries de livros é de James Patterson?',
		15,
		77
	),
	(
		990,
		'Qual dos seguintes foi o autor de "Username Evie"?',
		15,
		77
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		991,
		'Qual era o pseudônimo da romancista Mary Ann Evans?',
		15,
		77
	),
	(
		992,
		'Qual romance de John Grisham foi concebido em uma viagem para a Flórida enquanto pensava em livros roubados com sua esposa?',
		15,
		77
	),
	(
		993,
		'Qual é a marca e o modelo dos veículos de turismo em "Jurassic Park" (1990)?',
		15,
		77
	),
	(
		994,
		'Qual é o nome da gangue da qual Ponyboy faz parte no livro The Outsiders?',
		15,
		77
	),
	(
		995,
		'Qual é o quarto livro do Antigo Testamento?',
		15,
		77
	),
	(
		996,
		'Quantos livros tem a série As Crônicas de Nárnia?',
		15,
		77
	),
	(
		997,
		'Que série de livros publicada por Jim Butcher segue um mago na moderna Chicago?',
		15,
		77
	),
	(
		998,
		'Quem escreveu a história infantil "The Little Match Girl"?',
		15,
		77
	),
	(
		999,
		'Quem escreveu a série de romances de fantasia "As Crônicas de Gelo e Fogo"?',
		15,
		77
	),
	(
		1000,
		'Quem escreveu o romance de terror de 1967 "O bebê de Rosemary"?',
		15,
		77
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1001,
		'Depois da Inglaterra, mais peças de Shakespeare são ambientadas neste país atual do que em qualquer outro.',
		20,
		78
	),
	(
		1002,
		'Em Macbeth, os olhos de quais animais foram usados no caldeirão das bruxas?',
		20,
		78
	),
	(
		1003,
		'Em Os Miseráveis, quem é o Código Prisional 24601?',
		20,
		78
	),
	(
		1004,
		'Qual destas peças foi encenada pela primeira vez postumamente depois que o dramaturgo cometeu suicídio?',
		20,
		78
	),
	(
		1005,
		'Qual peça de Shakespeare apresenta a direção de palco "Entra um mensageiro, com duas cabeças e uma mão"?',
		20,
		78
	),
	(
		1006,
		'Qual é o nome do primeiro musical "de longa duração" da Broadway?',
		20,
		78
	),
	(
		1007,
		'Quem serve como orador do prólogo em Romeu e Julieta de Shakespeare?',
		20,
		78
	),
	(
		1008,
		'Na peça Júlio César de Shakespeare, as últimas palavras de César foram...',
		10,
		79
	),
	(
		1009,
		'O astro de "Doctor Who", David Tennant, atuou em uma versão de qual peça de Shakespeare?',
		10,
		79
	),
	(
		1010,
		'Quantas peças Shakespeare geralmente escreveu?',
		10,
		79
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1011,
		'Quem escreveu a peça ''Angels in America''?',
		10,
		79
	),
	(
		1012,
		'Quem escreveu o premiado musical "In The Heights"?',
		10,
		79
	),
	(
		1013,
		'De que peça é a citação "O inferno são os outros"?',
		15,
		80
	),
	(
		1014,
		'Em qual peça de Shakespeare o personagem Marcelo diz: "Algo está podre no estado da Dinamarca"?',
		15,
		80
	),
	(
		1015,
		'Em qual peça de Shakespeare você encontrará o suicídio de Ofélia?',
		15,
		80
	),
	(
		1016,
		'musical "Cats" de Andrew Lloyd Webber é baseado em um livro de poemas escrito por qual autor?',
		15,
		80
	),
	(
		1017,
		'Na versão musical de Jeff Wayne de War of the Worlds, as chances de algo vindo de Marte são...',
		15,
		80
	),
	(
		1018,
		'O Campeonato Mundial de Xadrez em Xadrez, Ato 1 se passa em qual cidade italiana?',
		15,
		80
	),
	(
		1019,
		'O musical "Dirty Rotten Scoundrels" se passa em que país?',
		15,
		80
	),
	(
		1020,
		'Qual das opções a seguir não é uma peça do musical West Side Story de 1950?',
		15,
		80
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1021,
		'Qual destes musicais ganhou o Prêmio Tony de Melhor Musical?',
		15,
		80
	),
	(
		1022,
		'Qual foi a última ópera de George Bizet?',
		15,
		80
	),
	(
		1023,
		'Quando foi escrita a peça "Macbeth"?',
		15,
		80
	),
	(
		1024,
		'Quem é o diretor musical do premiado musical "Hamilton"?',
		15,
		80
	),
	(
		1025,
		'"All the Boys" do Panic! At the Disco foi lançada como faixa bônus em qual álbum?',
		20,
		81
	),
	(
		1026,
		'A banda de heavy metal Black Sabbath vem de qual cidade inglesa?',
		20,
		81
	),
	(
		1027,
		'A Caixa Malacacheta é que tipo de instrumento musical é comumente usado na música latino-americana?',
		20,
		81
	),
	(
		1028,
		'A tonalidade de sustenidos contém a tonalidade de G# menor?',
		20,
		81
	),
	(
		1029,
		'Artis Leon Ivey Jr. é mais conhecido como qual artista de rap?',
		20,
		81
	),
	(
		1030,
		'Chino Moreno é o vocalista de qual banda de metal alternativo?',
		20,
		81
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1031,
		'Em qual álbum do M83 está a música "Midnight City"?',
		20,
		81
	),
	(
		1032,
		'Em qual álbum dos Beatles você encontraria a música ''Eleanor Rigby''?',
		20,
		81
	),
	(
		1033,
		'Em que ano a música "Money for Nothing" do Dire Straits foi lançada?',
		20,
		81
	),
	(
		1034,
		'Em que ano foi lançado o álbum "Floral Shoppe" do Macintosh Plus?',
		20,
		81
	),
	(
		1035,
		'Em que ano Min Yoongi da boy band sul-coreana "BTS" nasceu?',
		20,
		81
	),
	(
		1036,
		'Este álbum, hoje considerado um dos maiores de todos os tempos, foi um fracasso comercial quando foi lançado.',
		20,
		81
	),
	(
		1037,
		'No pânico! Na música "Nothern Downpour" do At the Disco, cuja letra segue ''Eu sei que o mundo é um osso quebrado''.',
		20,
		81
	),
	(1038, 'Onde Nicki Minaj nasceu?', 20, 81),
	(
		1039,
		'Pete Townshend colaborou com qual guitarrista famoso para um evento na Brixton Academy em 1985?',
		20,
		81
	),
	(
		1040,
		'Pânico! O sexto álbum do At the Disco, "Pray For The Wicked", foi lançado em qual data?',
		20,
		82
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1041,
		'Qual banda é a banda ativa por mais tempo no mundo sem interrupções ou mudanças de formação?',
		20,
		82
	),
	(
		1042,
		'Qual dessas músicas foi lançada em 1996?',
		20,
		82
	),
	(
		1043,
		'Qual dessas músicas NÃO está incluída na OST de Esquadrão Suicida?',
		20,
		82
	),
	(
		1044,
		'Qual desses artistas NÃO participou do quinto álbum de estúdio "Humanz" da banda virtual britânica Gorillaz?',
		20,
		82
	),
	(
		1045,
		'Qual desses artistas NÃO remixou a música "Faded" de Alan Walker?',
		20,
		82
	),
	(
		1046,
		'Qual desses pseudônimos NÃO foi usado pelo músico eletrônico Aphex Twin?',
		20,
		82
	),
	(
		1047,
		'Qual destas NÃO é uma música do EP Lockjaw lançado em 2013 por Flume & Chet Faker?',
		20,
		82
	),
	(
		1048,
		'Qual dos álbuns de Michael Jackson vendeu mais cópias?',
		20,
		82
	),
	(
		1049,
		'Qual empresa fez a animação para o filme de Peter Gabriel Sledgehammer (1986)?',
		20,
		82
	),
	(
		1050,
		'Qual era o nome da banda de rock formada por Nobuo Uematsu que tocava músicas de vários jogos Final Fantasy?',
		20,
		82
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1051,
		'Qual era o nome do cantor da Guerra Fria que tem uma música em Grand Theft Auto IV e um marco na parede em Moscou para seu memorial?',
		20,
		82
	),
	(
		1052,
		'Qual foi o último álbum do Aphex Twin lançado antes de seu hiato de uma década?',
		20,
		82
	),
	(
		1053,
		'Qual hit de Elton John começa com a frase "Quando você vai descer"?',
		20,
		82
	),
	(
		1054,
		'Qual integrante da banda inglesa "The xx" lançou seu álbum solo "In Colour" em 2015?',
		20,
		82
	),
	(
		1055,
		'Qual letra é sobre o vocalista do Red Hot Chili Peppers, Anthony Kiedis?',
		20,
		82
	),
	(
		1056,
		'Qual membro do Wu-Tang Clan teve apenas um verso em seu álbum de estreia, Enter the Wu-Tang (36 Chambers)?',
		20,
		83
	),
	(
		1057,
		'Qual música do álbum "The Life of Pablo" do rapper Kanye West apresenta Rihanna?',
		20,
		83
	),
	(
		1058,
		'Qual álbum do Death Grips é o único a apresentar um membro da banda?',
		20,
		83
	),
	(
		1059,
		'Qual é a primeira faixa do álbum "Before These Crowded Streets" da Dave Matthews Band?',
		20,
		83
	),
	(
		1060,
		'Qual é o nome artístico da cantora neozelandesa Phillipa "Pip" Brown?',
		20,
		83
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1061,
		'Qual é o nome da mixtape de 2016 lançada pela produtora eletrônica venezuelana Arca?',
		20,
		83
	),
	(
		1062,
		'Qual é o nome oficial da banda de apoio de Prince?',
		20,
		83
	),
	(
		1063,
		'Qual é o termo britânico para uma nota 64?',
		20,
		83
	),
	(
		1064,
		'Qual é o título em inglês da faixa vaporwave "リサフランク420 / 現代のコンピュー" do Macintosh Plus (Vektroid)?',
		20,
		83
	),
	(1065, 'Quando o rapper Eazy-E morreu?', 20, 83),
	(
		1066,
		'Quantos membros existem no grupo ídolo "µ''s"?',
		20,
		83
	),
	(
		1067,
		'Que música tocada originalmente pelos Bee Gees em 1978 teve uma versão cover de Steps 20 anos depois?',
		20,
		83
	),
	(
		1068,
		'Quem desenhou a capa do álbum True Romance, um álbum de Estelle?',
		20,
		83
	),
	(
		1069,
		'Quem escreveu a música "You Know You Like It"?',
		20,
		83
	),
	(
		1070,
		'Quem foi o baterista original dos Beatles?',
		20,
		83
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1071,
		'Quem não estava na banda "The Smiths"?',
		20,
		83
	),
	(
		1072,
		' Quem apareceu na música "Words" de Feint?',
		10,
		84
	),
	(
		1073,
		'"Algumas pessoas me chamam de cowboy do espaço" é o primeiro verso de qual música?',
		10,
		84
	),
	(
		1074,
		'"Doctor Jones", "Turn Back Time" e "Barbie Girl" foram os números um do Reino Unido para qual grupo Eurodance?',
		10,
		84
	),
	(
		1075,
		'"Gold Digger" de Kanye West apresentou qual ator vencedor do Oscar?',
		10,
		84
	),
	(
		1076,
		'"Grande Valse" é uma frase da música "Gran Vals". Como é conhecido esse segmento de música?',
		10,
		84
	),
	(
		1077,
		'"Hallelujah" é uma canção escrita por qual artista canadense?',
		10,
		84
	),
	(
		1078,
		'"The Singing Cowboy" Gene Autry é creditado com a primeira gravação de todos, mas qual clássico jingle de Natal?',
		10,
		84
	),
	(
		1079,
		'A "invasão britânica" foi um fenômeno cultural na música onde as boy bands britânicas se tornaram populares nos EUA em que década?',
		10,
		84
	),
	(
		1080,
		'A banda Muse lançou seu primeiro álbum, Showbiz, em que ano?',
		10,
		84
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1081,
		'A música de 2016 "Starboy" do cantor canadense The Weeknd apresenta qual artista eletrônico proeminente?',
		10,
		84
	),
	(
		1082,
		'A música do Rush "YYZ" deriva seu nome do código de identificação do aeroporto IATA para qual cidade?',
		10,
		84
	),
	(1083, 'De que país é a banda Rammstein?', 10, 84),
	(
		1084,
		'Em que ano foi lançado o álbum "Year of the Snitch" do Death Grips?',
		10,
		84
	),
	(
		1085,
		'Kanye West no VMA 2009 interrompeu qual celebridade?',
		10,
		84
	),
	(
		1086,
		'Na ópera de Rossini, qual era o nome de ''O Barbeiro de Sevilha''?',
		10,
		84
	),
	(
		1087,
		'O que não é um instrumento de sopro?',
		10,
		85
	),
	(
		1088,
		'Quais álbuns incluíam "Back in Black" e "Ballbreaker"?',
		10,
		85
	),
	(
		1089,
		'Qual artista lançou o single "Harlem Shake" em 2012, que foi usado em vários vídeos do YouTube em 2013?',
		10,
		85
	),
	(
		1090,
		'Qual banda de punk rock lançou canções de sucesso como "Californication", "Can''t Stop" e "Under the Bridge"?',
		10,
		85
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1091,
		'Qual banda dos anos 80 é liderada pelo cantor/guitarrista Robert Smith?',
		10,
		85
	),
	(
		1092,
		'Qual banda gravou o álbum "Parallel Lines"?',
		10,
		85
	),
	(
		1093,
		'Qual banda lançou músicas como "Rio", "Girls on Film" e "The Reflex"?',
		10,
		85
	),
	(
		1094,
		'Qual cantor foi destaque em Jack Ü (Skrillex & Diplo) a música de 2015 ''Where Are Ü Agora''?',
		10,
		85
	),
	(
		1095,
		'Qual das opções a seguir é um álbum da banda de punk rock Anti-Flag?',
		10,
		85
	),
	(
		1096,
		'Qual das seguintes músicas Elton John cantou após a morte da princesa Diane?',
		10,
		85
	),
	(
		1097,
		'Qual destas músicas de Skrillex apresenta Fatman Scoop como artista secundário?',
		10,
		85
	),
	(
		1098,
		'Qual destas NÃO é uma música do Men at Work?',
		10,
		85
	),
	(
		1099,
		'Qual destes NÃO é o nome de um álbum lançado pela cantora e compositora inglesa Adele?',
		10,
		85
	),
	(
		1100,
		'Qual destes é o nome de uma música do Tears for Fears?',
		10,
		85
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1101,
		'Qual dos seguintes não é um álbum de estúdio da banda Pink Floyd?',
		10,
		85
	),
	(
		1102,
		'Qual era o nome do segundo álbum de estúdio do cantor Frank Ocean, lançado em 20 de agosto de 2016?',
		10,
		85
	),
	(
		1103,
		'Qual ex-estrela de boyband lançou o hit solo "Angels" em 1997?',
		10,
		86
	),
	(
		1104,
		'Qual foi o primeiro álbum de estúdio do Daft Punk?',
		10,
		86
	),
	(
		1105,
		'Qual foi o álbum de estreia do Rage Against the Machine?',
		10,
		86
	),
	(
		1106,
		'Qual foi o álbum mais vendido de 2015?',
		10,
		86
	),
	(
		1107,
		'Qual grupo de rap lançou o álbum "Straight Outta Compton"?',
		10,
		86
	),
	(
		1108,
		'Qual guitarrista inglês tem o apelido de "Slowhand"?',
		10,
		86
	),
	(
		1109,
		'Qual música de "Random Access Memories" do Daft Punk apresenta Pharrell Williams?',
		10,
		86
	),
	(
		1110,
		'Qual músico canadense de reggae fez sucesso em 1993 com a música ''Informer''?',
		10,
		86
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1111,
		'Qual personagem da Disney canta a música "Um sonho é um desejo que seu coração faz"?',
		10,
		86
	),
	(
		1112,
		'Qual rapper famoso é apresentado em Jack Ü (Skrillex e Diplo) single de 2015 chamado "Febreze"?',
		10,
		86
	),
	(
		1113,
		'Qual streamer do Twitch é o vocalista do Red Vox?',
		10,
		86
	),
	(
		1114,
		'Qual álbum Bon Iver lançou em 2016?',
		10,
		86
	),
	(
		1115,
		'Qual álbum do Led Zeppelin contém "Stairway to Heaven"?',
		10,
		86
	),
	(
		1116,
		'Qual álbum do Nirvana tinha um bebê nu na capa?',
		10,
		86
	),
	(
		1117,
		'Qual álbum dos Beatles NÃO apresenta nenhum dos membros da banda na capa?',
		10,
		86
	),
	(
		1118,
		'Qual álbum The Lumineers lançou em 2016?',
		10,
		86
	),
	(
		1119,
		'Qual é o nome artístico da rapper inglesa Mathangi Arulpragasam, conhecida pela música "Paper Planes"?',
		10,
		87
	),
	(
		1120,
		'Qual é o nome da esposa de Rivers Cuomo?',
		10,
		87
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1121,
		'Qual é o nome do vocalista da banda de metal Megadeth?',
		10,
		87
	),
	(
		1122,
		'Qual é o nome do álbum lançado em 2014 pela banda americana Maroon 5?',
		10,
		87
	),
	(
		1123,
		'Qual é o álbum mais vendido de todos os tempos de 1976 a 2018?',
		10,
		87
	),
	(
		1124,
		'Quando Gangnam Style foi carregado no YouTube?',
		10,
		87
	),
	(
		1125,
		'Quantas cordas tem um violoncelo?',
		10,
		87
	),
	(
		1126,
		'Quantos membros há na banda Nirvana?',
		10,
		87
	),
	(
		1127,
		'Quantos álbuns de estúdio a dupla Daft Punk lançou?',
		10,
		87
	),
	(
		1128,
		'Que álbum colaborativo foi lançado por Kanye West e Jay-Z em 2011?',
		10,
		87
	),
	(
		1129,
		'Quem cantou "I Took A Pill In Ibiza"?',
		10,
		87
	),
	(
		1130,
		'Quem era "Kung Fu Fighting" em 1974?',
		10,
		87
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1131,
		'Quem escreveu o hit de Sinead O`Connor ''Nothing Compares 2 U''?',
		10,
		87
	),
	(
		1132,
		'Quem teve um hit de 1983 com a música ''Africa''?',
		10,
		87
	),
	(
		1133,
		'Quem é o vocalista da banda 30 Seconds to Mars?',
		10,
		87
	),
	(
		1134,
		'Quem é o vocalista da banda britânica de pop rock Coldplay?',
		10,
		87
	),
	(
		1135,
		'Quem é o vocalista da banda Coldplay?',
		10,
		88
	),
	(
		1136,
		'Quem é o vocalista do Arctic Monkeys?',
		10,
		88
	),
	(
		1137,
		'Quem é o vocalista do Foo Fighters?',
		10,
		88
	),
	(1138, 'Quem é o vocalista do Pearl Jam?', 10, 88),
	(
		1139,
		'Segundo a rapper americana Nelly, o que você deve fazer quando está calor aqui?',
		10,
		88
	),
	(
		1140,
		'Sting, o vocalista do The Police, toca principalmente qual instrumento?',
		10,
		88
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1141,
		'Termine esta letra da música "Panda" de 2016 de Desiigner: "I got broads in _______".',
		10,
		88
	),
	(
		1142,
		'"Drink the Sea" é um álbum de qual artista de música eletrônica?',
		15,
		89
	),
	(
		1143,
		'"Make You Feel My Love" foi originalmente escrita e interpretada por qual cantor e compositor?',
		15,
		89
	),
	(
		1144,
		'"The Genius" é o nome original e secundário de qual membro do Wu-Tang Clan?',
		15,
		89
	),
	(
		1145,
		'''74–''75 é um single de 1993 do álbum Ring de qual banda americana?',
		15,
		89
	),
	(
		1146,
		'A composição musical de 1952 4''33", composta pelo prolífico compositor americano John Cage, é composta principalmente por que som?',
		15,
		89
	),
	(
		1147,
		'A frase homônima do The Who, "Teenage Wasteland", aparece em qual de suas canções?',
		15,
		89
	),
	(
		1148,
		'A gravadora de EDM Monstercat é baseada em qual país?',
		15,
		89
	),
	(
		1149,
		'A música "Caramelldansen" é comumente confundida com uma música japonesa, em que idioma a música é realmente cantada?',
		15,
		89
	),
	(
		1150,
		'A música "Hung Up" de Madonna inclui uma peça de qual música popular dos anos 70?',
		15,
		89
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1151,
		'A música "Twin Size Mattress" foi escrita por qual banda?',
		15,
		89
	),
	(
		1152,
		'A turnê ''In the Flesh'' foi usada para divulgar qual álbum do Pink Floyd?',
		15,
		89
	),
	(
		1153,
		'Como se chama a guitarra de Brian May?',
		15,
		89
	),
	(
		1154,
		'Cryoshell, conhecido por "Creeping in My Soul" fez a música publicitária para qual Lego Theme?',
		15,
		89
	),
	(
		1155,
		'De acordo com a RIAA: Qual artista vendeu milhões de álbuns?',
		15,
		89
	),
	(
		1156,
		'De acordo com uma música dos Beatles, quem manteve o rosto em uma jarra perto da porta?',
		15,
		89
	),
	(
		1157,
		'De onde veio a boy band britânica "Bros"?',
		15,
		90
	),
	(
		1158,
		'De qual cidade o produtor de rap americano DJ Khaled se originou?',
		15,
		90
	),
	(
		1159,
		'De qual álbum a música do Gorillaz, "On Melancholy Hill" é apresentada?',
		15,
		90
	),
	(
		1160,
		'De que país Shirley Bassey se originou?',
		15,
		90
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1161,
		'De que país é a cantora Kyary Pamyu Pamyu?',
		15,
		90
	),
	(
		1162,
		'De que país é originária a banda de power metal "Sabaton"?',
		15,
		90
	),
	(
		1163,
		'De que país é originária a dupla de música eletrônica "The Knife"?',
		15,
		90
	),
	(
		1164,
		'De que país é originário o piano?',
		15,
		90
	),
	(
		1165,
		'Em 2015, David Hasselhof lançou um single chamado...',
		15,
		90
	),
	(
		1166,
		'Em agosto de 1964, quem apresentou os Beatles à cannabis?',
		15,
		90
	),
	(
		1167,
		'Em qual álbum do Iron Maiden a música "Dream of Mirrors" apareceu?',
		15,
		90
	),
	(
		1168,
		'Em que ano "Caravan Palace" lançou seu primeiro álbum?',
		15,
		90
	),
	(
		1169,
		'Em que ano foi lançado o álbum "Californication" do Red Hot Chill Pepper?',
		15,
		90
	),
	(
		1170,
		'Em que ano foi lançado o álbum do Megadeth "Peace Sells... but Who''s Buying?" lançado?',
		15,
		90
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1171,
		'Johnny Cash fez um cover dessa música escrita pelo vocalista do Nine Inch Nails, Trent Reznor.',
		15,
		90
	),
	(
		1172,
		'Liam Howlett fundou qual grupo de música eletrônica em 1990?',
		15,
		90
	),
	(
		1173,
		'Na capa de ''Abbey Road'', qual dos Beatles não está usando sapatos?',
		15,
		91
	),
	(
		1174,
		'Na música “The Ultimate Showdown of Ultimate Destiny,” quem é o único a sobreviver à batalha?',
		15,
		91
	),
	(
		1175,
		'Normalmente, quantas teclas estão em um piano?',
		15,
		91
	),
	(
		1176,
		'O artista afro-americano Sammy Davis Jr. ficou conhecido por perder qual parte do corpo em um acidente de carro?',
		15,
		91
	),
	(
		1177,
		'O hit de Rick Astley "Never Gonna Give You Up" foi lançado em que ano?',
		15,
		91
	),
	(
		1178,
		'O músico irlandês Hozier lançou uma faixa musical em 2013 intitulada "Take Me to ______"',
		15,
		91
	),
	(
		1179,
		'O primeiro álbum de Ellie Goulding foi nomeado?',
		15,
		91
	),
	(
		1180,
		'O produtor de EDM Marshmello se apresenta ao vivo vestindo roupas e uma máscara de marshmallow de que cor?',
		15,
		91
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1181,
		'Pink Floyd fez essa música para o vocalista anterior, Syd Barrett.',
		15,
		91
	),
	(
		1182,
		'Qual artista colaborou com o DJ americano Dillon Francis para lançar a música 2016 "Need You"?',
		15,
		91
	),
	(
		1183,
		'Qual artista fez a curadoria da trilha sonora oficial de "Jogos Vorazes: Mockingjay - Parte 1"?',
		15,
		91
	),
	(
		1184,
		'Qual artista ou grupo John Lennon considerava "filho(s) dos Beatles"?',
		15,
		91
	),
	(
		1185,
		'Qual artista/banda francesa é conhecida por tocar no instrumento midi "Launchpad"?',
		15,
		91
	),
	(
		1186,
		'Qual banda de rock alternativo lançou o aclamado álbum "OK Computer"?',
		15,
		91
	),
	(
		1187,
		'Qual banda de rock lançou o álbum "The Bends" em março de 1995?',
		15,
		91
	),
	(
		1188,
		'Qual banda de rock popular tem um baterista maneta?',
		15,
		91
	),
	(
		1189,
		'Qual banda familiar americana teve um hit no top 10 de 1986 com a música ''Crush On You''?',
		15,
		92
	),
	(
		1190,
		'Qual banda lançou músicas como "Electric Feel", "Kids" e "Time to Pretend"?',
		15,
		92
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1191,
		'Qual banda lançou o álbum "Sonic Highways" em 2014?',
		15,
		92
	),
	(
		1192,
		'Qual banda teve sucessos em 1972 com as canções "Baby I''m A Want You", "Everything I Own" e "The Guitar Man"',
		15,
		92
	),
	(
		1193,
		'Qual Beatle escreveu e cantou a música "Why Don''t We Do It in the Road" depois de se inspirar ao ver dois macacos copulando na rua?',
		15,
		92
	),
	(
		1194,
		'Qual Beatle liderou o caminho através da faixa de pedestres na capa do álbum Abbey Road?',
		15,
		92
	),
	(
		1195,
		'Qual cantor apareceu na música "Wake Me Up" do produtor sueco Avicii?',
		15,
		92
	),
	(
		1196,
		'Qual capa de álbum icônica apresenta as ondas pulsares do CP 1919 colocadas no centro da capa?',
		15,
		92
	),
	(
		1197,
		'Qual capital europeia dá nome a uma música de 1981 do Ultravox?',
		15,
		92
	),
	(
		1198,
		'Qual das seguintes bandas musicais não é da Finlândia?',
		15,
		92
	),
	(
		1199,
		'Qual dessas bandas é a mais antiga?',
		15,
		92
	),
	(
		1200,
		'Qual dessas músicas do artista Eminem contém a letra "Prazer em conhecê-lo. Oi, meu nome é... esqueci meu nome!"?',
		15,
		92
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1201,
		'Qual dessas músicas do Rammstein tem dois videoclipes oficiais?',
		15,
		92
	),
	(
		1202,
		'Qual dessas músicas Jimi Hendrix fez um cover?',
		15,
		92
	),
	(
		1267,
		'Quem é o vocalista do Smashing Pumpkins?',
		15,
		96
	),
	(
		1203,
		'Qual dessas músicas NÃO está no álbum dos Beatles "Sgt. Pepper''s Lonely Hearts Club Band"?',
		15,
		92
	),
	(
		1204,
		'Qual dessas pessoas já esteve na banda ''''Metallica'''' no passado?',
		15,
		92
	),
	(
		1205,
		'Qual desses artistas NÃO fez parte do grupo de dancehall Major Lazer?',
		15,
		93
	),
	(
		1206,
		'Qual desses artistas NÃO fez parte do supergrupo de música eletrônica Swedish House Mafia, que se separou em 2013?',
		15,
		93
	),
	(
		1207,
		'Qual desses artistas NÃO é originário da França?',
		15,
		93
	),
	(
		1208,
		'Qual desses idiomas NÃO foi incluído na música de 2016 "Don''t Mind" de Kent Jones?',
		15,
		93
	),
	(
		1209,
		'Qual desses Johns foi assassinado a tiros fora do Dakota em Nova York em 1980?',
		15,
		93
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1210,
		'Qual desses rappers NÃO é membro do grupo de rap Wu-Tang Clan?',
		15,
		93
	),
	(
		1211,
		'Qual desses álbuns do Pink Floyd também foi um filme?',
		15,
		93
	),
	(
		1212,
		'Qual destas NÃO é uma música do Pegboard Nerds?',
		15,
		93
	),
	(
		1213,
		'Qual destas NÃO é uma música do álbum autointitulado dos Beatles de 1968, também conhecido como álbum White?',
		15,
		93
	),
	(
		1214,
		'Qual destas não é uma música do álbum Graduation de Kanye West?',
		15,
		93
	),
	(
		1215,
		'Qual destes NÃO é o nome de um álbum lançado pelo rapper americano Pitbull?',
		15,
		93
	),
	(
		1216,
		'Qual destes NÃO é o nome de um álbum lançado pelo rapper americano Viper?',
		15,
		93
	),
	(
		1217,
		'Qual destes não é um álbum de Ed Sheeran?',
		15,
		93
	),
	(
		1218,
		'Qual destes NÃO é um álbum lançado pelos Beatles?',
		15,
		93
	),
	(
		1219,
		'Qual destes é o nome de uma banda americana de rock psicodélico formada em 2002 por Benjamin Goldwasser e Andrew VanWyngarden?',
		15,
		93
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1220,
		'Qual dos seguintes guitarristas gravou um álbum como membro do Red Hot Chili Peppers?',
		15,
		93
	),
	(
		1221,
		'Qual dupla francesa teve sucessos no Reino Unido em 1998 com as canções ''Sexy Boy'', ''Kelly Watch The Stars'' e ''All I Need''?',
		15,
		94
	),
	(
		1222,
		'Qual era o nome do primeiro álbum de estúdio do Pink Floyd?',
		15,
		94
	),
	(
		1223,
		'Qual era o nome do álbum do Wu-Tang Clan que Martin Shkreli comprou por $ 2 milhões de dólares?',
		15,
		94
	),
	(
		1224,
		'Qual era o sobrenome verdadeiro de David Bowie?',
		15,
		94
	),
	(
		1225,
		'Qual foi o primeiro álbum do Radiohead?',
		15,
		94
	),
	(
		1226,
		'Qual foi o single de estreia de Britney Spears?',
		15,
		94
	),
	(
		1227,
		'Qual foi o título da música de Sakamoto Kyu "Ue o Muite Arukou" (I Look Up As I Walk) mudou nos Estados Unidos?',
		15,
		94
	),
	(
		1228,
		'Qual foi o título do primeiro single de sucesso do ABBA no Reino Unido?',
		15,
		94
	),
	(
		1229,
		'Qual foi o álbum solo de estreia de Raekwon the Chefs?',
		15,
		94
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1230,
		'Qual M83 foi apresentado no rádio do Grand Theft Auto V?',
		15,
		94
	),
	(
		1231,
		'Qual membro do grupo pop britânico "The Spice Girls" era conhecido como Ginger Spice?',
		15,
		94
	),
	(
		1232,
		'Qual membro dos "The Beatles" narrou episódios de "Thomas the Tank Engine"?',
		15,
		94
	),
	(
		1233,
		'Qual música do músico eletrônico sueco Avicii sampleia a música "Something''s Got A Hold On Me" de Etta James?',
		15,
		94
	),
	(
		1234,
		'Qual música do Queen foi regravada por Brittany Murphy no filme de 2006 "Happy Feet"?',
		15,
		94
	),
	(
		1235,
		'Qual música do álbum Black Face LP do ScHoolboy Q apresentava Kanye West?',
		15,
		94
	),
	(
		1236,
		'Qual música gravada anteriormente por Elvis Presley foi regravada pelo UB40 com uma batida de reggae?',
		15,
		94
	),
	(1237, 'Qual música não é do TheFatRat?', 15, 95),
	(
		1238,
		'Qual álbum de rap famoso dos anos 90 é comumente chamado de "A Bíblia do Hip Hop"?',
		15,
		95
	),
	(
		1239,
		'Qual álbum do rapper americano Kanye West continha músicas como "Love Lockdown", "Paranoid" e "Heartless"?',
		15,
		95
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1240,
		'Qual álbum o Gorillaz lançou em 2017?',
		15,
		95
	),
	(
		1241,
		'Qual é a fórmula de compasso mais comum para canções de rock?',
		15,
		95
	),
	(
		1242,
		'Qual é a última música do primeiro Panic! Álbum At the Disco?',
		15,
		95
	),
	(
		1243,
		'Qual é o nome do personagem principal do videoclipe de "Shelter" de Porter Robinson e A-1 Studios?',
		15,
		95
	),
	(
		1244,
		'Qual é o nome do primeiro álbum de estúdio do produtor francês de música eletrônica Madeon em 2015?',
		15,
		95
	),
	(
		1245,
		'Qual é o nome do álbum de estúdio de 2016 da dupla francesa de música eletrônica Justice?',
		15,
		95
	),
	(
		1246,
		'Qual é o verdadeiro nome do produtor canadense de música eletrônica deadmau5?',
		15,
		95
	),
	(
		1247,
		'Qual é o verdadeiro nome do rapper Drake?',
		15,
		95
	),
	(
		1248,
		'Quando foi lançado o 3º álbum "Notes from the Underground" da banda "Hollywood Undead"?',
		15,
		95
	),
	(
		1249,
		'Quando o Tame Impala lançou seu segundo álbum?',
		15,
		95
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1250,
		'Quando os Beatles lançaram o LP "Please Please Me"?',
		15,
		95
	),
	(
		1251,
		'Quantas cópias do álbum "Metallica" (AKA The Black Album) do Metallica foram vendidas em todo o mundo (em milhões de cópias)?',
		15,
		95
	),
	(
		1252,
		'Quantos membros há na banda de rock japonesa SCANDAL?',
		15,
		95
	),
	(
		1253,
		'Quantos álbuns de estúdio a banda de heavy metal ''Metallica'' lançou no período entre 1983 e 2016?',
		15,
		96
	),
	(
		1254,
		'Que data é referenciada na música de 1971 "September" de Earth, Wind & Fire?',
		15,
		96
	),
	(
		1255,
		'Que músico fez a música "Fuckin` Perfect" em 2010?',
		15,
		96
	),
	(
		1256,
		'Quem alcançou o primeiro lugar nos Estados Unidos e no Reino Unido em 1962 com a instrumental ''Telstar''?',
		15,
		96
	),
	(
		1257,
		'Quem era o guitarrista da banda "The Doors"?',
		15,
		96
	),
	(
		1258,
		'Quem era o vocalista e vocalista da banda de rock REM?',
		15,
		96
	),
	(
		1259,
		'Quem escreveu a composição musical, "Rhapsody In Blue"?',
		15,
		96
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1260,
		'Quem executou o solo de guitarra no hit de Michael Jackson "Beat It"?',
		15,
		96
	),
	(
		1261,
		'Quem gravou o álbum chamado "Down to the Moon" em 1986?',
		15,
		96
	),
	(
		1262,
		'Quem teve sucessos nos anos 70 com as músicas "Lonely Boy" e "Never Let Her Slip Away"?',
		15,
		96
	),
	(
		1263,
		'Quem teve um hit de 1973 com a música ''Hocus Pocus''?',
		15,
		96
	),
	(
		1264,
		'Quem teve um hit de 1976 com a música ''You Make Me Feel Like Dancing''?',
		15,
		96
	),
	(
		1265,
		'Quem é o artista do recente álbum Uncanny Valley?',
		15,
		96
	),
	(
		1266,
		'Quem é o principal letrista da banda canadense de rock progressivo Rush?',
		15,
		96
	),
	(
		1268,
		'Quem é o vocalista do The Lumineers?',
		15,
		96
	),
	(
		1269,
		' No webcomic "Ava''s Demon", em que pecado "Nevy Nervine" é baseado?',
		20,
		97
	),
	(
		1270,
		'Em 1978, Superman se uniu a qual celebridade para derrotar uma invasão alienígena?',
		20,
		97
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1271,
		'Em qual Homestuck Update foi lançado o [S] Game Over?',
		20,
		97
	),
	(
		1272,
		'Em que ano foi a primeira San Diego Comic-Con?',
		20,
		97
	),
	(
		1273,
		'Em que ano foi lançada a primeira HQ de The Walking Dead?',
		20,
		97
	),
	(
		1274,
		'Mais conhecido pelo apelido de Logan, qual é o nome de batismo de Wolverine?',
		20,
		97
	),
	(
		1275,
		'Na série Homestuck, qual é o nome alternativo para o Reino das Luzes?',
		20,
		97
	),
	(
		1276,
		'Nos quadrinhos "Archie", quem foi a primeira namorada de Jughead?',
		20,
		97
	),
	(
		1277,
		'Quais são as Três Virtudes do Bionicle?',
		20,
		97
	),
	(
		1278,
		'Quais são os nomes dos dois "trolls fãs da Canon" em "Homestuck"?',
		20,
		97
	),
	(
		1279,
		'Qual herói pulp fez aparições nos quadrinhos Hellboy e BPRD antes de obter seu próprio spin-off?',
		20,
		97
	),
	(
		1280,
		'Qual é a cor real do cabelo da versão em quadrinhos mainstream (Terra-616) do Demolidor?',
		20,
		97
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1281,
		'Quando Batman vasculha as salas de bate-papo online, que pseudônimo ele usa?',
		20,
		97
	),
	(
		1282,
		'Em "Homestuck", o "Reino das Trevas" também é conhecido como?',
		10,
		98
	),
	(
		1283,
		'Em "Homestuck", qual é o guardião de Dave Strider?',
		10,
		98
	),
	(
		1284,
		'Em Black Hammer, que cidade os heróis salvaram do Anti-Deus?',
		10,
		98
	),
	(
		1285,
		'Este super-herói da Marvel é frequentemente chamado de "O homem sem medo".',
		10,
		98
	),
	(
		1286,
		'O principal protagonista de seis anos de idade em Calvin e Hobbes tem o nome de que teólogo?',
		10,
		98
	),
	(
		1287,
		'Qual crossover do universo foi introduzido na edição de quadrinhos #247 de "Sonic the Hedgehog"?',
		10,
		98
	),
	(
		1288,
		'Qual dessas equipes de super-heróis aparece nos quadrinhos Invincible?',
		10,
		98
	),
	(
		1289,
		'Qual é a raça do pai de Invincible?',
		10,
		98
	),
	(
		1290,
		'Qual é o primeiro nome completo da babá em Calvin e Hobbes?',
		10,
		98
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1291,
		'Quando a Marvel Comics foi fundada?',
		10,
		98
	),
	(
		1292,
		'Quem é o criador da série de quadrinhos "The Walking Dead"?',
		10,
		98
	),
	(
		1293,
		' Na história em quadrinhos "Sonic the Hedgehog", quem foi o criador do Roboticizer?',
		15,
		99
	),
	(
		1294,
		'Em Calvin and Hobbes, qual é o nome do coelho de pelúcia de Susie?',
		15,
		99
	),
	(
		1295,
		'Em Calvin e Hobbes, qual é o nome do diretor da escola de Calvin?',
		15,
		99
	),
	(
		1296,
		'Em Calvin e Hobbes, qual é o nome do namorado da babá?',
		15,
		99
	),
	(
		1297,
		'Em qual edição da história em quadrinhos "Sonic the Hedgehog" Scourge the Hedgehog fez sua primeira aparição?',
		15,
		99
	),
	(
		1298,
		'Encontrado no universo fictício da Marvel Comics, qual é o nome do metal quase indestrutível que reveste os ossos e garras de Wolverine?',
		15,
		99
	),
	(
		1299,
		'Na Marvel Comics, Taurus é o fundador e líder de qual organização criminosa?',
		15,
		99
	),
	(
		1300,
		'Na reinicialização da DC Comics 2016, Rebirth, qual velocista escapou da Speed Force depois de ter sido apagado da existência?',
		15,
		99
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1301,
		'No universo Hellboy, quem fundou o BPRD?',
		15,
		99
	),
	(
		1302,
		'No universo pré-Super Genesis da história em quadrinhos "Sonic the Hedgehog", qual era o nome do irmão de Sally Acorn?',
		15,
		99
	),
	(
		1303,
		'Nos quadrinhos, qual personagem do Sonic assumiu o comando da Dark Legion após o assassinato de Luger?',
		15,
		99
	),
	(
		1304,
		'O tigre de pelúcia em Calvin e Hobbes recebeu o nome de qual filósofo?',
		15,
		99
	),
	(
		1305,
		'Qual ajudante do "Arqueiro Verde" geralmente usa um boné de beisebol?',
		15,
		99
	),
	(1306, 'Qual o nome dos pais do Batman?', 15, 99),
	(
		1307,
		'Qual é a designação dada ao Universo Cinematográfico Marvel?',
		15,
		99
	),
	(
		1308,
		'Qual é a fraqueza dos vampiros americanos (American Vampire de Scott Snyder)?',
		15,
		100
	),
	(
		1309,
		'Qual é o nome da história em quadrinhos sobre um menino e um tigre que na verdade é um bicho de pelúcia?',
		15,
		100
	),
	(
		1310,
		'Qual é o nome do personagem principal do webcomic Gunnerkrigg Court de Tom Siddell?',
		15,
		100
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1311,
		'Qual é o nome verdadeiro do Magneto "Mestre do Magnetismo"?',
		15,
		100
	),
	(
		1312,
		'Qual é o sobrenome do personagem Homestuck Gamzee?',
		15,
		100
	),
	(
		1313,
		'Qual é o verdadeiro nome de Hellboy?',
		15,
		100
	),
	(1314, 'Quem criou Ultron da Terra-616?', 15, 100),
	(
		1315,
		'Quem foi a inspiração para Cuthbert Calculus na série Tintim?',
		15,
		100
	),
	(
		1316,
		'Quem foi o primeiro Vampiro Americano (American Vampire de Scott Snyder)?',
		15,
		100
	),
	(
		1317,
		'Quem é a segunda pessoa a assumir o manto de Night Owl na história em quadrinhos de Watchmen?',
		15,
		100
	),
	(
		1318,
		'Antes de trabalhar na Wizards of the Coast, "Mark Rosewater" foi roteirista de qual programa?',
		20,
		101
	),
	(
		1319,
		'Como é chamada a vida após a morte dos Klingon?',
		20,
		101
	),
	(
		1320,
		'De qual país o YouTuber "SinowBeats" é originário?',
		20,
		101
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1321,
		'Em "Donkey Kong Country", por que Donkey Kong quer saber o segredo do coco cristalino?',
		20,
		101
	),
	(
		1322,
		'Em "It''s Always Sunny in Philadelphia", qual era o nome da personalidade de luta livre de Frank?',
		20,
		101
	),
	(
		1323,
		'Em "Star Trek", de que é feita a delicadeza Klingon de "gagh"?',
		20,
		101
	),
	(
		1324,
		'Em "Star Trek", que molho é comumente usado pelos Klingons no pulmão bregit?',
		20,
		101
	),
	(
		1325,
		'Em 2008, o famoso chef britânico Gordon Ramsay acredita que quase morreu depois de sofrer que acidente na Islândia durante as filmagens?',
		20,
		101
	),
	(
		1326,
		'Em Star Trek, qual é o nome do pai de Spock?',
		20,
		101
	),
	(
		1327,
		'Na primeira temporada dos US Kitchen Nightmares, Gordan Ramsay tentou salvar 10 restaurantes diferentes. Quantos acabaram fechando depois?',
		20,
		101
	),
	(
		1328,
		'No programa de TV "Donkey Kong Country", em qual episódio a música "Eddie, Let Me Go Back To My Home" tocou?',
		20,
		101
	),
	(
		1329,
		'O que foi o Reino Unido "Quem Quer Ser um Milionário?" escândalo de trapaça conhecido como?',
		20,
		101
	),
	(
		1330,
		'O tema da popular série de ficção científica "Doctor Who" foi composto por quem?',
		20,
		101
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (2241, 'Qual é o menor país do mundo?', 10, 163),
	(
		1331,
		'Qual ator de The Young Ones também interpretou Lord Flashheart em um episódio de Blackadder II?',
		20,
		101
	),
	(
		1332,
		'Qual dessas vozes não foi uma escolha para a House AI no curta "The Simpsons Treehouse of Horror", House of Whacks?',
		20,
		101
	),
	(
		1333,
		'Qual dos seguintes atores interpretou o Nono Doutor no programa de televisão britânico "Doctor Who"?',
		20,
		102
	),
	(
		1334,
		'Qual era o nome do pato inflável sacrificado à multidão no final do episódio 34 da 18ª temporada do Big Brother?',
		20,
		102
	),
	(
		1335,
		'Qual ex-atriz de Coronation Street já foi apresentadora do British Game Show "Double Your Money"?',
		20,
		102
	),
	(
		1336,
		'Qual foi a data de exibição original do episódio piloto de My Little Pony: Friendship is Magic?',
		20,
		102
	),
	(
		1337,
		'Qual raça gosta de um copo de baghol quente em "Star Trek"?',
		20,
		102
	),
	(
		1338,
		'Qual é o primeiro nome do Dr. Doofenshmirtz?',
		20,
		102
	),
	(
		1339,
		'Quem foi o vencedor da 10ª temporada do "Big Brother"?',
		20,
		102
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1340,
		'Quem interpretou o bebê do sol na série original de Teletubbies?',
		20,
		102
	),
	(
		1341,
		'A série da HBO "Game of Thrones" é baseada em qual série de livros?',
		10,
		103
	),
	(
		1342,
		'A série de vídeos "Psicose" no YouTube foi criada por qual dos seguintes?',
		10,
		103
	),
	(
		1343,
		'Em "Rick And Morty", quem atirou em "Mr. Poopybutthole" no episódio "Total Rickall"?',
		10,
		103
	),
	(
		1344,
		'Em "Star Trek: Voyager", em qual episódio a Voyager estabeleceu comunicação em tempo real com o quartel-general da Frota Estelar?',
		10,
		103
	),
	(
		1345,
		'Em DuckTales, qual é o nome da cidade onde vivem todos os personagens principais?',
		10,
		103
	),
	(
		1346,
		'Em Game of Thrones, qual é o verdadeiro nome de Mindinho?',
		10,
		103
	),
	(
		1347,
		'Em Game of Thrones, que continente fica do outro lado do Mar Estreito de Westeros?',
		10,
		103
	),
	(
		1348,
		'Em que estado da América o Fresh Prince of Bel-Air nasceu e foi criado?',
		10,
		103
	),
	(
		1349,
		'Em que país Cory in the House se passa?',
		10,
		103
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1350,
		'Em Supernatural, qual é o nome dos irmãos de Sam?',
		10,
		103
	),
	(
		1351,
		'Em Two and a Half Men, qual é o nome do filho de Alan Harper?',
		10,
		103
	),
	(
		1352,
		'Grant Gustin interpreta qual super-herói no programa da CW com o mesmo nome?',
		10,
		103
	),
	(
		1353,
		'Guy''s Grocery Games é apresentado por qual apresentador?',
		10,
		103
	),
	(
		1354,
		'Na primeira temporada do drama político da Netflix "House of Cards", que posição governamental Frank Underwood ocupa?',
		10,
		103
	),
	(
		1355,
		'Na série "Rick and Morty", no episódio "Total Rickall", quem era o parasita?',
		10,
		103
	),
	(
		1356,
		'Na série de TV da AMC "The Walking Dead", como são chamados os "zumbis"?',
		10,
		104
	),
	(
		1357,
		'Na série original de TV Star Trek, qual era o nome do meio do capitão James T. Kirk?',
		10,
		104
	),
	(
		1358,
		'Na série Stranger Things, qual é o café da manhã favorito de Eleven?',
		10,
		104
	),
	(
		1359,
		'No desenho animado ''Bob Esponja Calça Quadrada'', o que significava a sigla EVIL?',
		10,
		104
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1360,
		'No programa Community da NBC, cuja frase de efeito era "Pop! Pop!"?',
		10,
		104
	),
	(
		1361,
		'No programa de televisão Breaking Bad, qual é o nome da rua do notório produto de Walter e Jesse?',
		10,
		104
	),
	(
		1362,
		'No programa de TV "Mad Men", qual era o nome de nascimento de Donald Draper?',
		10,
		104
	),
	(
		1363,
		'No programa de TV ''M*A*S*H'', qual era o apelido do cabo Walter O''Reilly?',
		10,
		104
	),
	(
		1364,
		'No show "Futurama" qual é o nome completo de Fry?',
		10,
		104
	),
	(
		1365,
		'No show "Tengen Toppa Gurren Lagann" qual é o nome do personagem que força todos a viver no subsolo?',
		10,
		104
	),
	(
		1366,
		'No show, Doctor Who, o que significa TARDIS?',
		10,
		104
	),
	(
		1367,
		'No universo de Star Trek, de que cor é o sangue vulcano?',
		10,
		104
	),
	(
		1368,
		'O ator britânico David Morrissey interpreta qual papel em "The Walking Dead"?',
		10,
		104
	),
	(
		1369,
		'Qual ator interpreta "Walter White" na série "Breaking Bad"?',
		10,
		104
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1370,
		'Qual desses personagens de "Stranger Things" tem o poder da Telecinesia?',
		10,
		104
	),
	(
		1371,
		'Qual desses personagens do Bojack Horseman é humano?',
		10,
		104
	),
	(
		1372,
		'Qual destes programas da Disney é classificado como anime?',
		10,
		105
	),
	(
		1373,
		'Qual dos seguintes ganhou a primeira temporada do American Idol em 2002?',
		10,
		105
	),
	(
		1374,
		'Qual dos seguintes prêmios Matt Stone e Trey Parker NÃO têm?',
		10,
		105
	),
	(
		1375,
		'Qual empresa tem direitos exclusivos para transmitir os episódios do "The Grand Tour"?',
		10,
		105
	),
	(
		1376,
		'Qual era o nome da bruxa adolescente interpretada por Melisa Joan Hart que mora com suas tias bruxas Hilda e Zelda?',
		10,
		105
	),
	(
		1377,
		'Qual era o nome do policial no desenho animado "Top Cat"?',
		10,
		105
	),
	(
		1378,
		'Qual era o nome do primeiro episódio de Doctor Who a ir ao ar em 1963?',
		10,
		105
	),
	(
		1379,
		'Qual personagem foi interpretado por Dustin Diamond na sitcom ''Saved by the Bell''?',
		10,
		105
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1380,
		'Qual programa é conhecido pelas músicas "You are a Pirate", "Cooking by the Book" e "We Are Number One"?',
		10,
		105
	),
	(
		1381,
		'Qual é o nome do irmão de Chris em "Everybody Hates Chris"?',
		10,
		105
	),
	(
		1382,
		'Qual é o nome do planeta de onde vem o Doutor da série de televisão "Doctor Who"?',
		10,
		105
	),
	(
		1383,
		'Quando Donkey Kong morreu no episódio "It''s a Wonderful Life" de "Donkey Kong Country", quem era seu anjo da guarda?',
		10,
		105
	),
	(
		1384,
		'Quando o programa de TV Rick and Morty foi ao ar pela primeira vez no Adult Swim?',
		10,
		105
	),
	(
		1385,
		'Quantas temporadas "Stargate SG-1" teve?',
		10,
		105
	),
	(
		1386,
		'Quantas temporadas teve o programa de televisão de ficção científica "Stargate Atlantis"?',
		10,
		105
	),
	(
		1387,
		'Quantas temporadas teve o programa de televisão de ficção científica "Stargate Universe"?',
		10,
		105
	),
	(
		1388,
		'Que game show da Nickelodeon apresentava uma casa no set que os competidores vasculhavam para encontrar objetos escondidos?',
		10,
		106
	),
	(
		1389,
		'Que programa de TV é sobre um avô arrastando seu neto em aventuras?',
		10,
		106
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1390,
		'Que sitcom da NBC já viu dois de seus personagens tentarem lançar a NBC em uma sitcom sobre nada?',
		10,
		106
	),
	(
		1391,
		'Quem foi o primeiro ator a interpretar "The Doctor" em "Doctor Who"?',
		10,
		106
	),
	(
		1392,
		'Quem ganhou o Big Brother 2014 Reino Unido?',
		10,
		106
	),
	(
		1393,
		'Quem interpretou a garçonete no esboço Spam de "Monty Python''s Flying Circus"?',
		10,
		106
	),
	(
		1394,
		'Quem é a estrela da série Breaking Bad da AMC?',
		10,
		106
	),
	(
		1395,
		' Qual faixa de "Massive Attack" é usada para o tema de "House"?',
		15,
		107
	),
	(
		1396,
		'"The A Team" foi ao ar pela primeira vez nos EUA e no Reino Unido em que ano?',
		15,
		107
	),
	(
		1397,
		'Barão Silas Greenback é o arqui-inimigo de qual herói de desenho animado?',
		15,
		107
	),
	(
		1398,
		'Cesar Romero interpretou qual vilão icônico do Batman do programa de TV dos anos 1960?',
		15,
		107
	),
	(
		1399,
		'Dee de "It''s Always Sunny in Philadelphia" namorou todos os seguintes caras, EXCETO',
		15,
		107
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1400,
		'Dos 3 Tots na Tots TV, quem fala francês na versão britânica e espanhol na versão americana?',
		15,
		107
	),
	(
		1401,
		'Em "Os Simpsons", qual é o verdadeiro nome do "Cara dos Quadrinhos"?',
		15,
		107
	),
	(
		1402,
		'Em "Star Trek", qual é a Primeira Regra de Aquisição dos Ferengi?',
		15,
		107
	),
	(
		1403,
		'Em "The Big Bang Theory", qual é o apelido de Howard Wolowitz em World of Warcraft?',
		15,
		107
	),
	(
		1404,
		'Em Battlestar Galactica (2004), qual é o nome do Presidente das Doze Colônias?',
		15,
		107
	),
	(
		1405,
		'Em Breaking Bad, as iniciais WW referem-se a qual das seguintes opções?',
		15,
		107
	),
	(
		1406,
		'Em Game of Thrones, qual é o nome da espada de Jon Snow?',
		15,
		107
	),
	(
		1407,
		'Em que ano terminou a série de televisão britânica "The Bill"?',
		15,
		107
	),
	(
		1408,
		'Na série de TV "Person of Interest", quem interpreta o personagem "Harold Finch"?',
		15,
		107
	),
	(
		1409,
		'Na série original de Doctor Who (1963), o cachecol do quarto médico Tom Baker tinha quanto tempo?',
		15,
		107
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1410,
		'No episódio de Bob Esponja Calça Quadrada, "Sobrevivência dos Idiotas", Bob Esponja chamou Patrick de qual apelido?',
		15,
		108
	),
	(
		1411,
		'No programa "The Office", com quem Michael Scott acaba ficando?',
		15,
		108
	),
	(
		1412,
		'No programa Community da NBC, qual era o nome verdadeiro de Star Burns?',
		15,
		108
	),
	(
		1413,
		'No programa da Netflix, Stranger Things, que música Will cantaria para si mesmo quando estivesse desaparecido?',
		15,
		108
	),
	(
		1414,
		'No programa de televisão "Lazy Town", quem é o ator de Robbie Rotten?',
		15,
		108
	),
	(
		1415,
		'No programa de televisão Sci-Fi Doctor Who, quem interpreta o Décimo Doutor?',
		15,
		108
	),
	(
		1416,
		'No universo de Doctor Who, quantas vezes um senhor do tempo pode se regenerar normalmente?',
		15,
		108
	),
	(
		1417,
		'O filme de ficção ''Rochelle, Rochelle'' aparece em qual sitcom?',
		15,
		108
	),
	(
		1418,
		'O primeiro desenho animado CGI de meia hora, ReBoot, foi ao ar em que ano?',
		15,
		108
	),
	(
		1419,
		'Qual desses programas de televisão faz todo mundo olhar embaixo da cadeira?',
		15,
		108
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1420,
		'Qual dos seguintes nomes de Autobot nos filmes de Michael Bay NÃO era um nome para um Transformer no desenho original dos anos 80?',
		15,
		108
	),
	(
		1421,
		'Qual dos seguintes não foi um ator/atriz do programa de televisão americano "Saturday Night Live" na 42ª temporada?',
		15,
		108
	),
	(
		1422,
		'Qual era o nome do macaco de estimação de Ross em "Friends"?',
		15,
		108
	),
	(
		1423,
		'Qual era o nome original da Nickelodeon?',
		15,
		108
	),
	(
		1424,
		'Qual escritor britânico escreveu para Doctor Who e Sherlock?',
		15,
		108
	),
	(
		1425,
		'Qual personagem a dubladora Tara Strong NÃO dubla?',
		15,
		108
	),
	(
		1426,
		'Qual personalidade do boxe foi um dos apresentadores no renascimento de It''s a Knockout em 1999?',
		15,
		109
	),
	(
		1427,
		'Qual é o cenário do show "Parks and Recreation"?',
		15,
		109
	),
	(
		1428,
		'Qual é o nome do spinoff de "Flash" e "Arrow" apresentando uma equipe de personagens que apareceram em ambos os programas?',
		15,
		109
	),
	(
		1429,
		'Qual é o sobrenome do personagem Daryl no programa da AMC, The Walking Dead?',
		15,
		109
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1430,
		'Quantas temporadas durou o programa de TV "Donkey Kong Country"?',
		15,
		109
	),
	(
		1431,
		'Quanto tempo durou a seqüência de vitórias de Ken Jennings no Jeopardy?',
		15,
		109
	),
	(
		1432,
		'Que ator retrata Hogan "Wash" Washburne no programa de TV Firefly?',
		15,
		109
	),
	(
		1433,
		'Que raça de cachorro é "Scooby Doo"?',
		15,
		109
	),
	(
		1434,
		'Quem cantou a música tema do programa de TV ''Rawhide''?',
		15,
		109
	),
	(
		1435,
		'Quem co-fundou o canal YouTube Let''s Play "Game Grumps" ao lado do animador Egoraptor da Newgrounds?',
		15,
		109
	),
	(
		1436,
		'Quem era o rival de Firestorm durante a execução original de UK Robot Wars?',
		15,
		109
	),
	(
		1437,
		'Quem foi a estrela da série de TV "24"?',
		15,
		109
	),
	(
		1438,
		'"Engraçadinho!" é um jogo Famicom japonês que usa uma expansão de chip de som no cartucho. Como isso é chamado?',
		20,
		110
	),
	(
		1439,
		'"Exile" e "Revelations" foram a terceira e quarta parcelas de qual série de jogos para PC?',
		20,
		110
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1440,
		'"Strangereal" é um mundo fictício parecido com a Terra para qual série de jogos?',
		20,
		110
	),
	(
		1441,
		'A criação do Entertainment Software Ratings Board (ESRB) é frequentemente associada ao Mortal Kombat e a qual videogame FMV?',
		20,
		110
	),
	(
		1442,
		'A trepadeira no Minecraft foi o resultado de um bug durante a implementação de qual criatura?',
		20,
		110
	),
	(
		1443,
		'Antes de Super Smash Bros. conter personagens da Nintendo, como era conhecido internamente?',
		20,
		110
	),
	(
		1444,
		'Com qual desses personagens em "Undertale" o jogador NÃO pode sair?',
		20,
		110
	),
	(
		1445,
		'De acordo com a tradição de "Starbound", o que o "Colony Deed" faz quando é colocado no chão?',
		20,
		110
	),
	(
		1446,
		'De acordo com Toby Fox, qual foi o método para criar a música inicial de Megalovânia?',
		20,
		110
	),
	(
		1447,
		'Durante o desenvolvimento de "Super Mario World", a sela rígida de Yoshi era originalmente qual destas?',
		20,
		110
	),
	(
		1448,
		'Em "Call Of Duty: Zombies", "Richtofen" está de posse de dois frascos de sangue cheios pertencentes a quem?',
		20,
		110
	),
	(
		1449,
		'Em "Call Of Duty: Zombies", qual cena de abertura do mapa mostra "Richtofen" matando outra versão de si mesmo?',
		20,
		110
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1450,
		'Em "Final Fantasy VI", qual é o nome do (convocado) ataque mais fraco de Gilgamesh?',
		20,
		110
	),
	(
		1451,
		'Em "Halo", qual é o nome do planeta que a Instalação 04 orbita?',
		20,
		110
	),
	(
		1452,
		'Em "Need for Speed III: Hot Pursuit", qual é o nome do carro fictício?',
		20,
		110
	),
	(
		1453,
		'Em "Pokémon Sun and Moon", a Equipe Skull assumiu qual cidade?',
		20,
		111
	),
	(
		1454,
		'Em "Starbound", qual é o HP máximo do monstro "Punchy"?',
		20,
		111
	),
	(
		1455,
		'Em "Super Mario Sunshine", como você desbloqueia o nível "Corona Mountain"?',
		20,
		111
	),
	(
		1456,
		'Em "Team Fortress 2", qual é a provocação mais rápida que pode ser executada?',
		20,
		111
	),
	(
		1457,
		'Em "Team Fortress 2", quanta saúde um batedor tem quando curado?',
		20,
		111
	),
	(
		1458,
		'Em "The Binding of Isaac", qual item mata instantaneamente a mamãe e o coração da mamãe?',
		20,
		111
	),
	(
		1459,
		'Em "The Witness", quantos lasers devem ser ativados para entrar na área da montanha?',
		20,
		111
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1460,
		'Em 2004, qual(is) pessoa(s) criou(m) o "Roblox"?',
		20,
		111
	),
	(
		1461,
		'Em Animal Crossing: New Leaf, qual dessas pinturas da Redd''s Art Gallery é sempre genuína?',
		20,
		111
	),
	(
		1462,
		'Em Counter Strike: Global Offensive, qual é o código implantado no C4 quando os terroristas plantam a bomba?',
		20,
		111
	),
	(
		1463,
		'Em Geometry Dash, o que é o nível 13?',
		20,
		111
	),
	(
		1464,
		'Em Left 4 Dead, qual é o sobrenome do personagem Bill?',
		20,
		111
	),
	(
		1465,
		'Em Monster Hunter Generations, quais dessas artes de caçador são exclusivas da Longsword?',
		20,
		111
	),
	(
		1466,
		'Em que ano foi lançado o jogo "Eliminator"?',
		20,
		111
	),
	(
		1467,
		'Em Terraria, a qual debuff o feitiço ankh não fornece imunidade?',
		20,
		111
	),
	(
		1468,
		'Em World of Warcraft, qual instância de raid apresenta um evento de xadrez?',
		20,
		111
	),
	(
		1469,
		'Em Xenoblade Chronicles X, qual classe tem um rifle de precisão como arma principal?',
		20,
		112
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1470,
		'GoldenEye 007 no Nintendo 64 foi planejado para permitir que você jogue como todos os atores de Bond anteriores, com exceção de quem?',
		20,
		112
	),
	(
		1471,
		'Meryl Silverburgh, uma personagem de videogame da série Metal Gear, era originalmente uma personagem de qual jogo?',
		20,
		112
	),
	(
		1472,
		'Na franquia "Devil May Cry", qual jogo é cronologicamente o primeiro?',
		20,
		112
	),
	(
		1473,
		'Na National Pokedex, que número é Porygon-Z?',
		20,
		112
	),
	(
		1474,
		'Na série "Ace Attorney", quem foi o verdadeiro responsável pela falsificação do relatório da autópsia do incidente central do IS-7?',
		20,
		112
	),
	(
		1475,
		'Na série "Halo", qual é o nome da raça de alienígenas que os humanos chamam de "Grunts"?',
		20,
		112
	),
	(
		1476,
		'Na série Animal Crossing, qual flor é erroneamente chamada de "Escada de Jacob"?',
		20,
		112
	),
	(
		1477,
		'Na série Fallout, em que data aconteceu a Grande Guerra?',
		20,
		112
	),
	(
		1478,
		'Na série Kingdom Hearts, qual não é um chefe opcional contra o qual você pode lutar?',
		20,
		112
	),
	(
		1479,
		'Na série Mario Kart, qual jogo introduziu a mecânica "Shield Drifting"?',
		20,
		112
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1480,
		'Na série PAYDAY, onde Dallas começou sua carreira criminosa?',
		20,
		112
	),
	(
		1481,
		'Na série Pokémon, qual é a habilidade oculta de Palkia?',
		20,
		112
	),
	(
		1482,
		'Na série SHMUP, "Gradius", qual é o nome da facção antagonista contra a qual você luta?',
		20,
		112
	),
	(
		1483,
		'Na série Super Mario Bros., qual é o nome científico de Yoshi?',
		20,
		112
	),
	(
		1484,
		'Na tradição de Diablo, esse mal menor surgiu de uma das sete cabeças de Tathamet e era conhecido como a Donzela da Angústia.',
		20,
		112
	),
	(
		1485,
		'Na tradição de World of Warcraft, qual dos seguintes é conhecido como o Deus das Aranhas nas crenças dos loa dos trolls?',
		20,
		113
	),
	(
		1486,
		'Na trilogia Lego Island, quem ensinou Pepper Roni a ler?',
		20,
		113
	),
	(
		1487,
		'Na versão Gamecube de "Resident Evil" qual documento de texto está aberto no monitor do computador no Visual Data Room?',
		20,
		113
	),
	(
		1488,
		'No "Super Mario Bros." original, qual é a aceleração de Mario se ele estiver em queda livre?',
		20,
		113
	),
	(
		1489,
		'No "Toontown Online" da Disney, qual dessas espécies não estava disponível como Toon?',
		20,
		113
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1490,
		'No cânone do Team Fortress 2, o que Shakespeare NÃO inventou?',
		20,
		113
	),
	(
		1491,
		'No DOOM original (1993), qual das opções a seguir NÃO é um código de trapaça?',
		20,
		113
	),
	(
		1492,
		'No Easter Egg "Little Lost Girl" em Call of Duty: Black Ops II, qual é a última etapa necessária para a conquista?',
		20,
		113
	),
	(
		1493,
		'No jogo "Overwatch", qual citação o herói "McCree" NÃO diz ao usar sua habilidade flashbang?',
		20,
		113
	),
	(
		1494,
		'No jogo "The Sims", com quantos Simoleons cada família começa?',
		20,
		113
	),
	(
		1495,
		'No jogo Call of Duty, qual é a última fase em que você joga como um soldado americano?',
		20,
		113
	),
	(
		1496,
		'No jogo Danganronpa: Happy Trigger Havoc, a habilidade final do personagem Aoi Asahina é qual?',
		20,
		113
	),
	(
		1497,
		'No jogo Enter the Gungeon, qual desses não é um personagem jogável?',
		20,
		113
	),
	(
		1498,
		'No jogo Nuclear Throne, que organização persegue o personagem do jogador ao longo do jogo?',
		20,
		113
	),
	(
		1499,
		'No jogo Warframe, qual Mastery Rank você precisa ter para construir o Tigris Prime?',
		20,
		113
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1500,
		'No mapa "Origins" de "Call Of Duty: Zombies", onde está localizado "Stamin-Up"?',
		20,
		113
	),
	(
		1501,
		'No Nintendo Game Splatoon 2, qual é o nome de tela de Marina?',
		20,
		114
	),
	(
		1502,
		'No título do jogo "Luigi''s Mansion", qual é a única letra que não aparece com um par de olhos?',
		20,
		114
	),
	(
		1503,
		'No videogame "Metal Gear Solid", o que Revolver Ocelot considerou a melhor arma já feita?',
		20,
		114
	),
	(
		1504,
		'O Base Stat Total do Pokémon não muda quando ele evolui?',
		20,
		114
	),
	(
		1505,
		'O dublador de qual personagem de Portal 2 não era ator de TV ou cinema antes do jogo?',
		20,
		114
	),
	(
		1506,
		'O mapa apresentado no Arma 3 chamado "Altis" é baseado em qual ilha grega?',
		20,
		114
	),
	(
		1507,
		'O Meme da Internet "Todas as suas bases pertencem a nós" é baseado na versão mal traduzida em inglês de qual videogame?',
		20,
		114
	),
	(
		1508,
		'O que os videogames No Man''s Sky e Mighty No. 9 têm em comum?',
		20,
		114
	),
	(
		1509,
		'Onde os Terror Fiends são mais comumente encontrados no jogo Nintendo Miitopia?',
		20,
		114
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1510,
		'Por que o personagem Trevor Philips foi dispensado da Força Aérea?',
		20,
		114
	),
	(
		1511,
		'Qual dessas classes de armas NÃO aparece no primeiro jogo Monster Hunter?',
		20,
		114
	),
	(
		1512,
		'Qual desses ambientes do TrackMania NÃO estava no jogo original?',
		20,
		114
	),
	(
		1513,
		'Qual desses jogos NÃO foi desenvolvido por Markus Persson?',
		20,
		114
	),
	(
		2243,
		'Qual é o nome do povo indígena da Nova Zelândia?',
		10,
		163
	),
	(
		1514,
		'Qual desses personagens de Final Fantasy VIII falou principalmente em frases de uma palavra?',
		20,
		114
	),
	(
		1515,
		'Qual desses personagens não era um vilão no Club Penguin?',
		20,
		114
	),
	(
		1516,
		'Qual desses Pokémon da Geração 1 NÃO teve uma evolução na Geração 4?',
		20,
		114
	),
	(
		1517,
		'Qual destes NÃO é um mapa oficial em Counter-Strike: Global Offensive?',
		20,
		115
	),
	(
		1518,
		'Qual destes Pokémon não consegue aprender Surf?',
		20,
		115
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1519,
		'Qual dos seguintes jogos da franquia The Legend of Zelda foi lançado na América do Norte antes do Japão?',
		20,
		115
	),
	(
		1520,
		'Qual dos seguintes jogos da franquia The Legend of Zelda foi lançado no Japão antes da América do Norte?',
		20,
		115
	),
	(
		1521,
		'Qual dos seguintes jogos NÃO foi incluído na Orange Box da Valve?',
		20,
		115
	),
	(
		1522,
		'Qual dos seguintes títulos da Valve não é baseado em um Community Mod?',
		20,
		115
	),
	(
		1523,
		'Qual equipe venceu o evento de convite "Tom Clancy''s Rainbow Six Siege" em fevereiro de 2017 na categoria PC?',
		20,
		115
	),
	(
		1524,
		'Qual era o apelido do modelo original do protagonista de Half-Life, Gordon Freeman?',
		20,
		115
	),
	(
		1525,
		'Qual era o nome da namorada humana original de Sonic the Hedgehog?',
		20,
		115
	),
	(
		1526,
		'Qual era o nome do herói do videogame animado dos anos 80 ''Dragon''s Lair''?',
		20,
		115
	),
	(
		1527,
		'Qual era o nome do jogo criado por Masahiro Sakurai e Satoru Iwata que eventualmente evoluiria para "Super Smash Bros."?',
		20,
		115
	),
	(
		1528,
		'Qual foi a primeira aparição de qual personagem do Touhou Project foi como um midboss no oitavo jogo, Imperishable Night?',
		20,
		115
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1529,
		'Qual foi o codinome dado a Sonic the Hedgehog 4 durante seu desenvolvimento?',
		20,
		115
	),
	(
		1530,
		'Qual foi o primeiro dispositivo de jogo portátil do mundo?',
		20,
		115
	),
	(
		1531,
		'Qual foi o primeiro mapa de "Call Of Duty: Zombies" dirigido por Jason Blundell?',
		20,
		115
	),
	(
		1532,
		'Qual foi o primeiro videogame com classificação M desenvolvido pela Squaresoft/Square Enix?',
		20,
		115
	),
	(
		1533,
		'Qual foi o primeiro videogame do mundo?',
		20,
		116
	),
	(
		1534,
		'Qual jogo da série "Dark Souls" o jogador joga como "Ashen One"?',
		20,
		116
	),
	(
		1535,
		'Qual jogo da série "Monster Hunter" introduziu a arma "Insect Glaive"?',
		20,
		116
	),
	(
		1536,
		'Qual jogo da série "Monster Hunter" introduziu o monstro "Gobul"?',
		20,
		116
	),
	(
		1537,
		'Qual jogo de Kingdom Hearts apresentou o elenco de "The World Ends With You"?',
		20,
		116
	),
	(
		1538,
		'Qual jogo de souls não foi dirigido por Hidetaka Miyazaki?',
		20,
		116
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1539,
		'Qual jogo era exclusivo do Dreamcast?',
		20,
		116
	),
	(
		1540,
		'Qual linguagem de programação foi usada para criar o jogo "Minecraft"?',
		20,
		116
	),
	(
		1541,
		'Qual ocupação John Tanner, o principal protagonista de Driver and Driver 2, teve antes de se tornar um policial disfarçado?',
		20,
		116
	),
	(
		1542,
		'Qual personagem, no jogo "Morenatsu", tem o maior número de finais possíveis para o seu percurso, num total de quatro finais diferentes?',
		20,
		116
	),
	(
		1543,
		'Qual série de jogos inclui "The Diabolical Box" e "The Curious Village"?',
		20,
		116
	),
	(
		1544,
		'Qual variante do MP5 é representada no Counter-Strike 1.6?',
		20,
		116
	),
	(
		1545,
		'Qual videogame foi recolhido por conter um episódio oculto e jogável de South Park?',
		20,
		116
	),
	(
		1546,
		'Qual videogame retrô foi lançado primeiro?',
		20,
		116
	),
	(
		1547,
		'Qual é a música tema principal de "Sonic Adventure 2"?',
		20,
		116
	),
	(
		1548,
		'Qual é a patente militar do protagonista "Nomad" em "Crysis"?',
		20,
		116
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1549,
		'Qual é a velocidade mais rápida possível no Trackmania²: Stadium?',
		20,
		117
	),
	(
		1550,
		'Qual é o mundo natal dos Elites de Halo?',
		20,
		117
	),
	(
		1551,
		'Qual é o nome da espécie exótica introduzida em Shadow the Hedgehog (2005)?',
		20,
		117
	),
	(
		1552,
		'Qual é o nome do vírus que infectou Nova York em Tom Clancy''s The Division?',
		20,
		117
	),
	(
		1553,
		'Qual é o nome verdadeiro de "Warhead" no jogo Sega Genesis "Vectorman"?',
		20,
		117
	),
	(
		1554,
		'Qual é o plano de existência em "Magic the Gathering" de 1997 da MicroProse?',
		20,
		117
	),
	(
		1555,
		'Qual é o quarto chefe do videogame de 1997 "Crash Bandicoot 2: Cortex Strikes Back"?',
		20,
		117
	),
	(
		1556,
		'Quando a Valve Corporation foi fundada?',
		20,
		117
	),
	(
		1557,
		'Quando foi lançado o primeiro "Half-Life"?',
		20,
		117
	),
	(
		1558,
		'Quando foi lançado o primeiro título de Call of Duty?',
		20,
		117
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1559,
		'Quando o Pokemon GO foi lançado na América do Norte?',
		20,
		117
	),
	(
		1560,
		'Quando o Steam foi lançado pela primeira vez?',
		20,
		117
	),
	(
		1561,
		'Quantas cópias do notório jogo ET para o Atari 2600 o Atari acabou vendendo?',
		20,
		117
	),
	(
		1562,
		'Quantas pessoas você pode recrutar no jogo Suikoden em uma única jogada?',
		20,
		117
	),
	(
		1563,
		'Quanto tempo duram todas as cenas de Metal Gear Solid 4 (PS3, 2008) combinadas?',
		20,
		117
	),
	(
		1564,
		'Quanto tempo durou o recorde mundial de velocidade do "Half-Life" da Valve Software, feito em 2014.',
		20,
		117
	),
	(
		1565,
		'Quantos ases podem ser derrubados em "Ace Combat Zero: The Belkan War"?',
		20,
		118
	),
	(
		1566,
		'Quantos canais de voz o Nintendo Entertainment System suporta nativamente?',
		20,
		118
	),
	(
		1567,
		'Quantos canais de voz o Super Nintendo Entertainment System suporta?',
		20,
		118
	),
	(
		1568,
		'Quantos monstros totais aparecem em Monster Hunter Generations?',
		20,
		118
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1569,
		'Quantos parceiros você pode obter em Paper Mario: The Thousand-Year Door?',
		20,
		118
	),
	(
		1570,
		'Quantos personagens jogáveis existem em Super Smash Bros. para Nintendo 3DS e Wii U?',
		20,
		118
	),
	(
		1571,
		'Que animal está no pijama de Link em The Legend of Zelda: The Wind Waker?',
		20,
		118
	),
	(
		1572,
		'Que dispositivo permite que Tracer manipule seu próprio tempo no jogo "Overwatch"?',
		20,
		118
	),
	(
		1573,
		'Quem é a vítima mencionada no segundo incidente KG-8, em Investigações do advogado Ace, Caso 4?',
		20,
		118
	),
	(
		1574,
		' Em Pokémon, a habilidade Wonder Guard é exclusiva de qual Pokémon?',
		10,
		119
	),
	(
		1575,
		' Em qual geração de Pokémon o chamado “Método Masuda” apareceu pela primeira vez?',
		10,
		119
	),
	(
		1576,
		' Qual Ultimate tem Makoto Naegi, protagonista de Danganronpa: Trigger Happy Havoc?',
		10,
		119
	),
	(
		1577,
		' Qual é o nome de uma franquia popular que inclui colocar blocos e sobreviver em um mundo aberto?',
		10,
		119
	),
	(
		1578,
		'"Minecraft" saiu da versão beta em 2011 durante uma convenção realizada em qual cidade?',
		10,
		119
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1579,
		'"The Potato Sack" foi uma coleção de jogos independentes lançados no Steam em 2011 como uma promoção para qual jogo?',
		10,
		119
	),
	(
		1580,
		'A pistola inicial da equipe Terrorist em uma partida competitiva de Counter Strike: Global Offensive é o quê?',
		10,
		119
	),
	(
		1581,
		'A Valve Corporation é uma desenvolvedora de videogames americana localizada em qual cidade?',
		10,
		119
	),
	(
		1582,
		'Blinky, Pinky, Inky e Clyde são personagens de qual videogame clássico?',
		10,
		119
	),
	(
		1583,
		'Como se chama a nave principal usada pelo Comandante Shepard na Franquia Mass Effect?',
		10,
		119
	),
	(
		1584,
		'Diz-se que Gordon Freeman queimou e destruiu que comida no microondas da sala de descanso?',
		10,
		119
	),
	(
		1585,
		'Em "Call Of Duty: Zombies", qual é o nome da besta Pack-A-Punched?',
		10,
		119
	),
	(
		1586,
		'Em "Call Of Duty: Zombies", qual é o nome da máquina que atualiza as armas?',
		10,
		119
	),
	(
		1587,
		'Em "Fallout 4" qual facção não está presente no jogo?',
		10,
		119
	),
	(
		1588,
		'Em "Overwatch", qual herói é capaz de cavalgar na parede?',
		10,
		119
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1589,
		'Qual é a cidade de origem do Team Fortress 2 Scout?',
		10,
		120
	),
	(
		1590,
		'Qual é a classe favorita de Gabe Newell em Team Fortress 2?',
		10,
		120
	),
	(
		1591,
		'Qual é a dificuldade mais difícil possível em "Deus Ex: Mankind Divided"?',
		10,
		120
	),
	(
		1592,
		'Qual é a primeira arma que você adquire no Half-Life?',
		10,
		120
	),
	(
		1593,
		'Qual é o nome da atualização "Team Fortress 2", na qual se tornou Free-to-play?',
		10,
		120
	),
	(
		1594,
		'Qual é o nome da Chaos Witch de 4 braços do videogame de 2016 "Battleborn"?',
		10,
		120
	),
	(
		1595,
		'Qual é o nome da cidade em Saints Row The Third?',
		10,
		120
	),
	(
		1596,
		'Qual é o nome da minigun do Team Fortress 2''s Heavy Weapons Guy?',
		10,
		120
	),
	(
		1597,
		'Qual é o nome do aventureiro que você encontra nas minas de Stardew Valley?',
		10,
		120
	),
	(
		1598,
		'Qual é o nome do desenvolvedor do jogo que criou "Call Of Duty: Zombies"?',
		10,
		120
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1599,
		'Qual é o nome do gato falante em Persona 5?',
		10,
		120
	),
	(
		1600,
		'Qual é o nome do personagem principal de "Life is Strange"?',
		10,
		120
	),
	(
		1601,
		'Qual é o nome do principal item de cura em Dark Souls?',
		10,
		120
	),
	(
		1602,
		'Qual é o nome do protagonista principal da franquia "Legend of Zelda"?',
		10,
		120
	),
	(
		1603,
		'Qual é o nome do protagonista principal em "Xenoblade Chronicles"?',
		10,
		120
	),
	(
		1604,
		'Qual é o Número PokéDex Nacional do Pikachu?',
		10,
		120
	),
	(
		1605,
		'Qual é o sobrenome da principal protagonista feminina de Final Fantasy VIII?',
		10,
		121
	),
	(
		1606,
		'Qual é o título da música no menu principal do Halo?',
		10,
		121
	),
	(
		1607,
		'Qual é o título do protagonista dado pelos demônios em DOOM (2016)?',
		10,
		121
	),
	(
		1608,
		'Qual(is) psicopata(s) em Dead Rising 1 deu a você a pequena motosserra?',
		10,
		121
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1609,
		'Quando foi lançado "Luigi''s Mansion 3"?',
		10,
		121
	),
	(
		1610,
		'Quando foi lançado Left 4 Dead 2?',
		10,
		121
	),
	(
		1611,
		'Quando foi lançado o jogo ''Portal 2''?',
		10,
		121
	),
	(
		1612,
		'Quando foi lançado o RPG online de cima para baixo "Space Station 13"?',
		10,
		121
	),
	(
		1613,
		'Quando o Minecraft foi lançado pela primeira vez ao público?',
		10,
		121
	),
	(
		1614,
		'Quantas peças de Tetris de formas diferentes existem?',
		10,
		121
	),
	(
		1615,
		'Quantas vezes você lutou contra Gilgamesh em "Final Fantasy 5"?',
		10,
		121
	),
	(
		1616,
		'Quantos blocos de obsidiana são necessários para construir um portal inferior no Minecraft?',
		10,
		121
	),
	(
		1617,
		'Quantos monstros emblemáticos aparecem em Monster Hunter Gernerations?',
		10,
		121
	),
	(
		1618,
		'Que jogo foi usado para anunciar o Steam?',
		10,
		121
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1619,
		'Que tipo de Pokémon é Charizard?',
		10,
		121
	),
	(
		1620,
		'Que videogame gerou polêmica por causa de seu minijogo oculto "Hot Coffee"?',
		10,
		121
	),
	(
		1621,
		'Quem acaba por ser o verdadeiro vencedor na Batalha do Armagedom em Mortal Kombat?',
		10,
		122
	),
	(
		1622,
		'Quem criou a plataforma de distribuição digital Steam?',
		10,
		122
	),
	(
		1623,
		'Quem criou a série "Metal Gear"?',
		10,
		122
	),
	(
		1624,
		'Quem criou o jogo de aventura independente "Night in the Woods"?',
		10,
		122
	),
	(
		1625,
		'Quem foi o dublador de Snake em Metal Gear Solid V: The Phantom Pain?',
		10,
		122
	),
	(1626, 'Quem é o ajudante do Sonic?', 10, 122),
	(
		1627,
		'Quem é o criador da série Super Smash Bros.?',
		10,
		122
	),
	(
		1628,
		'Quem é o criador do projeto Touhou?',
		10,
		122
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1629,
		'Quem é o dublador de Thrall na série de jogos Warcraft?',
		10,
		122
	),
	(
		1630,
		'Quem é o fundador da empresa fictícia "Mann Co" do Team Fortress 2?',
		10,
		122
	),
	(
		1631,
		'Quem é o líder da Irmandade de Nod na série Command and Conquer?',
		10,
		122
	),
	(
		1632,
		'Quem é o líder do Team Instinct em Pokémon Go?',
		10,
		122
	),
	(
		1633,
		'Quem é o líder do Team Mystic em Pokémon Go?',
		10,
		122
	),
	(
		1634,
		'Quem é o líder do Team Valor em Pokémon Go?',
		10,
		122
	),
	(
		1635,
		'Quem é o personagem principal do jogo Half-Life: Opposing Force?',
		10,
		122
	),
	(
		1636,
		'Quem é o principal protagonista de Dead Space?',
		10,
		122
	),
	(
		1637,
		'Quem é o protagonista de Danganronpa 2: Goodbye Despair?',
		10,
		123
	),
	(
		1638,
		'Rincewind do jogo Discworld de 1995 foi dublado por qual membro do Monty Python?',
		10,
		123
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1639,
		'Rocket League é um jogo que apresenta..',
		10,
		123
	),
	(
		1640,
		'Se um "sem mira 360" é uma rotação completa antes de disparar, quantas rotações seria uma "sem mira 1080"?',
		10,
		123
	),
	(
		1641,
		'série de jogos Touhou Project é frequentemente associada a qual gênero?',
		10,
		123
	),
	(
		1642,
		'TF2: Que código o Soldier coloca no teclado da porta em "Meet the Spy"?',
		10,
		123
	),
	(
		1643,
		'Em "Undertale", quantos finais principais existem?',
		10,
		124
	),
	(
		1644,
		'Em "Xenoblade Chronicles 2", qual membro do grupo não pode usar lâminas normais?',
		10,
		124
	),
	(
		1645,
		'Em "Yo! Noid 2", o Noid pode realizar qual movimento especial?',
		10,
		124
	),
	(
		1646,
		'Em CoD: Black Ops III, qual é o nome do antagonista desonesto da IA?',
		10,
		124
	),
	(
		1647,
		'Em Counter-Strike: Global Offensive, como se chama a raridade de skins descontinuadas?',
		10,
		124
	),
	(
		1648,
		'Em Danganronpa: Trigger Happy Havoc, qual é o nome do protagonista?',
		10,
		124
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1649,
		'Em Divinity: Original Sin II, qual é o nome do personagem de origem esquelética?',
		10,
		124
	),
	(
		1650,
		'Em Fallout: New Vegas, em qual desses cassinos você não pode jogar?',
		10,
		124
	),
	(
		1651,
		'Em Final Fantasy XIV, qual é o nome do Deep Dungeon que foi introduzido no pacote de expansão, Heavensward?',
		10,
		124
	),
	(
		1652,
		'Em Grand Theft Auto V, qual era o antigo sobrenome de Michael De Santa?',
		10,
		124
	),
	(
		1653,
		'Em Kingdom Hearts, quantos membros a Organização XIII tem no total?',
		10,
		124
	),
	(
		1654,
		'Em Night In The Woods, onde Gregg trabalha?',
		10,
		124
	),
	(
		1655,
		'Em Pokemon Red & Blue, qual é o nome do HM05?',
		10,
		124
	),
	(
		1656,
		'Em qual empresa Gabe Newell trabalhou antes de fundar a Valve Corporation?',
		10,
		124
	),
	(
		1657,
		'Em qual jogo "Sonic The Hedgehog" fez sua primeira aparição?',
		10,
		124
	),
	(
		1658,
		'Em qual jogo derivado do Mario Waluigi estreou?',
		10,
		124
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1659,
		'Em qual mecanismo de videogame o videogame Quake 2 é executado?',
		10,
		125
	),
	(
		1660,
		'Em qual série de jogos você coleta almas para fortalecê-lo e comprar armas e armaduras?',
		10,
		125
	),
	(
		1661,
		'Em que ano "Metal Gear Solid" foi lançado na América do Norte?',
		10,
		125
	),
	(
		1662,
		'Em que ano foi lançado "Antichamber"?',
		10,
		125
	),
	(
		1663,
		'Em que ano foi lançado o jogo "FTL: Faster Than Light"?',
		10,
		125
	),
	(
		1664,
		'Em que ano foi lançado o jogo Dishonored?',
		10,
		125
	),
	(
		1665,
		'Em que ano foi lançado o jogo Team Fortress 2?',
		10,
		125
	),
	(
		1666,
		'Em que ano foi lançado o primeiro jogo "Mass Effect"?',
		10,
		125
	),
	(
		1667,
		'Em que ano foi lançado Super Mario Bros.?',
		10,
		125
	),
	(
		1668,
		'Em que ano foi revelado o jogo "Overwatch"?',
		10,
		125
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1669,
		'Em que ano Hearthstone foi lançado?',
		10,
		125
	),
	(
		1670,
		'Em que ano League of Legends foi lançado?',
		10,
		125
	),
	(
		1671,
		'Em que ano o Garry''s Mod foi lançado como um título autônomo no serviço de distribuição Steam da Valve?',
		10,
		125
	),
	(
		1672,
		'Em que ano o jogo "Overwatch" entrou no beta fechado?',
		10,
		125
	),
	(
		1673,
		'Em que cidade no futuro alternativo da distopia do Half-Life 2 você começa?',
		10,
		125
	),
	(
		1674,
		'Em que guerra Call Of Duty: Black Ops se baseia?',
		10,
		125
	),
	(
		1675,
		'Em que shopping acontece "Dead Rising"?',
		10,
		126
	),
	(
		1676,
		'Em Rust, quantas Cargas Explosivas Temporizadas são necessárias para destruir uma Escotilha de Escada?',
		10,
		126
	),
	(
		1677,
		'Em Splatoon 2, quem são os membros do Off The Hook?',
		10,
		126
	),
	(
		1678,
		'Em Super Mario Bros., quem informa a Mario que a princesa está em outro castelo?',
		10,
		126
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1679,
		'Em Undertale, qual é o prêmio por responder corretamente?',
		10,
		126
	),
	(
		1680,
		'Em World of Warcraft, a cor padrão da interface do usuário que significa Druida é o quê?',
		10,
		126
	),
	(
		1681,
		'Lanky, Funky e Chunky são personagens de qual série da Nintendo?',
		10,
		126
	),
	(
		1682,
		'League of Legends, DOTA 2, Smite e Heroes of the Storm fazem parte de qual gênero de jogo?',
		10,
		126
	),
	(
		1683,
		'Na franquia de videogame "Halo", como é chamada a principal facção adversária da UNSC?',
		10,
		126
	),
	(
		1684,
		'Na maioria dos videogames FPS, como Counter-Strike, atirar em qual parte do corpo causa o maior dano?',
		10,
		126
	),
	(
		1685,
		'Na série "Hitman", qual é o nome do personagem principal?',
		10,
		126
	),
	(
		1686,
		'Na série "Metal Gear Solid", qual é o nome do irmão de Solid Snake?',
		10,
		126
	),
	(
		1687,
		'Na série Assassin''s Creed, qual era o nome de Desmond Miles dado pela Abstergo?',
		10,
		126
	),
	(
		1688,
		'Na série de videogames "Worms", qual dessas armas é afetada pelo vento?',
		10,
		126
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1689,
		'Na série Half-Life, a arma característica de Gordon Freeman é:',
		10,
		126
	),
	(
		1690,
		'No jogo "Fire Emblem: Shadow Dragon", qual é o nome do protagonista central?',
		10,
		126
	),
	(
		1691,
		'No jogo "Hearthstone", qual é a melhor classificação possível?',
		10,
		127
	),
	(
		1692,
		'No jogo "Overwatch", quais são os nomes dos dois criminosos australianos da facção Junkers?',
		10,
		127
	),
	(
		1693,
		'No jogo Battleblock Theatre, qual era o nome do dublador que dublou o narrador?',
		10,
		127
	),
	(
		1694,
		'No jogo de luta "Skullgirls", qual personagem utiliza uma cadeira dobrável chamada "Hurting" como arma?',
		10,
		127
	),
	(
		1695,
		'No jogo de terror de sobrevivência, "Cry of Fear", qual era o nome do amigo íntimo/possível interesse amoroso de Simon?',
		10,
		127
	),
	(
		1696,
		'No jogo Nintendo DS ''Ghost Trick: Phantom Detective'', qual é o nome do assassino visto no início do jogo?',
		10,
		127
	),
	(
		1697,
		'No jogo Nuclear Throne, qual personagem só pode ser usado em uma jogada com Melting?',
		10,
		127
	),
	(
		1698,
		'No jogo Spyro original, quem é o primeiro vilão?',
		10,
		127
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1699,
		'No Minecraft vanilla, qual dos itens a seguir não pode ser transformado em um bloco?',
		10,
		127
	),
	(
		1700,
		'No Minecraft, quais dois itens devem ser combinados para criar uma tocha?',
		10,
		127
	),
	(
		1701,
		'No primeiro jogo da franquia Sly Cooper, que herança de família Sly Cooper queria roubar de volta?',
		10,
		127
	),
	(
		1702,
		'No PROTÓTIPO 2, quem é referido como "Primário do Tango"?',
		10,
		127
	),
	(
		1703,
		'No videogame "Postal 2", qual é o nome do cachorro do Postal Dude?',
		10,
		127
	),
	(
		1704,
		'No videogame "Team Fortress 2", qual classe é capaz de dar um salto duplo?',
		10,
		127
	),
	(
		1705,
		'No videogame Half-life, que evento deu início ao universo Half-life como conhecemos hoje?',
		10,
		127
	),
	(
		1706,
		'No videogame Half-life, que tipo de força militar dos EUA começa a limpar o Black Mesa Research Facility?',
		10,
		127
	),
	(
		1707,
		'No videogame Overwatch, qual personagem jogável é famoso por dizer "É meio-dia."?',
		10,
		128
	),
	(
		1708,
		'O CEO da Aperture Science, Cave Johnson, é dublado por qual ator americano?',
		10,
		128
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1709,
		'O jogo mais graficamente violento que antecedeu a criação do ESRB (Entertainment Software Rating Board) foi...',
		10,
		128
	),
	(
		1710,
		'O nome da série Metroid vem de quê?',
		10,
		128
	),
	(
		1711,
		'O que significa IWHBYD no crânio na série Halo?',
		10,
		128
	),
	(
		1712,
		'O que Solid Snake usa para se esconder?',
		10,
		128
	),
	(
		1713,
		'Os Khajiit são uma raça de criaturas parecidas com gatos de qual série épica de jogos de RPG, ambientados na terra de Tamriel?',
		10,
		128
	),
	(
		1714,
		'Quais ingredientes são necessários para fazer um bolo no Minecraft?',
		10,
		128
	),
	(
		1715,
		'Quais jogos Grand Theft Auto (GTA) têm a mesma configuração?',
		10,
		128
	),
	(
		1716,
		'Qual das opções a seguir não é uma facção em Tom Clancy''s The Division?',
		10,
		128
	),
	(
		1717,
		'Qual das seguintes armas em "Counter-Strike: Global Offensive" não possui uma função de clique com o botão direito?',
		10,
		128
	),
	(
		1718,
		'Qual dessas raças Starbound tem uma cultura do Velho Oeste?',
		10,
		128
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1719,
		'Qual desses motores de videogame foi feito pela empresa Epic Games?',
		10,
		128
	),
	(
		1720,
		'Qual desses níveis NÃO aparece nas versões de console/PC do jogo "Sonic Generations"?',
		10,
		128
	),
	(
		1721,
		'Qual desses personagens é o mascote da empresa de videogame SEGA?',
		10,
		128
	),
	(
		1722,
		'Qual destas não é uma arma maravilhosa em "Call Of Duty: Zombies"?',
		10,
		128
	),
	(
		1723,
		'Qual destas NÃO é uma classe de jogador no Team Fortress 2?',
		10,
		129
	),
	(
		1724,
		'Qual destes NÃO é o nome de uma gangue rival no videogame Saint''s Row 2?',
		10,
		129
	),
	(
		1725,
		'Qual destes NÃO é um mapa incluído no jogo Counter-Strike: Global Offensive?',
		10,
		129
	),
	(
		1726,
		'Qual destes NÃO é um personagem jogável em "Left 4 Dead"?',
		10,
		129
	),
	(
		1727,
		'Qual destes NÃO é um personagem jogável no videogame Overwatch de 2016?',
		10,
		129
	),
	(
		1728,
		'Qual destes NÃO é um personagem jogável principal em "Grand Theft Auto V"?',
		10,
		129
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1729,
		'Qual destes NÃO é um time disponível no jogo Pokémon Go?',
		10,
		129
	),
	(
		1730,
		'Qual destes NÃO é uma franquia de jogos da Humongous Entertainment?',
		10,
		129
	),
	(
		1731,
		'Qual destes é um tipo de monstro encontrado no Minecraft?',
		10,
		129
	),
	(
		1732,
		'Qual dos seguintes era um mapa que estava no Team Fortress 2 no lançamento?',
		10,
		129
	),
	(
		1733,
		'Qual dos seguintes jogos tem o maior tamanho de mapa?',
		10,
		129
	),
	(
		1734,
		'Qual dos seguintes membros da Elite Four da 6ª Geração de Pokémon era um membro do Team Flare?',
		10,
		129
	),
	(
		1735,
		'Qual dos seguintes nomes é a franquia "Mega Man" conhecida no Japão?',
		10,
		129
	),
	(
		1736,
		'Qual dos seguintes NÃO é um console de jogos da Nintendo?',
		10,
		129
	),
	(
		1737,
		'Qual dos seguintes não é um personagem da série Street Fighter?',
		10,
		129
	),
	(
		1738,
		'Qual dos seguintes não é um personagem do videogame Doki Doki Literature Club?',
		10,
		129
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1739,
		'Qual dos seguintes personagens do jogo "Overwatch" revelou ser homossexual em dezembro de 2016?',
		10,
		130
	),
	(
		1740,
		'Qual dos seguintes tipos de Pokémon estava presente nos jogos originais, vermelho e azul?',
		10,
		130
	),
	(
		1741,
		'Qual empresa criou e desenvolveu o jogo "Overwatch"?',
		10,
		130
	),
	(
		1742,
		'Qual empresa desenvolve a série Rock Band de jogos rítmicos?',
		10,
		130
	),
	(
		1743,
		'Qual era o nome da sequência cancelada de Team Fortress?',
		10,
		130
	),
	(
		1744,
		'Qual era o nome do cancelado projetado pela Blizzard Entertainment que mais tarde se tornaria Overwatch?',
		10,
		130
	),
	(
		1745,
		'Qual era o nome original de Crash Bandicoot?',
		10,
		130
	),
	(
		1746,
		'Qual era o trabalho de Frank West em "Dead Rising"?',
		10,
		130
	),
	(
		1747,
		'Qual foi a data de lançamento de "Grand Theft Auto IV"?',
		10,
		130
	),
	(
		1748,
		'Qual foi o primeiro jogo da série "Battlefield"?',
		10,
		130
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1749,
		'Qual franquia popular de tiro em primeira pessoa (FPS) desenvolveu um jogo de estratégia em tempo real (RTS) baseado em seu universo?',
		10,
		130
	),
	(
		1750,
		'Qual Game Boy da série Game Boy de consoles portáteis de videogame foi lançado primeiro?',
		10,
		130
	),
	(
		1751,
		'Qual ingrediente NÃO é usado para fazer um bolo no Minecraft?',
		10,
		130
	),
	(
		1752,
		'Qual inicial de Pokémon do tipo água foi introduzido na 4ª geração da série?',
		10,
		130
	),
	(
		1753,
		'Qual jogo de Animal Crossing era para o Nintendo Wii?',
		10,
		130
	),
	(
		1754,
		'Qual jogo de Kirby introduziu pela primeira vez as habilidades de cópia?',
		10,
		130
	),
	(
		1755,
		'Qual jogo do Nintendo 64 NÃO tinha o Luigi nele?',
		10,
		131
	),
	(
		1756,
		'Qual jogo do Sonic the Hedgehog originalmente deveria vir junto com o Sonic 3, mas foi cortado pela metade devido a limitações de tempo?',
		10,
		131
	),
	(
		1757,
		'Qual jogo Final Fantasy consistia em um elenco feminino de membros do grupo?',
		10,
		131
	),
	(
		1758,
		'Qual jogo NÃO foi financiado via Crowdfunding?',
		10,
		131
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1759,
		'Qual letra grega representa o logotipo "Half-Life"?',
		10,
		131
	),
	(
		1760,
		'Qual mapa de "Call Of Duty: Zombies" introduziu os "Staffs Of The Ancients"?',
		10,
		131
	),
	(
		1761,
		'Qual membro da Elite Four da primeira geração de Pokémon se tornou o campeão na próxima geração?',
		10,
		131
	),
	(
		1762,
		'Qual membro do Velvet Room não é um personagem jogável em Persona 4 Arena Ultimax?',
		10,
		131
	),
	(
		1763,
		'Qual missão "Fallout: New Vegas" NÃO tem o nome de uma música da vida real?',
		10,
		131
	),
	(
		1764,
		'Qual nacionalidade é D.Va de Overwatch?',
		10,
		131
	),
	(
		1765,
		'Qual nível mínimo na habilidade Defesa é necessário para equipar Dragon Armor no MMO RuneScape?',
		10,
		131
	),
	(
		1766,
		'Qual personagem da série "Animal Crossing" usa a frase "zip zoom" ao falar com o jogador?',
		10,
		131
	),
	(
		1767,
		'Qual personagem foi apresentado à franquia Super Smash Bros em Super Smash Bros Melee?',
		10,
		131
	),
	(
		1768,
		'Qual Pokémon pode aprender o movimento "Secret Power" subindo de nível?',
		10,
		131
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1769,
		'Qual veículo em PUBG tem a maior velocidade máxima?',
		10,
		131
	),
	(
		1770,
		'Qual é a arma mais cara do Counter-Strike: Global Offensive?',
		10,
		131
	),
	(
		1771,
		' Em Fallout: New Vegas, ao iniciar cada um dos quatro DLCs da campanha, qual deles não possui uma tela de aviso/nível recomendado?',
		15,
		132
	),
	(
		1772,
		' Em World of Warcraft Lore, quatro Deuses Antigos criaram uma criatura gigante e poderosa. Como se chamava?',
		15,
		132
	),
	(
		1773,
		' O jogo para celular "Jetpack Joyride" foi lançado em que ano?',
		15,
		132
	),
	(
		1774,
		' Qual das seguintes não é uma raça jogável no MMORPG Guild Wars 2?',
		15,
		132
	),
	(
		1775,
		' Qual desses campeões do MOBA ''League of Legends'' NÃO é um Yordle?',
		15,
		132
	),
	(
		2315,
		'Qual é a língua oficial do Butão?',
		15,
		168
	),
	(
		1776,
		' Qual era o nome da organização secreta na série Hotline Miami?',
		15,
		132
	),
	(
		1777,
		' Qual é o nome da filha de Joel no jogo, "The Last of Us"?',
		15,
		132
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1778,
		'"Megalovania" de Toby Fox foi usada pela primeira vez onde?',
		15,
		132
	),
	(
		1779,
		'"Rollercoaster Tycoon" foi programado principalmente em...',
		15,
		132
	),
	(
		1780,
		'A cidade de Rockport aparece em qual dos seguintes videogames?',
		15,
		132
	),
	(
		1781,
		'A primeira versão do Blockland saiu em que ano?',
		15,
		132
	),
	(
		1782,
		'A qual gênero o Touhou Project está associado?',
		15,
		132
	),
	(
		1783,
		'Como se chama o jogo final da série "Zero Escape"?',
		15,
		132
	),
	(
		1784,
		'Como são chamados os minúsculos Thwomps em Super Mario World?',
		15,
		132
	),
	(
		1785,
		'Da Cultura Meme, qual jogo do Mario imergiu "Weegee"?',
		15,
		132
	),
	(
		1786,
		'O ''64'' no console Nintendo-64 refere-se a quê?',
		15,
		133
	),
	(
		1787,
		'O bolo retratado na franquia "Portal" da Valve mais se parece com qual tipo de bolo do mundo real?',
		15,
		133
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1788,
		'O mascote original do popular jogo da Nintendo, "Splatoon", seria...',
		15,
		133
	),
	(
		1789,
		'O protagonista do jogo "Cave Story" chama-se',
		15,
		133
	),
	(
		1790,
		'O que aconteceu com Half-Life 2 antes de seu lançamento, que resultou na Valve recomeçar o desenvolvimento do jogo?',
		15,
		133
	),
	(
		1791,
		'O que não é um modo de jogo padrão no Counter-Strike (2000)?',
		15,
		133
	),
	(
		1792,
		'Onde nasceu o personagem Sniper em Team Fortress 2?',
		15,
		133
	),
	(
		1793,
		'Onde se passa "The Legend of Zelda: Majora''s Mask"?',
		15,
		133
	),
	(
		1794,
		'Os direitos da série "Rayman" pertencem a qual empresa?',
		15,
		133
	),
	(
		1795,
		'Planetside original foi lançado na América do Norte em...',
		15,
		133
	),
	(1796, 'Por quem Tetris foi criado?', 15, 133),
	(
		1797,
		'Psych-Horror "Eternal Darkness: Sanity''s Requiem", desenvolvido pela Silicon Knights em 2002, foi publicado por quem e em qual plataforma?',
		15,
		133
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1798,
		'Quais dessas franquias de jogos foram feitas pela Namco?',
		15,
		133
	),
	(
		1799,
		'Quais dos seguintes personagens foram considerados para inclusão em Super Smash Bros. Melee?',
		15,
		133
	),
	(
		1800,
		'Quais são os dois personagens do jogo Undertale que nunca tiveram um relacionamento ou não são parentes?',
		15,
		133
	),
	(
		1801,
		'Quais são os nomes dos Ice Climbers no videogame Ice Climber?',
		15,
		133
	),
	(
		1802,
		'Qual "Perk-A-Cola" em "Call Of Duty: Zombies" foi "retrabalhado" em "Call of Duty: Black Ops II"?',
		15,
		134
	),
	(
		1803,
		'Qual artista musical NÃO apareceu como avatar jogável no jogo "DJ Hero"?',
		15,
		134
	),
	(
		1804,
		'Qual ator deu voz ao pai do personagem principal em Fallout 3?',
		15,
		134
	),
	(
		1805,
		'Qual caixa do CS:GO contém a faca Butterfly?',
		15,
		134
	),
	(
		1806,
		'Qual cantor pop foi contratado pela SEGA para produzir a música de "Sonic the Hedgehog 3"?',
		15,
		134
	),
	(
		1807,
		'Qual carro NÃO aparece em "Need for Speed: Hot Pursuit 2"?',
		15,
		134
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1808,
		'Qual cidade sediou o CS:GO Dreamhack Open 2015?',
		15,
		134
	),
	(
		1809,
		'Qual das seguintes opções Jennifer Taylor NÃO dublou?',
		15,
		134
	),
	(
		1810,
		'Qual das seguintes unidades terráqueas do jogo RTS Starcraft foi introduzida pela primeira vez na expansão Brood War?',
		15,
		134
	),
	(
		1811,
		'Qual deles não era um membro do Fiendish Five no jogo Sly Cooper and the Thievius Raccoonus?',
		15,
		134
	),
	(
		1812,
		'Qual dessas armas NÃO está disponível para a equipe Terrorist no jogo "Counter-Strike: Global Offensive"?',
		15,
		134
	),
	(
		1813,
		'Qual dessas músicas NÃO toca durante os segmentos Ruins do jogo de 2015 "Undertale"?',
		15,
		134
	),
	(
		1814,
		'Qual desses blocos em "Minecraft" tem a menor resistência à explosão?',
		15,
		134
	),
	(
		1815,
		'Qual desses jogos "Worms" apresentava jogabilidade 3D?',
		15,
		134
	),
	(
		1816,
		'Qual desses jogos do Mario Kart foi feito para o Gameboy Advance?',
		15,
		134
	),
	(
		1817,
		'Qual desses jogos foi o primeiro jogo de tiro em primeira pessoa conhecido com um tempo conhecido de publicação?',
		15,
		134
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1818,
		'Qual desses jogos se passa na cidade irlandesa de Doolin, com a opção de jogar como um dos personagens, Ellen e Keats?',
		15,
		135
	),
	(
		1819,
		'Qual desses operadores de "Tom Clancy''s Rainbow Six Siege" tem a capacidade de danificar paredes reforçadas?',
		15,
		135
	),
	(
		1820,
		'Qual desses papéis em Town of Salem é da máfia?',
		15,
		135
	),
	(
		1821,
		'Qual desses personagens foi introduzido pela primeira vez em Sonic Boom: Rise of Lyric?',
		15,
		135
	),
	(
		1822,
		'Qual desses personagens NÃO foi planejado para ser jogável em Super Smash Bros. 64?',
		15,
		135
	),
	(
		1823,
		'Qual desses personagens NÃO é um chefe em Crash Bash?',
		15,
		135
	),
	(
		1824,
		'Qual desses personagens quase foi adicionado ao Super Smash Bros. Melee, mas não foi incluído porque o jogo estava muito avançado em desenvolvimento?',
		15,
		135
	),
	(
		1825,
		'Qual destas NÃO é uma facção terrorista em Counter-Strike (2000)?',
		15,
		135
	),
	(
		1826,
		'Qual destes mapas de Counter-Strike é um cenário de desarme de bombas?',
		15,
		135
	),
	(
		1827,
		'Qual destes NÃO é o nome de um líder de equipe no Pokémon GO?',
		15,
		135
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1828,
		'Qual destes não é o nome de uma cidade da série Grand Theft Auto?',
		15,
		135
	),
	(
		1829,
		'Qual destes NÃO é o nome de uma cidade na ilha principal de PLAYERUNKNOWN''S BATTLEGROUNDS?',
		15,
		135
	),
	(
		1830,
		'Qual destes não é um personagem do jogo "Liga Letal"?',
		15,
		135
	),
	(
		1831,
		'Qual destes não é um veículo DLC em "Mario Kart 8"?',
		15,
		135
	),
	(
		1832,
		'Qual destes é o nome de um inimigo cortado de "Half-Life 2"?',
		15,
		135
	),
	(
		1833,
		'Qual dos jogos Call of Duty a seguir foi um título de lançamento do PS3?',
		15,
		135
	),
	(
		1834,
		'Qual dos quatro primeiros títulos da franquia "Grand Theft Auto" iniciou a série de artes de capa de grade de imagem icônica?',
		15,
		136
	),
	(
		1835,
		'Qual dos seguintes atores não dublou um personagem em "Saints Row: The Third"?',
		15,
		136
	),
	(
		1836,
		'Qual dos seguintes itens de Mario Kart 8 Deluxe NÃO o tornará invencível?',
		15,
		136
	),
	(
		1837,
		'Qual dos seguintes jogos de Pokémon foi lançado primeiro?',
		15,
		136
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1838,
		'Qual dos seguintes jogos tem os personagens mais jogáveis?',
		15,
		136
	),
	(
		1839,
		'Qual dos seguintes não foi desenvolvido pela Bethesda?',
		15,
		136
	),
	(
		1840,
		'Qual dos seguintes não é um Pokémon real?',
		15,
		136
	),
	(
		1841,
		'Qual dos seguintes não é um promotor da série de videogames "Ace Attorney"?',
		15,
		136
	),
	(
		1842,
		'Qual dos seguintes personagens NÃO é jogável em "Resident Evil 6"?',
		15,
		136
	),
	(
		1843,
		'Qual dos seguintes é um personagem do videogame Destiny?',
		15,
		136
	),
	(
		1844,
		'Qual empresa de desenvolvimento de jogos fez o No Man''s Sky?',
		15,
		136
	),
	(
		1845,
		'Qual empresa desenvolveu e publicou o Game Dev Tycoon?',
		15,
		136
	),
	(
		1846,
		'Qual empresa fez o RPG japonês "Dragon Quest"?',
		15,
		136
	),
	(
		1847,
		'Qual era o nome do primeiro MMORPG a popularizar o gênero?',
		15,
		136
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1848,
		'Qual era o nome do protagonista de Metal Gear Solid V: The Phantom Pain?',
		15,
		136
	),
	(
		1849,
		'Qual estágio foi planejado para fazer parte de "Sonic the Hedgehog 2", mas foi descartado durante o desenvolvimento?',
		15,
		136
	),
	(
		1850,
		'Qual filme de terror teve uma sequência na forma de um videogame lançado em 20 de agosto de 2002?',
		15,
		137
	),
	(
		1851,
		'Qual foi a primeira atualização de "Team Fortress 2" a incluir uma guerra?',
		15,
		137
	),
	(
		1852,
		'Qual foi o primeiro jogo Call of Duty a incluir o modo de jogo Zombies?',
		15,
		137
	),
	(
		1853,
		'Qual foi o PRIMEIRO jogo da Valve a ter VR?',
		15,
		137
	),
	(
		1854,
		'Qual foi o primeiro jogo de PlayStation a exigir o uso do controle DualShock?',
		15,
		137
	),
	(
		1855,
		'Qual foi o primeiro jogo do Super Mario lançado na América do Norte para o 3DS?',
		15,
		137
	),
	(
		1856,
		'Qual foi o primeiro videogame a ser produzido pela empresa de desenvolvimento Rare?',
		15,
		137
	),
	(
		1857,
		'Qual foi o primeiro videogame de filme interativo?',
		15,
		137
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1858,
		'Qual franquia teve um evento especial no popular MMORPG Final Fantasy XIV: A Realm Reborn?',
		15,
		137
	),
	(
		1859,
		'Qual herói do Dota 1 mudou de gênero quando foi transferido para o Dota 2?',
		15,
		137
	),
	(
		1860,
		'Qual jogador de futebol está na capa do FIFA 18 da EA Sport?',
		15,
		137
	),
	(
		1861,
		'Qual jogo de quebra-cabeça foi projetado por um programador russo, apresentando edifícios e música russos?',
		15,
		137
	),
	(
		1862,
		'Qual jogo NÃO faz parte da série Science Adventure da 5pb. e Nitroplus?',
		15,
		137
	),
	(
		1863,
		'Qual mob nevado foi adicionado no Minecraft 1.10?',
		15,
		137
	),
	(
		1864,
		'Qual operação em "Tom Clancy''s Rainbow Six Siege" introduziu o mapa "Skyscraper"?',
		15,
		137
	),
	(
		1865,
		'Qual país é apresentado em Ace Combat 5: The Unsung War?',
		15,
		137
	),
	(
		1866,
		'Qual personagem de Overwatch diz a frase "Os heróis nunca morrem!"?',
		15,
		138
	),
	(
		1867,
		'Qual personagem desbloqueável em Super Smash Bros. Para Wii U e 3DS não precisa ser combatido para ser desbloqueado?',
		15,
		138
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1868,
		'Qual personagem NÃO faz parte da série Grand Theft Auto?',
		15,
		138
	),
	(
		1869,
		'Qual personagem o jogador interpreta como no videogame "Bastion"?',
		15,
		138
	),
	(
		1870,
		'Qual rifle favorito é usado pelos terroristas em Counter Strike: Global Offensive?',
		15,
		138
	),
	(
		1871,
		'Qual sobrevivente em Left 4 Dead se sacrificou para salvar os outros sobreviventes?',
		15,
		138
	),
	(
		1872,
		'Qual time de CS:GO eSports venceu o grande evento ESL One Cologne 2016?',
		15,
		138
	),
	(
		1873,
		'Qual videogame rendeu ao compositor musical Mike Morasky mais prêmios por seu trabalho?',
		15,
		138
	),
	(
		1874,
		'Qual é a menor quantidade de vida máxima que você pode ter no Team Fortress 2?',
		15,
		138
	),
	(
		1875,
		'Qual é a punição por jogar Postal 2 na Nova Zelândia?',
		15,
		138
	),
	(
		1876,
		'Qual é a vantagem que foi introduzida no mapa "Call Of Duty: Zombies", "Mob Of The Dead"?',
		15,
		138
	),
	(
		1877,
		'Qual é o item necessário para invocar o chefe Duke Fishron no jogo Terraria?',
		15,
		138
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1878,
		'Qual é o nome completo do protagonista do jogo de aventura indie "Night in the Woods"?',
		15,
		138
	),
	(
		1879,
		'Qual é o nome da 8ª edição da série Fire Emblem?',
		15,
		138
	),
	(
		1880,
		'Qual é o nome da criatura que o personagem principal faz amizade em "The Last Guardian"?',
		15,
		138
	),
	(
		1881,
		'Qual é o nome da moeda na série "Animal Crossing"?',
		15,
		138
	),
	(
		1882,
		'Qual é o nome da máquina que falha e essencialmente condena a humanidade no início do primeiro jogo Half-Life?',
		15,
		139
	),
	(
		1883,
		'Qual é o nome da mãe de Cream the Rabbit na série "Sonic the Hedgehog"?',
		15,
		139
	),
	(
		1884,
		'Qual é o nome da primeira Persona do protagonista em "Persona 5"?',
		15,
		139
	),
	(
		1885,
		'Qual é o nome do AK-47 em Counter Strike: Source?',
		15,
		139
	),
	(
		1886,
		'Qual é o nome do personagem principal em "Braid"?',
		15,
		139
	),
	(
		1887,
		'Qual é o nome do primeiro chefe que o jogador encontra no jogo de 2017, "Little Nightmares"?',
		15,
		139
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1888,
		'Qual é o nome do primeiro nível em "Call of Duty: World at War"?',
		15,
		139
	),
	(
		1889,
		'Qual é o nome do vírus em "Metal Gear Solid 1"?',
		15,
		139
	),
	(
		1890,
		'Qual é o nome dos inimigos armados comuns da série de videogames "Oddworld"?',
		15,
		139
	),
	(
		1891,
		'Qual é o nome original de Final Fantasy XV?',
		15,
		139
	),
	(
		1892,
		'Qual é o primeiro console de videogame do mundo?',
		15,
		139
	),
	(
		1893,
		'Qual é o verdadeiro nome de Solid Snake?',
		15,
		139
	),
	(
		1894,
		'Qual é o único Pokémon da Geração III cujo nome começa com a letra I?',
		15,
		139
	),
	(
		1895,
		'Quando Final Fantasy XV foi lançado?',
		15,
		139
	),
	(
		1896,
		'Quando foi fundada a editora de videogames "Ubisoft"?',
		15,
		139
	),
	(
		1897,
		'Quando foi lançado o "Garry''s Mod"?',
		15,
		139
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1898,
		'Quando foi lançado o Club Penguin?',
		15,
		140
	),
	(
		1899,
		'Quando foi lançado o Virtual Boy da Nintendo?',
		15,
		140
	),
	(
		1900,
		'Quando Halo 3: ODST foi lançado em 2008, tinha um título diferente. Como o jogo era formalmente chamado?',
		15,
		140
	),
	(
		1901,
		'Quando o Sega Genesis foi lançado no Japão?',
		15,
		140
	),
	(
		1902,
		'Quando o Star Wars: Battlefront II original foi lançado?',
		15,
		140
	),
	(
		1903,
		'Quando o videogame "PAMELA" foi lançado no Steam?',
		15,
		140
	),
	(
		1904,
		'Quantas Chaos Emeralds você consegue coletar no primeiro Sonic The Hedgehog?',
		15,
		140
	),
	(
		1905,
		'Quantas classes existem no Team Fortress 2?',
		15,
		140
	),
	(
		1906,
		'Quantas notas diferentes tem a melodia, "Song of Healing", composta em "The Legend of Zelda: Majora''s Mask"?',
		15,
		140
	),
	(
		1907,
		'Quantas vezes você luta contra os Aprisionados em The Legend of Zelda: Skyward Sword?',
		15,
		140
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1908,
		'Quanto custou o jogo indie "Cave Story" quando foi lançado pela primeira vez em 2004?',
		15,
		140
	),
	(
		1909,
		'Quantos anos tem Chloe Price em Life is Strange: Before the Storm?',
		15,
		140
	),
	(
		1910,
		'Quantos companheiros permanentes existem na versão base do jogo Fallout: New Vegas?',
		15,
		140
	),
	(
		1911,
		'Quantos conjuntos de equipamentos do grão-mestre bruxo existem no DLC Blood and Wine de The Witcher 3?',
		15,
		140
	),
	(
		1912,
		'Quantos controladores um Nintendo GameCube pode ter conectado ao mesmo tempo?',
		15,
		140
	),
	(
		1913,
		'Quantos espíritos estelares você resgata no videogame Nintendo 64 "Paper Mario"?',
		15,
		140
	),
	(
		1914,
		'Quantos finais normais existem no modo de campanha de Cry Of Fear?',
		15,
		141
	),
	(
		1915,
		'Quantos itens exclusivos "Borderlands 2" afirma ter?',
		15,
		141
	),
	(
		1916,
		'Quantos minutos você está atrasado para o trabalho em "Half-Life"?',
		15,
		141
	),
	(
		1917,
		'Quantos zumbis precisam ser mortos para obter a conquista "Zombie Genocider" em Dead Rising (2006)?',
		15,
		141
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1918,
		'Que animal é apresentado em "Bloons TD Battles"?',
		15,
		141
	),
	(
		1919,
		'Que gênero de videogame eram os jogos Warcraft originais?',
		15,
		141
	),
	(
		1920,
		'Que música é tocada durante os créditos finais de Guitar Hero: World Tour?',
		15,
		141
	),
	(
		1921,
		'Que nome originalmente tinha "Mario", de "Super Mario Brothers"?',
		15,
		141
	),
	(
		1922,
		'Que números Sayaka Maizono escreveu na parede em Dangan Ronpa Trigger Happy Havoc?',
		15,
		141
	),
	(
		1923,
		'Que tipo de gênero é o polêmico jogo de 2015 "Hatred"?',
		15,
		141
	),
	(
		1924,
		'Quem criou a bomba "FLUDD" que Mario usa em Super Mario Sunshine?',
		15,
		141
	),
	(
		1925,
		'Quem criou o Agente 47 na série de jogos "Hitman"?',
		15,
		141
	),
	(
		1926,
		'Quem desenvolveu o RPG agrícola de 2016 "Stardew Valley"?',
		15,
		141
	),
	(
		1927,
		'Quem dubla Max Payne no jogo de 2001 "Max Payne"?',
		15,
		141
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1928,
		'Quem dubla o infame Citadel Station AI conhecido como SHODAN, nos jogos System Shock?',
		15,
		141
	),
	(
		1929,
		'Quem dubla o personagem "Vernon Cherry" em "Red Dead Redemption"?',
		15,
		141
	),
	(
		1930,
		'Quem era o mascote da SEGA antes de "Sonic the Hedgehog"?',
		15,
		142
	),
	(
		1931,
		'Quem foi o principal antagonista de Max Payne 3 (2012)?',
		15,
		142
	),
	(
		1932,
		'Quem é a companhia de vilões em "Stardew Valley"?',
		15,
		142
	),
	(
		1933,
		'Quem é creditado por ter criado o primeiro ovo de páscoa de videogame do mundo?',
		15,
		142
	),
	(
		1934,
		'Quem é o criador do Geometry Dash?',
		15,
		142
	),
	(
		1935,
		'Quem é o dublador inglês de Sora da série Kingdom Hearts?',
		15,
		142
	),
	(
		1936,
		'Quem é o Nobody de Sora em Kingdom Hearts?',
		15,
		142
	),
	(
		1937,
		'Quem é o personagem principal de "Metal Gear Solid 3"?',
		15,
		142
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1938,
		'Quem é o personagem principal do videogame "Just Cause 3"?',
		15,
		142
	),
	(
		1939,
		'Quem é o personagem que você interpreta em Yume Nikki?',
		15,
		142
	),
	(
		1940,
		'Quem é o principal protagonista de "Ace Combat Zero: The Belkan War"?',
		15,
		142
	),
	(
		1941,
		'Quem é o principal vilão da série Crash Bandicoot?',
		15,
		142
	),
	(
		1942,
		'Quem é o principal vilão de Kirby''s Return to Dreamland?',
		15,
		142
	),
	(
		1943,
		'Quem é o protagonista do videogame "Dead Rising 2"?',
		15,
		142
	),
	(
		1944,
		'Se você jogar Super Mario RPG e tirar uma soneca em um quarto de hotel alugado, vai acordar ao lado de qual personagem familiar?',
		15,
		142
	),
	(
		1945,
		'Sean Bean dubla o personagem de "Martin Septim" em qual jogo Elder Scrolls?',
		15,
		142
	),
	(
		1946,
		'De acordo com a tradição de Overwatch, quem já foi membro da gangue Deadlock?',
		15,
		143
	),
	(
		1947,
		'De onde vem o nome do personagem do videogame da Nintendo, Mario?',
		15,
		143
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1948,
		'Durante o desenvolvimento do jogo, qual foi o primeiro Pokémon criado?',
		15,
		143
	),
	(
		1949,
		'Em "Call Of Duty: Zombies", completar qual ovo de páscoa do mapa irá recompensá-lo com a conquista "A viagem no tempo dirá"?',
		15,
		143
	),
	(
		1950,
		'Em "Call Of Duty: Zombies", completar qual ovo de páscoa principal do mapa o recompensará com a conquista "Alta Manutenção"?',
		15,
		143
	),
	(
		1951,
		'Em "Call Of Duty: Zombies", o que o jogo tradicionalmente recompensa por completar uma rodada de chefe?',
		15,
		143
	),
	(
		1952,
		'Em "Call Of Duty: Zombies", qual mapa apresenta o ovo de páscoa "Fly Trap"?',
		15,
		143
	),
	(
		1953,
		'Em "Call Of Duty: Zombies", qual mapa introduziu a vantagem "PhD Flopper"?',
		15,
		143
	),
	(
		1954,
		'Em "Call Of Duty: Zombies", qual é o nome do cachorro de Samantha Maxis?',
		15,
		143
	),
	(
		1955,
		'Em "Halo 2", qual é o nome do monitor da Instalação 05?',
		15,
		143
	),
	(
		1956,
		'Em "Kingdom Hearts", qual é o nome do mundo natal de Sora?',
		15,
		143
	),
	(
		1957,
		'Em "Kingdom Hearts", que missão Donald e Pateta são atribuídos pelo Rei Mickey?',
		15,
		143
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1958,
		'Em "Kingdom Hearts", quem sequestra Jasmine na Câmara da Lâmpada?',
		15,
		143
	),
	(
		1959,
		'Em "Overwatch", qual é o nome completo do herói McCree?',
		15,
		143
	),
	(
		1960,
		'Em "Overwatch", qual é o nome da "habilidade final" de Mercy?',
		15,
		143
	),
	(
		1961,
		'Em "Overwatch", quanta saúde a habilidade "Take a Breather" de Roadhog recupera?',
		15,
		143
	),
	(
		1962,
		'Em "PAYDAY 2", qual arma tem o maior dano base por tiro?',
		15,
		144
	),
	(
		1963,
		'Em "PUBATTLEGROUNDS" qual é o nome da ilha da Base Militar?',
		15,
		144
	),
	(
		1964,
		'Em "Resident Evil 2", por qual vírus William Birkin foi mutado?',
		15,
		144
	),
	(
		1965,
		'Em "Resident Evil 2", qual é o nome do meio de Leon Kennedy?',
		15,
		144
	),
	(
		1966,
		'Em "The Walking Dead: Season One" da Telltale Games, qual é o nome do pai de Clementine?',
		15,
		144
	),
	(
		1967,
		'Em 6 de junho de 2006, qual era o nome da infame falha que ocorreu no MMO RuneScape?',
		15,
		144
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1968,
		'Em Call Of Duty: Black Ops II, quem é o principal antagonista?',
		15,
		144
	),
	(
		1969,
		'Em Call of Duty: Modern Warfare 2, quantas mortes consecutivas são necessárias para ganhar o killstreak "Tactical Nuke"?',
		15,
		144
	),
	(
		1970,
		'Em Call of Duty: United Offensive, que dois soldados compartilham o nome de um personagem de videogame?',
		15,
		144
	),
	(
		1971,
		'Em Civilization V de Sid Meier, qual Maravilha do Mundo só pode ser construída em cidades próximas a um deserto?',
		15,
		144
	),
	(
		1972,
		'Em Dota 2, qual é o nome verdadeiro de Earthshaker?',
		15,
		144
	),
	(
		2316,
		'Qual é a maior cidade de Marrocos?',
		15,
		168
	),
	(
		1973,
		'Em Fallout 4, que tipo de power armor é encontrado pela primeira vez na missão inicial "When Freedom Calls" em um Vertibird acidentado?',
		15,
		144
	),
	(
		1974,
		'Em Grand Theft Auto: V, que nível de procurado o jogador recebe se entrar na Base Militar de Zancudo ao norte de Los Santos?',
		15,
		144
	),
	(
		1975,
		'Em Hitman: Blood Money, qual é o nome do alvo na missão "Death of a Showman"?',
		15,
		144
	),
	(
		1976,
		'Em Kingdom Hearts, qual das seguintes pessoas NÃO pode empunhar uma keyblade?',
		15,
		144
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1977,
		'Em Left 4 Dead, qual é o nome do Special Infected que não pode ser jogado no modo Versus?',
		15,
		144
	),
	(
		1978,
		'Em Left 4 Dead, qual é o nome do vírus, designado pela CEDA, que faz com que a maioria dos humanos se transforme em Infectados?',
		15,
		145
	),
	(
		1979,
		'Em Monster Hunter Generations, quais dos seguintes monstros fazem parte dos "Fated Four"?',
		15,
		145
	),
	(
		1980,
		'Em Need For Speed Most Wanted (2005), o que você dirige no início do modo carreira?',
		15,
		145
	),
	(
		1981,
		'Em Need For Speed: Most Wanted (2005), quantas pessoas existem para derrotar na lista negra?',
		15,
		145
	),
	(
		1982,
		'Em Need for Speed: Underground, que carro Eddie dirige?',
		15,
		145
	),
	(
		1983,
		'Em Night in the Woods, qual instrumento Casey tocava?',
		15,
		145
	),
	(
		1984,
		'Em Night In The Woods, qual é o nome da mãe de Mae Borowski?',
		15,
		145
	),
	(
		1985,
		'Em Overwatch, qual é o nome completo do Lúcio?',
		15,
		145
	),
	(
		1986,
		'Em Overwatch, quantos anos Reinhardt Wilhelm tem?',
		15,
		145
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1987,
		'Em Pokemon Diamond, Pearl e Platinum, onde pode ser encontrado um Munchlax?',
		15,
		145
	),
	(
		1988,
		'Em Portal 2, o icônico personagem GLaDOS se transforma em:',
		15,
		145
	),
	(
		1989,
		'Em Portal, de que cor é o Núcleo de Inteligência?',
		15,
		145
	),
	(
		1990,
		'Em Portal, de que cor é o Núcleo de Moralidade?',
		15,
		145
	),
	(
		1991,
		'Em qual cidade alemã ocorre o mapa "Clubhouse" em "Tom Clancy''s Rainbow Six Siege"?',
		15,
		145
	),
	(
		1992,
		'Em qual estado dos EUA está localizado o cenário fictício de Far Cry 5, ''Hope County''?',
		15,
		145
	),
	(
		1993,
		'Em qual jogo "Call of Duty" os "Apothicons" são introduzidos no modo Zombies?',
		15,
		145
	),
	(
		1994,
		'Em qual jogo do Mario o Mega Mushroom estreou?',
		15,
		146
	),
	(
		1995,
		'Em qual jogo Mario foi dublado pela primeira vez por Charles Martinet?',
		15,
		146
	),
	(
		1996,
		'Em qual jogo um personagem diz: "Às vezes, sonho com queijo"?',
		15,
		146
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		1997,
		'Em qual sistema "Touhou: Altamente Responsivo às Orações" foi lançado?',
		15,
		146
	),
	(
		1998,
		'Em qual versão do Half-Life de qual país os fuzileiros navais HECU são substituídos por robôs?',
		15,
		146
	),
	(
		1999,
		'Em que ano as capturas de tela foram adicionadas ao Steam?',
		15,
		146
	),
	(
		2000,
		'Em que ano as conquistas foram adicionadas ao Steam?',
		15,
		146
	),
	(
		2001,
		'Em que ano foi fundada a plataforma de streaming de videogames TwitchTV?',
		15,
		146
	),
	(
		2002,
		'Em que ano foi lançado "Super Mario Sunshine"?',
		15,
		146
	),
	(
		2003,
		'Em que ano foi lançado o jogo Sonic the Hedgehog original?',
		15,
		146
	),
	(
		2004,
		'Em que ano o primeiro jogo Monster Hunter foi lançado?',
		15,
		146
	),
	(
		2005,
		'Em que cidade Seamus "Sledge" Cowden de "Tom Clancy''s Rainbow Six Siege" nasceu?',
		15,
		146
	),
	(
		2006,
		'Em que expansão do Half-Life você pode encontrar a foto de Gordon em um porta-retratos de "Funcionário do Mês"?',
		15,
		146
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2007,
		'Em que motor o "Half-Life" original funcionava?',
		15,
		146
	),
	(
		2008,
		'Em que motor Titanfall foi feito?',
		15,
		146
	),
	(
		2009,
		'Em que nível você precisa estar para conseguir uma medalha de serviço no CS:GO?',
		15,
		146
	),
	(
		2010,
		'Em que ordem você precisa acertar alguns Deku Scrubs para abrir a primeira porta do chefe em "Ocarina of Time"?',
		15,
		147
	),
	(
		2011,
		'Em que país Eliza "Ash" Cohen de "Tom Clancy''s Rainbow Six Siege" nasceu?',
		15,
		147
	),
	(
		2012,
		'Em que planeta se passa o jogo Freedom Planet (2014)?',
		15,
		147
	),
	(
		2013,
		'Em que é baseado o mod "Cry of Fear"?',
		15,
		147
	),
	(
		2014,
		'Em Skylanders Giants, por que o Wow Pow de Zaps foi nomeado "For Riley"?',
		15,
		147
	),
	(
		2015,
		'Em Splatoon, qual é a idade em que os pressentidos podem mudar livremente entre lulas e formas humanóides?',
		15,
		147
	),
	(
		2016,
		'Em Team Fortress 2, qual classe empunha uma espingarda?',
		15,
		147
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2017,
		'Em Terraria, o que o Wall of Flesh não deixa cair após a derrota?',
		15,
		147
	),
	(
		2018,
		'Em Terraria, qual desses itens NÃO é fabricado em uma Mythril Anvil?',
		15,
		147
	),
	(
		2019,
		'Em The Elder Scrolls V: Skyrim, quem é o bobo da corte na irmandade das trevas?',
		15,
		147
	),
	(
		2020,
		'Em Touhou 12: Undefined Fantastic Object, qual desses não era um personagem jogável?',
		15,
		147
	),
	(
		2021,
		'Em Touhou: Embodiment of Scarlet Devil, que música toca durante a luta contra o chefe de Flandre Scarlet?',
		15,
		147
	),
	(
		2022,
		'Em Undertale, quanto custam os Spider Donuts em Hotland?',
		15,
		147
	),
	(
		2023,
		'Em WarioWare: Smooth Moves, qual destes NÃO é um Form?',
		15,
		147
	),
	(
		2024,
		'Esta arma em Counter-Strike: Global Offensive não existe na vida real.',
		15,
		147
	),
	(
		2025,
		'Excluindo o instrutor, quantos membros da Classe VII existem no jogo "Legend of Heroes: Trails of Cold Steel"?',
		15,
		147
	),
	(
		2026,
		'Final Fantasy VI foi originalmente lançado fora do Japão com qual nome?',
		15,
		148
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2027,
		'Junto com Gabe Newell, que co-fundou a Valve?',
		15,
		148
	),
	(
		2028,
		'Just Cause 2 foi ambientado principalmente em que ilha fictícia do Sudeste Asiático?',
		15,
		148
	),
	(
		2029,
		'Killing Floor começou como um mod para qual jogo Unreal Engine 2?',
		15,
		148
	),
	(
		2030,
		'Marvel vs Capcom 2: New age of Heroes foi lançado em que ano?',
		15,
		148
	),
	(
		2031,
		'Na franquia "Halo", em que país fica New Mombasa?',
		15,
		148
	),
	(
		2032,
		'Na franquia Half-Life, qual é o verdadeiro nome da "arma de gravidade"?',
		15,
		148
	),
	(
		2033,
		'Na série "Ace Attorney", qual é a relação entre Apollo Justice e Trucy Wright?',
		15,
		148
	),
	(
		2034,
		'Na série "Pikmin", qual é o único tipo de pikmin que possui orelhas visíveis?',
		15,
		148
	),
	(
		2035,
		'Na série "Portal", quem era o assistente pessoal de Cave Johnson?',
		15,
		148
	),
	(
		2036,
		'Na série "STALKER", qual desses itens não pode ser usado para diminuir a radiação acumulada do jogador?',
		15,
		148
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2037,
		'Na série de jogos "The Legend of Zelda", qual foi o primeiro jogo 3D?',
		15,
		148
	),
	(
		2038,
		'Na série de jogos Portal, quem foi o fundador da Aperture Science?',
		15,
		148
	),
	(
		2039,
		'Na série Halo, de que frota era o comandante supremo de Thel ''Vadam antes de ser classificado como Árbitro?',
		15,
		148
	),
	(
		2040,
		'Na série Kingdom Heart, quem dá a voz em inglês para Master Eraqus?',
		15,
		148
	),
	(
		2041,
		'Na série Pokémon, de que tipo é Sudowoodo, o Pokémon Imitação?',
		15,
		148
	),
	(
		2042,
		'Na série Portal, a Aperture Science foi fundada com que nome no início dos anos 1940?',
		15,
		149
	),
	(
		2043,
		'Na série Super Mario Bros., de que jogo é o power-up "Carrot"?',
		15,
		149
	),
	(
		2044,
		'Na tradição de World of Warcraft, quem foi o primeiro a ter o título de "The Ashbringer"?',
		15,
		149
	),
	(
		2045,
		'Na trilogia Mass Effect, quem é o protagonista?',
		15,
		149
	),
	(
		2046,
		'Na versão beta do jogo "The Legend of Zelda" de 1986, os jogadores podem escolher entre uma espada e que outro item?',
		15,
		149
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2047,
		'No ARPG "Path of Exile", qual é a maior quantidade de soquetes que um item pode ter?',
		15,
		149
	),
	(
		2048,
		'No Forza Motorsport 6, qual desses carros exclusivos de pista NÃO foi apresentado no jogo, originalmente com o jogo ou adicionado como DLC?',
		15,
		149
	),
	(
		2049,
		'No início do jogo "Sonic Adventure", qual é a cor Chaos Emerald do Tails?',
		15,
		149
	),
	(
		2050,
		'No jogo "Brawhalla", de que espécie é o personagem Bödvar?',
		15,
		149
	),
	(
		2051,
		'No jogo "Cave Story", qual é o bordão do personagem Balrog?',
		15,
		149
	),
	(
		2052,
		'No jogo "Persona 4", qual é o nome canônico do protagonista?',
		15,
		149
	),
	(
		2053,
		'No jogo "Red Dead Redemption", qual é o nome do cachorro de John Marston?',
		15,
		149
	),
	(
		2054,
		'No jogo "Subnautica", qual recurso foi removido devido a problemas de desempenho em 2016?',
		15,
		149
	),
	(
		2055,
		'No jogo "Terraria", quais desses chefes são chefes pré-hardmode?',
		15,
		149
	),
	(
		2056,
		'No jogo "Undertale", quem foi o criador de Mettaton?',
		15,
		149
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2057,
		'No jogo de tiro cooperativo Payday 2, qual contato ajuda você a escapar de Hoxton?',
		15,
		149
	),
	(
		2058,
		'No jogo Destiny, quem sucedeu Peter Dinklage na dublagem do protagonista "Ghost"?',
		15,
		150
	),
	(
		2059,
		'No jogo Paper Mario para Nintendo 64 o primeiro parceiro que você encontra é um Goomba, qual é o nome dele?',
		15,
		150
	),
	(
		2060,
		'No jogo Pokémon Conquest, quantos reinos compõem a região de Ransei?',
		15,
		150
	),
	(
		2061,
		'No jogo Tom Clancy''s Rainbow 6 Siege, de que organização é a Valquíria?',
		15,
		150
	),
	(
		2062,
		'No mapa "Der Riese" de "Call Of Duty: Zombies", qual é o nome do "Pack-A-Punched PPSH-41"?',
		15,
		150
	),
	(
		2063,
		'No mapa "Moon" de "Call Of Duty: Zombies", existe um secundário chamado QED. O que significa QED?',
		15,
		150
	),
	(
		2064,
		'No mapa "Origins" de "Call Of Duty: Zombies", quantos geradores de energia numerados existem?',
		15,
		150
	),
	(
		2065,
		'No MMO RPG "Realm of the Mad God", qual classe é conhecida por ter a maior defesa possível?',
		15,
		150
	),
	(
		2066,
		'No primeiro Left 4 Dead, você pode jogar como qualquer um desses quatro personagens.',
		15,
		150
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2067,
		'No RPG "Undertale" de 2015, qual personagem você encontra pela primeira vez depois de cair no subsolo?',
		15,
		150
	),
	(
		2068,
		'No videogame "Kingdom Hearts" de 2002, quantos mundos jogáveis havia?',
		15,
		150
	),
	(
		2069,
		'No videogame "League of Legends", qual personagem é conhecido como "The Sinister Blade"?',
		15,
		150
	),
	(
		2070,
		'No videogame de 2000 "Crimson Skies", qual era o nome do zepelim dos protagonistas?',
		15,
		150
	),
	(
		2071,
		'No videogame DOTA 2, qual destes NÃO é um herói?',
		15,
		150
	),
	(
		2072,
		'Nos jogos DOOM originais, qual dos seguintes demônios é uma recoloração do Barão do Inferno, mas é mais fraco que o Barão?',
		15,
		150
	),
	(
		2073,
		'Nos jogos Mario Kart e Smash Bros., a princesa Rosalina é considerada em qual categoria de peso?',
		15,
		150
	),
	(
		2074,
		'A equipe afiliada da AHL do Boston Bruins se chama como?',
		20,
		151
	),
	(
		2075,
		'Com qual parceiro de duplas John McEnroe teve mais sucesso?',
		20,
		151
	),
	(
		2076,
		'Em que ano foi realizado o terceiro Super Bowl?',
		20,
		151
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2077,
		'No futebol canadense, marcar um rouge vale quantos pontos?',
		20,
		151
	),
	(
		2078,
		'O que é “O Esporte dos Reis”?',
		20,
		151
	),
	(
		2079,
		'Onde foram realizados os Jogos da XXII Olimpíada?',
		20,
		151
	),
	(
		2080,
		'Qual dessas cidades russas NÃO continha um estádio que foi usado na Copa do Mundo da FIFA 2018?',
		20,
		151
	),
	(
		2081,
		'Qual jogador masculino ganhou a medalha de ouro no tênis de mesa individual nos Jogos Olímpicos de 2016?',
		20,
		151
	),
	(
		2082,
		'Qual jogadora ganhou a medalha de ouro no tênis de mesa individual nos Jogos Olímpicos de 2016?',
		20,
		151
	),
	(
		2083,
		'Qual montadora é a única empresa japonesa que venceu as 24 Horas de Le Mans?',
		20,
		151
	),
	(
		2084,
		'Qual time de futebol inglês é apelidado de ''The Tigers''?',
		20,
		151
	),
	(
		2085,
		'Que ferramenta empresta seu nome a uma vantagem de última hora em uma final de Curling?',
		20,
		151
	),
	(
		2086,
		'Que futebolista italiano disse a Neuer onde está a rematar e a rematar ao lado, durante o jogo Itália-Alemanha, UEFA EURO 2016?',
		20,
		151
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2087,
		'Quem é o principal criador de aparências do Manchester United?',
		20,
		151
	),
	(
		2088,
		'Com quem Steven Gerrard ganhou a Liga dos Campeões?',
		10,
		152
	),
	(
		2089,
		'De qual cidade o ex-time da NHL "The Nordiques" se originou?',
		10,
		152
	),
	(
		2090,
		'Em que ano Jenson Button ganhou seu primeiro Campeonato Mundial de Pilotos de Fórmula 1?',
		10,
		152
	),
	(
		2091,
		'Em que ano o New Orleans Saints venceu o Super Bowl?',
		10,
		152
	),
	(
		2092,
		'Em que esporte a "peteca" é usada?',
		10,
		152
	),
	(
		2093,
		'Este locutor esportivo da televisão canadense é conhecido por seu papel em "Hockey Night in Canada", um programa de comentários durante os jogos de hóquei.',
		10,
		152
	),
	(
		2094,
		'Na Copa do Mundo FIFA 2014, qual foi o placar final da partida Brasil x Alemanha?',
		10,
		152
	),
	(
		2095,
		'No beisebol, quantas faltas são eliminadas?',
		10,
		152
	),
	(
		2096,
		'No beisebol, quantas vezes a bola precisa ser arremessada para fora da zona de ataque antes que o rebatedor seja andado?',
		10,
		152
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2097,
		'No boliche, qual é o termo usado para obter três rebatidas consecutivas?',
		10,
		152
	),
	(
		2317,
		'Qual é a maior ilha não continental do mundo?',
		15,
		168
	),
	(
		2098,
		'No golfe, que nome se dá a um buraco de dois abaixo do par?',
		10,
		152
	),
	(
		2099,
		'O Los Angeles Dodgers era originalmente de qual cidade dos Estados Unidos?',
		10,
		152
	),
	(
		2100,
		'Os Jogos Olímpicos Rio 2016 tiveram sua cerimônia de encerramento em que data?',
		10,
		152
	),
	(
		2101,
		'Quais são os dois times que jogaram no Super Bowl XLII?',
		10,
		152
	),
	(
		2102,
		'Qual afro-americano é parcialmente responsável pela integração da Liga Principal de beisebol?',
		10,
		152
	),
	(
		2103,
		'Qual boxeador foi banido por morder a orelha de Evander Holyfield em 1997?',
		10,
		153
	),
	(
		2104,
		'Qual clube de futebol inglês tem o apelido de ''The Foxes''?',
		10,
		153
	),
	(
		2105,
		'Qual foi o placar final da partida da Copa do Mundo da FIFA Alemanha x Brasil 2014?',
		10,
		153
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2106,
		'Qual jogador detém o recorde da NHL de 2.857 pontos?',
		10,
		153
	),
	(
		2107,
		'Qual país sediará os Jogos Olímpicos de Verão de 2020?',
		10,
		153
	),
	(
		2108,
		'Qual país sediou a Copa do Mundo FIFA 2018?',
		10,
		153
	),
	(
		2109,
		'Qual piloto foi o campeão mundial de Fórmula 1 por um recorde de 7 vezes?',
		10,
		153
	),
	(
		2110,
		'Qual seleção venceu a Copa do Mundo FIFA de 2014 no Brasil?',
		10,
		153
	),
	(
		2111,
		'Qual time a Inglaterra derrotou para vencer a final da Copa do Mundo de 1966?',
		10,
		153
	),
	(
		2112,
		'Qual time ganhou mais Copas Stanley na NHL?',
		10,
		153
	),
	(
		2113,
		'Qual time venceu a MLS Cup 2016?',
		10,
		153
	),
	(
		2114,
		'Qual time venceu a Premier League inglesa de 2015-16?',
		10,
		153
	),
	(
		2115,
		'Qual é o nome do estádio do Manchester United?',
		10,
		153
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2116,
		'Qual é o tipo de arremesso mais comum lançado pelos arremessadores no beisebol?',
		10,
		153
	),
	(
		2117,
		'Quando foi fundado o FC Schalke 04?',
		10,
		153
	),
	(
		2118,
		'Quantos jogadores de futebol devem estar em campo ao mesmo tempo?',
		10,
		153
	),
	(
		2119,
		'Quantos pontos LeBron James marcou em seu primeiro jogo na NBA?',
		10,
		154
	),
	(
		2120,
		'Quem costuma ser chamado de "o Maestro" no circuito masculino de tênis?',
		10,
		154
	),
	(
		2121,
		'Quem ganhou a Liga dos Campeões da UEFA em 2016?',
		10,
		154
	),
	(
		2122,
		'Quem ganhou a Liga dos Campeões da UEFA em 2017?',
		10,
		154
	),
	(
		2123,
		'Quem ganhou o Campeonato Mundial de Pilotos de Fórmula 1 de 2016?',
		10,
		154
	),
	(
		2124,
		'Quem ganhou o Campeonato Mundial de Pilotos de Fórmula 1 de 2017?',
		10,
		154
	),
	(
		2125,
		'Quem ganhou o título da liga principal na temporada 2015-2016 após uma corrida de conto de fadas?',
		10,
		154
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2126,
		'A temporada de F1 de 1994 é lembrada por qual evento trágico?',
		15,
		155
	),
	(
		2127,
		'De que ilha portuguesa é o jogador de futebol Cristiano Ronaldo?',
		15,
		155
	),
	(
		2128,
		'De que país surgiu o Kabaddi, um esporte de contato envolvendo combate?',
		15,
		155
	),
	(
		2129,
		'Em qual ponte começa a corrida anual de barcos de Oxford e Cambridge?',
		15,
		155
	),
	(
		2130,
		'Em que esporte Fanny Chmelar compete pela Alemanha?',
		15,
		155
	),
	(
		2131,
		'Em um jogo de sinuca, qual é a cor da bola que vale 3 pontos?',
		15,
		155
	),
	(
		2132,
		'Josh Mansour faz parte de qual equipe da NRL?',
		15,
		155
	),
	(
		2133,
		'Na Fórmula 1, o Safety Car Virtual foi introduzido após o acidente fatal de qual piloto?',
		15,
		155
	),
	(
		2134,
		'Por que The Green Monster at Fenway Park foi originalmente construído?',
		15,
		155
	),
	(
		2135,
		'Qual das seleções nacionais desses países se classificou para a Copa do Mundo da FIFA 2018 na Rússia?',
		15,
		155
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2136,
		'Qual dessas equipes não é membro da era "Original Six" da NHL?',
		15,
		155
	),
	(
		2137,
		'Qual dos seguintes arremessadores foi eleito o Novato do Ano da Liga Nacional na temporada de 2013?',
		15,
		155
	),
	(
		2138,
		'Qual dos seguintes jogadores marcou um hat-trick durante sua estreia no Manchester United?',
		15,
		155
	),
	(
		2139,
		'Qual dos seguintes torneios de tênis do Grand Slam ocorre ÚLTIMO?',
		15,
		155
	),
	(
		2140,
		'Qual esporte NÃO é tradicionalmente praticado durante o festival Naadam da Mongólia?',
		15,
		155
	),
	(
		2141,
		'Qual fabricante de automóveis venceu as 24 Horas de Le Mans de 2016?',
		15,
		156
	),
	(
		2142,
		'Qual fabricante de automóveis venceu as 24 Horas de Le Mans de 2017?',
		15,
		156
	),
	(
		2143,
		'Qual jogador da NBA tem mais jogos disputados ao longo de sua carreira?',
		15,
		156
	),
	(
		2144,
		'Qual lutador profissional caiu das vigas para a morte durante um evento Pay-Per-View ao vivo em 1999?',
		15,
		156
	),
	(
		2145,
		'Qual país está sediando a Copa do Mundo FIFA de 2022?',
		15,
		156
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2146,
		'Qual país sediou os Jogos Olímpicos de Inverno de 2014?',
		15,
		156
	),
	(
		2147,
		'Qual piloto de Fórmula 1 trocou de equipe no meio da temporada de 2017?',
		15,
		156
	),
	(
		2148,
		'Qual time de basquete participou de mais grandes finais da NBA?',
		15,
		156
	),
	(
		2149,
		'Qual time foi o campeão da NBA de 2014-2015?',
		15,
		156
	),
	(
		2150,
		'Qual é a faixa mais alta que você pode obter no Taekwondo?',
		15,
		156
	),
	(
		2151,
		'Qual é a melhor pontuação de todos os tempos da carreira de Tiger Woods?',
		15,
		156
	),
	(
		2152,
		'Qual é o time mais antigo da Major League Baseball?',
		15,
		156
	),
	(
		2153,
		'Quantas zonas de pontuação existem em um alvo de dardos convencional?',
		15,
		156
	),
	(
		2154,
		'Quantos Abertos da França Björn Borg ganhou?',
		15,
		156
	),
	(
		2155,
		'Quantos troféus da liga principal Sir Alex Ferguson ganhou durante seu tempo no Manchester United?',
		15,
		156
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2156,
		'Que seleção nacional venceu a edição de 2016 do Campeonato da Europa da UEFA?',
		15,
		156
	),
	(
		2157,
		'Quem foi o artilheiro da Seleção Inglesa de Futebol?',
		15,
		157
	),
	(
		2158,
		'Quem ganhou a Copa Stanley de 2011?',
		15,
		157
	),
	(
		2159,
		'Quem ganhou o Grande Prêmio de Mônaco 2018?',
		15,
		157
	),
	(
		2160,
		'Quem venceu o Campeonato Nacional de Playoff de Futebol Americano Universitário (CFP) de 2015?',
		15,
		157
	),
	(
		2161,
		'Quem é o maior artilheiro do Manchester United na Premier League?',
		15,
		157
	),
	(
		2162,
		'Um estimpímetro mede a velocidade de uma bola em que superfície?',
		15,
		157
	),
	(
		2163,
		' Qual destas cidades tem um 4° Longitude leste.',
		20,
		158
	),
	(
		2164,
		'A Cordilheira Hunua está localizada em...',
		20,
		158
	),
	(
		2165,
		'As ilhas Andaman e Nicobar no Sudeste Asiático são controladas por qual país?',
		20,
		158
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2242,
		'Qual é o nome da península que contém Espanha e Portugal?',
		10,
		163
	),
	(
		2166,
		'As ilhas Molucas (informalmente conhecidas como Ilhas das Especiarias) pertencem a qual país?',
		20,
		158
	),
	(
		2167,
		'Bir Tawil, uma faixa de terra desabitada reivindicada por nenhum país, está localizada ao longo da fronteira de quais dois países?',
		20,
		158
	),
	(
		2168,
		'Em qual bacia o rio Jordão deságua?',
		20,
		158
	),
	(
		2169,
		'Em qual cidade, o Big Nickel está localizado no Canadá?',
		20,
		158
	),
	(
		2170,
		'Em que ano está a bandeira do estado americano de Wisconsin?',
		20,
		158
	),
	(2171, 'Em que país fica o rio Taedong?', 20, 158),
	(
		2172,
		'Em que país se encontra Tallinn?',
		20,
		158
	),
	(
		2173,
		'Fucking é uma aldeia em que país?',
		20,
		158
	),
	(
		2174,
		'O emblema na bandeira da República do Tajiquistão apresenta um nascer do sol sobre as montanhas abaixo de que símbolo?',
		20,
		158
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2175,
		'O montanhoso Passo Khyber conecta qual dos dois países a seguir?',
		20,
		158
	),
	(
		2176,
		'O prefixo sino- (como em sino-americano) é usado para se referir a qual nacionalidade?',
		20,
		158
	),
	(
		2177,
		'Qual atração turística norte-americana é atendida pela empresa de turismo "Maid of the Mist"?',
		20,
		158
	),
	(
		2178,
		'Qual cidade é conhecida como a Capital Mundial das Rosas?',
		20,
		159
	),
	(
		2179,
		'Qual dessas cidades NÃO fica na Inglaterra?',
		20,
		159
	),
	(
		2180,
		'Qual desses países insulares está localizado no Caribe?',
		20,
		159
	),
	(
		2181,
		'Qual desses países NÃO faz parte do continente asiático?',
		20,
		159
	),
	(
		2182,
		'Qual destas NÃO é uma cidade da Índia?',
		20,
		159
	),
	(
		2183,
		'Qual destas NÃO é uma placa tectônica real?',
		20,
		159
	),
	(
		2184,
		'Qual destas NÃO é uma província da China?',
		20,
		159
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2185,
		'Qual país é completamente sem litoral pela África do Sul?',
		20,
		159
	),
	(2186, 'Qual é a capital das Bermudas?', 20, 159),
	(2187, 'Qual é a capital das Maurícias?', 20, 159),
	(
		2188,
		'Qual é a capital de Wisconsin, EUA?',
		20,
		159
	),
	(
		2189,
		'Qual é a maior cidade e capital comercial do Sri Lanka?',
		20,
		159
	),
	(2190, 'Qual é a maior ilha do Canadá?', 20, 159),
	(
		2191,
		'Qual é a montanha mais alta do Canadá?',
		20,
		159
	),
	(
		2192,
		'Qual é a nação de maioria muçulmana mais populosa em 2010?',
		20,
		159
	),
	(
		2193,
		'Qual é a palavra finlandesa para "Finlândia"?',
		20,
		159
	),
	(
		2194,
		'Qual é a rota de escalada mais comum para a segunda montanha mais alta do mundo, K2?',
		20,
		160
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2195,
		'Qual é a segunda maior cidade da Lituânia?',
		20,
		160
	),
	(
		2196,
		'Qual é a terra que liga a América do Norte e a América do Sul?',
		20,
		160
	),
	(
		2197,
		'Qual é a área da Cidade do Vaticano?',
		20,
		160
	),
	(
		2198,
		'Qual é o maior lago de água doce do mundo?',
		20,
		160
	),
	(
		2199,
		'Qual é o nome da região rochosa que abrange a maior parte do leste do Canadá?',
		20,
		160
	),
	(
		2200,
		'Qual é o nome de uma das línguas neo-aramaicas faladas pela população judaica do noroeste do Iraque?',
		20,
		160
	),
	(
		2201,
		'Qual é o nome do hino nacional canadense?',
		20,
		160
	),
	(
		2202,
		'Qual é o nome oficial alemão das Ferrovias Federais Suíças?',
		20,
		160
	),
	(
		2203,
		'Quando a Finlândia comemora o dia da independência?',
		20,
		160
	),
	(
		2204,
		'Quantas estações tem a Central Line no metrô de Londres?',
		20,
		160
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2205,
		'Quantos países fazem fronteira com o Quirguistão?',
		20,
		160
	),
	(
		2206,
		'Que museu nacional você encontrará em Cooperstown, Nova York?',
		20,
		160
	),
	(
		2207,
		'A fronteira compartilhada mais longa do mundo pode ser encontrada entre quais duas nações?',
		10,
		161
	),
	(
		2208,
		'A Groenlândia faz parte de qual reino?',
		10,
		161
	),
	(
		2209,
		'Com quantos países o México faz fronteira?',
		10,
		161
	),
	(
		2210,
		'O acrônimo irônico "PIIGS" refere-se a qual dos seguintes países europeus e seus status econômicos?',
		10,
		161
	),
	(
		2211,
		'O Space Needle está localizado em qual cidade?',
		10,
		161
	),
	(
		2212,
		'Onde você encontraria a "Escadaria Espanhola"?',
		10,
		161
	),
	(
		2213,
		'Os Alpes são uma cordilheira em que continente?',
		10,
		161
	),
	(
		2214,
		'Qual cidade é a capital dos Estados Unidos da América?',
		10,
		161
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2215,
		'Qual das seguintes línguas NÃO usa o alfabeto latino?',
		10,
		161
	),
	(
		2216,
		'Qual destes NÃO é um estado ou território australiano?',
		10,
		161
	),
	(
		2217,
		'Qual destes países africanos lista o "espanhol" como língua oficial?',
		10,
		161
	),
	(
		2218,
		'Qual destes é o nome da maior cidade do estado americano do Tennessee?',
		10,
		161
	),
	(
		2219,
		'Qual dos seguintes ex-estados iugoslavos não tem litoral?',
		10,
		161
	),
	(
		2220,
		'Qual dos seguintes países tem uma bandeira com um leão amarelo empunhando uma espada em um fundo vermelho escuro?',
		10,
		161
	),
	(
		2221,
		'Qual estado dos EUA tem a maior população?',
		10,
		161
	),
	(
		2222,
		'Qual estado é o maior estado dos Estados Unidos da América?',
		10,
		162
	),
	(
		2223,
		'Qual nação reivindica a propriedade da Antártica?',
		10,
		162
	),
	(
		2224,
		'Qual oblast russo faz fronteira com a Polônia?',
		10,
		162
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2225,
		'Qual oceano faz fronteira com a costa oeste dos Estados Unidos?',
		10,
		162
	),
	(
		2226,
		'Qual país do Reino Unido tem um dragão em sua bandeira?',
		10,
		162
	),
	(
		2227,
		'Qual país NÃO fazia parte da União Soviética?',
		10,
		162
	),
	(
		2228,
		'Qual país é o segundo maior do mundo em área?',
		10,
		162
	),
	(
		2229,
		'Qual é a capital da Coreia do Sul?',
		10,
		162
	),
	(2230, 'Qual é a capital da Dinamarca?', 10, 162),
	(2231, 'Qual é a capital da Escócia?', 10, 162),
	(2232, 'Qual é a capital da Espanha?', 10, 162),
	(2233, 'Qual é a capital da Jamaica?', 10, 162),
	(
		2234,
		'Qual é a capital do estado americano de Nova York?',
		10,
		162
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2235,
		'Qual é a capital do estado americano do Arizona?',
		10,
		162
	),
	(
		2236,
		'Qual é a cor do círculo na bandeira japonesa?',
		10,
		162
	),
	(
		2237,
		'Qual é a língua oficial da Costa Rica?',
		10,
		162
	),
	(
		2238,
		'Qual é a menor província do Canadá?',
		10,
		163
	),
	(
		2239,
		'Qual é o apelido do estado americano Delaware?',
		10,
		163
	),
	(2240, 'Qual é o maior país do mundo?', 10, 163),
	(
		2244,
		'Qual é o único estado dos Estados Unidos que não possui uma bandeira com formato de 4 arestas?',
		10,
		163
	),
	(
		2245,
		'Quantas estrelas aparecem na bandeira da Nova Zelândia?',
		10,
		163
	),
	(
		2246,
		'Quantos fusos horários a China tem?',
		10,
		163
	),
	(
		2247,
		'Que nome foi usado historicamente para a cidade turca atualmente conhecida como Istambul?',
		10,
		163
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2248,
		'Se o futebol é chamado de futebol na Inglaterra, como é chamado o futebol americano na Inglaterra?',
		10,
		163
	),
	(
		2249,
		'Todas as seguintes são classificadas como línguas fino-úgricas, EXCETO:',
		10,
		163
	),
	(
		2250,
		'A antiga cidade da Prússia Oriental de Königsberg é conhecida como qual cidade russa hoje?',
		15,
		164
	),
	(
		2251,
		'A massa de terra da Turquia moderna é chamada de quê?',
		15,
		164
	),
	(
		2252,
		'A sede da Organização Mundial da Saúde está localizada em qual país europeu?',
		15,
		164
	),
	(
		2253,
		'As cidades de Brugelette, Arlon e Ath estão localizadas em que país?',
		15,
		164
	),
	(
		2254,
		'As seguintes províncias espanholas estão localizadas na região norte da Espanha, exceto:',
		15,
		164
	),
	(
		2255,
		'Bridgetown é a capital de qual país insular do Caribe?',
		15,
		164
	),
	(
		2256,
		'Broome é uma cidade em que estado da Austrália?',
		15,
		164
	),
	(
		2257,
		'cidade histórica de Timbuktu está localizada em qual país da África Ocidental?',
		15,
		164
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2258,
		'Colchester Overpass, também conhecido como "Bunny Man Bridge", está localizado onde?',
		15,
		164
	),
	(
		2259,
		'Com quantos países a Espanha tem fronteira terrestre?',
		15,
		164
	),
	(
		2260,
		'Como era conhecida anteriormente a nação africana do Zimbábue?',
		15,
		164
	),
	(
		2261,
		'Como é chamada a região que une o Paquistão, a Índia e a China com liderança desconhecida?',
		15,
		164
	),
	(
		2262,
		'Em qual condado inglês você encontrará a Universidade de East Anglia?',
		15,
		164
	),
	(
		2263,
		'Em que condado inglês fica a cidade de Portsmouth?',
		15,
		164
	),
	(
		2264,
		'Em que continente está localizado o país de Angola?',
		15,
		164
	),
	(
		2265,
		'Em que continente está o país Lesoto?',
		15,
		165
	),
	(
		2266,
		'Em um mapa do metrô de Londres, de que cor é a Linha do Círculo?',
		15,
		165
	),
	(
		2267,
		'Frankenmuth, uma cidade dos EUA apelidada de "Pequena Baviera", está localizada em que estado?',
		15,
		165
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2268,
		'Gibraltar, localizada ao sul da Península Ibérica, é território de qual país da Europa Ocidental?',
		15,
		165
	),
	(
		2269,
		'Montreal fica em qual província canadense?',
		15,
		165
	),
	(
		2270,
		'Na pesquisa do Índice de Paz Global de 2016, de 163 países, qual foi a classificação dos Estados Unidos da América?',
		15,
		165
	),
	(
		2271,
		'O distrito japonês de Akihabara também é conhecido por qual apelido?',
		15,
		165
	),
	(
		2272,
		'O Lago Titicaca está localizado entre quais duas nações?',
		15,
		165
	),
	(
		2273,
		'O Principado de Sealand é uma micronação não reconhecida na costa de que país?',
		15,
		165
	),
	(
		2274,
		'Onde está localizado o "Deserto de Sonora"?',
		15,
		165
	),
	(
		2275,
		'Onde estão localizadas as Linhas de Nazca?',
		15,
		165
	),
	(
		2276,
		'Onde fica a área comumente conhecida como Triângulo das Bermudas?',
		15,
		165
	),
	(
		2277,
		'Quais são os dois países modernos que costumavam ser conhecidos como a região da Rodésia entre as décadas de 1890 e 1980?',
		15,
		165
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2278,
		'Quais são os quatro estados dos cantos dos EUA?',
		15,
		165
	),
	(
		2279,
		'Qual cidade alemã está localizada no rio Isar?',
		15,
		165
	),
	(
		2280,
		'Qual cidade europeia tem a maior quilometragem de canais do mundo?',
		15,
		165
	),
	(
		2281,
		'Qual cidade é a capital da Suíça?',
		15,
		166
	),
	(
		2282,
		'Qual das capitais desses países começa com a letra B?',
		15,
		166
	),
	(
		2283,
		'Qual das seguintes famílias linguísticas é a mais controversa entre os linguistas modernos?',
		15,
		166
	),
	(
		2284,
		'Qual das seguintes NÃO é uma capital?',
		15,
		166
	),
	(
		2285,
		'Qual dessas cidades americanas tem menos de 1.000.000 de pessoas?',
		15,
		166
	),
	(
		2286,
		'Qual desses países faz fronteira com a Polônia?',
		15,
		166
	),
	(
		2287,
		'Qual desses países NÃO está localizado na África?',
		15,
		166
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2288,
		'Qual desses países não é um estado membro das Nações Unidas?',
		15,
		166
	),
	(
		2289,
		'Qual desses países é o menor em população?',
		15,
		166
	),
	(
		2290,
		'Qual destas ilhas japonesas é a maior em área?',
		15,
		166
	),
	(
		2291,
		'Qual destas NÃO é uma ilha que faz parte das Filipinas?',
		15,
		166
	),
	(
		2292,
		'Qual destes países é "duplamente sem litoral" (cercado inteiramente por um ou mais países sem litoral)?',
		15,
		166
	),
	(
		2293,
		'Qual dos seguintes não é um país megadiverso - um que abriga um grande número de espécies endêmicas da Terra?',
		15,
		166
	),
	(
		2294,
		'Qual dos seguintes países NÃO reconhece a Armênia como um país independente?',
		15,
		166
	),
	(
		2295,
		'Qual dos seguintes países proibiu o uso de testes de ancestralidade genética pessoal?',
		15,
		166
	),
	(
		2296,
		'Qual dos seguintes é o maior rio da Europa?',
		15,
		166
	),
	(
		2297,
		'Qual estado dos Estados Unidos é o menor?',
		15,
		167
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2298,
		'Qual foi a cidade mais populosa das Américas em 2015?',
		15,
		167
	),
	(
		2299,
		'Qual país dentro do Reino Unido NÃO aparece em sua bandeira, a Union Jack?',
		15,
		167
	),
	(
		2300,
		'Qual país tem a abreviatura "CH"?',
		15,
		167
	),
	(2301, 'Qual país tem três capitais?', 15, 167),
	(
		2302,
		'Qual é a altura do One World Trade Center em Nova York?',
		15,
		167
	),
	(2303, 'Qual é a capital da Austrália?', 15, 167),
	(
		2304,
		'Qual é a capital da Bielorrússia?',
		15,
		167
	),
	(
		2305,
		'Qual é a capital da Colúmbia Britânica, no Canadá?',
		15,
		167
	),
	(2306, 'Qual é a capital da Eslováquia?', 15, 167),
	(2307, 'Qual é a capital da Eslovênia?', 15, 167);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (2308, 'Qual é a capital da Estônia?', 15, 167),
	(2309, 'Qual é a capital da Lituânia?', 15, 167),
	(
		2310,
		'Qual é a capital da Nova Zelândia?',
		15,
		167
	),
	(2311, 'Qual é a capital das Seicheles?', 15, 167),
	(
		2312,
		'Qual é a capital do estado americano de Nevada?',
		15,
		167
	),
	(2313, 'Qual é a capital do Peru?', 15, 168),
	(2314, 'Qual é a capital do Senegal?', 15, 168),
	(
		2318,
		'Qual é a montanha mais alta do mundo?',
		15,
		168
	),
	(
		2319,
		'Qual é o assentamento humano mais ao norte com habitantes durante todo o ano?',
		15,
		168
	),
	(
		2320,
		'Qual é o maior lago do continente africano?',
		15,
		168
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (2321, 'Qual é o maior rio da Europa?', 15, 168),
	(
		2322,
		'Qual é o menor país da América do Sul em área?',
		15,
		168
	),
	(
		2323,
		'Qual é o nome do antigo país que foi sucedido por países como Sérvia, Croácia e Eslovênia?',
		15,
		168
	),
	(
		2324,
		'Qual é o porto mais movimentado da Europa?',
		15,
		168
	),
	(
		2325,
		'Qual é o primeiro Parque Nacional designado nos Estados Unidos?',
		15,
		168
	),
	(
		2326,
		'Qual é o rio mais longo do mundo?',
		15,
		168
	),
	(
		2327,
		'Qual é o único país do mundo com uma bandeira que não tem quatro ângulos retos?',
		15,
		168
	),
	(
		2328,
		'Quantas províncias existem na Holanda?',
		15,
		168
	),
	(
		2329,
		'Quantos estados existem na Austrália?',
		15,
		169
	),
	(
		2330,
		'Quantos Estados soberanos são membros das Nações Unidas?',
		15,
		169
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2331,
		'Quantos fusos horários a Rússia tem?',
		15,
		169
	),
	(
		2332,
		'Quantos fusos horários existem na Rússia?',
		15,
		169
	),
	(
		2333,
		'Quantos países compartilham uma fronteira terrestre com Luxemburgo?',
		15,
		169
	),
	(
		2334,
		'Quantos países estão dentro do Reino Unido?',
		15,
		169
	),
	(
		2335,
		'Quantos países independentes existem no continente da América do Sul?',
		15,
		169
	),
	(
		2336,
		'Quantos rios existem na Arábia Saudita?',
		15,
		169
	),
	(
		2337,
		'Que cordilheira delimita a fronteira entre a Espanha e a França?',
		15,
		169
	),
	(
		2338,
		'Que ilha das Ilhas Canárias foi palco de um dos piores desastres aéreos da história com a colisão de dois jatos jumbo?',
		15,
		169
	),
	(
		2339,
		'Que país africano tem o português como língua oficial?',
		15,
		169
	),
	(
		2340,
		'Que país europeu não faz parte da UE?',
		15,
		169
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2341,
		'Que pequeno principado fica entre a Espanha e a França?',
		15,
		169
	),
	(
		2342,
		'terra de Gotland está localizada em qual país europeu?',
		15,
		169
	),
	(
		2343,
		'Todas as opções a seguir são cidades/aldeias na nação insular do Pacífico de Kiribati, EXCETO:',
		15,
		169
	),
	(
		2344,
		'Todos os seguintes países têm reivindicações oficiais de território na Antártica, EXCETO:',
		15,
		169
	),
	(
		2345,
		'A antiga cidade de ChichÉn ItzÁ foi construído por qual civilização?',
		20,
		170
	),
	(
		2346,
		'A Batalha de Hastings foi travada em que ano?',
		20,
		170
	),
	(
		2347,
		'A Espanha foi formada em 1469 com o casamento de Isabella I de Castela e Fernando II de que outro reino ibérico?',
		20,
		170
	),
	(
		2348,
		'A Hagia Sophia foi encomendada por qual imperador do Império Bizantino?',
		20,
		170
	),
	(
		2349,
		'A Revolta da Boêmia (1618-1620) começou depois que os protestantes em Praga fizeram o que com seus senhores regentes católicos?',
		20,
		170
	),
	(
		2350,
		'A Segunda Guerra dos Bôeres em 1899 foi travada onde?',
		20,
		170
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2351,
		'Antes de as colônias americanas mudarem para o calendário gregoriano em 1752, em que data o ano novo começava?',
		20,
		170
	),
	(
		2352,
		'Após a Batalha de Marj Dabiq em 1516, o Império Otomano assumiu o controle de Jerusalém de qual sultanato?',
		20,
		170
	),
	(
		2353,
		'Bohdan Khmelnytsky era qual dos seguintes?',
		20,
		170
	),
	(
		2354,
		'De 1940 a 1942, qual foi a capital no exílio da França Livre?',
		20,
		170
	),
	(
		2355,
		'Durante a Guerra das Rosas (1455 - 1487), qual inglês foi apelidado de "o Fazedor de Reis"?',
		20,
		170
	),
	(
		2356,
		'Durante a Primeira Guerra Mundial, os monarcas de qual nação eram parentes de sangue?',
		20,
		170
	),
	(
		2357,
		'Durante o Triunvirato Romano de 42 AEC, que região da República Romana foi dada a Lépido?',
		20,
		170
	),
	(
		2358,
		'Em que ano foi assinada a Declaração de Independência dos Estados Unidos?',
		20,
		170
	),
	(
		2359,
		'Em que ano o Canadá foi fundado?',
		20,
		170
	),
	(
		2360,
		'Em que ano ocorreu o ataque Sarin no metrô de Tóquio?',
		20,
		171
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2361,
		'Em que dia a ARPANET sofreu uma queda de rede de 4 horas?',
		20,
		171
	),
	(
		2362,
		'Em que dia começou a Primeira Guerra Mundial?',
		20,
		171
	),
	(
		2363,
		'Liste os seguintes impérios iranianos em ordem cronológica:',
		20,
		171
	),
	(
		2364,
		'No ano de 1900, quais eram os primeiros nomes mais populares dados a meninos e meninas nascidos nos Estados Unidos?',
		20,
		171
	),
	(
		2365,
		'O argumento ontológico para a prova da existência de Deus é primeiro atribuído a quem?',
		20,
		171
	),
	(
		2366,
		'O brasão do Rei de Espanha contém as armas dos monarcas de Castela, Leão, Aragão e de que outro antigo reino ibérico?',
		20,
		171
	),
	(
		2367,
		'O filho de qual papa supostamente realizou uma festa lasciva envolvendo 50 cortesãs no palácio papal?',
		20,
		171
	),
	(
		2368,
		'O panteão de Roma era usado para adorar que deus?',
		20,
		171
	),
	(
		2369,
		'O pianista Frédéric Chopin foi um compositor de qual era musical?',
		20,
		171
	),
	(
		2370,
		'O principal objetivo da operação alemã "Case Blue" durante a Segunda Guerra Mundial era originalmente capturar o quê?',
		20,
		171
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2371,
		'O que as primeiras máquinas de venda automática no início da década de 1880 distribuíam?',
		20,
		171
	),
	(
		2372,
		'Quais países participaram da Guerra da Lagosta?',
		20,
		171
	),
	(
		2373,
		'Qual batalha naval foi considerada o ponto de virada do Pacific Ocean Theatre durante a Segunda Guerra Mundial?',
		20,
		171
	),
	(
		2374,
		'Qual dessas posições o astrônomo e físico Isaac Newton não ocupou?',
		20,
		171
	),
	(
		2375,
		'Qual desses governantes não pertencia à dinastia dos Habsburgos?',
		20,
		171
	),
	(
		2376,
		'Qual dos seguintes físicos ajudou a Alemanha nazista na produção de uma arma nuclear?',
		20,
		172
	),
	(
		2377,
		'Qual dos seguintes não foi um dos dez golpes de Joseph Stalin durante a Segunda Guerra Mundial?',
		20,
		172
	),
	(
		2378,
		'Qual era o nome da operação ofensiva alemã em outubro de 1941 para tomar Moscou antes do inverno?',
		20,
		172
	),
	(
		2379,
		'Qual era o nome de Napoleão Bonaparte antes de mudá-lo?',
		20,
		172
	),
	(
		2380,
		'Qual era o nome do anel de espionagem que ajudou os Estados Unidos a vencer a Guerra Revolucionária?',
		20,
		172
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2381,
		'Qual era o nome original da cidade de Nova York?',
		20,
		172
	),
	(
		2382,
		'Qual era o nome verdadeiro do líder nacional albanês Skanderbeg?',
		20,
		172
	),
	(
		2452,
		'Adolf Hitler nasceu em que data?',
		15,
		177
	),
	(
		2383,
		'Qual foi a última colônia que o Reino Unido cedeu marcando o fim do Império Britânico?',
		20,
		172
	),
	(
		2384,
		'Qual foi o objetivo da "Revolução dos Guarda-Chuvas" em Hong Kong em 2014?',
		20,
		172
	),
	(
		2385,
		'Qual rei da Inglaterra enfrentou a Revolta dos Camponeses em 1381?',
		20,
		172
	),
	(
		2386,
		'Qual rei inglês foi casado com Leonor da Aquitânia?',
		20,
		172
	),
	(
		2387,
		'Qual é o casco NO. do destruidor da classe Fletcher Fletcher?',
		20,
		172
	),
	(
		2388,
		'Quando a SS ou Schutzstaffel foi estabelecida?',
		20,
		172
	),
	(
		2389,
		'Quando Adolf Hitler foi nomeado chanceler da Alemanha?',
		20,
		172
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2390,
		'Quando começou a Revolução Francesa?',
		20,
		172
	),
	(
		2391,
		'Quando o Canadá deixou a confederação para se tornar sua própria nação?',
		20,
		172
	),
	(
		2392,
		'Quantas mulheres ingressaram nas Forças Armadas dos Estados Unidos durante a Segunda Guerra Mundial?',
		20,
		173
	),
	(
		2393,
		'Quantas sonatas Ludwig van Beethoven escreveu?',
		20,
		173
	),
	(
		2394,
		'Quanto tempo durou a Revolta de Varsóvia durante a Segunda Guerra Mundial?',
		20,
		173
	),
	(
		2395,
		'Que idade tinha o rei Henrique V quando morreu?',
		20,
		173
	),
	(
		2396,
		'Quem assassinou o presidente James A. Garfield?',
		20,
		173
	),
	(
		2397,
		'A ideia do socialismo foi articulada e promovida por quem?',
		10,
		174
	),
	(
		2398,
		'A que partido político pertencia Abraham Lincoln quando eleito POTUS?',
		10,
		174
	),
	(2399, 'Como Sócrates foi executado?', 10, 174);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2400,
		'Durante a Segunda Guerra Mundial, em 1945, os Estados Unidos lançaram bombas atômicas sobre as duas cidades japonesas de Hiroshima e qual outra cidade?',
		10,
		174
	),
	(
		2401,
		'Em 1453, que cidade importante caiu?',
		10,
		174
	),
	(
		2402,
		'Em 1720, a Inglaterra estava endividada e se envolveu na Bolha dos Mares do Sul. Quem foi o principal mentor por trás disso?',
		10,
		174
	),
	(
		2403,
		'Em 1939, a Grã-Bretanha e a França declararam guerra à Alemanha após a invasão de qual país?',
		10,
		174
	),
	(
		2404,
		'Em que ano a pistola M1911 foi projetada?',
		10,
		174
	),
	(
		2405,
		'Em que ano começou a Primeira Guerra Mundial?',
		10,
		174
	),
	(
		2406,
		'Em que ano ocorreu o Crash de Wall Street?',
		10,
		174
	),
	(
		2407,
		'Em que ano terminou a Grande Guerra do Norte, entre a Rússia e a Suécia?',
		10,
		174
	),
	(
		2408,
		'Em que país Josef Stalin nasceu?',
		10,
		174
	),
	(
		2409,
		'Esses dois países mantiveram uma comunidade entre os séculos 16 e 18.',
		10,
		174
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2410,
		'O "Trilho de Lágrimas" foi resultado de qual Política de Remoção de Índios do Presidente dos Estados Unidos?',
		10,
		174
	),
	(
		2411,
		'O abolicionista John Brown invadiu o arsenal em que Virginia Town?',
		10,
		174
	),
	(
		2412,
		'O colapso da União Soviética ocorreu em que ano?',
		10,
		175
	),
	(
		2413,
		'O Império Otomano foi dissolvido após sua derrota em qual guerra?',
		10,
		175
	),
	(
		2414,
		'O que os Estados Unidos da América comemoram durante o 4 de julho?',
		10,
		175
	),
	(
		2415,
		'O rei Henrique VIII foi o segundo monarca de qual casa real européia?',
		10,
		175
	),
	(
		2416,
		'Qual desses tanques foi projetado e operado pelo Reino Unido?',
		10,
		175
	),
	(
		2417,
		'Qual destes não foi um local de desembarque na praia durante a invasão da Normandia?',
		10,
		175
	),
	(
		2418,
		'Qual dos seguintes países não era uma potência do eixo durante a Segunda Guerra Mundial?',
		10,
		175
	),
	(
		2419,
		'Qual dos seguintes povos antigos NÃO foi classificado como helênico (grego)?',
		10,
		175
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2420,
		'Qual era o apelido de Manfred von Richthofen?',
		10,
		175
	),
	(
		2421,
		'Qual era o nome comumente dado às antigas rotas comerciais que ligavam o leste e o oeste da Eurásia?',
		10,
		175
	),
	(
		2422,
		'Qual famoso comandante militar marchou com um exército, que incluía elefantes de guerra, sobre os Alpes durante a Segunda Guerra Púnica?',
		10,
		175
	),
	(
		2423,
		'Qual líder mundial famoso é famoso por dizer: "Deixe-os comer bolo", mas há rumores de que ele nunca disse isso?',
		10,
		175
	),
	(
		2424,
		'Qual país moderno é conhecido como "O Cemitério dos Impérios"?',
		10,
		175
	),
	(
		2425,
		'Qual é o nome histórico do Sri Lanka?',
		10,
		175
	),
	(
		2426,
		'Quando começou a Batalha do Somme?',
		10,
		175
	),
	(2427, 'Quando o Google foi fundado?', 10, 175),
	(
		2428,
		'Quanto tempo durou a Segunda Guerra Mundial?',
		10,
		176
	),
	(
		2429,
		'Quantos anos tinha Adolf Hitler quando morreu?',
		10,
		176
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2430,
		'Quantos pousos tripulados na lua ocorreram?',
		10,
		176
	),
	(2431, 'Que país aderiu à UE em 2013?', 10, 176),
	(
		2432,
		'Que país moderno é a região conhecida como Frígia nos tempos antigos?',
		10,
		176
	),
	(
		2433,
		'Quem andou a cavalo para avisar os Minutemen que os britânicos estavam chegando durante a Guerra Revolucionária dos Estados Unidos?',
		10,
		176
	),
	(2434, 'Quem descobriu a Penicilina?', 10, 176),
	(
		2435,
		'Quem era o primeiro-ministro do Japão quando o Japão declarou guerra aos EUA?',
		10,
		176
	),
	(
		2436,
		'Quem estava entre os mortos na tragédia do acidente de avião em Smolensk, na Rússia, em 2010?',
		10,
		176
	),
	(
		2437,
		'Quem foi o primeiro americano no espaço?',
		10,
		176
	),
	(
		2438,
		'Quem foi o primeiro presidente dos Estados Unidos?',
		10,
		176
	),
	(
		2439,
		'Quem foi o primeiro primeiro ministro do Canadá?',
		10,
		176
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2440,
		'Quem liderou a Revolução Comunista da Rússia?',
		10,
		176
	),
	(
		2441,
		'Sob qual das seguintes opções o Brasil foi uma ex-colônia?',
		10,
		176
	),
	(
		2442,
		' Em que diálogo Sócrates se defendeu perante a corte de Atenas?',
		15,
		177
	),
	(
		2443,
		' Qual rei foi morto na Batalha de Bosworth Field em 1485?',
		15,
		177
	),
	(
		2444,
		' Quando a Jamaica obteve sua independência da Inglaterra?',
		15,
		177
	),
	(
		2445,
		' Quem foi o primeiro chanceler de uma Alemanha unida em 1871?',
		15,
		177
	),
	(
		2446,
		'A Batalha do Somme na Primeira Guerra Mundial ocorreu em que país?',
		15,
		177
	),
	(
		2447,
		'A Fallingwater House, localizada na Pensilvânia, foi projetada por qual arquiteto?',
		15,
		177
	),
	(
		2448,
		'A Guerra da Coreia começou em que ano?',
		15,
		177
	),
	(
		2449,
		'A Guerra dos Trinta Anos terminou com qual tratado?',
		15,
		177
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2450,
		'A minigun foi projetada em 1960 por qual fabricante.',
		15,
		177
	),
	(
		2451,
		'A quem é atribuído o crédito pela gravação do poema épico A Odisseia?',
		15,
		177
	),
	(
		2453,
		'Após sua derrota na Batalha de Waterloo, Napoleão Bonaparte foi exilado para qual ilha?',
		15,
		177
	),
	(
		2454,
		'Com qual de suas seis esposas Henrique VIII foi casado por mais tempo?',
		15,
		177
	),
	(
		2455,
		'Como foi chamada a transferência de doenças, colheitas e pessoas através do Atlântico logo após a descoberta das Américas?',
		15,
		177
	),
	(
		2456,
		'De que nacionalidade era o sultão Saladino?',
		15,
		177
	),
	(
		2457,
		'Durante as invasões mongóis do Japão, quais eram os barcos mongóis mais parados?',
		15,
		178
	),
	(
		2458,
		'Durante qual campanha da Guerra Civil Americana as tropas da União cavaram um túnel sob as tropas confederadas para detonar explosivos sob elas?',
		15,
		178
	),
	(
		2459,
		'Em 1845, uma série de guerras com o nome das quais os indígenas começaram na Nova Zelândia?',
		15,
		178
	),
	(
		2460,
		'Em 1961, um avião americano B-52 caiu e quase detonou duas bombas nucleares de 4mt sobre qual cidade dos EUA?',
		15,
		178
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2461,
		'Em que ano a Austrália se tornou uma federação?',
		15,
		178
	),
	(
		2462,
		'Em que ano a Skoal, uma empresa de tabaco sem fumaça, lançou sua primeira linha de Pouches, conhecida como "Skoal Bandits"?',
		15,
		178
	),
	(
		2463,
		'Em que ano começou a primeira guerra mundial?',
		15,
		178
	),
	(
		2464,
		'Em que ano Constantinopla foi conquistada pelos turcos?',
		15,
		178
	),
	(
		2465,
		'Em que ano foi documentado o último caso natural de varíola?',
		15,
		178
	),
	(
		2466,
		'Em que ano foi fundada a empresa de videogames Electronic Arts?',
		15,
		178
	),
	(
		2467,
		'Em que ano foram instituídas as Reformas Marianas na República Romana?',
		15,
		178
	),
	(
		2468,
		'Em que ano Neil Armstrong e Buzz Aldrin pousaram na lua?',
		15,
		178
	),
	(
		2469,
		'Em que ano o famoso letreiro de Hollywood de 45 pés de altura foi erguido pela primeira vez?',
		15,
		178
	),
	(
		2470,
		'Em que ano o Kentucky se tornou o 15º estado a aderir ao sindicato?',
		15,
		178
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2471,
		'Em que ano o Texas se separou do México?',
		15,
		178
	),
	(
		2472,
		'Em que ano ocorreu a Batalha de Agincourt?',
		15,
		178
	),
	(
		2473,
		'Em que ano ocorreu o Crash do videogame norte-americano?',
		15,
		179
	),
	(
		2474,
		'Em que ano ocorreu o terremoto e tsunami do Boxing Day no Oceano Índico?',
		15,
		179
	),
	(
		2475,
		'Em que ano terminou a Guerra do Vietnã?',
		15,
		179
	),
	(
		2476,
		'Em que dia começou a construção do "Pentágono", a sede do Departamento de Defesa dos Estados Unidos?',
		15,
		179
	),
	(
		2477,
		'Em que dia começou a tentativa de golpe de Estado de 1991 na União Soviética?',
		15,
		179
	),
	(
		2478,
		'Em que prisão Adolf Hitler foi mantido em 1924?',
		15,
		179
	),
	(
		2479,
		'Em relação à ocupação britânica na Irlanda, o que o IRA representa.',
		15,
		179
	),
	(
		2480,
		'John Moses Browning, o designer do M1918 BAR (Browning Automatic Rifle) fazia parte de qual religião?',
		15,
		179
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2481,
		'Joseph Stalin teve um passado criminoso fazendo o quê?',
		15,
		179
	),
	(
		2482,
		'Na Guerra do Pacífico (1879 - 1883), a Bolívia perdeu o acesso ao Oceano Pacífico após ser derrotada por qual país sul-americano?',
		15,
		179
	),
	(
		2483,
		'Na Primeira Guerra Mundial, qual era o nome da aliança da Alemanha, Áustria-Hungria, Império Otomano e Bulgária?',
		15,
		179
	),
	(
		2484,
		'O criador do Enigma Cypher and Machine era de que nacionalidade?',
		15,
		179
	),
	(
		2485,
		'O genocídio Herero foi perpetrado na África por qual das seguintes nações coloniais?',
		15,
		179
	),
	(
		2486,
		'O médico fraudulento John R. Brinkley acumulou grande fama e riqueza no início dos anos 1900, oferecendo que serviço?',
		15,
		179
	),
	(
		2487,
		'O que aconteceu em 6 de junho de 1944?',
		15,
		179
	),
	(
		2488,
		'O Spitfire LF Mk IX tinha qual motor?',
		15,
		179
	),
	(
		2489,
		'Quais desses tanques de 1900 foram projetados e construídos ANTES dos outros?',
		15,
		180
	),
	(
		2490,
		'Quais foram os primeiros estados a se separar da Iugoslávia?',
		15,
		180
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2491,
		'Qual civilização americana é a fonte da crença de que o mundo acabaria ou mudaria drasticamente em 21 de dezembro de 2012?',
		15,
		180
	),
	(
		2492,
		'Qual conflito histórico matou mais pessoas?',
		15,
		180
	),
	(
		2493,
		'Qual das seguintes batalhas é frequentemente considerada como marcando o início da queda do Império Romano do Ocidente?',
		15,
		180
	),
	(
		2494,
		'Qual das seguintes NÃO é classificada como uma língua semética?',
		15,
		180
	),
	(
		2495,
		'Qual dessas instalações não estava presente no Titanic?',
		15,
		180
	),
	(
		2496,
		'Qual desses pais fundadores dos Estados Unidos da América mais tarde se tornou presidente?',
		15,
		180
	),
	(
		2497,
		'Qual desses países NÃO fazia parte da União Soviética?',
		15,
		180
	),
	(
		2498,
		'Qual destes países foi mapeado em 1500 pelas explorações marítimas portuguesas?',
		15,
		180
	),
	(
		2499,
		'Qual ditador matou mais pessoas?',
		15,
		180
	),
	(
		2500,
		'Qual dos seguintes povos do antigo Oriente Próximo ainda existe como um grupo étnico moderno?',
		15,
		180
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2501,
		'Qual dos seguintes reis assírios NÃO governou durante o Império Neoassírio?',
		15,
		180
	),
	(
		2502,
		'Qual edifício foi incendiado em 24 de agosto de 1812?',
		15,
		180
	),
	(
		2503,
		'Qual era o comprimento total do Titanic?',
		15,
		180
	),
	(
		2504,
		'Qual era o nome da planejada invasão do Japão no final da Segunda Guerra Mundial?',
		15,
		180
	),
	(
		2505,
		'Qual era o nome de um dos palácios sobreviventes de Henrique VIII localizado perto de Richmond, Londres?',
		15,
		181
	),
	(
		2506,
		'Qual era o nome do produto químico que foi lançado no Vietnã durante a guerra do Vietnã?',
		15,
		181
	),
	(
		2507,
		'Qual era o nome não oficial da Alemanha entre 1919 e 1933?',
		15,
		181
	),
	(
		2508,
		'Qual era o nome verdadeiro de Genghis Khan?',
		15,
		181
	),
	(
		2509,
		'Qual foi a batalha mais sangrenta em um único dia durante a Guerra Civil Americana?',
		15,
		181
	),
	(
		2510,
		'Qual foi o nome de código para a invasão alemã da União Soviética na Segunda Guerra Mundial?',
		15,
		181
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2511,
		'Qual general nazista era conhecido como a "Raposa do Deserto"?',
		15,
		181
	),
	(
		2512,
		'Qual Louis era conhecido como ''O Rei Sol da França''?',
		15,
		181
	),
	(
		2513,
		'Qual missão Apollo foi a última no programa Apollo da NASA?',
		15,
		181
	),
	(
		2514,
		'Qual nação NÃO tinha uma colônia na América moderna?',
		15,
		181
	),
	(
		2515,
		'Qual país foi uma potência aliada na Segunda Guerra Mundial?',
		15,
		181
	),
	(
		2516,
		'Qual país presenteou a Estátua da Liberdade aos Estados Unidos da América?',
		15,
		181
	),
	(
		2517,
		'Qual país teve uma "Revolução Laranja" entre 2004 e 2005?',
		15,
		181
	),
	(
		2518,
		'Qual presidente dos EUA estava no cargo quando a Guerra do Golfo começou?',
		15,
		181
	),
	(
		2519,
		'Qual presidente dos EUA foi notoriamente ''atacado'' por um coelho nadando?',
		15,
		181
	),
	(
		2520,
		'Qual ás dos tanques da Segunda Guerra Mundial é creditado por ter destruído mais tanques?',
		15,
		181
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2521,
		'Qual é o dispositivo mnemônico para lembrar o destino das esposas de Henrique VIII?',
		15,
		182
	),
	(
		2522,
		'Qual é o estado americano mais antigo?',
		15,
		182
	),
	(
		2523,
		'Qual é o evento mais sangrento da história dos Estados Unidos, em termos de baixas?',
		15,
		182
	),
	(
		2524,
		'Qual é o nome do navio espião da Marinha dos EUA que foi atacado e capturado pelas forças norte-coreanas em 1968?',
		15,
		182
	),
	(
		2525,
		'Qual é o nome do navio que estava a apenas alguns quilômetros de distância do RMS Titanic quando atingiu um iceberg em 14 de abril de 1912?',
		15,
		182
	),
	(
		2526,
		'Quando a Noruega conseguiu sua constituição?',
		15,
		182
	),
	(
		2527,
		'Quando a Noruega se libertou da Suécia?',
		15,
		182
	),
	(
		2528,
		'Quando começou a Crise do Terceiro Século?',
		15,
		182
	),
	(
		2529,
		'Quando Cristóvão Colombo navegou para a América, qual foi a primeira região em que ele chegou?',
		15,
		182
	),
	(
		2530,
		'Quando foi criada a Agência de Segurança Nacional dos Estados Unidos?',
		15,
		182
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2531,
		'Quando os britânicos entregaram a soberania de Hong Kong de volta à China?',
		15,
		182
	),
	(
		2532,
		'Quando os Estados Unidos declararam formalmente guerra ao Japão, entrando na Segunda Guerra Mundial?',
		15,
		182
	),
	(
		2533,
		'Quando terminou a Batalha do Bulge?',
		15,
		182
	),
	(
		2534,
		'Quando terminou a construção do Canal de Suez?',
		15,
		182
	),
	(
		2535,
		'Quantas vezes Albert Einstein se casou em sua vida?',
		15,
		182
	),
	(
		2536,
		'Quantos anos tinha Lyndon B. Johnson quando assumiu o cargo de presidente dos Estados Unidos?',
		15,
		182
	),
	(
		2537,
		'Que ano é considerado o ano em que o Império Britânico terminou?',
		15,
		183
	),
	(
		2538,
		'Que evento marcou o início da Segunda Guerra Mundial?',
		15,
		183
	),
	(
		2539,
		'Que número representa o numeral romano "D"?',
		15,
		183
	),
	(
		2540,
		'Quem assassinou o arquiduque Franz Ferdinand?',
		15,
		183
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2541,
		'Quem coroou Carlos Magno como Sacro Imperador Romano no dia de Natal de 800?',
		15,
		183
	),
	(
		2542,
		'Quem ensinou Alexandre, o Grande?',
		15,
		183
	),
	(
		2543,
		'Quem era o líder do Partido Comunista da Iugoslávia?',
		15,
		183
	),
	(
		2544,
		'Quem foi o primeiro explorador a navegar para a América do Norte?',
		15,
		183
	),
	(
		2545,
		'Quem foi o primeiro presidente nascido nos Estados Unidos independentes?',
		15,
		183
	),
	(
		2546,
		'Quem foi o último imperador romano no Ano dos Quatro Imperadores (69 DC)?',
		15,
		183
	),
	(
		2547,
		'Quem foi o único presidente dos Estados Unidos a ser eleito quatro vezes?',
		15,
		183
	),
	(
		2548,
		'Todos os seguintes são nomes dos Sete Estados Guerreiros, EXCETO:',
		15,
		183
	),
	(
		2549,
		'Uma das pandemias mais mortais, a "Gripe Espanhola", matou que porcentagem da população humana mundial na época?',
		15,
		183
	),
	(
		2550,
		'Na mitologia grega, quem era a filha do rei Minos?',
		20,
		184
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2551,
		'Na mitologia nórdica, qual é o nome da serpente que come as raízes do freixo Yggdrasil?',
		20,
		184
	),
	(
		2552,
		'Nidhogg é uma criatura mítica de que mitologia?',
		20,
		184
	),
	(
		2553,
		'Qual deus nórdico tem um cavalo chamado Sleipnir?',
		20,
		184
	),
	(
		2554,
		'Qual dos seguintes NÃO é um deus na mitologia nórdica.',
		20,
		184
	),
	(
		2555,
		'Que imensa estrutura é referida na mitologia nórdica como Yggdrasil.',
		20,
		184
	),
	(
		2556,
		'Quem é o deus egípcio da reprodução e da alface?',
		20,
		184
	),
	(
		2557,
		'Talos, o mítico homem gigante de bronze, era o protetor de qual ilha?',
		20,
		184
	),
	(
		2558,
		'A marca de roupas e calçados Nike leva o nome da deusa grega de quê?',
		10,
		185
	),
	(
		2559,
		'De que mitologia veio o deus "Apolo"?',
		10,
		185
	),
	(
		2560,
		'Na maioria das tradições, quem era a esposa de Zeus?',
		10,
		185
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2561,
		'Na mitologia grega, quem é o deus do vinho?',
		10,
		185
	),
	(
		2562,
		'O antigo deus romano da guerra era comumente conhecido como qual dos seguintes?',
		10,
		185
	),
	(
		2563,
		'Qual dessas criaturas mitológicas é considerada meio homem e meio cavalo?',
		10,
		185
	),
	(
		2564,
		'Qual figura da mitologia grega viajou para o submundo para devolver sua esposa Eurídice à terra dos vivos?',
		10,
		185
	),
	(
		2565,
		'Qual foi o único deus da Grécia que não mudou de nome em Roma?',
		10,
		185
	),
	(
		2566,
		'Que criaturas mitológicas têm rosto de mulher e corpo de abutre?',
		10,
		185
	),
	(
		2567,
		'Quem era o rei dos deuses na mitologia grega antiga?',
		10,
		185
	),
	(
		2568,
		'Esta figura mitológica grega é o deus/deusa da estratégia de batalha (entre outras coisas).',
		15,
		186
	),
	(2569, 'Hera é a deusa da...', 15, 186),
	(
		2570,
		'Na mitologia africana, Anansi é um trapaceiro e contador de histórias que assume a forma de qual animal?',
		15,
		186
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2571,
		'O Hipogrifo, que não deve ser confundido com o Grifo, é uma criatura mágica com a metade frontal de uma águia e a metade traseira de quê?',
		15,
		186
	),
	(2572, 'O nome grego de Netuno era...', 15, 186),
	(
		2573,
		'Qual desses deuses romanos não tem uma contrapartida na mitologia grega?',
		15,
		186
	),
	(
		2574,
		'Qual dos seguintes não é um dos destinos gregos?',
		15,
		186
	),
	(
		2575,
		'Qual é o nome do deus grego das mortes pacíficas?',
		15,
		186
	),
	(
		2576,
		'Qual é o nome do deus grego dos ferreiros?',
		15,
		186
	),
	(
		2577,
		'Qual é o nome do primeiro ser humano na mitologia nórdica?',
		15,
		186
	),
	(2578, 'Quem era o deus romano do fogo?', 15, 186),
	(
		2579,
		'Quem é o deus da guerra na mitologia polinésia?',
		15,
		186
	),
	(
		2580,
		'Segundo o folclore japonês, qual é a comida preferida do Kappa.',
		15,
		186
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2581,
		'Um minotauro é meio humano meio o quê?',
		15,
		186
	),
	(
		2582,
		'"Sim, a América pode!" foi o slogan de fato da campanha deste político dos Estados Unidos em 2004.',
		20,
		187
	),
	(
		2583,
		'Em junho de 2017, a Arábia Saudita e o Egito romperam relações com qual país por causa de seu suposto apoio ao terrorismo?',
		20,
		187
	),
	(2584, 'O que é centralismo?', 20, 187),
	(
		2585,
		'Qual carta você precisa ter em uma carteira de motorista europeia para andar de moto?',
		20,
		187
	),
	(
		2586,
		'Qual destes foi um candidato oficial nas eleições gerais britânicas de 2017?',
		20,
		187
	),
	(
		2587,
		'Qual dos seguintes presidentes dos Estados Unidos teve o mandato mais curto?',
		20,
		187
	),
	(
		2588,
		'Qual tribo/nação nativa americana requer pelo menos meio quantum de sangue (equivalente a um dos pais) para ser elegível como membro?',
		20,
		187
	),
	(
		2589,
		'Qual é o nome de NiccolÒ O trabalho de Maquiavel que argumentava que líderes eficazes precisavam esmagar seus oponentes a todo custo?',
		20,
		187
	),
	(
		2590,
		'Quem foi o senador mais antigo da história dos Estados Unidos, servindo de 1959 a 2010?',
		20,
		187
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2591,
		'De quem foi o slogan da campanha presidencial de 2016 "Make America Great Again"?',
		10,
		188
	),
	(
		2592,
		'O ex-presidente dos Estados Unidos, Bill Clinton, tocou qual instrumento?',
		10,
		188
	),
	(
		2593,
		'Qual dos seguintes países das Ilhas do Pacífico é governado por uma monarquia constitucional?',
		10,
		188
	),
	(
		2594,
		'Quantas pessoas estão na Câmara dos Representantes dos EUA?',
		10,
		188
	),
	(
		2595,
		'Quem foi o 45º presidente dos Estados Unidos?',
		10,
		188
	),
	(
		2596,
		'Antes de 2016, em que outro ano Donald Trump concorreu à presidência?',
		15,
		189
	),
	(
		2597,
		'Devido à Resolução de Nagoya, a China concordou em permitir que Taiwan competisse separadamente em eventos esportivos internacionais sob qual nome?',
		15,
		189
	),
	(
		2598,
		'Em que ano Gerald Ford se tornou presidente?',
		15,
		189
	),
	(
		2599,
		'Entre 1973 e 1990, que país foi governado pelo ditador Augusto Pinochet?',
		15,
		189
	),
	(
		2600,
		'Na história dos Estados Unidos, quantos vice-presidentes Franklin D. Roosevelt teve durante seu mandato como presidente?',
		15,
		189
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2601,
		'O escândalo Watergate ocorreu em que ano?',
		15,
		189
	),
	(
		2602,
		'Qual destes NÃO é um dos filhos de Donald Trump?',
		15,
		189
	),
	(
		2603,
		'Qual era o apelido pessoal do 40º governador do estado americano da Louisiana, Huey Long?',
		15,
		189
	),
	(
		2604,
		'Qual presidente apagou a dívida nacional dos Estados Unidos?',
		15,
		189
	),
	(
		2605,
		'Qual é o nome completo do ex-presidente dos Estados Unidos Bill Clinton?',
		15,
		189
	),
	(
		2606,
		'Quem era o primeiro-ministro britânico no início da Segunda Guerra Mundial?',
		15,
		189
	),
	(
		2607,
		'Quem foi eleito líder do Partido Trabalhista do Reino Unido em setembro de 2015?',
		15,
		189
	),
	(
		2608,
		'Quem foi o 40º presidente dos EUA?',
		15,
		189
	),
	(
		2609,
		'Quem foi o único presidente a não ocupar o cargo em Washington DC?',
		15,
		189
	),
	(
		2610,
		'Quem sucedeu Joseph Stalin como secretário-geral do Partido Comunista da União Soviética?',
		15,
		189
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2611,
		'Em 2014, mais de 6 milhões de veículos da General Motors foram recolhidos devido a qual falha crítica?',
		20,
		190
	),
	(
		2612,
		'Em que ano o mini caminhão Chevrolet LUV estreou?',
		20,
		190
	),
	(
		2613,
		'O lendário motor VR6 da Volkswagen tem cilindros posicionados em que ângulo de inclinação?',
		20,
		190
	),
	(
		2614,
		'Qual Audi não usa o sistema de tração integral baseado em Haldex?',
		20,
		190
	),
	(
		2615,
		'Qual carro é o primeiro veículo híbrido produzido em massa?',
		20,
		190
	),
	(
		2616,
		'Qual das seguintes NÃO é uma subempresa do Grupo Volkswagen?',
		20,
		190
	),
	(
		2617,
		'Qual desses códigos de chassi é usado pelo BMW série 3?',
		20,
		190
	),
	(
		2618,
		'Qual destes NÃO é um modelo de carro produzido pela montadora malaia Proton?',
		20,
		190
	),
	(2619, 'Qual motor está no Lexus SC400?', 20, 190),
	(
		2620,
		'Qual tecnologia Variable Valve Timing é usada pela BMW?',
		20,
		190
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2621,
		'Quanta potência é produzida pela locomotiva SD40-2?',
		20,
		190
	),
	(
		2622,
		'Que fabricante de carros abriu mão da patente do cinto de segurança para salvar vidas?',
		20,
		190
	),
	(
		2623,
		'Que tipo de trem era Stepney, um trem da Bluebell Railway notável por sua aparição em "The Railway Series"?',
		20,
		190
	),
	(
		2624,
		'A Jaguar Cars pertenceu anteriormente a qual fabricante de automóveis?',
		10,
		191
	),
	(
		2625,
		'A montadora italiana Lamborghini usa que animal como logotipo?',
		10,
		191
	),
	(
		2626,
		'motor LS2 tem quantos centímetros cúbicos?',
		10,
		191
	),
	(
		2627,
		'O motor LS1 tem quantos centímetros cúbicos?',
		10,
		191
	),
	(
		2628,
		'O motor LS7 tem quantos centímetros cúbicos?',
		10,
		191
	),
	(
		2629,
		'Onde são fabricados os carros da marca "Ferrari"?',
		10,
		191
	),
	(
		2630,
		'Os automóveis produzidos pela Tesla Motors operam com qual forma de energia?',
		10,
		191
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2631,
		'Quais são as partes semelhantes a cilindros que bombeiam para cima e para baixo dentro do motor?',
		10,
		191
	),
	(
		2632,
		'Qual destas empresas NÃO fabrica motocicletas?',
		10,
		191
	),
	(
		2633,
		'Qual dos seguintes fabricantes de automóveis teve uma guerra com o nome?',
		10,
		191
	),
	(
		2634,
		'Qual dos seguintes sistemas de prevenção de colisões ajuda os aviões a evitar colisões uns com os outros?',
		10,
		191
	),
	(
		2635,
		'Qual fabricante de pneus automotivos é famoso por sua linha "P Zero"?',
		10,
		191
	),
	(
		2636,
		'Qual fabricante de pneus de carro é famoso por sua marca de pneus "Eagle" e é o fornecedor oficial de pneus da NASCAR?',
		10,
		191
	),
	(
		2637,
		'Qual trem do Reino Unido NÃO ultrapassa 125 MPH?',
		10,
		191
	),
	(
		2638,
		'Qual é o carro legal de estrada mais rápido do mundo?',
		10,
		191
	),
	(
		2639,
		'Complete a seguinte analogia: a Audi está para a Volkswagen assim como a Infiniti está para a ?',
		15,
		192
	),
	(
		2640,
		'Em que país o supercarro Hussarya, fabricado pela montadora "Arrinera", é montado?',
		15,
		192
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2641,
		'Enzo Ferrari era originalmente um piloto de corrida de qual fabricante antes de fundar sua própria empresa de automóveis?',
		15,
		192
	),
	(
		2642,
		'O que representam os 4 anéis no logotipo da Audi?',
		15,
		192
	),
	(
		2643,
		'Quais destes modelos de carros são produzidos pela Lamborghini?',
		15,
		192
	),
	(
		2644,
		'Qual animal aparece no logotipo da Abarth, a divisão de automobilismo da Fiat?',
		15,
		192
	),
	(
		2645,
		'Qual desses carros NÃO é considerado um dos 5 supercarros modernos da Ferrari?',
		15,
		192
	),
	(
		2646,
		'Qual dos seguintes jatos de passageiros é o mais longo?',
		15,
		192
	),
	(
		2647,
		'Qual dos seguintes modelos de carros foi mais projetado com emblemas (rebatizados)?',
		15,
		192
	),
	(
		2648,
		'Qual dos seguintes NÃO é um fabricante de automóveis russo?',
		15,
		192
	),
	(
		2649,
		'Qual dos seguintes países proibiu oficialmente o uso civil de câmeras de painel em carros?',
		15,
		192
	),
	(
		2650,
		'Qual empresa de supercarros é da Suécia?',
		15,
		192
	);
INSERT INTO public.questoes (id, pergunta, pontuacao, questionario_id)
VALUES (
		2651,
		'Qual empresa japonesa é a maior fabricante mundial de motocicletas?',
		15,
		192
	),
	(
		2652,
		'Qual fabricante de carros criou o "Aventador"?',
		15,
		192
	),
	(
		2653,
		'Qual NÃO é a função do óleo do motor nos motores dos carros?',
		15,
		192
	);
-- Inserindo na tabela 'respostas'
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1, false, 'Annelida', 1),
	(2, true, 'Chordata', 1),
	(3, false, 'Equinoderma', 1),
	(4, false, 'placazoa', 1),
	(5, false, 'canídeos', 2),
	(6, false, 'Eupleridae', 2),
	(7, false, 'Felidae', 2),
	(8, true, 'Hyaenidae', 2),
	(9, false, 'Cabeça', 3),
	(10, true, 'Cauda', 3);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (11, false, 'Dentes', 3),
	(12, false, 'Pés', 3),
	(13, false, 'Dragão de Komodo', 4),
	(14, false, 'iguana verde', 4),
	(15, false, 'Monstro de Gila', 4),
	(16, true, 'Tuatara', 4),
	(17, true, 'caravela portuguesa', 5),
	(18, false, 'Irukandji', 5),
	(19, false, 'urtiga', 5),
	(20, false, 'vespa do mar', 5);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (21, false, 'aflito', 6),
	(22, false, 'faixa de prata', 6),
	(23, true, 'Gooty', 6),
	(24, false, 'tremonha', 6),
	(25, false, 'Canis Simiensis', 7),
	(26, false, 'coiote etíope', 7),
	(27, false, 'Raposa Amárica', 7),
	(28, true, 'Simien Jackel', 7),
	(29, false, 'Urso Atlas', 8),
	(30, false, 'urso pardo da Califórnia', 8);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (31, false, 'urso pardo mexicano', 8),
	(32, true, 'urso pardo sírio', 8),
	(33, true, 'Acinonyx jubatus', 9),
	(34, false, 'Felis catus', 9),
	(35, false, 'lince rufus', 9),
	(36, false, 'Panthera onca', 9),
	(37, false, 'Ara macao', 10),
	(38, true, 'Melopsittacus undulatus', 10),
	(39, false, 'Nymphicus hollandicus', 10),
	(40, false, 'Pyrrhura molinae', 10);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (41, false, 'Canis Aureus', 11),
	(42, false, 'Canis Latrans', 11),
	(43, true, 'Canis lupus', 11),
	(44, false, 'Canis Lupus Lycaon', 11),
	(45, false, 'Citocromo', 12),
	(46, false, 'Ferro', 12),
	(47, true, 'hemocianina', 12),
	(48, false, 'Metionina', 12),
	(49, false, 'casuar', 13),
	(50, true, 'Cigana', 13);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (51, false, 'Corvo-marinho', 13),
	(52, false, 'pássaro secretário', 13),
	(53, false, 'Caniformia', 14),
	(54, false, 'Ciconiiformes', 14),
	(55, true, 'Feliformia', 14),
	(56, false, 'Haplorina', 14),
	(57, false, 'Gato selvagem', 15),
	(58, false, 'Leão', 15),
	(59, true, 'Macaco', 15),
	(60, false, 'Papagaio', 15);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (61, true, 'Anfíbio', 16),
	(62, false, 'Mamíferos', 16),
	(63, false, 'Peixe', 16),
	(64, false, 'répteis', 16),
	(65, false, 'Criança', 17),
	(66, false, 'Filhote', 17),
	(68, false, 'pintinho', 17),
	(69, false, 'Dentro de uma árvore', 18),
	(70, false, 'No deserto', 18),
	(71, true, 'No fundo do oceano', 18);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (72, false, 'No topo de uma montanha', 18),
	(73, false, 'Amarelo', 19),
	(74, false, 'Branco', 19),
	(75, true, 'Marrom', 19),
	(76, false, 'Preto', 19),
	(77, false, 'Antílope Pronghorn', 20),
	(78, false, 'Gazela de Thomson', 20),
	(79, true, 'guepardo', 20),
	(80, false, 'Leão', 20),
	(81, false, 'Homo erectus', 21);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (82, false, 'Homo Ergaster', 21),
	(83, false, 'Homo Neanderthalensis', 21),
	(84, true, 'homo sapiens', 21),
	(85, false, 'Covil', 22),
	(86, false, 'Dray', 22),
	(87, false, 'Ninho', 22),
	(88, true, 'Toca', 22),
	(89, true, 'Assassinato', 23),
	(90, false, 'Gaggle', 23),
	(91, false, 'Pacote', 23);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (92, false, 'Rebanho', 23),
	(93, false, 'Brócolis', 24),
	(94, false, 'Minnie', 24),
	(95, false, 'Molho', 24),
	(96, true, 'Molho Tardar', 24),
	(97, false, '0', 25),
	(98, false, '2', 25),
	(99, false, '4', 25),
	(100, true, '6', 25),
	(101, false, '24', 26);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (102, false, '26', 26),
	(103, true, '28', 26),
	(104, false, '30', 26),
	(105, false, 'Camarão', 27),
	(106, false, 'caranguejos', 27),
	(107, true, 'krill', 27),
	(108, false, 'lagostas', 27),
	(109, false, 'Baluquistão, Paquistão', 28),
	(110, true, 'Tasmânia, Austrália', 28),
	(111, false, 'Valáquia, Romênia', 28);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (112, false, 'Óregon, Estados Unidos', 28),
	(113, true, 'Cabra', 29),
	(114, false, 'Camelo', 29),
	(115, false, 'lhama', 29),
	(116, false, 'Ovelha', 29),
	(117, false, 'Marfim', 30),
	(118, false, 'Osso', 30),
	(119, false, 'Pele', 30),
	(120, true, 'Queratina', 30),
	(121, false, 'Agressão', 31);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (122, false, 'Exaustão', 31),
	(123, false, 'Excitação', 31),
	(124, true, 'nervosismo', 31),
	(125, true, 'Dragão de Komodo', 32),
	(126, false, 'gazela saudita', 32),
	(127, false, 'leão marinho japonês', 32),
	(128, false, 'Tigre da Tasmânia', 32),
	(129, false, 'interior de taipan', 33),
	(130, true, 'Rei Cobra', 33),
	(
		131,
		false,
		'Serpente do Mar de Barriga Amarela',
		33
	);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (132, false, 'sucuri verde', 33),
	(133, true, 'Falcão peregrino', 34),
	(134, false, 'guepardo', 34),
	(135, false, 'mutuca', 34),
	(136, false, 'Águia Dourada', 34),
	(137, false, 'Urso polar', 35),
	(138, false, 'Ursus Arctos', 35),
	(139, true, 'Ursus Maritimus', 35),
	(140, false, 'Ursus Spelaeus', 35),
	(141, false, 'gorila gorila', 36);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (142, false, 'pan paniscus', 36),
	(143, true, 'Pan trogloditas', 36),
	(144, false, 'panthera leo', 36),
	(145, true, 'Felidae', 37),
	(146, false, 'felinae', 37),
	(147, false, 'Felis', 37),
	(148, false, 'Gato', 37),
	(149, true, 'drone', 38),
	(150, false, 'Macho', 38),
	(151, false, 'Soldado', 38);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (152, false, 'Trabalhador', 38),
	(153, false, 'Corrida', 39),
	(154, false, 'Deriva', 39),
	(155, false, 'Pacote', 39),
	(156, true, 'Travessura', 39),
	(157, false, 'Branco', 40),
	(158, true, 'Preto', 40),
	(159, false, 'Rosa', 40),
	(160, false, 'Verde', 40),
	(161, false, 'Inseto', 41);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (162, false, 'Peixe', 41),
	(163, false, 'Pássaro', 41),
	(164, true, 'Sapo', 41),
	(165, false, 'Augusto Rodin', 42),
	(166, true, 'Frédéric Auguste Bartholdi', 42),
	(167, false, 'Henrique Matisse', 42),
	(168, false, 'Jean-Léon Gérôme', 42),
	(169, false, 'Impressionismo', 43),
	(170, false, 'Neoclássico', 43),
	(171, true, 'pós-impressionismo', 43);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (172, false, 'Romantismo', 43),
	(173, false, '1487', 44),
	(174, true, '1504', 44),
	(175, false, '1511', 44),
	(176, false, '1523', 44),
	(177, false, 'Augsburgo', 45),
	(178, false, 'Bamberga', 45),
	(179, false, 'Berlim', 45),
	(180, true, 'Nurnberg', 45),
	(181, false, 'Cubismo', 46);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (182, false, 'Impressionismo', 46),
	(183, true, 'Neoplasticismo', 46),
	(184, false, 'Precisionismo', 46),
	(185, false, 'Bizâncio', 47),
	(186, true, 'Kobicha', 47),
	(187, false, 'Palatinado', 47),
	(188, false, 'Pompa e poder', 47),
	(189, false, '1', 48),
	(190, false, '2', 48),
	(191, false, '3', 48);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (192, true, '4', 48),
	(193, false, 'A Igreja de Auvers', 49),
	(194, true, 'A noite estrelada', 49),
	(195, false, 'Campos de Trigo com Corvos', 49),
	(196, false, 'O Semeador com Sol Poente', 49),
	(197, true, 'A Nona Onda', 50),
	(199, false, 'Noite estrelada', 50),
	(200, false, 'Quarto Em Arles', 50),
	(201, false, 'Edgar Degas', 51),
	(202, false, 'Jackson Pollock', 51);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (203, true, 'Salvador Dalí', 51),
	(204, false, 'Vincent van Gogh', 51),
	(205, false, 'Claude Monet', 52),
	(206, true, 'Leonardo da Vinci', 52),
	(207, false, 'Pablo Picasso', 52),
	(208, false, 'Vincent van Gogh', 52),
	(209, false, 'Leonardo da Vinci', 53),
	(210, false, 'Michelangelo', 53),
	(211, false, 'Pablo Picasso', 53),
	(212, true, 'Vincent van Gogh', 53);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (213, false, 'Caravaggio', 54),
	(214, false, 'Leonardo da Vinci', 54),
	(215, true, 'Michelangelo', 54),
	(216, false, 'Rembrandt', 54),
	(217, true, 'Espanhol', 55),
	(218, false, 'Francês', 55),
	(219, false, 'italiano', 55),
	(220, false, 'Português', 55),
	(221, true, 'Andy Warhol', 56),
	(222, false, 'David Hockney', 56);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (223, false, 'Peter Blake', 56),
	(224, false, 'Roy lichtenstein', 56),
	(
		225,
		false,
		'Andarilho acima do Mar de Névoa',
		57
	),
	(226, false, 'O mar de gelo', 57),
	(227, true, 'o mar negro', 57),
	(228, false, 'O monge à beira-mar', 57),
	(229, false, 'Cofix', 58),
	(230, true, 'Copic', 58),
	(231, false, 'Dopix', 58),
	(232, false, 'Marx', 58);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (233, false, 'Andy Warhol', 59),
	(234, false, 'Pablo Picasso', 59),
	(235, true, 'Salvador Dalí', 59),
	(236, false, 'Vincent van Gogh', 59),
	(237, false, 'Francisco Goya', 60),
	(238, false, 'Henrique Matisse', 60),
	(239, false, 'Leonardo da Vinci', 60),
	(240, true, 'Pablo Picasso', 60),
	(241, false, 'Arizona', 61),
	(242, false, 'Califórnia', 61);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (243, false, 'Geórgia', 61),
	(244, true, 'Nova Iorque', 61),
	(245, true, 'alce', 62),
	(246, false, 'Cabra', 62),
	(247, false, 'Cachorro', 62),
	(248, false, 'Urso', 62),
	(249, false, 'assurismo', 63),
	(250, false, 'judaísmo', 63),
	(251, false, 'Paganismo', 63),
	(252, true, 'zoroastrismo', 63);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (253, true, 'Collingwood College', 64),
	(254, false, 'Escola Tomlinscote', 64),
	(255, false, 'Kings International College', 64),
	(256, false, 'Lyndhurst School', 64),
	(257, false, '5′ 4″', 65),
	(258, false, '5′ 5″', 65),
	(259, true, '5′ 7″', 65),
	(260, false, '5′ 9″', 65),
	(261, false, 'Bruno Mars', 66),
	(262, true, 'Charlie Sheen', 66);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (263, false, 'Joaquin Phoenix', 66),
	(264, false, 'Ricky Martin', 66),
	(265, false, '2 Chainz', 67),
	(266, true, 'Drake', 67),
	(267, false, 'Lil Wayne', 67),
	(268, false, 'Travis Scott', 67),
	(269, false, 'Booker', 68),
	(270, true, 'Sundance', 68),
	(271, false, 'torneiro', 68),
	(272, false, 'Woodward', 68);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (273, false, ' documentários', 69),
	(274, false, 'Filmes de ação', 69),
	(275, false, 'marcos históricos', 69),
	(
		276,
		true,
		'Prédios abandonados e shoppings mortos',
		69
	),
	(277, true, 'Gregg Turkington', 70),
	(278, false, 'Nathan Fielder', 70),
	(279, false, 'Tim Heidecker', 70),
	(280, false, 'Todd Glass', 70),
	(281, false, 'Charlie Sheen', 71),
	(282, false, 'Emílio Estevez', 71);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (283, true, 'Martin Sheen', 71),
	(284, false, 'Ramon Sheen', 71),
	(285, true, 'Catherine Zeta-Jones', 72),
	(286, false, 'Pam Ferris', 72),
	(287, false, 'Ruth Jones', 72),
	(288, false, 'Sara Sugarman', 72),
	(289, false, 'Donald Trump', 73),
	(290, true, 'Kanye West', 73),
	(291, false, 'Leonardo Di Caprio', 73),
	(292, false, 'Miley Cyrus', 73);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (293, false, 'Ataque de faca', 74),
	(294, false, 'incêndio em casa', 74),
	(295, true, 'Overdose de drogas', 74),
	(296, false, 'Tiro', 74),
	(297, true, 'arma americana', 75),
	(298, false, 'cães de neve', 75),
	(299, false, 'Monstros SA', 75),
	(300, false, 'rangers do Texas', 75),
	(301, false, 'Jack', 76),
	(302, true, 'James', 76);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (303, false, 'John', 76),
	(304, false, 'Justin', 76),
	(305, true, 'A festa', 77),
	(306, false, 'As Cheetah Girls', 77),
	(307, false, 'as garotas do tempo', 77),
	(308, false, 'As Pussycat Dolls', 77),
	(309, false, 'Babe Ruth', 78),
	(310, true, 'Joe DiMaggio', 78),
	(311, false, 'Mason Williams', 78),
	(312, false, 'Tino Martinez', 78);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (313, true, 'O nerd irritado do videogame', 79),
	(314, false, 'PeanutButterGamer', 79),
	(315, false, 'TotalBiscuit', 79),
	(
		316,
		false,
		'Youtuber com mais subs do mundo',
		79
	),
	(317, true, 'Bobby Shmurda', 80),
	(318, false, 'DJ Cobra', 80),
	(319, false, 'jovem bandido', 80),
	(320, false, 'Swae Lee', 80),
	(321, true, 'Grande irmão', 81),
	(322, false, 'O bacharel', 81);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (323, false, 'Perigo', 81),
	(324, false, 'Sobrevivente', 81),
	(325, false, '1986', 82),
	(326, false, '1989', 82),
	(327, true, '1995', 82),
	(328, false, '1997', 82),
	(329, true, '1982', 83),
	(330, false, '1984', 83),
	(331, false, '1985', 83),
	(332, false, '1995', 83);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (333, false, '1991', 84),
	(334, false, '1992', 84),
	(335, true, '1995', 84),
	(336, false, '1996', 84),
	(337, true, 'Escorpião', 85),
	(338, false, 'Falcão', 85),
	(339, false, 'Jato', 85),
	(340, false, 'Nightshade', 85),
	(341, false, 'jasão', 86),
	(342, false, 'Jeff', 86);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (343, false, 'Jerald', 86),
	(344, true, 'John', 86),
	(345, true, 'Assédio moral', 87),
	(346, false, 'Nomeação para Pior Ator', 87),
	(347, false, 'Racismo', 87),
	(348, false, 'Registro criminal', 87),
	(349, true, 'Atlanta, Geórgia', 88),
	(350, false, 'Chicago, Illinois', 88),
	(351, false, 'Detroit, Michigan', 88),
	(352, false, 'Los Angeles, Califórnia', 88);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (353, true, 'Bing Crosby', 89),
	(354, false, 'Charlie Chaplin', 89),
	(355, false, 'Elvis Presley', 89),
	(356, false, 'Groucho Marx', 89),
	(357, false, 'Ainsley Harriott', 90),
	(358, false, 'Antony Worrall Thompson', 90),
	(359, true, 'Gordon Ramsay', 90),
	(360, false, 'Jamie Oliver', 90),
	(361, false, 'Derrick Acosta', 91),
	(362, true, 'Jon Jafari', 91);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (363, false, 'Rocco Botte', 91),
	(364, false, 'Shawn Chatfield', 91),
	(365, false, 'Arthur Miller', 92),
	(366, true, 'James Dougherty', 92),
	(367, false, 'joe dimaggio', 92),
	(368, false, 'Kirk Douglas', 92),
	(369, false, '1º de dezembro de 1750', 93),
	(370, true, '23 de abril de 1564', 93),
	(371, false, '29 de setembro de 1699', 93),
	(372, false, '4 de julho de 1409', 93);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (373, false, 'AngryJoeShow', 94),
	(374, true, 'O Crítico Nostálgico', 94),
	(375, false, 'O Esnobe do Cinema', 94),
	(376, false, 'O nerd irritado do videogame', 94),
	(377, false, 'Allison Harvard', 95),
	(378, false, 'Catie Wayne', 95),
	(379, true, 'Christopher Poole', 95),
	(380, false, 'Mark Zuckerberg', 95),
	(381, false, '13 de dezembro de 1931', 96),
	(382, false, '17 de abril de 1938', 96);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (383, false, '18 de julho de 1940', 96),
	(384, true, '8 de janeiro de 1935', 96),
	(385, false, '30 libras', 97),
	(386, false, '50 libras', 97),
	(387, true, '60 libras', 97),
	(388, false, '70 libras', 97),
	(389, false, '56', 98),
	(390, false, '61', 98),
	(391, true, '74', 98),
	(392, false, 'ele ainda está vivo', 98);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (393, true, 'católico', 99),
	(394, false, 'cristão', 99),
	(395, false, 'islâmico', 99),
	(396, false, 'judaico', 99),
	(397, false, 'Contar', 100),
	(398, false, 'Medir', 100),
	(399, true, 'Saber', 100),
	(400, false, 'Viver', 100),
	(
		401,
		true,
		'A separação de uma cepa de uma população natural e mista de micróbios vivos',
		101
	),
	(
		402,
		false,
		'Falta de nutrição em microambientes',
		101
	);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (403, false, 'O nível de nitrogênio no solo', 101),
	(
		404,
		false,
		'Testar os efeitos de certos microrganismos em ambientes isolados, como cavernas',
		101
	),
	(405, false, 'Cobre', 102),
	(406, false, 'Liderar', 102),
	(407, false, 'Lítio', 102),
	(408, true, 'Magnésio', 102),
	(409, false, 'Cérebro', 103),
	(410, false, 'Fígado', 103),
	(411, true, 'pâncreas', 103),
	(412, false, 'Rim', 103);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (413, false, 'Banana', 104),
	(414, false, 'Mirtilo', 104),
	(415, true, 'Morango', 104),
	(416, false, 'uva concórdia', 104),
	(417, false, 'Efeito Fransen', 105),
	(418, false, 'Efeito McGurck', 105),
	(419, false, 'Ilusão de Glissandro', 105),
	(420, true, 'Tom de Shepard', 105),
	(421, false, 'Aspirina', 106),
	(422, false, 'Cetamina', 106);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (423, true, 'Ibuprofeno', 106),
	(424, false, 'Morfina', 106),
	(425, false, 'Agulhas', 107),
	(426, false, 'Cemitérios', 107),
	(427, true, 'palhaços', 107),
	(428, false, 'túneis', 107),
	(429, false, 'Brisa', 108),
	(430, false, 'Furacão', 108),
	(431, false, 'Tempestade', 108),
	(432, true, 'vendaval', 108);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (433, false, 'capsaicina', 109),
	(434, false, 'Dihidrocapsaicina', 109),
	(435, true, 'Resiniferatoxina', 109),
	(436, false, 'tiniatoxina', 109),
	(437, false, 'Teorema de Bell', 110),
	(438, false, 'Teorema de Carnot', 110),
	(439, true, 'Teorema de Noether', 110),
	(440, false, 'Teorema de Wick', 110),
	(
		441,
		true,
		'27° Milhão F (15° Milhão C)',
		111
	),
	(
		442,
		false,
		'8° Bilhões de F (°4,4 bilhões de C)',
		111
	);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (443, false, '938.000° F (521093,3° C)', 111),
	(444, false, 'Zero Absoluto (Ambos F e C)', 111),
	(445, false, 'a retrolavagem', 112),
	(446, false, 'o ablativo', 112),
	(447, true, 'o coma', 112),
	(448, false, 'O despertar', 112),
	(449, false, 'Gorila Beringei Beringei', 113),
	(450, false, 'Gorila Beringei Graueri', 113),
	(451, false, 'Gorila Gorila Diehli', 113),
	(452, true, 'Gorila Gorila Gorila', 113);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (
		453,
		false,
		'Um estimulante de combate da Segunda Guerra Mundial',
		114
	),
	(454, true, 'Um gênero de mariposas', 114),
	(455, false, 'Um tipo de tempero', 114),
	(
		456,
		false,
		'Uma cidade portuária no Caribe',
		114
	),
	(457, false, 'Vitamina A', 115),
	(458, true, 'Vitamina B', 115),
	(459, false, 'Vitamina C', 115),
	(460, false, 'Vitamina D', 115),
	(461, false, 'Braço', 116),
	(462, true, 'bunda', 116);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (463, false, 'Cabeça', 116),
	(464, false, 'Tronco', 116),
	(465, false, 'Células assassinas naturais', 117),
	(466, false, 'Células dendríticas', 117),
	(467, true, 'Células T citotóxicas', 117),
	(468, false, 'Glóbulos brancos', 117),
	(
		469,
		true,
		'As experiências com cães de Pavlov',
		118
	),
	(
		470,
		false,
		'Experimentos com macacos de Harlow',
		118
	),
	(
		471,
		false,
		'Experiência da caixa de Skinner',
		118
	),
	(
		472,
		false,
		'O experimento do gato de Schrödinger',
		118
	);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (473, false, 'Deslizamento', 119),
	(474, true, 'Drop-slide', 119),
	(475, false, 'Foreshock', 119),
	(476, false, 'tremor', 119),
	(477, true, 'Grande tubarão branco', 120),
	(478, false, 'Orca', 120),
	(479, false, 'Peixe-gato', 120),
	(480, false, 'Polvo', 120),
	(481, false, 'Cloreto de Potássio', 121),
	(482, false, 'Cloreto de Sódio', 121);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (483, false, 'Ácido clorídrico', 121),
	(484, true, 'Ácido sulfúrico', 121),
	(485, false, 'ACA', 122),
	(486, false, 'AGIR', 122),
	(487, false, 'GTA', 122),
	(488, true, 'TAA', 122),
	(489, true, 'Boro', 123),
	(490, false, 'Carbono', 123),
	(491, false, 'Ferro', 123),
	(492, false, 'Oxigênio', 123);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (493, false, 'Hássio', 124),
	(494, false, 'lutécio', 124),
	(495, false, 'Praseodímio', 124),
	(496, true, 'vitrânio', 124),
	(497, false, 'Trapézio', 125),
	(500, false, 'Triquetrum', 125),
	(501, false, 'Enxofre', 126),
	(502, false, 'Ferro', 126),
	(503, false, 'hidrogênio', 126),
	(504, true, 'Urânio', 126);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (505, false, 'Etanol', 127),
	(506, false, 'Formaldeído', 127),
	(507, false, 'Propano', 127),
	(508, true, 'uréia', 127),
	(509, true, 'Cretáceo-Paleogeno', 128),
	(510, false, 'Ordoviciano - Siluriano', 128),
	(511, false, 'Permiano–Triássico', 128),
	(512, false, 'Triássico–Jurássico', 128),
	(513, false, 'B', 129),
	(514, false, 'D', 129);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (515, false, 'O', 129),
	(516, true, 'R', 129),
	(517, false, 'Calisto', 130),
	(518, false, 'Europa', 130),
	(519, false, 'Miranda', 130),
	(520, true, 'Titã', 130),
	(521, false, 'hertz', 131),
	(522, false, 'Ohm', 131),
	(523, false, 'Pascal', 131),
	(524, true, 'Volt', 131);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (525, false, 'C2H4O2', 132),
	(526, true, 'C6H12O6', 132),
	(527, false, 'CH4', 132),
	(528, false, 'K+', 132),
	(529, false, 'C6H2O6', 133),
	(530, false, 'N2O', 133),
	(531, true, 'O3', 133),
	(532, false, 'SO4', 133),
	(533, false, 'Amianto', 134),
	(534, false, 'Cianeto', 134);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (535, false, 'Ricina', 134),
	(536, true, 'Toxina botulínica', 134),
	(537, false, 'Coulomb', 135),
	(538, true, 'henrique', 135),
	(539, false, 'mho', 135),
	(540, false, 'Weber', 135),
	(541, true, 'Azul', 136),
	(542, false, 'Roxo', 136),
	(543, false, 'Verde', 136),
	(544, false, 'Vermelho', 136);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (545, false, 'Raposa vermelha', 137),
	(546, false, 'Vulpes Redus', 137),
	(547, true, 'Vulpes Vulpes', 137),
	(548, false, 'Vulpes Vulpies', 137),
	(549, false, 'Forame magno', 138),
	(550, false, 'Fêmur', 138),
	(551, false, 'Omoplata', 138),
	(552, true, 'Patela', 138),
	(553, true, 'Australopithecus Afarensis', 139),
	(554, false, 'Australopithecus Africanus', 139);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (555, false, 'Australopithecus Antaris', 139),
	(556, false, 'Australopithecus Architeuthis', 139),
	(557, false, 'Carbonato de Sódio Anidro', 140),
	(558, false, 'cloreto de amônio', 140),
	(559, false, 'Dióxido de manganês', 140),
	(560, true, 'Monóxido de Di-hidrogênio', 140),
	(561, true, '0,1 Microsievert', 141),
	(562, false, '0,3 Microsievert', 141),
	(563, false, '0,5 Microsievert', 141),
	(564, false, '0,7 Microsievert', 141);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (565, true, '100', 142),
	(566, false, '26', 142),
	(567, false, '50', 142),
	(568, false, '74', 142),
	(569, false, '1 UA', 143),
	(570, false, '105,40 anos terrestres', 143),
	(571, false, '501,2 milhões de milhas', 143),
	(572, true, '9,461 trilhões de quilômetros', 143),
	(573, false, '6,002 x 10^22', 144),
	(574, false, '6,002 x 10^23', 144);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (575, false, '6,022 x 10^22', 144),
	(576, true, '6,022 x 10^23', 144),
	(577, false, 'Síndrome de Down', 145),
	(578, true, 'Síndrome de Jacob', 145),
	(579, false, 'Síndrome de Klinefelter', 145),
	(580, false, 'Síndrome de Turner', 145),
	(581, false, 'Cotovelo de tenista', 146),
	(582, true, 'Dores nas canelas', 146),
	(583, false, 'Joelho da empregada', 146),
	(584, false, 'túnel do carpo', 146);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (585, false, 'adenina', 147),
	(586, true, 'Citosina', 147),
	(587, false, 'timina', 147),
	(588, false, 'uracilo', 147),
	(589, false, 'Lei de Ampère', 148),
	(590, false, 'Lei de Biot-Savart', 148),
	(591, false, 'lei de faraday', 148),
	(592, true, 'Lei de Gauss', 148),
	(593, false, '-39', 149),
	(594, true, '-40', 149);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (595, false, '-42', 149),
	(596, false, '32', 149),
	(597, false, 'flores', 150),
	(598, false, 'Grãos', 150),
	(599, false, 'Legumes', 150),
	(600, true, 'árvores', 150),
	(601, false, 'Bocejar', 151),
	(602, true, 'Espirrar', 151),
	(603, false, 'Soluço', 151),
	(604, false, 'Tosse', 151);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (605, false, 'Aldeído', 152),
	(606, false, 'Alquil', 152),
	(607, false, 'carbonila', 152),
	(608, true, 'Hidroxila', 152),
	(609, true, 'Fêmur', 153),
	(610, false, 'Fíbula', 153),
	(611, false, 'Omoplata', 153),
	(612, false, 'Ulna', 153),
	(613, false, 'Coração', 154),
	(614, true, 'Cérebro', 154);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (615, false, 'Pele', 154),
	(616, false, 'Pulmões', 154),
	(
		617,
		false,
		'A presença ou ausência de certas organelas',
		155
	),
	(
		618,
		true,
		'A presença ou ausência de um núcleo',
		155
	),
	(619, false, 'O modo de reprodução', 155),
	(620, false, 'O tamanho geral', 155),
	(621, true, 'Nariz', 156),
	(622, false, 'Ouvidos', 156),
	(623, false, 'Pescoço', 156),
	(624, false, 'Queixo', 156);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (625, false, '1', 157),
	(626, true, '2', 157),
	(627, false, '3', 157),
	(628, false, '4', 157),
	(629, false, 'Azoto', 158),
	(630, true, 'Carbono', 158),
	(631, false, 'hidrogênio', 158),
	(632, false, 'Oxigênio', 158),
	(633, false, 'Júpiter e Saturno', 159),
	(634, true, 'Marte e Júpiter', 159);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (635, false, 'Mercúrio e Vênus', 159),
	(636, false, 'Terra e Marte', 159),
	(637, false, 'Amônia', 160),
	(638, false, 'Azoto', 160),
	(639, true, 'Dióxido de carbono', 160),
	(640, false, 'Oxigênio', 160),
	(641, false, 'um buraco de minhoca', 161),
	(642, true, 'um buraco negro', 161),
	(643, false, 'um quasar', 161),
	(644, false, 'uma supernova', 161);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (645, false, 'Ciência', 162),
	(646, true, 'Espaço', 162),
	(647, false, 'Estrela', 162),
	(648, false, 'Sociedade', 162),
	(649, false, 'Ácido Desintoxicante', 163),
	(650, false, 'Ácido Desoxirribogenético', 163),
	(651, true, 'Ácido desoxirribonucleico', 163),
	(652, false, 'Átomos Desoxirribogenéticos', 163),
	(653, false, 'Nares', 164),
	(654, false, 'nevo', 164);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (655, false, 'Paxillus', 164),
	(656, true, 'Umbigo', 164),
	(
		657,
		false,
		'Amplificador de luz por energia de espera do rádio',
		165
	),
	(
		658,
		true,
		'Amplificação de Luz por Emissão Estimulada de Radiação',
		165
	),
	(
		659,
		false,
		'Lite analisando por estéreo ecorazer',
		165
	),
	(
		660,
		false,
		'Vida antimatéria por entrada permanente de alcance',
		165
	),
	(661, true, 'Antimônio', 166),
	(662, false, 'Bromo', 166),
	(663, false, 'Lata', 166),
	(664, false, 'Rubídio', 166);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (665, false, 'Crânio', 167),
	(666, true, 'Fêmur', 167),
	(667, false, 'Tíbia', 167),
	(668, false, 'Úmero', 167),
	(669, false, ' Fíbula', 168),
	(670, false, 'Patela', 168),
	(671, true, 'Raio', 168),
	(672, false, 'Tíbia', 168),
	(673, true, 'Ferro', 169),
	(674, false, 'Lata', 169);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (675, false, 'Ouro', 169),
	(676, false, 'Prata', 169),
	(677, false, 'argônio', 170),
	(678, true, 'Azoto', 170),
	(679, false, 'Dióxido de carbono', 170),
	(680, false, 'Oxigênio', 170),
	(681, false, 'Apolo 10', 171),
	(682, true, 'Apolo 11', 171),
	(683, false, 'Apolo 13', 171),
	(684, false, 'Apolo 9', 171);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (685, false, 'cloroplasto', 172),
	(686, true, 'Mitocôndria', 172),
	(687, false, 'Núcleo', 172),
	(688, false, 'Retículo endoplasmático', 172),
	(689, false, '10', 173),
	(690, true, '12', 173),
	(691, false, '14', 173),
	(692, false, '16', 173),
	(693, true, 'Mitocôndria', 174),
	(694, false, 'Núcleo', 174);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (695, false, 'Red Bull', 174),
	(696, false, 'ribossomo', 174),
	(697, false, 'catinona', 175),
	(698, false, 'Efedrina', 175),
	(699, false, 'Glaucina', 175),
	(700, true, 'Nicotina', 175),
	(701, true, '299.792.458 m/s', 176),
	(702, false, '308.215.043 m/s', 176),
	(703, false, '50.461 m/s', 176),
	(704, false, '751.665.014.151 m/s', 176);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (705, true, 'hidrogênio', 177),
	(706, false, 'Hélio', 177),
	(707, false, 'Lítio', 177),
	(708, false, 'Oxigênio', 177),
	(709, true, 'Baleia Azul', 178),
	(710, false, 'Girafa', 178),
	(711, false, 'lula colossal', 178),
	(712, false, 'orca', 178),
	(713, false, 'Eridanus', 179),
	(714, false, 'Gama Cephei', 179);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (715, false, 'Iota Cephei', 179),
	(716, true, 'Polaris', 179),
	(717, false, '128', 180),
	(718, true, '244', 180),
	(719, false, '481', 180),
	(720, false, '94', 180),
	(721, false, 'Júpiter', 181),
	(722, false, 'Marte', 181),
	(723, false, 'Mercúrio', 181),
	(724, true, 'Vênus', 181);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (725, true, 'hidrogênio', 182),
	(726, false, 'Hélio', 182),
	(727, false, 'Lítio', 182),
	(728, false, 'Oxigênio', 182),
	(729, true, 'Hg', 183),
	(730, false, 'Hy', 183),
	(731, false, 'Mc', 183),
	(732, false, 'Meu', 183),
	(733, false, '21', 184),
	(734, false, '22', 184);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (735, true, '23', 184),
	(736, false, '24', 184),
	(737, false, '200', 185),
	(738, false, '203', 185),
	(739, true, '206', 185),
	(740, false, '209', 185),
	(741, false, '6', 186),
	(742, false, '7', 186),
	(743, true, '8', 186),
	(744, false, '9', 186);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (745, false, 'Dez', 187),
	(746, false, 'Nove', 187),
	(747, true, 'Oito', 187),
	(748, false, 'Sete', 187),
	(749, false, 'Bastão', 188),
	(750, false, 'Borboleta', 188),
	(751, false, 'Cachorro', 188),
	(752, true, 'Gato', 188),
	(753, false, 'Diamante', 189),
	(754, true, 'metamórfico', 189);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (755, false, 'Sedimentar', 189),
	(756, false, 'ígneo', 189),
	(757, false, 'Albert Einstein', 190),
	(758, false, 'Charles Darwin', 190),
	(759, false, 'Galileu Galilei', 190),
	(760, true, 'Senhor Isaac Newton', 190),
	(761, false, '100', 191),
	(762, true, '212', 191),
	(763, false, '326', 191),
	(764, false, '451', 191);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (765, false, 'Braço', 192),
	(766, false, 'Cabeça', 192),
	(767, false, 'Mão', 192),
	(768, true, 'Perna', 192),
	(769, false, 'Coração', 193),
	(770, false, 'Cérebro', 193),
	(771, true, 'Ossos', 193),
	(772, false, 'Pele', 193),
	(773, false, '178°F', 194),
	(774, false, '181°F', 194);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (775, false, '200°F', 194),
	(776, true, '212°F', 194),
	(777, true, 'Ferro', 195),
	(778, false, 'hidrogênio', 195),
	(779, false, 'Oxigênio', 195),
	(780, false, 'átomos sem carga', 195),
	(781, false, 'Júpiter', 196),
	(782, false, 'Netuno', 196),
	(783, true, 'Urano', 196),
	(784, false, 'Vênus', 196);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (785, false, 'Níquel', 197),
	(786, true, 'Ouro', 197),
	(787, false, 'Oxigênio', 197),
	(788, false, 'Prata', 197),
	(789, false, 'Espanha', 198),
	(790, false, 'França', 198),
	(791, true, 'México', 198),
	(792, false, 'Rússia', 198),
	(793, true, 'copenhague', 199),
	(794, false, 'Herning', 199);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (795, false, 'Odense', 199),
	(796, false, 'Skagen', 199),
	(797, false, 'Cálcio', 200),
	(798, false, 'Osso', 200),
	(799, true, 'Queratina', 200),
	(800, false, 'quitina', 200),
	(801, true, 'STS-107', 201),
	(802, false, 'STS-109', 201),
	(803, false, 'STS-51-L', 201),
	(804, false, 'STS-61-C', 201);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (805, false, 'Estase', 202),
	(806, true, 'Interfase', 202),
	(807, false, 'Prófase', 202),
	(808, false, 'Telófase', 202),
	(809, true, ' Cinza', 203),
	(810, false, 'Decibel', 203),
	(811, false, 'Kelvin', 203),
	(812, false, 'Watt', 203),
	(813, false, '3', 204),
	(814, true, '4', 204);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (815, false, '5', 204),
	(816, false, '6', 204),
	(817, true, 'Azoto', 205),
	(818, false, 'Carbono', 205),
	(819, false, 'hidrogênio', 205),
	(820, false, 'Hélio', 205),
	(821, false, 'Hipermetropia', 206),
	(822, true, 'Miopia', 206),
	(823, false, 'Visão dupla', 206),
	(824, false, 'visão nublada', 206);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (825, false, '16', 207),
	(826, true, '24', 207),
	(827, false, '32', 207),
	(828, false, '8', 207),
	(829, false, 'N / D', 208),
	(830, false, 'Ni', 208),
	(831, true, 'Sn', 208),
	(832, false, 'ti', 208),
	(833, false, 'alto, alguns', 209),
	(834, false, 'alto, tudo', 209);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (835, false, 'baixo, alguns', 209),
	(836, true, 'baixo, tudo', 209),
	(837, false, 'Azoto', 210),
	(838, true, 'hidrogênio', 210),
	(839, false, 'Hélio', 210),
	(840, false, 'Néon', 210),
	(841, false, 'Cotovelo', 211),
	(842, true, 'Joelho', 211),
	(843, false, 'Ombro', 211),
	(844, false, 'Tornozelo', 211);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (845, false, '1', 212),
	(846, false, '2', 212),
	(847, true, '3', 212),
	(848, false, '4', 212),
	(849, false, 'Inflamabilidade', 213),
	(850, false, 'radioatividade', 213),
	(851, true, 'Reatividade', 213),
	(852, false, 'Saúde', 213),
	(853, false, 'Humanos', 214),
	(854, true, 'insetos', 214);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (855, false, 'o cérebro', 214),
	(856, false, 'Peixe', 214),
	(857, false, 'Carbono & Hélio', 215),
	(858, false, 'Carbono e Nitrogênio', 215),
	(859, true, 'Hidrogênio e Hélio', 215),
	(860, false, 'Hidrogênio e Nitrogênio', 215),
	(861, true, 'Cotovelo', 216),
	(862, false, 'Joelho', 216),
	(863, false, 'Sholder', 216),
	(864, false, 'Tornozelo', 216);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (865, false, 'Apolo 11', 217),
	(866, false, 'Luna 2', 217),
	(867, true, 'Marinheiro 4', 217),
	(868, false, 'SMART-1', 217),
	(869, false, 'Deserto da Arábia', 218),
	(870, false, 'Deserto de Gobi', 218),
	(871, true, 'Deserto de Sonora', 218),
	(872, false, 'O deserto de Yuma', 218),
	(873, false, 'Betelgeuse', 219),
	(874, false, 'RW Cephei', 219);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (875, true, 'UY Scuti', 219),
	(876, false, 'VY Canis Majoris', 219),
	(877, false, 'Anáfase', 220),
	(878, true, 'Diplófase', 220),
	(879, false, 'Metáfase', 220),
	(880, false, 'Telófase', 220),
	(881, false, 'Arquimedes', 221),
	(882, true, 'Ernest Rutherford', 221),
	(883, false, 'Joseph John Thomson', 221),
	(884, false, 'Niels Henrik David Bohr', 221);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (885, false, 'bainha de mielina', 222),
	(886, false, 'células de Schwann', 222),
	(887, true, 'Ilhotas de Langerhans', 222),
	(888, false, 'Nó de Ranvier', 222),
	(889, false, 'Reflexo de arranhão', 223),
	(890, false, 'reflexo de luz pupilar', 223),
	(891, false, 'Reflexo de vômito', 223),
	(892, true, 'Reflexo do tornozelo', 223),
	(893, false, 'Albert Einstein', 224),
	(894, false, 'Enrico Fermi', 224);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (895, false, 'Niels Bohr', 224),
	(896, true, 'Senhor Isaac Newton', 224),
	(897, false, 'Capacitor', 225),
	(898, false, 'Indutor', 225),
	(899, false, 'Resistor', 225),
	(900, true, 'Transistor', 225),
	(901, false, 'Antimônio', 226),
	(902, true, 'Astato', 226),
	(903, false, 'Molibdênio', 226),
	(904, false, 'Selênio', 226);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (905, false, 'Azoto', 227),
	(906, false, 'hidrogênio', 227),
	(907, true, 'Hélio', 227),
	(908, false, 'Néon', 227),
	(909, true, 'Azoto', 228),
	(910, false, 'hidrogênio', 228),
	(911, false, 'Néon', 228),
	(912, false, 'Oxigênio', 228),
	(913, true, ' Moscas da fruta', 229),
	(914, false, 'Cachorro', 229);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (915, false, 'Macaco', 229),
	(916, false, 'Rato', 229),
	(917, false, 'Diamante', 230),
	(918, false, 'gesso', 230),
	(919, false, 'Quartzo', 230),
	(920, true, 'Talco', 230),
	(921, false, 'Bola da raiz', 231),
	(922, true, 'flor feminina', 231),
	(923, false, 'flor masculina', 231),
	(924, false, 'Folhas', 231);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (925, false, 'Estômago', 232),
	(926, false, 'Garganta', 232),
	(927, true, 'Olhos', 232),
	(928, false, 'Sangue', 232),
	(929, false, 'Cérebro dividido', 233),
	(930, true, 'Dissonância cognitiva', 233),
	(931, false, 'Síndrome do flip-flop', 233),
	(932, false, 'visão cega', 233),
	(933, true, 'Psicanálise', 234),
	(934, false, 'Teoria da Gravidade', 234);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (
		935,
		false,
		'Terapia cognitiva comportamental',
		234
	),
	(
		936,
		false,
		'Terapia Comportamental Dialética',
		234
	),
	(937, false, 'Azul', 235),
	(938, false, 'Roxo', 235),
	(939, false, 'Verde', 235),
	(940, true, 'Vermelho', 235),
	(941, false, 'C13H25NO4', 236),
	(942, true, 'C18H27NO3', 236),
	(943, false, 'C21H23NO3', 236),
	(944, false, 'C6H4Cl2', 236);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (945, false, 'CH4', 237),
	(946, false, 'CO2', 237),
	(947, false, 'N ° 3', 237),
	(948, true, 'NH3', 237),
	(949, true, 'Farad', 238),
	(950, false, 'Gauss', 238),
	(951, false, 'henrique', 238),
	(952, false, 'Watt', 238),
	(953, false, 'Anatomia', 239),
	(954, false, 'Bioquímica', 239);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (955, true, 'Histologia', 239),
	(956, false, 'Microbiologia', 239),
	(957, false, 'Baleia Azul', 240),
	(958, true, 'mel fungo', 240),
	(959, false, 'O recife de coral', 240),
	(960, false, 'Sequóia', 240),
	(961, true, 'Efeito Dunning-Kruger', 241),
	(962, false, 'Efeito Freud-Hall', 241),
	(963, false, 'Efeito Meyers-Briggs', 241),
	(964, false, 'efeito Müller-Lyer', 241);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (965, false, 'Appelus delectica', 242),
	(966, false, 'Malus americana', 242),
	(967, true, 'malus pumila', 242),
	(968, false, 'Pomus domestica', 242),
	(969, false, '11', 243),
	(970, true, '38', 243),
	(971, false, '47', 243),
	(972, false, '73', 243),
	(973, false, 'Olfato', 244),
	(974, false, 'Percepção Auditiva', 244);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (975, true, 'Percepção Gustativa', 244),
	(976, false, 'somatosensação', 244),
	(977, false, 'Crise de identidade', 245),
	(978, false, 'Esquizofrenia', 245),
	(
		979,
		false,
		'Transtorno de Identidade Integridade Corporal',
		245
	),
	(
		980,
		true,
		'Transtorno dissociativo de identidade',
		245
	),
	(981, true, 'Aterrissagem do Núcleo Central', 246),
	(
		982,
		false,
		'Aterrissagem Lateral do Booster',
		246
	),
	(983, false, 'Ignição e Levantamento', 246),
	(984, false, 'Implantação de Starman', 246);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (985, false, '1985', 247),
	(986, true, '1996', 247),
	(987, false, '1999', 247),
	(988, false, '2009', 247),
	(989, false, '2,5 bilhões de anos', 248),
	(990, false, '3,5 bilhões de anos', 248),
	(991, true, '4,5 bilhões de anos', 248),
	(992, false, '5,5 bilhões de anos', 248),
	(993, false, '0', 249),
	(994, false, '1', 249);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (995, true, '2', 249),
	(996, false, '5', 249),
	(997, false, 'Amígdala', 250),
	(998, false, 'Cerebelo', 250),
	(999, true, 'Hipocampo', 250),
	(1000, false, 'tálamo', 250),
	(1001, false, 'baquelite', 251),
	(1002, false, 'Borracha', 251),
	(1003, false, 'Nylon', 251),
	(1004, true, 'Policarbonato', 251);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1005, false, 'Frederick Robbins', 252),
	(1006, false, 'John F. Enders', 252),
	(1007, true, 'Jonas Salk', 252),
	(1008, false, 'Thomas Weller', 252),
	(1009, false, 'Albert Einstein', 253),
	(1010, false, 'James watt', 253),
	(1011, false, 'Thomas Alva Edison', 253),
	(1012, true, 'Wilhelm Conrad Röntgen', 253),
	(1013, false, 'CompuServe', 254),
	(1014, false, 'Gênio', 254);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1015, true, 'Link Quântico', 254),
	(1016, false, 'Prodígio', 254),
	(1017, false, 'Ao controle', 255),
	(1018, false, 'Dados', 255),
	(1019, false, 'Endereço', 255),
	(1020, true, 'Instrução', 255),
	(1021, false, '1999', 256),
	(1022, false, '2002', 256),
	(1023, true, '2005', 256),
	(1024, false, '2008', 256);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1025, false, 'Kelobyte', 257),
	(1026, true, 'kibibyte', 257),
	(1027, false, 'Kylobyte', 257),
	(1028, false, 'quilobyte', 257),
	(1029, true, 'A'' + B''', 258),
	(1030, false, 'A''B + B''A', 258),
	(1031, false, 'A''B''', 258),
	(1032, false, 'AB'' + AB', 258),
	(1033, true, 'guepardo', 259),
	(1034, false, 'Leopardo', 259);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1035, false, 'Puma', 259),
	(1036, false, 'Tigre', 259),
	(1037, false, 'Construir', 260),
	(1038, true, 'Criador de jogos', 260),
	(1039, false, 'estêncil', 260),
	(1040, false, 'Torque 2D', 260),
	(1041, false, 'Fiji', 261),
	(1042, false, 'Ilhas Marshall', 261),
	(1043, true, 'Micronésia', 261),
	(1044, false, 'Tuvalu', 261);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1045, true, 'Cereja MX Azul', 262),
	(1046, false, 'Cereja MX Marrom', 262),
	(1047, false, 'Cereja MX Preto', 262),
	(1048, false, 'Cherry MX Red', 262),
	(1049, false, 'Encélado', 263),
	(1050, true, 'Netuno', 263),
	(1051, false, 'Pólux', 263),
	(1052, false, 'Saturno', 263),
	(1053, true, 'coração sangrando', 264),
	(1054, false, 'Sangue Corrompido', 264);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1055, false, 'Shellscript', 264),
	(1056, false, 'Trauma pós guerra', 264),
	(1057, false, 'Colaboração do cliente', 265),
	(1058, true, 'Documentação abrangente', 265),
	(1059, false, 'Indivíduos e interações', 265),
	(1060, false, 'Respondendo à mudança', 265),
	(1061, false, 'Camada de aplicação', 266),
	(1062, true, 'Camada de Conexão', 266),
	(1063, false, 'Camada de transporte', 266),
	(1064, false, 'Camada física', 266);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1065, false, 'BATER', 267),
	(1066, false, 'CPU', 267),
	(1067, false, 'Registro', 267),
	(1068, true, 'ULA', 267),
	(1069, false, 'Comodoro 64', 268),
	(1070, false, 'Espectro ZX', 268),
	(1071, false, 'maçã 3', 268),
	(1072, true, 'TRS-80', 268),
	(1073, false, 'Fila', 269),
	(1074, false, 'pilha', 269);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1076, false, 'Árvore', 269),
	(1077, false, 'Google', 270),
	(1078, false, 'IBM', 270),
	(1079, true, 'Maçã', 270),
	(1080, false, 'Microsoft', 270),
	(1081, false, 'C #', 271),
	(1082, true, 'C++', 271),
	(1083, false, 'Conjunto', 271),
	(1084, false, 'ECMAScript', 271),
	(1085, false, 'FTP', 272);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1086, false, 'HTTP', 272),
	(1087, false, 'HTTPS', 272),
	(1088, true, 'IRC', 272),
	(1089, true, ' injeção', 273),
	(1090, false, 'Autenticação quebrada', 273),
	(
		1091,
		false,
		'Referências inseguras de objetos diretos',
		273
	),
	(1092, false, 'Script entre sites', 273),
	(1093, false, 'Broadwell', 274),
	(1094, true, 'Lago do Café', 274),
	(1095, false, 'ponte de areia', 274);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1096, false, 'Skylake', 274),
	(1097, false, 'Link de dados', 275),
	(1098, false, 'Rede', 275),
	(1099, false, 'Sessão', 275),
	(1100, true, 'Transporte', 275),
	(1101, false, 'Codificação superdensa', 276),
	(1102, false, 'Emaranhamento Quântico', 276),
	(1103, false, 'Programação Quântica', 276),
	(1104, true, 'Teletransporte Quântico', 276),
	(1105, false, '25', 277);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1106, true, '50', 277),
	(1107, false, '59', 277),
	(1108, false, '60', 277),
	(1109, false, 'Algoritmo de hash', 278),
	(1110, false, 'cifra de fluxo', 278),
	(1111, false, 'Criptografia assimétrica', 278),
	(
		1112,
		true,
		'Esquema de compartilhamento secreto',
		278
	),
	(1113, true, 'amostrador ADPCM', 279),
	(1114, false, 'Amostrador PCM', 279),
	(
		1115,
		false,
		'Gerador de som programável (PSG)',
		279
	);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1116, false, 'Sintetizador FM', 279),
	(1117, false, 'Michael Roberts', 280),
	(1118, false, 'Paul Vixie', 280),
	(1119, true, 'Radia Perlman', 280),
	(1120, false, 'Vint Cerf', 280),
	(1121, false, 'AMD', 281),
	(1122, false, 'idade', 281),
	(1123, true, 'NovodeX', 281),
	(1124, false, 'nvidia', 281),
	(1125, false, 'Jack Dorsey', 282);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1126, false, 'Marc Benioff', 282),
	(1127, false, 'Mark Zuckerberg', 282),
	(1128, true, 'Peter Thiel', 282),
	(1129, false, 'al-Khwārizmī', 283),
	(1130, true, 'Dennis Ritchie', 283),
	(1131, false, 'Tim Berners-Lee', 283),
	(1132, false, 'Willis Ware', 283),
	(1133, false, 'Binário', 284),
	(1134, false, 'Duodecimal', 284),
	(1135, true, 'Hexadecimal', 284);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1136, false, 'octal', 284),
	(1137, true, '1000', 285),
	(1138, false, '1024', 285),
	(1139, false, '500', 285),
	(1140, false, '512', 285),
	(1141, false, 'Amarelo', 286),
	(1142, false, 'Azul', 286),
	(1143, true, 'Verde', 286),
	(1144, false, 'Vermelho', 286),
	(1145, false, 'Contra-ataque: Fonte', 287);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1146, false, 'Folha de estilo corretiva', 287),
	(
		1147,
		false,
		'Folha de estilo de computador',
		287
	),
	(1148, true, 'Planilha em estilo cascata', 287),
	(1149, true, 'Linguagem de marcação', 288),
	(1150, false, 'Linguagem de programação', 288),
	(1151, false, 'Linguagem de script', 288),
	(1152, false, 'Linguagem Macro', 288),
	(
		1153,
		false,
		'Interface de dados de instrumentos musicais',
		289
	),
	(
		1154,
		true,
		'Interface digital de instrumentos musicais',
		289
	),
	(
		1155,
		false,
		'Interface Modular de Instrumentos Digitais',
		289
	);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (
		1156,
		false,
		'Interface Musical de Instrumentos Digitais',
		289
	),
	(1157, false, 'Estático', 290),
	(1158, true, 'Final', 290),
	(1159, false, 'Privado', 290),
	(1160, false, 'Público', 290),
	(1161, false, '100', 291),
	(1162, false, '120', 291),
	(1163, true, '140', 291),
	(1164, false, '160', 291),
	(1165, true, 'Imagem em movimento', 292);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1166, false, 'micro ponto', 292),
	(1167, false, 'Passe múltiplo', 292),
	(1168, false, 'Reprodutor de música', 292),
	(1169, false, 'Gigahatz', 293),
	(1170, true, 'Gigahertz', 293),
	(1171, false, 'Gigahetz', 293),
	(1172, false, 'gigahotz', 293),
	(1173, false, 'Apenas Máquina Virtual', 294),
	(1174, false, 'Java Vendor Machine', 294),
	(1175, false, 'Java Visual Machine', 294);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1176, true, 'Máquina Virtual JAVA', 294),
	(1177, false, 'Drive de disco rígido', 295),
	(1178, false, 'Memória de acesso aleatório', 295),
	(1179, true, 'placa-mãe', 295),
	(
		1180,
		false,
		'Unidade central de processamento',
		295
	),
	(1181, false, 'C', 296),
	(1182, false, 'Jacarta', 296),
	(1183, true, 'Java', 296),
	(1184, false, 'Pitão', 296),
	(1185, false, 'Código Fonte do Joomla', 297);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1186, false, 'Fonte Java', 297),
	(1187, false, 'Java', 297),
	(1188, true, 'JavaScript', 297),
	(1189, false, '.gif', 298),
	(1190, false, '.jpeg', 298),
	(1191, false, '.png', 298),
	(1192, true, '.svg', 298),
	(1193, true, '1GB', 299),
	(1194, false, '512MB', 299),
	(1195, false, '5GB', 299);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1196, false, 'Ilimitado', 299),
	(1197, true, '128 bits', 300),
	(1198, false, '128 bytes', 300),
	(1199, false, '32 bits', 300),
	(1200, false, '64 bits', 300),
	(1201, false, '1000', 301),
	(1202, true, '1000000', 301),
	(1203, false, '1024', 301),
	(1204, false, '1048576', 301),
	(1205, false, '1', 302);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1206, false, '1024', 302),
	(1207, true, '256', 302),
	(1208, false, '8', 302),
	(1209, false, '1', 303),
	(1210, false, '2', 303),
	(1211, false, '64', 303),
	(1212, true, '8', 303),
	(1213, true, 'Binário', 304),
	(1214, false, 'C++', 304),
	(1215, false, 'JavaScript', 304);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1216, false, 'Pitão', 304),
	(1217, true, 'Active Directory', 305),
	(1218, false, 'Banco de dados automatizado', 305),
	(1219, false, 'Condução Alternativa', 305),
	(1220, false, 'Departamento Ativo', 305),
	(1221, false, 'Angola', 306),
	(1222, false, 'Argentina', 306),
	(1223, false, 'Austrália', 306),
	(1224, true, 'Áustria', 306),
	(1225, false, 'Romênia', 307);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1226, false, 'Ruanda', 307),
	(1227, false, 'Rússia', 307),
	(1228, true, 'Sérvia', 307),
	(1229, false, '100', 308),
	(1230, false, '1000', 308),
	(1231, true, '200', 308),
	(1232, false, '500', 308),
	(1233, true, '<marquee></marquee>', 309),
	(1234, false, '<mover></mover>', 309),
	(1235, false, '<rolagem></rolagem>', 309);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1236, false, '<slide></slide>', 309),
	(1237, false, 'Entrada de idioma comum', 310),
	(1238, true, 'Interface da Linha de comando', 310),
	(1239, false, 'Interface de linguagem comum', 310),
	(
		1240,
		false,
		'Interface de linha de controle',
		310
	),
	(1241, false, 'Arizona', 311),
	(1242, false, 'Colorado', 311),
	(1243, true, 'Novo México', 311),
	(1244, false, 'Washington', 311),
	(1245, true, 'Cartão de vídeo', 312);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1246, false, 'Disco rígido', 312),
	(1247, false, 'Fonte de energia', 312),
	(1248, false, 'Processador', 312),
	(1249, false, 'console.log("Olá Mundo")', 313),
	(1250, false, 'echo "Olá mundo"', 313),
	(1251, true, 'print("Olá mundo")', 313),
	(1252, false, 'printf("Olá Mundo")', 313),
	(1253, false, 'Abstração', 314),
	(1254, false, 'Herdar', 314),
	(1255, true, 'Sobrecarga', 314);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1256, false, 'Substituindo', 314),
	(1257, false, '?', 315),
	(1258, true, '?:', 315),
	(1259, false, '??', 315),
	(1260, false, 'se então', 315),
	(1261, false, 'Bule 3D', 316),
	(1262, false, 'bule de chá tennessee', 316),
	(1263, false, 'Bule Pixar', 316),
	(1264, true, 'Bule Utah', 316),
	(1265, false, 'Hellman-Pohl', 317);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1266, true, 'Hewlett-Packard', 317),
	(1267, false, 'Howard Packmann', 317),
	(1268, false, 'Husker-Pollosk', 317),
	(1269, false, 'Desenho Contínuo Longo', 318),
	(
		1270,
		false,
		'Projeto de Controle de Linguagem',
		318
	),
	(1271, true, 'Visor de cristal líquido', 318),
	(1272, false, 'Última diferença comum', 318),
	(1273, false, 'Rede de dados compactada', 319),
	(1274, false, 'Rede de Dados Computacionais', 319),
	(
		1275,
		false,
		'Rede de distribuição de conteúdo',
		319
	);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1276, true, 'Rede de entrega de conteúdo', 319),
	(1277, false, 'escocês', 320),
	(1278, false, 'Estábulo', 320),
	(1279, false, 'Seguro', 320),
	(1280, true, 'Shamir', 320),
	(
		1281,
		false,
		'Unidade de processador de jogos',
		321
	),
	(
		1282,
		true,
		'Unidade de processamento gráfico',
		321
	),
	(
		1283,
		false,
		'Unidade de Produção de Grafite',
		321
	),
	(1284, false, 'Unidade Proprietária Gráfica', 321),
	(
		1285,
		true,
		'Extensões Multifuncionais de Correio da Internet',
		322
	);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (
		1286,
		false,
		'Intercâmbio de correio intercalado multiuso',
		322
	),
	(1287, false, 'Mail Internet Mail Exchange', 322),
	(
		1288,
		false,
		'Troca de método de intercalação de correio',
		322
	),
	(1289, false, 'placa-mãe', 323),
	(1290, false, 'Teclado', 323),
	(
		1291,
		true,
		'Unidade central de processamento',
		323
	),
	(
		1292,
		false,
		'Unidade de processamento gráfico',
		323
	),
	(1293, false, 'C #', 324),
	(1294, true, 'Conjunto', 324),
	(1295, false, 'Pascal', 324);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1296, false, 'Pitão', 324),
	(1297, false, 'Astuto Lobisomem', 325),
	(1298, true, 'mansão mística', 325),
	(1299, false, 'Tahr confiável', 325),
	(1300, false, 'unicórnio utópico', 325),
	(1301, false, ' Xmilênio', 326),
	(1302, true, 'FM-7', 326),
	(1303, false, 'MSX', 326),
	(1304, false, 'PC-9801', 326),
	(1305, true, 'Amazonas', 327);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1306, false, 'eBay', 327),
	(1307, false, 'estoque excessivo', 327),
	(1308, false, 'Shopify', 327),
	(1309, false, 'O Roteador Laranja', 328),
	(1310, true, 'O Roteador Onion', 328),
	(1311, false, 'O roteador sinistro', 328),
	(1312, false, 'O único roteador', 328),
	(1313, true, 'Favo de mel', 329),
	(1314, false, 'Froyo', 329),
	(1315, false, 'marshmallow', 329);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1316, false, 'éclair', 329),
	(1317, false, 'Froyo', 330),
	(1318, true, 'Jujuba', 330),
	(1319, false, 'Nutella', 330),
	(1320, false, 'Pirulito', 330),
	(1321, false, 'AMD AM386', 331),
	(1322, true, 'Intel 4004', 331),
	(1323, false, 'Intel 486SX', 331),
	(1324, false, 'TMS 1000', 331),
	(1325, false, 'C #', 332);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1326, true, 'JavaScript', 332),
	(1327, false, 'PHP', 332),
	(1328, false, 'Pitão', 332),
	(1329, false, 'janelas', 333),
	(1330, false, 'Linux', 333),
	(1331, true, 'Mac OS', 333),
	(1332, false, 'OS/2', 333),
	(1333, false, 'assobiador', 334),
	(1334, false, 'Bênção', 334),
	(1335, true, 'Luna', 334);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1336, false, 'Netuno', 334),
	(1337, false, 'Decipador de temperatura', 335),
	(1338, true, 'Dissipador de calor', 335),
	(1339, false, 'Ventilação da CPU', 335),
	(1340, false, 'Ventilação de Calor', 335),
	(1341, false, '2009', 336),
	(1342, false, '2011', 336),
	(1343, false, '2013', 336),
	(1344, true, '2016', 336),
	(1345, false, '15', 337);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1346, true, '23', 337),
	(1347, false, '53', 337),
	(1348, false, '8', 337),
	(1349, false, '1000', 338),
	(1350, true, '1024', 338),
	(1351, false, '1240', 338),
	(1352, false, '2400', 338),
	(1353, false, 'Adobe Photoshop', 339),
	(1354, false, 'GIMP', 339),
	(1355, true, 'InkscapeGenericName', 339);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1356, false, 'Paint.NET', 339),
	(1357, false, 'Windows 2000', 340),
	(1358, false, 'windows 7', 340),
	(1359, false, 'Windows 95', 340),
	(1360, true, 'Windows XP', 340),
	(1361, false, '5,45x39mm', 341),
	(1362, false, '5,56x45mm', 341),
	(1363, true, '7,62x39mm', 341),
	(1364, false, '7,62x51mm', 341),
	(1365, false, ' alessandro volta', 342);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1366, true, 'Benjamim Franklin', 342),
	(1367, false, 'Luigi Galvani', 342),
	(1368, false, 'Nikola Tesla', 342),
	(1369, false, 'Bravura', 343),
	(1370, true, 'Coragem', 343),
	(1371, false, 'Inovação', 343),
	(1372, false, 'Revolução', 343),
	(1373, false, '1989', 344),
	(1374, false, '1990', 344),
	(1375, false, '1992', 344);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1376, true, '1996', 344),
	(1377, false, '1962', 345),
	(1378, false, '1972', 345),
	(1379, true, '1982', 345),
	(1380, false, '1992', 345),
	(1381, false, '1980', 346),
	(1382, false, '1990', 346),
	(1383, true, '1995', 346),
	(1384, false, '2000', 346),
	(1385, false, '2004', 347);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1386, false, '2005', 347),
	(1387, false, '2006', 347),
	(1388, true, '2007', 347),
	(1389, false, ' constelação', 348),
	(1390, true, 'Farol', 348),
	(1391, false, 'Movimento', 348),
	(1392, false, 'Rastreadores', 348),
	(1393, true, 'Challenger e Columbia', 349),
	(1394, false, 'Descoberta e Esforço', 349),
	(1395, false, 'Enterprise e Atlantis', 349);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1396, false, 'Nenhuma das acima', 349),
	(1397, false, '2010', 350),
	(1398, false, '2011', 350),
	(1399, true, '2012', 350),
	(1400, false, '2013', 350),
	(1401, true, 'Um robô', 351),
	(1402, false, 'Uma caminhonete', 351),
	(1403, false, 'uma lancha', 351),
	(1404, false, 'uma moto', 351),
	(1405, false, 'HTC', 352);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1406, true, 'Microsoft', 352),
	(1407, false, 'Oculus', 352),
	(1408, false, 'Tobii', 352),
	(1409, false, 'Fujitsu', 353),
	(1410, false, 'LG', 353),
	(1411, false, 'Panasonic', 353),
	(1412, true, 'sony', 353),
	(1413, false, 'Liquidificadores', 354),
	(1414, false, 'maçanetas', 354),
	(1415, true, 'máquinas de escrever', 354);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1416, false, 'Ventiladores de teto', 354),
	(1417, false, 'Albert Einstein', 355),
	(1418, false, 'alessandro volta', 355),
	(1419, true, 'James watt', 355),
	(1420, false, 'Nikola Tesla', 355),
	(1421, false, 'Alfred North Whitehead', 356),
	(1422, true, 'Bertrand Russel', 356),
	(1423, false, 'Francis Bacon', 356),
	(1424, false, 'John Locke', 356),
	(1425, false, 'Coordenadas cartesianas', 357);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1426, true, 'Folha de Descartes', 357),
	(1427, false, 'helicóide de Descartes', 357),
	(
		1428,
		false,
		'Parabolóide Elíptico de Descartes',
		357
	),
	(1429, false, ' Método de Galois para PDEs', 358),
	(
		1430,
		false,
		'Frações Continuadas de Galois',
		358
	),
	(1431, false, 'Integração Abeliana', 358),
	(1432, true, 'Teoria de Galois', 358),
	(1433, false, '1B', 359),
	(1434, true, '1F', 359),
	(1435, false, '2E', 359);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1436, false, '3D', 359),
	(1437, false, '1,58 x 10^18', 360),
	(1438, true, '1,58 x 10^20', 360),
	(1439, false, '1,58 x 10^22', 360),
	(1440, false, '1,58 x 10^24', 360),
	(1441, false, 'Abel', 361),
	(1442, false, 'Euler', 361),
	(1443, true, 'galois', 361),
	(1444, false, 'Gauss', 361),
	(1445, false, 'Carl Friedrich Gauss', 362);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1446, true, 'John Von Neumann', 362),
	(1447, false, 'Leonhard Euler', 362),
	(1448, false, 'Stefan Banach', 362),
	(1449, false, 'Deslizar', 363),
	(1450, true, 'Idiota', 363),
	(1451, false, 'Mudança', 363),
	(1452, false, 'Ressalto', 363),
	(1453, true, '1729', 364),
	(1454, false, '4104', 364),
	(1455, false, '561', 364);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1456, false, '91', 364),
	(1457, true, '1', 365),
	(1458, false, '2', 365),
	(1459, false, '3', 365),
	(1460, false, '4', 365),
	(1461, false, '1.41', 366),
	(1462, false, '1.62', 366),
	(1463, true, '2.72', 366),
	(1464, false, '3.14', 366),
	(1465, false, '15', 367);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1466, true, '40', 367),
	(1467, false, '60', 367),
	(1468, false, '90', 367),
	(1469, false, 'um bilionésimo', 368),
	(1470, false, 'Um Quatrilionésimo', 368),
	(1471, true, 'Um Quintilionésimo', 368),
	(1472, false, 'Um septilionésimo', 368),
	(1473, false, '21', 369),
	(1474, true, '23', 369),
	(1475, false, '25', 369);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1476, false, '27', 369),
	(
		1477,
		false,
		'A ordem em que as operações são gravadas.',
		370
	),
	(
		1478,
		false,
		'Adição, Multiplicação, Divisão, Subtração, Adição, Parênteses',
		370
	),
	(
		1479,
		false,
		'Parênteses, Expoentes, Adição, Subtração, Multiplicação, Divisão',
		370
	),
	(
		1480,
		true,
		'Parênteses, Expoentes, Multiplicação, Divisão, Adição, Subtração',
		370
	),
	(1481, true, 'Δr', 371),
	(1482, false, 'Dp', 371),
	(1483, false, 'dr', 371),
	(1484, false, 'r', 371),
	(1485, false, '5', 372);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1486, false, '6', 372),
	(1487, true, '7', 372),
	(1488, false, '8', 372),
	(1489, false, '0', 373),
	(1490, false, '180', 373),
	(1491, false, '270', 373),
	(1492, true, '90', 373),
	(1493, false, '10', 374),
	(1494, false, '16', 374),
	(1495, true, 'A Letra A', 374);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1496, false, 'O Número 0', 374),
	(1497, false, '3.12423', 375),
	(1498, true, '3.14159', 375),
	(1499, false, '3.14169', 375),
	(1500, false, '3.25812', 375),
	(1501, true, 'dado de 10 faces', 376),
	(1502, false, 'dado de 12 faces', 376),
	(1503, false, 'dado de 20 faces', 376),
	(1504, false, 'dado de 8 faces', 376),
	(1505, true, 'Arquimedes', 377);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1506, false, 'Eratóstenes', 377),
	(1507, false, 'Euclides', 377),
	(1508, false, 'Homero', 377),
	(1509, false, 'Andrew Wiles', 378),
	(1510, false, 'Edward Witten', 378),
	(1511, true, 'Grigori Perelman', 378),
	(1512, false, 'Terence Tao', 378),
	(1513, false, 'e', 379),
	(1514, true, 'eu', 379),
	(1515, false, 'n', 379);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1516, false, 'x', 379),
	(1517, false, '1256,6 polegadas', 380),
	(1518, true, '314,15 polegadas', 380),
	(1519, false, '3141,5 polegadas', 380),
	(1520, false, '380,1215 polegadas', 380),
	(1521, false, '1009', 381),
	(1522, false, '1069', 381),
	(1523, true, '1279', 381),
	(1524, false, '2203', 381),
	(1525, false, '10', 382);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1526, true, '13', 382),
	(1527, false, '17', 382),
	(1528, false, '8', 382),
	(1529, false, '1.000', 383),
	(1530, false, '1.000.000', 383),
	(1531, false, '10', 383),
	(1532, true, '100', 383),
	(1533, false, 'Alfa', 384),
	(1534, false, 'Delta', 384),
	(1535, true, 'Sigma', 384);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1536, false, 'Ómega', 384),
	(1537, false, 'Exponencial', 385),
	(1538, false, 'Linear', 385),
	(1539, true, 'Quadrático', 385),
	(1540, false, 'Racional', 385),
	(1541, true, 'André Scott Reisse', 386),
	(1542, false, 'Jack McCauley', 386),
	(1543, false, 'Nate Mitchell', 386),
	(1544, false, 'Palmer Luckey', 386),
	(1545, true, 'atormentar', 387);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1546, false, 'Esdras', 387),
	(1547, false, 'Gus', 387),
	(1548, false, 'Phineas', 387),
	(
		1549,
		false,
		'A incapacidade de se concentrar em qualquer coisa',
		388
	),
	(
		1550,
		false,
		'A incapacidade de se levantar',
		388
	),
	(
		1551,
		true,
		'A incapacidade de tomar decisões',
		388
	),
	(
		1552,
		false,
		'Um desejo febril de arrancar a própria roupa',
		388
	),
	(1553, false, 'a-ha - Take On Me', 389),
	(1554, false, 'Coldplay - meia-noite', 389),
	(1555, true, 'Ed Sheeran - Eu Vejo Fogo', 389);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1556, false, 'Marvin Gaye - Cura Sexual', 389),
	(1557, false, 'sala aberta', 390),
	(1558, false, 'Sala de estar', 390),
	(1559, true, 'Salão', 390),
	(1560, false, 'sótão', 390),
	(1561, false, 'China', 391),
	(1562, false, 'Etiópia', 391),
	(1563, false, 'Papua Nova Guiné', 391),
	(1564, true, 'Índia', 391),
	(1565, true, 'Banco da Itália', 392);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1566, false, 'Banco da Pensilvânia', 392),
	(1567, false, 'Banco de Charlotte', 392),
	(1568, false, 'Banco de Long Island', 392),
	(1569, false, '13%', 393),
	(1570, false, '20%', 393),
	(1571, true, '28%', 393),
	(1572, false, '7%', 393),
	(1573, false, 'Aldeia Yelloh', 394),
	(1574, false, 'Keycamp', 394),
	(1575, true, 'Parques Centrais', 394);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1576, false, 'Villa Plus', 394),
	(1577, false, '10%', 395),
	(1578, true, '15%', 395),
	(1579, false, '20%', 395),
	(1580, false, '25%', 395),
	(1581, false, '2000', 396),
	(1582, false, '2001', 396),
	(1583, true, '2004', 396),
	(1584, false, '2006', 396),
	(1585, false, '1923', 397);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1586, true, '1926', 397),
	(1587, false, '1929', 397),
	(1588, false, '1930', 397),
	(
		1589,
		false,
		'Sistema de abreviação de indicativo de tráfego',
		398
	),
	(
		1590,
		false,
		'Sistema de alerta de comunicação de tráfego',
		398
	),
	(
		1591,
		false,
		'Sistema de Alinhamento de Configuração de Tráfego',
		398
	),
	(
		1592,
		true,
		'Sistema de Prevenção de Colisão de Trânsito',
		398
	),
	(1593, false, 'Dormir com os olhos abertos', 399),
	(1594, true, 'Encontrando formas nas nuvens', 399),
	(1595, false, 'Nadando em água gelada', 399);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1596, false, 'Quebrando vidro com sua voz', 399),
	(1597, false, 'A Tumba dos Anciãos', 400),
	(1598, false, 'Ninho de cobras', 400),
	(1599, true, 'o Shatter', 400),
	(
		1600,
		false,
		'O Teatro do Mestre das Marionetes',
		400
	),
	(
		1601,
		false,
		'Um edifício na Universidade de Oxford',
		401
	),
	(1602, true, 'Um instrumento de percussão', 401),
	(1603, false, 'Um teorema geométrico', 401),
	(1604, false, 'Uma jogada de xadrez', 401),
	(1605, true, 'Eu vim eu vi eu conquistei', 402);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (
		1606,
		false,
		'Não veja o mal, não ouça o mal, não fale o mal',
		402
	),
	(1607, false, 'Passado, presente e futuro', 402),
	(1608, false, 'Vida, liberdade e felicidade', 402),
	(1609, true, 'Cupertino, Califórnia', 403),
	(1610, false, 'Redmond, Washington', 403),
	(1611, false, 'Redwood City, Califórnia', 403),
	(1612, false, 'Santa Mônica, Califórnia', 403),
	(1613, false, 'Azul', 404),
	(1614, false, 'Rosa', 404),
	(1615, false, 'Verde', 404);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1616, true, 'Vermelho', 404),
	(1617, false, 'Banco da China', 405),
	(1618, false, 'HSBC', 405),
	(1619, true, 'OCBC', 405),
	(1620, false, 'Padrão Fretado', 405),
	(1621, false, 'A família', 406),
	(1622, true, 'A família gótica', 406),
	(1623, false, 'A família orgulhosa', 406),
	(1624, false, 'A Família Simoleão', 406),
	(1625, false, 'Alemão', 407);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1626, false, 'dinamarquês', 407),
	(1627, false, 'polonês', 407),
	(1628, true, 'turco', 407),
	(1629, false, 'Clas Ohlson', 408),
	(1630, true, 'IKEA', 408),
	(1631, false, 'Lindex', 408),
	(1632, false, 'P&M', 408),
	(1633, false, 'Carlos II', 409),
	(1634, true, 'Eduardo VIII', 409),
	(1635, false, 'Jorge VI', 409);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1636, false, 'vitoria', 409),
	(1637, false, 'Abóbora da Guiné', 410),
	(1638, false, 'berinjela', 410),
	(1639, false, 'Melongene', 410),
	(1640, true, 'Potimarron', 410),
	(1641, false, 'deadmau5', 411),
	(1642, true, 'Feito em', 411),
	(1643, false, 'Mat Zo', 411),
	(1644, false, 'Zedd', 411),
	(1645, false, 'Computadores', 412);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1646, true, 'Papel', 412),
	(1647, false, 'processadores', 412),
	(1648, false, 'Telefones', 412),
	(1649, true, 'Feiji', 413),
	(1650, false, 'Huojian', 413),
	(1651, false, 'qiche', 413),
	(1652, false, 'Zongxian', 413),
	(1653, false, 'farsas', 414),
	(1654, false, 'Kawkab', 414),
	(1655, false, 'Najma', 414);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1656, true, 'Qamar', 414),
	(1657, false, '32,50 libras', 415),
	(1658, true, '35 libras', 415),
	(1659, false, '40 libras', 415),
	(1660, false, '£ 30', 415),
	(1661, false, 'Homem', 416),
	(1662, false, 'Lar', 416),
	(1663, true, 'Tempo', 416),
	(1664, false, 'Água', 416),
	(1665, false, '12 de setembro de 2005', 417);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1666, true, '14 de fevereiro de 2005', 417),
	(1667, false, '19 de julho de 2009', 417),
	(1668, false, '22 de maio de 2004', 417),
	(1669, true, '1 mês', 418),
	(1670, false, '1 semana', 418),
	(1671, false, '2 meses', 418),
	(1672, false, '3 semanas', 418),
	(1673, false, 'Boxer', 419),
	(1674, true, 'Buldogue', 419),
	(1675, false, 'pug', 419);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1676, false, 'Yorkshire Terrier', 419),
	(1677, false, 'Adel Khan', 420),
	(1678, false, 'Ben Khan', 420),
	(1679, false, 'Kitt Khan', 420),
	(1680, true, 'Sal Khan', 420),
	(1681, false, 'Sua aparência é repulsiva.', 421),
	(
		1682,
		true,
		'Você cheira extremamente desagradável.',
		421
	),
	(
		1683,
		false,
		'Você está fora de forma/fraco.',
		421
	),
	(
		1684,
		false,
		'Você é incompreensível/idiota.',
		421
	),
	(1685, false, 'flores', 422);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1686, false, 'Grãos', 422),
	(1687, false, 'Vegetais', 422),
	(1688, true, 'árvores', 422),
	(1689, true, 'Assinante', 423),
	(1690, false, 'Seguro', 423),
	(1691, false, 'Solteiro', 423),
	(1692, false, 'Sólido', 423),
	(1693, false, 'Alan Sugar', 424),
	(1694, false, 'Bill Gates', 424),
	(1695, false, 'Donald Trump', 424);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1696, true, 'Richard Branson', 424),
	(1697, false, '10', 425),
	(1698, true, '12', 425),
	(1699, false, '14', 425),
	(1700, false, '16', 425),
	(1701, false, 'Bolsa Ulisses', 426),
	(1702, false, 'John Quincy Adams', 426),
	(1703, false, 'Martin Van Buren', 426),
	(1704, true, 'Thomas Jefferson', 426),
	(1705, false, 'Boolie', 427);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1706, true, 'lunático', 427),
	(1707, false, 'temperamental', 427),
	(1708, false, 'tolo', 427),
	(1709, false, 'Mario Party (N64)', 428),
	(1710, true, 'Mário Tênis 64 (N64)', 428),
	(1711, false, 'Super Smash Bros. Ultimate', 428),
	(
		1712,
		false,
		'Wario Land: Super Mario Land 3',
		428
	),
	(1713, false, 'A Galáxia de Marte', 429),
	(1714, false, 'a nota da galáxia', 429),
	(1715, true, 'A Via Láctea', 429);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1716, false, 'O buraco negro', 429),
	(1717, false, 'Bogotá;', 430),
	(1718, false, 'Cali', 430),
	(1719, true, 'Medellín', 430),
	(1720, false, 'Quito', 430),
	(1721, true, '100', 431),
	(1722, false, '25', 431),
	(1723, false, '50', 431),
	(1724, false, '69', 431),
	(1725, false, 'Google', 432);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1726, true, 'HTC', 432),
	(1727, false, 'Oculus', 432),
	(1728, false, 'razer', 432),
	(1729, false, ' ola', 433),
	(1730, true, 'Adiós', 433),
	(1731, false, 'Au Revoir', 433),
	(1732, false, 'salir', 433),
	(1733, false, 'Causa', 434),
	(1734, false, 'Fonte', 434),
	(1735, false, 'Responder', 434);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1736, true, 'Verdade', 434),
	(1737, true, 'Canudo', 435),
	(1738, false, 'Cânhamo', 435),
	(1739, false, 'Linho', 435),
	(1740, false, 'Seda', 435),
	(1741, true, 'cães', 436),
	(1742, false, 'Germes', 436),
	(1743, false, 'pássaros', 436),
	(1744, false, 'Vôo', 436),
	(1745, false, 'Arrastar', 437);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1746, true, 'Elevador', 437),
	(1747, false, 'Impulso', 437),
	(1748, false, 'Peso', 437),
	(1749, true, 'Assistir', 438),
	(1750, false, 'Caderno', 438),
	(1751, false, 'Chaves', 438),
	(1752, false, 'Dinheiro', 438),
	(1753, false, 'Coração', 439),
	(1754, false, 'Estômago', 439),
	(1755, true, 'Fígado', 439);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1756, false, 'Intestinos', 439),
	(1757, false, 'Burger King', 440),
	(1758, true, 'McDonald''s', 440),
	(1759, false, 'sônica', 440),
	(1760, false, 'Whataburger', 440),
	(1761, false, 'Hora do Homem de Glasgow', 441),
	(1762, true, 'Horário de Greenwich', 441),
	(1763, false, 'Horário do Meridiano Global', 441),
	(1764, false, 'Tempo Mediano Geral', 441),
	(1765, false, 'A lua', 442);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1766, false, 'bolas', 442),
	(1767, true, 'Uma corda bamba', 442),
	(1768, false, 'Vidro quebrado', 442),
	(1769, false, 'Digerir', 443),
	(1770, true, 'Imprimir', 443),
	(1771, false, 'Ler', 443),
	(1772, false, 'Olhar', 443),
	(1773, false, 'Dinamarca', 444),
	(1774, false, 'Moldávia', 444),
	(1775, true, 'País de Gales', 444);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1776, false, 'República Checa', 444),
	(1777, false, 'amendoim', 445),
	(1778, true, 'Amêndoas', 445),
	(1779, false, 'nozes', 445),
	(1780, false, 'pistachios', 445),
	(1781, false, 'Anheuser Busch', 446),
	(1782, false, 'Boston Beer Company', 446),
	(1783, true, 'DG Yuengling and Son, Inc', 446),
	(1784, false, 'Miller Coors', 446),
	(1785, false, 'Ar francês', 447);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1786, false, 'British Airways', 447),
	(1787, true, 'Swiss Air', 447),
	(1788, false, 'TWA', 447),
	(1789, false, 'Harvard', 448),
	(1790, false, 'Princeton', 448),
	(1791, true, 'Stanford', 448),
	(1792, false, 'Universidade da Pensilvânia', 448),
	(1793, false, 'EGCC', 449),
	(1794, false, 'EGLL', 449),
	(1795, true, 'HOMEM', 449);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1796, false, 'LHR', 449),
	(1797, false, 'Cimitarra', 450),
	(1799, false, 'Flamberge', 450),
	(1800, false, 'Ulfberht', 450),
	(1801, true, 'Almond Joy', 451),
	(1802, false, 'M&M''s', 451),
	(1803, false, 'Snickers', 451),
	(1804, false, 'Twix', 451),
	(1805, false, 'Glóbulos brancos', 452),
	(1806, false, 'glóbulos vermelhos', 452);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1807, true, 'plaquetas', 452),
	(1808, false, 'Plasma sanguíneo', 452),
	(1809, false, 'Munchkin', 453),
	(1810, false, 'Twister', 453),
	(1811, true, 'uno', 453),
	(1812, false, 'Vai pescar', 453),
	(1813, true, 'Banda de rock', 454),
	(1814, false, 'dança dança revolução', 454),
	(1815, false, 'Guitar Hero ao vivo', 454),
	(1816, false, 'Meat Beat Mania', 454);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1817, true, 'Ben Shapiro', 455),
	(1818, false, 'Ira Glass', 455),
	(1819, false, 'Pedro Sagal', 455),
	(1820, false, 'Terry Gross', 455),
	(1821, false, 'Abraham Lincoln', 456),
	(1822, true, 'John F. Kennedy', 456),
	(1823, false, 'Theodore Roosevelt', 456),
	(1824, false, 'Thomas Jefferson', 456),
	(1825, false, 'cintos', 457),
	(1826, false, 'eixos', 457);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1827, false, 'Engrenagens', 457),
	(1828, true, 'rolamentos', 457),
	(1829, true, 'Mídia do futuro da Crypton', 458),
	(1830, false, 'Sega', 458),
	(1831, false, 'sony', 458),
	(1832, false, 'Yamaha Corporation', 458),
	(1833, false, 'A equipa de sonho', 459),
	(1834, true, 'Demolição', 459),
	(1835, false, 'Os Buldogues Britânicos', 459),
	(1836, false, 'Os Bushwhackers', 459);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1837, false, 'Linha Bakerloo', 460),
	(1838, false, 'Linha circular', 460),
	(1839, true, 'Linha Metropolitana', 460),
	(1840, false, 'Linha Vitória', 460),
	(1841, false, 'Canadá', 461),
	(1842, false, 'Hong Kong', 461),
	(1843, true, 'Nova Zelândia', 461),
	(1844, false, 'África do Sul', 461),
	(1845, true, 'Brasil', 462),
	(1846, false, 'China', 462);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1847, false, 'Coreia do Sul', 462),
	(1848, false, 'Estados Unidos da América', 462),
	(1849, false, 'Abraham Lincoln', 463),
	(1850, false, 'Benjamim Franklin', 463),
	(1851, true, 'George Washington', 463),
	(1852, false, 'Thomas Jefferson', 463),
	(1853, false, 'Cilindro', 464),
	(1854, true, 'Cubo', 464),
	(1855, false, 'Esfera', 464),
	(1856, false, 'Pirâmide', 464);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1857, false, 'Brasileiro', 465),
	(1858, false, 'Espanhol', 465),
	(1859, false, 'Inglês', 465),
	(1860, true, 'português', 465),
	(1861, true, 'Burro', 466),
	(1862, false, 'cavalo', 466),
	(1863, false, 'Perro', 466),
	(1864, false, 'Touro', 466),
	(1865, false, ' Écharpe', 467),
	(1866, false, ' casco', 467);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1867, true, 'Chapéu', 467),
	(1868, false, 'Gorro', 467),
	(1869, false, 'escargot', 468),
	(1870, false, 'ficha', 468),
	(1871, false, 'mer', 468),
	(1872, true, 'poisson', 468),
	(1873, false, 'estado da baía', 469),
	(1874, false, 'estado do sol', 469),
	(1875, false, 'estado do tesouro', 469),
	(1876, true, 'Estado Dourado', 469);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1877, true, 'Polska', 470),
	(1878, false, 'Polszka', 470),
	(1879, false, 'Pupcia', 470),
	(1880, false, 'Póland', 470),
	(1881, false, 'Ano Novo', 471),
	(1882, false, 'Elul', 471),
	(1883, true, 'Rosh Hashaná', 471),
	(1884, false, 'sucesso', 471),
	(1885, false, 'Estrela da Morte', 472),
	(1886, false, 'Millenium Falcon', 472);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1887, false, 'Olho grande', 472),
	(1888, true, 'telescópio espacial Hubble', 472),
	(1889, false, 'Júpiter', 473),
	(1890, false, 'Marte', 473),
	(1891, true, 'Mercúrio', 473),
	(1892, false, 'Terra', 473),
	(1893, false, 'ANDERSON', 474),
	(1894, false, 'Chowder', 474),
	(1895, true, 'Schnatter', 474),
	(1896, false, 'Williams', 474);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1897, false, 'Donzela', 475),
	(1898, false, 'escalas', 475),
	(1899, true, 'Gêmeos', 475),
	(1900, false, 'Peixe', 475),
	(1901, false, 'Amarelo', 476),
	(1902, false, 'Azul', 476),
	(1903, true, 'Verde', 476),
	(1904, false, 'Vermelho', 476),
	(1905, true, 'Amarelo', 477),
	(1906, false, 'Azul', 477);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1907, false, 'Verde', 477),
	(1908, false, 'Vermelho', 477),
	(1909, false, 'Amarelo', 478),
	(1910, false, 'Azul', 478),
	(1911, true, 'Verde', 478),
	(1912, false, 'Vermelho', 478),
	(1913, true, '11 de novembro de 2006', 479),
	(1914, false, '16 de julho de 2006', 479),
	(1915, false, '25 de dezembro de 2007', 479),
	(1916, false, '8 de janeiro de 2007', 479);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1917, true, 'frango frito kentucky', 480),
	(1918, false, 'Kiwi Corte de Alimentos', 480),
	(1919, false, 'Queijo fresco de Kentucky', 480),
	(1920, false, 'Vaca Freaky Kibbled', 480),
	(1921, false, 'André Johnson', 481),
	(1922, false, 'John Cadbury', 481),
	(1923, false, 'John Tyler', 481),
	(1924, true, 'Joseph Fry', 481),
	(1925, false, 'Lawrence Bragg', 482),
	(1926, true, 'Malala Yousafzai', 482);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1927, false, 'Werner Heisenberg', 482),
	(1928, false, 'Yasser Arafat', 482),
	(1929, false, 'Chuck Paluhniuk', 483),
	(1930, false, 'Irvine Galês', 483),
	(1931, true, 'Michael Crichton', 483),
	(1932, false, 'Peter Benchley', 483),
	(1933, true, 'Alcaçuz', 484),
	(1934, false, 'Chiclete', 484),
	(1935, false, 'Chocolate', 484),
	(1936, false, 'Pirulito', 484);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1937, false, 'A Liga dos Cavalheiros', 485),
	(1938, false, 'As guloseimas', 485),
	(1939, true, 'Monty Python', 485),
	(1940, false, 'Os Penny Dreadfuls', 485),
	(1941, false, 'A', 486),
	(1942, false, 'C', 486),
	(1943, false, 'O', 486),
	(1944, true, 'S', 486),
	(1945, false, 'Bjarke Ingels', 487),
	(1946, true, 'David Childs', 487);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1947, false, 'Fumihiko Maki', 487),
	(1948, false, 'Michael Arad', 487),
	(1949, false, 'KFC', 488),
	(1950, false, 'McDonald''s', 488),
	(1951, true, 'Metrô', 488),
	(1952, false, 'Starbucks', 488),
	(1953, false, 'Baltic Porter', 489),
	(1954, false, 'India Pale Ale', 489),
	(1955, true, 'Pale Lager', 489),
	(1956, false, 'Pilfsner', 489);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1957, false, '3', 490),
	(1958, true, '4', 490),
	(1959, false, '5', 490),
	(1960, false, '6', 490),
	(1961, false, 'carros', 491),
	(1962, false, 'Computadores', 491),
	(1963, false, 'Equipamentos esportivos', 491),
	(1964, true, 'Relógios', 491),
	(1965, true, 'bebida do brad', 492),
	(1966, false, 'Carolina Cola', 492);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1967, false, 'Pepsina Pop', 492),
	(1968, false, 'Xarope De Pepsina', 492),
	(1969, false, 'Biryani', 493),
	(1970, false, 'pani puri', 493),
	(1971, true, 'Tandoori', 493),
	(1972, false, 'tiki massala', 493),
	(1973, false, 'Cem', 494),
	(1974, true, 'Cinco', 494),
	(1975, false, 'Dez', 494),
	(1976, false, 'Vinte', 494);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1977, false, 'Baviera, Polônia', 495),
	(1978, false, 'Hesse, Alemanha', 495),
	(1979, true, 'Maine, Estados Unidos', 495),
	(1980, false, 'Mazóvia, Polônia', 495),
	(1981, false, 'Jimmy De Seno', 496),
	(1982, false, 'John De Seno', 496),
	(1983, true, 'Josh De Seno', 496),
	(1984, false, 'Justin De Seno', 496),
	(1985, false, '10', 497),
	(1986, true, '15', 497);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1987, false, '20', 497),
	(1988, false, '25', 497),
	(
		1989,
		true,
		'Coração, Fígado e Pulmões de Ovinos',
		498
	),
	(
		1990,
		false,
		'Coração, Rins e Pulmões de Carneiro',
		498
	),
	(
		1991,
		false,
		'Fígado, Rins e Olhos de Ovelha',
		498
	),
	(1992, false, 'ovelha inteira', 498),
	(1993, true, 'US$ 12,7 bilhões', 499),
	(1994, false, 'US$ 2,7 bilhões', 499),
	(1995, false, 'US$ 95 milhões', 499),
	(1996, false, 'US$ 956 milhões', 499);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (1997, false, 'Batatas', 500),
	(1998, true, 'Chocolate', 500),
	(1999, false, 'Cocaína', 500),
	(2000, false, 'rosquinhas', 500),
	(2001, false, '1974', 501),
	(2002, true, '1976', 501),
	(2003, false, '1978', 501),
	(2004, false, '1980', 501),
	(2005, false, 'clubes', 502),
	(2006, true, 'corações', 502);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2007, false, 'diamantes', 502),
	(2008, false, 'espadas', 502),
	(2009, false, 'De pé em sua cabeça', 503),
	(
		2010,
		false,
		'Digitando em um teclado durante uma parada de mão',
		503
	),
	(
		2011,
		false,
		'Saltar para trás sobre uma mesa',
		503
	),
	(
		2012,
		true,
		'Saltar sobre uma cadeira de escritório',
		503
	),
	(2013, true, 'economia', 504),
	(2014, false, 'Filosofia', 504),
	(2015, false, 'Física', 504),
	(2016, false, 'Política', 504);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2017, false, 'Asus', 505),
	(2018, false, 'Dell', 505),
	(2019, true, 'Hewlett-Packard', 505),
	(2020, false, 'Toshiba', 505),
	(2021, false, 'A Agulha Espacial', 506),
	(2022, true, 'O Guggenheim', 506),
	(2023, false, 'Sydney Opera House', 506),
	(2024, false, 'Villa Savoye', 506),
	(2025, false, 'economia', 507),
	(2026, false, 'Fisiologia/Medicina', 507);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2027, false, 'Física', 507),
	(2028, true, 'Paz', 507),
	(2029, false, 'Barco', 508),
	(2030, true, 'Cavalo', 508),
	(2031, false, 'Guitarra', 508),
	(2032, false, 'Tecer', 508),
	(2033, false, 'Barroco', 509),
	(2034, true, 'Modernismo', 509),
	(2035, false, 'Neoclássico', 509),
	(2036, false, 'Renascimento gótico', 509);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2037, false, 'Baunilha', 510),
	(2038, false, 'Lavanda', 510),
	(2039, false, 'Mel', 510),
	(2040, true, 'óleo de bergamota', 510),
	(2041, false, 'Fantasma', 511),
	(2042, false, 'Geronimo', 511),
	(2043, true, 'Governo', 511),
	(2044, false, 'Indo', 511),
	(2045, false, 'Um tipo de comida', 512),
	(2046, true, 'Uma bandeira', 512);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2047, false, 'Uma corda', 512),
	(2048, false, 'Uma janela', 512),
	(
		2049,
		true,
		'Um shopping com altas taxas de vacância ou baixo tráfego de consumidores',
		513
	),
	(
		2050,
		false,
		'Um shopping depois do horário comercial',
		513
	),
	(
		2051,
		false,
		'Um shopping que foi condenado',
		513
	),
	(2052, false, 'Um shopping sem lojas', 513),
	(2053, false, 'filmes', 514),
	(2054, true, 'Jogos de tabuleiro', 514),
	(2055, false, 'Jogos de vídeo', 514),
	(2056, false, 'Shows de televisão', 514);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2057, false, 'Chespin, Fennekin, Oshawott', 515),
	(2058, false, 'Chespin, Tepig, Froakie', 515),
	(2059, false, 'Snivy, Fennekin, Froakie', 515),
	(2060, true, 'Snivy, Tepig, Oshawott', 515),
	(2061, false, 'A mansão Mal Assombrada', 516),
	(2062, false, 'O voo de Peter Pan', 516),
	(2063, false, 'piratas do Caribe', 516),
	(
		2064,
		true,
		'Torre do Terror da Zona Crepuscular',
		516
	),
	(2065, true, ' wasabi', 517),
	(2066, false, 'Karashi', 517);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2067, false, 'Mentsuyu', 517),
	(2068, false, 'ponzu', 517),
	(2069, false, 'Universidade Columbia', 518),
	(2070, false, 'Universidade de Harvard', 518),
	(2071, false, 'Universidade de Princeton', 518),
	(2072, true, 'Universidade de Yale', 518),
	(2073, true, 'Ducati', 519),
	(2074, false, 'Fiat', 519),
	(2075, false, 'GMC', 519),
	(2076, false, 'nissan', 519);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2077, true, 'Gongoozler', 520),
	(2078, false, 'gossipiboma', 520),
	(2079, false, 'Jentacular', 520),
	(2080, false, 'Meupareunia', 520),
	(2081, false, 'Ikigai', 521),
	(2082, false, 'Majime', 521),
	(2083, true, 'Shiatsu', 521),
	(2084, false, 'Ukiyo', 521),
	(2085, false, 'Boo-Berry', 522),
	(2086, true, 'Bruto de Frutas', 522);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2087, false, 'Conde Chocula', 522),
	(2088, false, 'Franken Berry', 522),
	(2089, false, 'Coca Cola', 523),
	(2090, false, 'orvalho da montanha', 523),
	(2091, true, 'pimenta', 523),
	(2092, false, 'sprite', 523),
	(2093, false, 'CatMassage', 524),
	(2094, true, 'Massagem nas costas', 524),
	(2095, false, 'Netscape Navigator', 524),
	(2096, false, 'SearchPro', 524);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2097, true, 'Ad hominem', 525),
	(2098, false, 'Argumentum ad populum', 525),
	(2099, false, 'Post hoc ergo propter hoc', 525),
	(2100, false, 'tu quoque', 525),
	(2101, false, 'grego', 526),
	(2102, true, 'húngaro', 526),
	(2103, false, 'letão', 526),
	(2104, false, 'russo', 526),
	(2105, false, 'Alemanha', 527),
	(2106, false, 'China', 527);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2107, true, 'Japão', 527),
	(2108, false, 'Rússia', 527),
	(2109, true, 'Bélgica', 528),
	(2110, false, 'EUA', 528),
	(2111, false, 'França', 528),
	(2112, false, 'Holanda', 528),
	(2113, true, 'Kilt', 529),
	(2114, false, 'Rhobes', 529),
	(2115, false, 'Saia', 529),
	(2116, false, 'Vestir', 529);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2117, true, 'Adoramos ver você sorrir', 530),
	(2118, false, 'Faça do seu jeito', 530),
	(2119, false, 'Por que pagar mais!?', 530),
	(
		2120,
		false,
		'Tornar as pessoas felizes através da comida',
		530
	),
	(2121, false, 'Colt 9mm', 531),
	(2122, true, 'M3', 531),
	(2123, false, 'MAC-10', 531),
	(2124, false, 'Thompson', 531),
	(2125, false, 'Alto', 532),
	(2126, false, 'Engraçado', 532);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2127, true, 'Peludo', 532),
	(2128, false, 'Rude', 532),
	(2129, false, 'Coroa', 533),
	(2130, false, 'Euro', 533),
	(2131, false, 'Rublo', 533),
	(2132, true, 'Złoty', 533),
	(2133, false, 'Brasil', 534),
	(2136, false, 'Brasília', 534),
	(2137, false, 'Aglio', 535),
	(2138, false, 'Cipolla', 535);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2139, false, 'Peperoncino', 535),
	(2140, true, 'pomodoro', 535),
	(2141, true, 'Daigaku', 536),
	(2142, false, 'Jimusho', 536),
	(2143, false, 'Shokudou', 536),
	(2144, false, 'Toshokan', 536),
	(2145, false, 'Leto', 537),
	(2146, false, 'Osen''', 537),
	(2147, false, 'Vesna', 537),
	(2148, true, 'Zima', 537);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2149, false, 'Dólar', 538),
	(2150, true, 'Kip', 538),
	(2151, false, 'Konra', 538),
	(2152, false, 'Rublo', 538),
	(2153, false, 'Cinco', 539),
	(2154, false, 'quatro', 539),
	(2155, false, 'Seis', 539),
	(2156, true, 'Três', 539),
	(2157, false, 'baixo grande', 540),
	(2158, true, 'Big Mouth Billy Bass', 540);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2159, false, 'Peixe Cantor', 540),
	(2160, false, 'Sardeen', 540),
	(2161, false, 'carrie anda de caminhão', 541),
	(2162, true, 'eu no zoológico', 541),
	(
		2163,
		false,
		'Seu novo cachorrinho do bisavô vern.',
		541
	),
	(2164, false, 'tributo', 541),
	(2165, true, 'Aquário', 542),
	(2166, false, 'Capricórnio', 542),
	(2167, false, 'Escorpião', 542),
	(2168, false, 'Peixes', 542);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2169, true, 'Açafrão', 543),
	(2170, false, 'Baunilha', 543),
	(2171, false, 'Canela', 543),
	(2172, false, 'Cardamomo', 543),
	(2173, false, '19 de outubro de 1891', 544),
	(2174, true, '23 de setembro de 1889', 544),
	(2175, false, '27 de dezembro de 1894', 544),
	(2176, false, '4 de março de 1887', 544),
	(2177, false, '1972', 545),
	(2178, true, '1979', 545);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2179, false, '1980', 545),
	(2180, false, '1984', 545),
	(2181, false, '2003', 546),
	(2182, true, '2004', 546),
	(2183, false, '2005', 546),
	(2184, false, '2006', 546),
	(2185, true, 'Gin', 547),
	(2186, false, 'Rum', 547),
	(2187, false, 'tequila', 547),
	(2188, false, 'Vodka', 547);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2189, true, 'E comercial', 548),
	(2190, false, 'Interrobang', 548),
	(2191, false, 'Pillow', 548),
	(2192, false, 'Til', 548),
	(2193, false, 'Marca', 549),
	(2194, false, 'Mateus', 549),
	(2195, true, 'Mike', 549),
	(2196, false, 'máx.', 549),
	(2197, false, 'Estados Unidos da América', 550),
	(2198, false, 'Polônia', 550);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2199, false, 'União Soviética', 550),
	(2200, true, 'Índia', 550),
	(2201, true, 'Clyde', 551),
	(2202, false, 'Dee', 551),
	(2203, false, 'tay', 551),
	(2204, false, 'Tweed', 551),
	(2205, false, 'Bill Nye', 552),
	(2206, true, 'Bobby Henderson', 552),
	(2207, false, 'Eric Tignor', 552),
	(2208, false, 'Zach Soldi', 552);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2209, false, ' Gerhardt Kirk Christiansen', 553),
	(2210, false, ' Jens Niels Christiansen', 553),
	(2211, false, 'Kirstine Christiansen', 553),
	(2212, true, 'Ole Kirk Christiansen', 553),
	(2213, true, 'Filosofia', 554),
	(2214, false, 'Fisioterapia', 554),
	(2215, false, 'Frenologia', 554),
	(2216, false, 'Psicologia', 554),
	(2217, false, 'Museu Britânico', 555),
	(2218, false, 'Museu de Ciências', 555);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2219, true, 'Museu de História Natural', 555),
	(2220, false, 'tate', 555),
	(2221, false, 'Chave de fenda', 556),
	(2222, false, 'Manhattan', 556),
	(2223, true, 'prego enferrujado', 556),
	(2224, false, 'sexo na praia', 556),
	(2225, true, ' Rastreador', 557),
	(2226, false, 'Aprendiz', 557),
	(2227, false, 'Assassino', 557),
	(2228, false, 'Escriba', 557);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2229, false, 'Azumanga Daioh', 558),
	(2230, false, 'Estrela da sorte', 558),
	(2231, false, 'Trevo', 558),
	(2232, true, 'Yotsuba&!', 558),
	(2233, false, 'Casa de Komuro', 559),
	(2234, false, 'Centro Comercial', 559),
	(2235, true, 'Delegacia Leste', 559),
	(2236, false, 'Na ponte principal', 559),
	(2237, true, 'assassinos', 560),
	(2238, false, 'bandidos', 560);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2239, false, 'caçadores', 560),
	(2240, false, 'ninjas', 560),
	(2241, false, 'Emissão', 561),
	(2242, false, 'Especialização', 561),
	(2243, true, 'Restauração', 561),
	(2244, false, 'Transmutação', 561),
	(2245, false, 'Anel de rubi', 562),
	(2246, false, 'Nascido para ser selvagem', 562),
	(2247, true, 'Não quero perder nada', 562),
	(2248, false, 'Olho do tigre', 562);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2249, false, 'Amizade', 563),
	(2250, false, 'Aventura', 563),
	(2251, true, 'Liberdade', 563),
	(2252, false, 'Promessa', 563),
	(2253, true, 'Edward "Barba Branca" Newgate', 564),
	(
		2254,
		false,
		'Ex-Almirante da Frota da Marinha Sengoku',
		564
	),
	(2255, false, 'Rei Pirata Gol D Roger', 564),
	(2256, false, 'Silvers Rayleigh', 564),
	(2257, false, ' Empório Ivankov', 565),
	(2258, false, 'Boa Hancock', 565);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2259, true, 'coala', 565),
	(2260, false, 'Nico Robin', 565),
	(2261, false, 'Egito', 566),
	(2262, true, 'Filipinas', 566),
	(2263, false, 'Paquistão', 566),
	(2264, false, 'Índia', 566),
	(2265, false, '1983', 567),
	(2266, true, '1987', 567),
	(2267, false, '1995', 567),
	(2268, false, '2013', 567);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2269, true, '1996', 568),
	(2270, false, '2003', 568),
	(2271, false, '2010', 568),
	(2272, false, '2014', 568),
	(2273, false, '2004', 569),
	(2274, false, '2005', 569),
	(2275, true, '2006', 569),
	(2276, false, '2007', 569),
	(2277, false, 'Caixa de areia', 570),
	(2278, false, 'imparcialidade', 570);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2279, true, 'O fim', 570),
	(2280, false, 'Perfeição', 570),
	(2281, false, 'arroz', 571),
	(2282, false, 'Bardock', 571),
	(2283, true, 'Raditz', 571),
	(2284, false, 'Vegeta', 571),
	(2285, true, 'Kyoko Tokiwa', 572),
	(2286, false, 'Melissa Mao', 572),
	(2287, false, 'Ren Mikihara', 572),
	(2288, false, 'Teletha "Tessa" Testarossa', 572);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (
		2289,
		false,
		'''. . . as rodas perdem tração, fazendo o carro deslizar para os lados''',
		573
	),
	(
		2290,
		false,
		'''. . . o carro sai de frente em uma curva, fazendo com que ele gire mais rápido''',
		573
	),
	(
		2291,
		true,
		'''. . . os pneus dianteiros deslizam para que o carro não fique virado para dentro''',
		573
	),
	(2292, false, '''. . . você gira muito''', 573),
	(2293, false, 'Chibi Maruko-chan', 574),
	(2294, false, 'naruto', 574),
	(2295, true, 'Sazae-san', 574),
	(2296, false, 'Uma pedaço', 574),
	(2297, false, 'Axia', 575),
	(2298, false, 'Jack', 575);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2299, true, 'Shiron', 575),
	(2300, false, 'Tambor', 575),
	(2301, true, 'gonzo', 576),
	(2302, false, 'Kyoto Animation', 576),
	(2303, false, 'Produção IG', 576),
	(2304, false, 'xaveco', 576),
	(2305, false, 'Acionar', 577),
	(2306, true, 'Haste', 577),
	(2307, false, 'Kyoto Animation', 577),
	(2308, false, 'Produção IG', 577);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2309, false, 'Acionar', 578),
	(2310, false, 'Haste', 578),
	(2311, false, 'Kyoto Animation', 578),
	(2312, true, 'Produção IG', 578),
	(2313, false, 'Acionar', 579),
	(2314, false, 'Kyoto Animation', 579),
	(2315, false, 'Nascer do sol', 579),
	(2316, true, 'Xaveco', 579),
	(2317, false, 'Nascer do sol', 580),
	(2318, false, 'Produção IG', 580);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2319, true, 'satélite', 580),
	(2320, false, 'Xaveco', 580),
	(2321, false, 'Kyoto Animation', 581),
	(2322, false, 'Nascer do sol', 581),
	(2323, true, 'Produção IG', 581),
	(2324, false, 'Xaveco', 581),
	(2325, true, 'Além do arco-íris', 582),
	(2326, false, 'Cantando na Chuva', 582),
	(
		2327,
		false,
		'Quando você deseja a uma estrela',
		582
	),
	(2328, false, 'Que mundo maravilhoso', 582);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2329, true, 'Giorno Giovanna', 583),
	(2330, false, 'Johnny Joestar', 583),
	(2331, false, 'Jolyne Cujoh', 583),
	(2332, false, 'Josuke Higashikata', 583),
	(
		2333,
		false,
		'"Idiota, eu não vou deixar você me matar!"',
		584
	),
	(2334, false, '"Maldição, Shinji."', 584),
	(2335, false, '"Nada."', 584),
	(2336, true, '"Que nojento."', 584),
	(2337, false, ' Noboru Takahashi', 585),
	(2338, false, 'Akira Toriyama', 585);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2339, true, 'Junji Ito', 585),
	(2340, false, 'Masashi Kishimoto', 585),
	(2341, false, 'Hayao Miyazaki', 586),
	(2342, true, 'Isao Takahata', 586),
	(2343, false, 'Satoshi Kon', 586),
	(2344, false, 'Sunao Katabuchi', 586),
	(2345, false, 'George Joestar', 587),
	(2346, false, 'Jean-Pierre Polnareff', 587),
	(2347, true, 'JoJo Kikasu', 587),
	(2348, false, 'Risoto Nero', 587);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2349, false, '10.000', 588),
	(2350, false, '128', 588),
	(2351, true, '20.000', 588),
	(2352, false, '5.000', 588),
	(2353, true, 'A Salamandra', 589),
	(2354, false, 'O demônio', 589),
	(2355, false, 'O Dragão', 589),
	(2356, false, 'O Matador de Dragões', 589),
	(2357, false, ' Diário da Justiça', 590),
	(2358, false, ' diário de fuga', 590);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2359, false, 'diário de assassinato', 590),
	(2360, true, 'diário de yukiteru', 590),
	(2361, false, 'Esferas do dragão', 591),
	(2362, true, 'Estilhaços de Joia', 591),
	(2363, false, 'pedras rave', 591),
	(2364, false, 'pedras sagradas', 591),
	(2365, false, 'do papai joão', 592),
	(2366, true, 'dominó', 592),
	(2367, false, 'Pizza Hut', 592),
	(2368, false, 'Sabarro''s', 592);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2369, false, 'Adulto', 593),
	(2370, false, 'Campeão', 593),
	(2371, true, 'Final', 593),
	(2372, false, 'mega', 593),
	(2373, false, 'Elma', 594),
	(2374, false, 'Kanna', 594),
	(2375, false, 'lucoa', 594),
	(2376, true, 'Tohru', 594),
	(2377, false, '2012', 595),
	(2378, true, '2013', 595);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2379, false, '2014', 595),
	(2380, false, '2015', 595),
	(2381, true, 'Deus', 596),
	(2382, false, 'Esper', 596),
	(2383, false, 'Estrangeiro', 596),
	(2384, false, 'Viajante do tempo', 596),
	(2385, false, ' Asui', 597),
	(2386, false, 'Bakugo', 597),
	(2387, false, 'Deku', 597),
	(2388, true, 'Uraraka', 597);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2389, false, 'Karuha', 598),
	(2390, false, 'Mayu', 598),
	(2391, false, 'mineha', 598),
	(2392, true, 'Yukine', 598),
	(2393, false, 'Ayano', 599),
	(2394, true, 'diane', 599),
	(2395, false, 'sakura', 599),
	(2396, false, 'Sheska', 599),
	(2397, false, 'Ame & Hana', 600),
	(2398, true, 'Ame & Yuki', 600);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2399, false, 'Chuck & Anna', 600),
	(2400, false, 'Hana & Yuki', 600),
	(2401, false, 'Cinzas', 601),
	(2402, false, 'Fantasma', 601),
	(2403, true, 'Manaphy', 601),
	(2404, false, 'Poderia', 601),
	(2405, false, 'impostor final', 602),
	(2406, false, 'Komaru Naegi', 602),
	(2407, true, 'Mukuro Ikusaba', 602),
	(2408, false, 'Ryota Mitarai', 602);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2409, false, 'Através de um ritual mágico', 603),
	(2410, false, 'Comi muitos chocobars', 603),
	(2411, false, 'Quando ele colocou o harmaki', 603),
	(
		2412,
		true,
		'Ser atropelado por um caminhão',
		603
	),
	(2413, false, 'bestas de guerra', 604),
	(2414, false, 'Descartar', 604),
	(2415, true, 'Em branco', 604),
	(2416, false, 'imanidade', 604),
	(2417, false, 'Cowboy Bebop', 605),
	(2418, true, 'Inicial d', 605);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2419, false, 'Kino no Tabi', 605),
	(2420, false, 'Wangan meia-noite', 605),
	(2421, true, 'Caterpie', 606),
	(2422, false, 'Charmander', 606),
	(2423, false, 'Pidgey', 606),
	(2424, false, 'pikachu', 606),
	(2425, true, '10', 607),
	(2426, false, '11', 607),
	(2427, false, '12', 607),
	(2428, false, '9', 607);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2429, true, 'A tese de um anjo cruel', 608),
	(2430, false, 'Deus sabe', 608),
	(2431, false, 'Requiem para um sonho', 608),
	(2432, false, 'Stardust Crusaders', 608),
	(2433, false, 'Eduardo', 609),
	(2434, true, 'einsten', 609),
	(2435, false, 'Foguete', 609),
	(2436, false, 'joel', 609),
	(
		2437,
		false,
		'Atos imundos feitos por um preço razoável',
		610
	),
	(2438, true, 'Ações sujas feitas baratas', 610);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (
		2439,
		false,
		'Deus abençoe os Estados Unidos da America',
		610
	),
	(2440, false, 'Guerra civil', 610),
	(2441, false, 'Eliek', 611),
	(2442, false, 'Ellis', 611),
	(2443, true, 'Elric', 611),
	(2444, false, 'Elwood', 611),
	(2445, false, '4', 612),
	(2446, false, '5', 612),
	(2447, false, '6', 612),
	(2448, true, '8', 612);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2449, false, 'Alphonse Elric', 613),
	(2450, true, 'Edward elric', 613),
	(2451, false, 'Izumi Curtis', 613),
	(2452, false, 'Van Hohenheim', 613),
	(2453, true, 'Kaname Chidori', 614),
	(2454, false, 'Kyoko Tokiwa', 614),
	(2455, false, 'Melissa Mao', 614),
	(2456, false, 'Teletha Testarossa', 614),
	(2457, false, 'Marinheiro Júpiter', 615),
	(2458, false, 'Sailor Marte', 615);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2459, true, 'Sailor Moon', 615),
	(2460, false, 'Sailor Vênus', 615),
	(2461, false, 'Mitsuteri Yokoyama', 616),
	(2462, true, 'Osamu Tezuka', 616),
	(2463, false, 'Takao Saito', 616),
	(2464, false, 'Yoshihiro Tatsumi', 616),
	(2465, false, 'Dez dez', 617),
	(2466, false, 'kakashi', 617),
	(2467, true, 'naruto', 617),
	(2468, false, 'sasuke', 617);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2469, true, 'Bertolt Hoover', 618),
	(2470, false, 'eren', 618),
	(2471, false, 'reiner', 618),
	(2472, false, 'Sasha', 618),
	(2473, false, 'Gurren lagann', 619),
	(2474, false, 'naruto', 619),
	(2475, true, 'Naruto Shippuden', 619),
	(2476, false, 'Uma pedaço', 619),
	(2477, false, 'a Terra', 620),
	(2478, false, 'animais', 620);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2479, false, 'elfos', 620),
	(2480, true, 'fadas', 620),
	(2481, false, 'Andes Chucky', 621),
	(2482, false, 'Angel Beats!', 621),
	(
		2483,
		true,
		'O Terceiro Esquadrão de Garotas Aéreas',
		621
	),
	(2484, false, 'Êxodo!', 621),
	(2485, false, 'Aparência diferente', 622),
	(
		2486,
		false,
		'Diferentes Proporções Corporais',
		622
	),
	(2487, true, 'Gênero diferente', 622),
	(2488, false, 'história de fundo diferente', 622);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2489, false, 'Vermelho, amarelo e verde', 623),
	(2490, true, 'Vermelho, preto e amarelo', 623),
	(2491, false, 'Vermelho, preto e verde', 623),
	(2492, false, 'Vermelho, roxo e azul', 623),
	(2493, false, 'Carmesim', 624),
	(2494, true, 'Cerceta', 624),
	(2495, false, 'Marrom escuro', 624),
	(2496, false, 'Preto', 624),
	(2497, false, 'Humano', 625),
	(2498, false, 'kappa', 625);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2499, false, 'kitsune', 625),
	(2500, true, 'Nekomata', 625),
	(2501, false, 'Artefato abençoado', 626),
	(2502, false, 'Braço Imperial', 626),
	(2503, false, 'relíquia sagrada', 626),
	(2504, true, 'Sacred Gear', 626),
	(2505, false, 'Feito no céu', 627),
	(2506, true, 'menino do século 20', 627),
	(2507, false, 'O mundo', 627),
	(2508, false, 'Star Platinum', 627);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2509, false, 'Cujoh', 628),
	(2510, false, 'Higashikata', 628),
	(2511, false, 'Joestar', 628),
	(2512, true, 'Kujo', 628),
	(2513, false, 'Anne Finnelan', 629),
	(2514, false, 'Meridias da Cruz', 629),
	(2515, false, 'Miranda Holbrook', 629),
	(2516, true, 'Ursula Callistis', 629),
	(2517, false, 'Aqours', 630),
	(2518, false, 'Kuznetsov', 630);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2519, true, 'Minalinsky', 630),
	(2520, false, 'Stanoytchev', 630),
	(2521, false, 'Minato', 631),
	(2522, false, 'Montoya', 631),
	(2523, true, 'Tatsuya', 631),
	(2524, false, 'Tomohisa', 631),
	(
		2525,
		true,
		'Caçador de Olhos Ardentes de Cabelos Flamejantes',
		632
	),
	(2526, false, 'Neblina de chama', 632),
	(
		2527,
		false,
		'Névoa de Olhos Ardentes de Cabelos Flamejantes',
		632
	),
	(2528, false, 'Shana', 632);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2529, false, 'Haruna', 633),
	(2530, false, 'Lalá', 633),
	(2531, false, 'Mikan', 633),
	(2532, true, 'rito', 633),
	(2533, false, 'alpacookie', 634),
	(2534, true, 'Batata Venenosa', 634),
	(2535, false, 'parmesansho fruta', 634),
	(2536, false, 'Óleo Mors', 634),
	(2537, false, 'Coco', 635),
	(2538, false, 'Ensolarado', 635);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2539, false, 'Toriko', 635),
	(2540, true, 'Zebra', 635),
	(2541, false, 'buracos de minhoca', 636),
	(2542, false, 'quânticos', 636),
	(2543, false, 'Velocidade', 636),
	(2544, true, 'vetores', 636),
	(2545, true, 'arroz', 637),
	(2546, false, 'Goku', 637),
	(2547, false, 'Roupa de baixo', 637),
	(2548, false, 'Vegeta', 637);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2549, true, 'Enrico Pucci', 638),
	(2550, false, 'Jolyne Cujoh', 638),
	(2551, false, 'Jotaro Kujo', 638),
	(2552, false, 'Kujo Jotaro', 638),
	(2553, false, 'Jolyne Cujoh', 639),
	(2554, false, 'Joseph Joestar', 639),
	(2555, true, 'Jotaro Kujo', 639),
	(2556, false, 'Koichi Hirose', 639),
	(2557, false, 'Ela achou assustador.', 640),
	(
		2558,
		false,
		'Ela ficou gravemente ferida com isso.',
		640
	);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (
		2559,
		true,
		'Ela rastejou em sua boca quando bebê.',
		640
	),
	(2560, false, 'É parte Bug.', 640),
	(2561, false, '1989', 641),
	(2562, false, '1990', 641),
	(2563, true, '1992', 641),
	(2564, false, '1994', 641),
	(2565, true, '2017', 642),
	(2566, false, '2018', 642),
	(2567, false, '2019', 642),
	(2568, false, '2020', 642);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2569, false, '1888', 643),
	(2570, true, '1890', 643),
	(2571, false, '1999', 643),
	(2572, false, '2003', 643),
	(2573, false, 'Brigada do Vento Oeste', 644),
	(2574, true, 'DD D', 644),
	(2575, false, 'espada de prata', 644),
	(
		2576,
		false,
		'Sistemas Oceânicos (Agência Marítima)',
		644
	),
	(2577, true, 'Makoto Kino', 645),
	(2578, false, 'Minako Aino', 645);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2579, false, 'Rei Hino', 645),
	(2580, false, 'Usagi Tsukino', 645),
	(2581, false, '1', 646),
	(2582, false, '2', 646),
	(2583, true, '3', 646),
	(2584, false, '4', 646),
	(2585, false, 'Bubsy', 647),
	(2586, true, 'Carlos', 647),
	(2587, false, 'Kero', 647),
	(2588, false, 'Usagi', 647);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2589, true, 'Ley Batenkaitos', 648),
	(2590, false, 'Louis Arneb', 648),
	(2591, false, 'Petelgeuse Romanee-Conti', 648),
	(2592, false, 'Roy Alphard', 648),
	(2593, false, 'Giorno Giovanna', 649),
	(2594, false, 'Joseph Joestar', 649),
	(2595, false, 'Josuke Higashikata', 649),
	(2596, true, 'Jotaro Kujo', 649),
	(2597, false, '4', 650),
	(2598, true, '5', 650);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2599, false, '6', 650),
	(2600, false, '7', 650),
	(
		2601,
		false,
		'Criar eletricidade de seu próprio corpo',
		651
	),
	(
		2602,
		true,
		'Dissipar qualquer esper ou poderes mágicos',
		651
	),
	(
		2603,
		false,
		'Faça comunicações telepáticas',
		651
	),
	(2604, false, 'teleporte', 651),
	(2605, false, 'Classe 3-A', 652),
	(2606, false, 'Classe 3-B', 652),
	(2607, false, 'Classe 3-D', 652),
	(2608, true, 'Classe 3-E', 652);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2609, true, 'Macroon', 653),
	(2610, false, 'pizza', 653),
	(2611, false, 'Salgadinhos', 653),
	(2612, false, 'Sorvete', 653),
	(2613, false, '3', 654),
	(2614, false, '4', 654),
	(2615, false, '6', 654),
	(2616, true, '8', 654),
	(2617, true, 'Dhampir', 655),
	(2618, false, 'FlÜgel', 655);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2619, false, 'Imanidade', 655),
	(2620, false, 'Seiren', 655),
	(2621, true, 'Giorno Giovanna', 656),
	(2622, false, 'Guido Mista', 656),
	(2623, false, 'Joey JoJo', 656),
	(2624, false, 'Jonathan Joestar', 656),
	(2625, false, 'Billy morcego', 657),
	(2626, true, 'Diário do meu pai', 657),
	(2627, false, 'meninos do século 20', 657),
	(2628, false, 'Monstro', 657);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2629, true, 'Antigo Mundo do Dragão', 658),
	(2630, false, 'mundo do dragão', 658),
	(2631, false, 'Mundo do Dragão das Trevas', 658),
	(2632, false, 'Mundo Dragão Estelar', 658),
	(
		2633,
		true,
		'A Fortaleza Super Dimensional Macross',
		659
	),
	(2634, false, 'Blindado Trooper VOTOMS', 659),
	(2635, false, 'Mobile Suit Gundam', 659),
	(2636, false, 'Neon Genesis Evangelion', 659),
	(2637, false, 'Bizarra Aventura de JoJo', 660),
	(2638, false, 'Detetive Conan', 660);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2639, true, 'Golgo 13', 660),
	(2640, false, 'Uma pedaço', 660),
	(2641, false, 'Kyoto Animation', 661),
	(2642, true, 'Ossos', 661),
	(2643, false, 'Produção IG', 661),
	(2644, false, 'xaveco', 661),
	(2645, false, 'Hospício', 662),
	(2646, true, 'Nascer do sol', 662),
	(2647, false, 'Ossos', 662),
	(2648, false, 'Pierriot', 662);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2649, false, 'Gurren lagann', 663),
	(2650, false, 'Kiznaiver', 663),
	(2651, true, 'Matar La matança', 663),
	(2652, false, 'policial infernal', 663),
	(2653, false, 'Babymetal', 664),
	(2654, false, 'casa de ganso', 664),
	(2655, true, 'Egoísta', 664),
	(2656, false, 'garnidelia', 664),
	(2657, true, 'Androide paranóico', 665),
	(2658, false, 'Mundo louco', 665);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2659, false, 'sinfonia agridoce', 665),
	(2660, false, 'verão sádico', 665),
	(2661, true, 'CA/CC', 666),
	(2662, false, 'Dia Verde', 666),
	(2663, false, 'Red Hot Chili Peppers', 666),
	(2664, false, 'Sobrevivente', 666),
	(2665, false, 'Cavalo Hol', 667),
	(2666, false, 'Hermes Costello', 667),
	(2667, true, 'Jean Pierre Polnareff', 667),
	(2668, false, 'Noriaki Kakyoin', 667);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2669, true, 'Bobinas', 668),
	(2670, false, 'Colecionadores', 668),
	(2671, false, 'fios', 668),
	(2672, false, 'tesla', 668),
	(2673, false, 'cinábrio', 669),
	(2674, true, 'fosfofilita', 669),
	(2675, false, 'Padparadscha', 669),
	(2676, false, 'turmalina melancia', 669),
	(2677, false, '2003', 670),
	(2678, false, '2005', 670);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2679, true, '2008', 670),
	(2680, false, '2011', 670),
	(2681, false, 'Basquetebol', 671),
	(2682, false, 'beisebol', 671),
	(2683, false, 'Futebol', 671),
	(2684, true, 'futebol americano', 671),
	(2685, false, 'Acionar', 672),
	(2686, true, 'Ossos', 672),
	(2687, false, 'Pierrot', 672),
	(2688, false, 'xaveco', 672);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2689, false, 'Casey Mongillo', 673),
	(2690, true, 'Chris Niosi', 673),
	(2691, false, 'Kyle McCarley', 673),
	(2692, false, 'Max Mittelman', 673),
	(2693, true, 'Hayao Miyazaki', 674),
	(2694, false, 'Hidetaka Miyazaki', 674),
	(2695, false, 'Isao Takahata', 674),
	(2696, false, 'Mamoru Hosoda', 674),
	(2697, true, 'Eiichiro Oda', 675),
	(2698, false, 'Hayao Miyazaki', 675);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2699, false, 'Masashi Kishimoto', 675),
	(2700, false, 'Yoshihiro Togashi', 675),
	(2701, false, 'Fumante', 676),
	(2702, false, 'hastes', 676),
	(2703, true, 'Luffy', 676),
	(2704, false, 'zoro', 676),
	(2705, false, 'Springfield, Illinois', 677),
	(2706, false, 'Springfield, Massachusetts', 677),
	(2707, false, 'Springfield, Missouri', 677),
	(2708, true, 'Springfield, Óregon', 677);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2709, true, ' um holograma', 678),
	(2710, false, ' Uma ilusão', 678),
	(2711, false, 'Corrompendo', 678),
	(2712, false, 'uma simulação', 678),
	(
		2713,
		true,
		'Coma uma salamandra e pule pela janela.',
		679
	),
	(2714, false, 'Deixe em paz.', 679),
	(2715, false, 'Pule pela janela.', 679),
	(
		2716,
		false,
		'Solte 1.000 salamandras cativas na casa branca.',
		679
	),
	(2717, false, '10 libras', 680),
	(2718, true, '15 libras', 680);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2719, false, '20 libras', 680),
	(2720, false, '£ 30', 680),
	(2721, false, 'C-136', 681),
	(2722, true, 'C-137', 681),
	(2723, false, 'C500-a', 681),
	(2724, false, 'J1977', 681),
	(2725, false, 'Os Irmãos Ardósia', 682),
	(2726, false, 'Os irmãos de pedra', 682),
	(2727, false, 'Os irmãos do rock', 682),
	(2728, true, 'Os Irmãos Slag', 682);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (
		2729,
		true,
		'Estou com muita dor, por favor me ajude.',
		683
	),
	(
		2730,
		false,
		'Estou sofrendo, por favor me ajude.',
		683
	),
	(
		2731,
		false,
		'Eu rezo para que minha vida acabe logo.',
		683
	),
	(2732, false, 'Vamos começar esta festa!', 683),
	(2733, false, 'Com saudades de casa', 684),
	(2734, false, 'Hiveswap', 684),
	(2735, false, 'Husslie', 684),
	(2736, true, 'subúrbio', 684),
	(2737, true, 'Bandido', 685),
	(2738, false, 'máx.', 685);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2739, false, 'Rochoso', 685),
	(2740, false, 'Sortudo', 685),
	(2741, false, 'Ja!', 686),
	(2742, false, 'Oxidado!', 686),
	(2743, true, 'Papai.', 686),
	(2744, false, 'Sequência?', 686),
	(2745, false, 'Jack Brauchel', 687),
	(2746, true, 'Jay Baruchel', 687),
	(2747, false, 'John Powell', 687),
	(2748, false, 'Mordomo de Gerard', 687);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2749, true, 'George Clooney', 688),
	(2750, false, 'Jay Leno', 688),
	(2751, false, 'pedra mate', 688),
	(2752, false, 'Robert Smith', 688),
	(2753, false, 'Donatello', 689),
	(2754, false, 'leonardo', 689),
	(2755, true, 'Michelangelo', 689),
	(2756, false, 'Rafael', 689),
	(2757, false, 'Dave Foley', 690),
	(2758, false, 'Geoffrey Rush', 690);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2759, true, 'John Ratzenberger', 690),
	(2760, false, 'Tom Hanks', 690),
	(2761, true, 'bambi', 691),
	(2762, false, 'Cinderela', 691),
	(2763, false, 'O livro da Selva', 691),
	(2764, false, 'Pinóquio', 691),
	(2765, false, 'Ar', 692),
	(2766, false, 'Fogo', 692),
	(2767, false, 'Terra', 692),
	(2768, true, 'Água', 692);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2769, true, 'Guerra do Vietnã', 693),
	(2770, false, 'Guerra Fria', 693),
	(2771, false, 'Guerra Mundial 2', 693),
	(2772, false, 'Primeira Guerra Mundial', 693),
	(2773, true, 'andy', 694),
	(2774, false, 'Danny', 694),
	(2775, false, 'Eduardo', 694),
	(2776, false, 'Matt', 694),
	(2777, false, 'Coco', 695),
	(2778, false, 'Mac', 695);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2779, true, 'murcha', 695),
	(2780, false, 'Queijo', 695),
	(2781, true, 'lilo', 696),
	(2782, false, 'Lolo', 696),
	(2783, false, 'Lucy', 696),
	(2784, false, 'lulu', 696),
	(2785, true, 'Gary', 697),
	(2786, false, 'Lula Molusco', 697),
	(2787, false, 'Orville', 697),
	(2788, false, 'Squidette', 697);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2789, true, ' Bob Esponja Calça Quadrada', 698),
	(2790, false, 'Patrick Estrela', 698),
	(2791, false, 'Senhor caranguejo', 698),
	(2792, false, 'Tentáculos do Lula Molusco', 698),
	(2793, false, 'Bata no saco, Jack!', 699),
	(2794, false, 'Rikki-Tikki-Tavi, biatch!', 699),
	(2795, true, 'Slam dunk, nada além de rede!', 699),
	(2796, false, 'Wubba-lubba-dub-dub!', 699),
	(2797, true, 'A carroça do dragão', 700),
	(2798, false, 'O Bouldermobile', 700);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2799, false, 'O gatinho compacto', 700),
	(2800, false, 'O Haybailer Carmesim', 700),
	(2801, false, 'Barney Rubble', 701),
	(2802, true, 'Lorde Rockingham IX', 701),
	(2803, false, 'O Grande Gazoo', 701),
	(2804, false, 'Rockhead Slate', 701),
	(2805, false, 'Lady Tremaine', 702),
	(2806, false, 'Madame Mim', 702),
	(2807, false, 'Malévola', 702),
	(2808, true, 'Úrsula', 702);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2809, false, 'Fantasia', 703),
	(2810, false, 'História de brinquedos', 703),
	(2811, true, 'O Caldeirão Negro', 703),
	(2812, false, 'Tron', 703),
	(2813, true, 'Cleveland Brown', 704),
	(2814, false, 'Glenn Quagmire', 704),
	(2815, false, 'Joe Swanson', 704),
	(2816, false, 'O Surdo Engraxado', 704),
	(2817, false, 'Donatello', 705),
	(2818, false, 'leonardo', 705);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2819, true, 'Michelangelo', 705),
	(2820, false, 'Rafael', 705),
	(2821, false, '25 de dezembro de 2010', 706),
	(2822, false, '28 de março de 1999', 706),
	(2823, true, '4 de setembro de 2013', 706),
	(2824, false, 'Em andamento', 706),
	(2825, false, 'Ben Bocquelet', 707),
	(2826, false, 'JG Quintel', 707),
	(2827, true, 'Pendleton Ward', 707),
	(2828, false, 'Rebeca Açúcar', 707);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2829, false, 'Hayden Panettiere', 708),
	(2830, false, 'Jéssica Nigri', 708),
	(2831, true, 'Lindsay Jones', 708),
	(2832, false, 'Tara Forte', 708),
	(2833, true, 'Cicatriz', 709),
	(2834, false, 'Fred', 709),
	(2835, false, 'jafar', 709),
	(2836, false, 'Vada', 709),
	(2837, true, 'Kootie Pie', 710),
	(2838, false, 'Torta de mel', 710);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2839, false, 'Torta Docinho', 710),
	(2840, false, 'Wendy Pie', 710),
	(2841, false, 'abc', 711),
	(2842, false, 'CBS', 711),
	(2843, false, 'RAPOSA', 711),
	(2844, true, 'viacom', 711),
	(2845, false, 'Dick Tingler', 712),
	(2846, false, 'Helmut Schmacker', 712),
	(2847, false, 'Rosqueador de Vara', 712),
	(2848, true, 'Willi Wakker', 712);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2849, false, '"A Cúpula"', 713),
	(2850, false, 'bolha de sandy', 713),
	(2851, false, 'Centro de Pesquisa Aquática', 713),
	(2852, true, 'Sandy''s Treedome', 713),
	(2853, true, 'Diretor Brown', 714),
	(2854, false, 'Diretor Simeon', 714),
	(2855, false, 'Principal Brawn', 714),
	(2856, false, 'Principal Pequeno', 714),
	(2857, false, 'Em 742 Evergreen Terrace', 715),
	(2858, false, 'Na escola', 715);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2859, false, 'Na Igreja', 715),
	(2860, true, 'no acampamento de verão', 715),
	(2861, true, '1995', 716),
	(2862, false, '1997', 716),
	(2863, false, '1999', 716),
	(2864, false, '2001', 716),
	(2865, false, 'Ember Celica', 717),
	(2866, false, 'mortalha de Gambol', 717),
	(2867, true, 'Myrtenaster', 717),
	(2868, false, 'rosa crescente', 717);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2869, true, 'A gangue do ferro-velho', 718),
	(2870, false, 'A Trupe do Lixo', 718),
	(2871, false, 'O ferro-velho sete', 718),
	(2872, false, 'O Posse podre', 718),
	(2873, false, 'Freddie Mercury', 719),
	(2874, false, 'Janet Jackson', 719),
	(2875, false, 'Joan Jett', 719),
	(2876, true, 'Levi Stubbs', 719),
	(2877, false, 'Califórnia', 720),
	(2878, false, 'Minnesota', 720);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2879, true, 'São Francisco', 720),
	(2880, false, 'Washington', 720),
	(
		2881,
		false,
		'A Máscara (A Máscara, Série de TV)',
		721
	),
	(2882, false, 'Carl Wheezer (Jimmy Neutron)', 721),
	(2883, true, 'Max Tennyson (Ben 10)', 721),
	(2884, false, 'Yakko Warner (animaníacos)', 721),
	(2885, false, 'linha do arco-íris', 722),
	(2886, false, 'Pinkie Pie', 722),
	(2887, true, 'Rosa Marene', 722),
	(2888, false, 'Torta de Maud', 722);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2889, true, 'A concha', 723),
	(2890, false, 'as crianças', 723),
	(2891, false, 'as queixas', 723),
	(2892, false, 'O limite', 723),
	(2893, true, '33', 724),
	(2894, false, '38', 724),
	(2895, false, '83', 724),
	(2896, false, '88', 724),
	(2897, false, 'Badtz-Maru', 725),
	(2898, false, 'Kerropi', 725);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2899, false, 'Minha melodia', 725),
	(2900, true, 'Pompompurina', 725),
	(2901, false, 'cão furtivo', 726),
	(2902, false, 'presunto', 726),
	(2903, false, 'rex', 726),
	(2904, true, 'Sr Cabeça de Batata', 726),
	(2905, false, 'Boss Gator', 727),
	(2906, true, 'Grape Ape', 727),
	(2907, false, 'Urso Iogue', 727),
	(2908, false, 'Wally Gator', 727);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2909, false, '12 FPS', 728),
	(2910, true, '24 FPS', 728),
	(2911, false, '30 FPS', 728),
	(2912, false, '60 FPS', 728),
	(2913, false, 'bigodes', 729),
	(2914, false, 'Buster', 729),
	(2915, true, 'Scud', 729),
	(2916, false, 'Sr Jones', 729),
	(2917, false, 'Capitão Flynn', 730),
	(2918, false, 'Capitão Heitor', 730);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2919, true, 'Capitão Jack', 730),
	(2920, false, 'Capitão Jake', 730),
	(2921, false, 'Lambreta', 731),
	(2922, true, 'Scoobert', 731),
	(2923, false, 'Scrappy', 731),
	(2924, false, 'shooby', 731),
	(2925, false, 'Cabeça de bolha', 732),
	(2926, false, 'escudo de bolha', 732),
	(2927, false, 'Guelras Artificiais', 732),
	(2928, true, 'transformação sereia', 732);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2929, false, 'forte contente', 733),
	(2930, false, 'Forte Louco', 733),
	(2931, true, 'Forte Ruim', 733),
	(2932, false, 'Forte Triste', 733),
	(2933, false, 'Kerry Shawcross', 734),
	(2934, false, 'Miles Luna', 734),
	(2935, true, 'Monty Oum', 734),
	(2936, false, 'Shane Newville', 734),
	(2937, true, 'Jeremy Shada', 735),
	(2938, false, 'John DiMaggio', 735);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2939, false, 'Nolan Norte', 735),
	(2940, false, 'Tom Kenny', 735),
	(2941, true, 'Leni', 736),
	(2942, false, 'Lincoln', 736),
	(2943, false, 'Luan', 736),
	(2944, false, 'Luna', 736),
	(2945, true, 'barionix', 737),
	(2946, false, 'Suchomimus', 737),
	(2947, false, 'Tiranossauro Rex', 737),
	(2948, false, 'Velociraptor', 737);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2949, false, 'Alderaan', 738),
	(2950, false, 'Naboo', 738),
	(2951, true, 'Stewjon', 738),
	(2952, false, 'Tatooine', 738),
	(
		2953,
		false,
		' Para se tornar amigo de Picard',
		739
	),
	(2954, false, 'Para destruir a Enterprise', 739),
	(2955, false, 'Para roubar a Enterprise', 739),
	(
		2956,
		true,
		'Substituir Picard como Agente Romulano',
		739
	),
	(
		2957,
		false,
		'A garota com tatuagem de dragão',
		740
	),
	(2958, true, 'Jack e Jill', 740);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2959, false, 'O discurso do Rei', 740),
	(2960, false, 'Thor', 740),
	(2961, false, 'bebês macacos', 741),
	(2962, true, 'bebês pinguins', 741),
	(2963, false, 'filhotes de avestruzes', 741),
	(2964, false, 'ursinhos', 741),
	(2965, false, '1969', 742),
	(2966, true, '1971', 742),
	(2967, false, '1975', 742),
	(2968, false, '1983', 742);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2969, true, '2005', 743),
	(2970, false, '2007', 743),
	(2971, false, '2015', 743),
	(2972, false, '2020', 743),
	(2973, false, 'Fantasia', 744),
	(2974, false, 'grande herói 6', 744),
	(2975, false, 'Monstros SA.', 744),
	(2976, true, 'Tron', 744),
	(
		2977,
		false,
		'Archie Prescott e Philip Marv',
		745
	),
	(2978, true, 'Billy Loomis e Stu Macher', 745);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2979, false, 'Dewey Riley', 745),
	(2980, false, 'Sidney Prescott', 745),
	(2981, false, 'Coronel Bogey March', 746),
	(2982, false, 'Escócia, a Brava', 746),
	(2983, true, 'Homens de Harlech', 746),
	(2984, false, 'Os Granadeiros Britânicos', 746),
	(2985, false, '1', 747),
	(2986, false, '2', 747),
	(2987, true, '4', 747),
	(2988, false, '6', 747);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2989, false, 'Amigo e Bobby', 748),
	(2990, false, 'Floco de Neve e Sincelo', 748),
	(2991, false, 'Holly & Jolly', 748),
	(2992, true, 'Jingle & Jangle', 748),
	(2993, false, 'braquiossauro', 749),
	(2994, false, 'Triceratops', 749),
	(2995, false, 'Troodonte', 749),
	(2996, true, 'Velociraptor', 749),
	(2997, true, '1985', 750),
	(2998, false, '1986', 750);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (2999, false, '1988', 750),
	(3000, false, '1993', 750),
	(3001, true, 'um cavalo galopando', 751),
	(3002, false, 'Um fogo crepitante', 751),
	(3003, false, 'um homem andando', 751),
	(3004, false, 'Uma mulher em um vestido', 751),
	(
		3005,
		false,
		'"O Bom, o Mau e o Feio", "Por Mais Alguns Dólares", "Um Punhado de Dólares"',
		752
	),
	(
		3006,
		false,
		'"Por mais alguns dólares", "O bom, o mau e o feio", "Um punhado de dólares"',
		752
	),
	(
		3007,
		false,
		'"Por mais alguns dólares", "Um punhado de dólares", "O bom, o mau e o feio"',
		752
	),
	(
		3008,
		true,
		'"Um Punhado de Dólares", "Por uns Dólares a Mais", "O Bom, o Mau e o Feio"',
		752
	);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3009, false, ' Alyssa Monroe', 753),
	(3010, false, 'Jéssica Chastain', 753),
	(3011, false, 'Melissa Beckett', 753),
	(3012, true, 'Sigourney Weaver', 753),
	(3013, true, 'Bombardeiro Billy Wells', 754),
	(3014, false, 'Don Cockell', 754),
	(3015, false, 'Freddie Mills', 754),
	(3016, false, 'Terry Spinks', 754),
	(3017, false, 'Buddy Holly', 755),
	(3018, true, 'Elvis Presley', 755);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3019, false, 'Hank Williams, Sr.', 755),
	(3020, false, 'Johnny Cash', 755),
	(3021, false, 'Carl', 756),
	(3022, true, 'Dave', 756),
	(3023, false, 'John', 756),
	(3024, false, 'Vai', 756),
	(3025, false, 'Edwin Neal', 757),
	(3026, true, 'Gunnar Hansen', 757),
	(3027, false, 'Joe Bill Hogan', 757),
	(3028, false, 'John Dugan', 757);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3029, false, 'Bryce', 758),
	(3030, true, 'DeForest', 758),
	(3031, false, 'DeWinter', 758),
	(3032, false, 'Steven', 758),
	(
		3033,
		false,
		'Base Weyland Yutani Corporation',
		759
	),
	(3034, false, 'DI-621', 759),
	(3035, false, 'FR-838', 759),
	(3036, true, 'LV-426', 759),
	(3037, false, '3 ninjas contra-atacam', 760),
	(3038, true, 'Norte', 760);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3039, false, 'O Papai Noel', 760),
	(3040, false, 'Riquinho', 760),
	(3041, false, 'A carga no rio Feather', 761),
	(3042, false, 'Indiana Jones', 761),
	(3043, true, 'Tambores Distantes', 761),
	(3044, false, 'Tesouro da Serra Madre', 761),
	(3045, false, 'negócios sujos', 762),
	(3046, true, 'Sopa de pato', 762),
	(3047, false, 'Um dia nas corridas', 762),
	(3048, false, 'Uma Noite na Ópera', 762);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3049, false, 'Phocrex', 763),
	(3050, false, 'Pretoriano', 763),
	(3051, false, 'xenomorfo', 763),
	(3052, true, 'Yautja', 763),
	(3053, false, 'Grigori Efimovich Rasputin', 764),
	(3054, false, 'Ilsa Haupstein', 764),
	(3055, true, 'Karl Ruprecht Kroenen', 764),
	(3056, false, 'Klaus Werner von Krupt', 764),
	(3057, false, 'maria boa noite', 765),
	(3058, false, 'Pam Bouvier', 765);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3059, true, 'Vanessa Kensington', 765),
	(3060, false, 'Wai Lin', 765),
	(3061, false, 'A ilha', 766),
	(3062, true, 'Clube de luta', 766),
	(3063, false, 'Impensável', 766),
	(3064, false, 'torta americana', 766),
	(3065, false, 'Flash Gordon', 767),
	(3066, true, 'Highlander', 767),
	(3067, false, 'Howard, o Pato', 767),
	(3068, false, 'Labirinto', 767);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3069, false, ' piratas do Caribe', 768),
	(3070, false, 'crianças espiãs', 768),
	(3071, true, 'Harry Potter', 768),
	(3072, false, 'Ted', 768),
	(3073, false, 'Gordon Foster', 769),
	(3074, false, 'Gordon Milipp', 769),
	(3075, true, 'Gordon Shumway', 769),
	(3076, false, 'Gordon von Gam', 769),
	(3077, true, 'San Fransokyo', 770),
	(3078, false, 'Sankyo', 770);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3079, false, 'São Tóquio', 770),
	(3080, false, 'Tóquio', 770),
	(3081, true, 'Casablanca', 771),
	(3082, false, 'Cidadão Kane', 771),
	(3083, false, 'O Falcão Maltês', 771),
	(3084, false, 'O tesouro da Sierra Madre', 771),
	(3085, false, 'A coisa certa', 772),
	(3086, false, 'abandonado', 772),
	(3087, true, 'Apolo 13', 772),
	(3088, false, 'capricórnio um', 772);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3089, false, 'bonita em rosa', 773),
	(3090, true, 'dança suja', 773),
	(
		3091,
		false,
		'Dia de folga de Ferris Bueller',
		773
	),
	(3092, false, 'Três homens e um bebê', 773),
	(3093, false, 'A cor do dinheiro', 774),
	(3094, false, 'coquetel', 774),
	(3095, false, 'Dias de tempestade', 774),
	(3096, true, 'Top Gun', 774),
	(3097, false, 'Dusty, Kirby e Ralph', 775),
	(3098, false, 'Jenna, Sylvie e Dixie', 775);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3099, true, 'Kaltag, Nikki e Star', 775),
	(3100, false, 'Nuk, Iaque e Sumac', 775),
	(3101, false, 'Cylons', 776),
	(3102, true, 'Replicantes', 776),
	(3103, false, 'Sintéticos', 776),
	(3104, false, 'Skinjobs', 776),
	(3105, false, 'carson', 777),
	(3106, false, 'Jackson', 777),
	(3107, false, 'Willy', 777),
	(3108, true, 'Wilson', 777);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3109, false, 'almôndegas', 778),
	(3110, true, 'Ar', 778),
	(3111, false, 'o Schwartz', 778),
	(3112, false, 'Princesa Lonestar', 778),
	(3113, true, 'Aloysius O''Hare', 779),
	(3114, false, 'Grammy Norma', 779),
	(3115, false, 'o outrora-ler', 779),
	(3116, false, 'Ted Wiggins', 779),
	(3117, false, 'Manhã', 780),
	(3118, true, 'Meia-noite', 780);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3119, false, 'Noite', 780),
	(3120, false, 'Tarde', 780),
	(3121, false, 'Boliche para Sopa', 781),
	(3122, false, 'Linkin Park', 781),
	(3123, true, 'Quebra Boca', 781),
	(3124, false, 'Total 41', 781),
	(3125, false, 'Alemanha', 782),
	(3126, false, 'França', 782),
	(3127, false, 'Itália', 782),
	(3128, true, 'Reino Unido', 782);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3129, false, 'Americano nativo', 783),
	(3130, false, 'japonês', 783),
	(3131, false, 'nórdico', 783),
	(3132, true, 'polinésio', 783),
	(3133, false, ' Refluxo ácido', 784),
	(3134, false, 'Anemia', 784),
	(3135, false, 'Constipação', 784),
	(3136, true, 'Disenteria', 784),
	(3137, false, 'Bridget Fonda', 785),
	(3138, false, 'Kathy Griffin', 785);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3139, false, 'Pam Grier', 785),
	(3140, true, 'Uma Thurman', 785),
	(3141, false, 'Jared Leto', 786),
	(3142, false, 'margot robbie', 786),
	(3143, true, 'Scarlett Johansson', 786),
	(3144, false, 'Will Smith', 786),
	(3145, false, 'Coragem verdadeira', 787),
	(3146, false, 'O doador', 787),
	(3147, true, 'Os oito odiados', 787),
	(3148, false, 'Tron: Legado', 787);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3149, false, 'Blade Runner', 788),
	(3150, false, 'O Exterminador do Futuro', 788),
	(3151, false, 'Predador 2', 788),
	(3152, true, 'RoboCop', 788),
	(3153, false, 'A rocha', 789),
	(3154, false, 'Dia da Independência', 789),
	(3155, true, 'Gladiador', 789),
	(3156, false, 'Missão Impossível', 789),
	(3157, false, 'Christoph Waltz', 790),
	(3158, false, 'Harvey Keitel', 790);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3159, true, 'John Travolta', 790),
	(3160, false, 'Samuel L. Jackson', 790),
	(3161, false, 'Dia', 791),
	(3162, false, 'Parker', 791),
	(3163, false, 'Perkins', 791),
	(3164, true, 'vendaval', 791),
	(3165, true, 'Aladim', 792),
	(3166, false, 'História de brinquedos', 792),
	(3167, false, 'James e o Pêssego Gigante', 792),
	(3168, false, 'O corcunda de Notre Dame', 792);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (
		3169,
		false,
		'Batman v Superman: Black of Knight',
		793
	),
	(
		3170,
		false,
		'Batman v Superman: Superapocalipse',
		793
	),
	(
		3171,
		true,
		'Batman vs Superman: A Origem da Justiça',
		793
	),
	(
		3172,
		false,
		'Batman vs Superman: Knightfall',
		793
	),
	(3173, true, 'Descolado.', 794),
	(3174, false, 'Legal.', 794),
	(3175, false, 'Nodoso.', 794),
	(3176, false, 'Perfeito.', 794),
	(3177, false, 'Da Rússia com amor', 795),
	(3178, false, 'Dedo de ouro', 795);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3179, true, 'Dr. Não', 795),
	(3180, false, 'Thunderball', 795),
	(3181, false, '101 dálmatas', 796),
	(3182, true, 'História de brinquedos', 796),
	(3183, false, 'Rei Leão', 796),
	(3184, false, 'Tron', 796),
	(3185, true, 'Anguirus', 797),
	(3186, false, 'king kong', 797),
	(3187, false, 'Mothra', 797),
	(3188, false, 'Rei Ghidora', 797);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3189, false, 'América colonial', 798),
	(3190, false, 'Inglaterra vitoriana', 798),
	(3191, true, 'Inquisição espanhola', 798),
	(3192, false, 'revolução Francesa', 798),
	(
		3193,
		true,
		'Branca de Neve e os Sete Anões',
		799
	),
	(3194, false, 'Dumbo', 799),
	(3195, false, 'Fantasia', 799),
	(3196, false, 'Pinóquio', 799),
	(3197, true, 'Chá Ming', 800),
	(3198, false, 'hortelã', 800);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3199, false, 'Senhor E', 800),
	(3200, false, 'Tosse Fi', 800),
	(3201, false, 'Ilha Muerta', 801),
	(3202, true, 'Ilha Nublar', 801),
	(3203, false, 'Ilha Pena', 801),
	(3204, false, 'Ilha Sorna', 801),
	(3205, false, 'AA-A', 802),
	(3206, false, 'BB-3', 802),
	(3207, true, 'BB-8', 802),
	(3208, false, 'R2-D2', 802);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3209, false, 'Antes do Episódio 1', 803),
	(3210, false, 'Depois do episódio 6', 803),
	(3211, true, 'Entre o episódio 3 e 4', 803),
	(3212, false, 'Entre o episódio 4 e 5', 803),
	(3213, false, '1985', 804),
	(3214, false, '1990', 804),
	(3215, true, '1997', 804),
	(3216, false, '1999', 804),
	(3217, false, 'Billy', 805),
	(3218, false, 'jones', 805);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3219, false, 'Sexta-feira', 805),
	(3220, true, 'Wilson', 805),
	(3221, false, 'dálmata', 806),
	(3222, false, 'Golden Retriever', 806),
	(3223, true, 'labrador retriever', 806),
	(3224, false, 'Shiba Inu', 806),
	(3225, false, 'James cameron', 807),
	(3226, false, 'Stanley Kubrick', 807),
	(3227, true, 'Steven Spielberg', 807),
	(3228, false, 'Tim Burton', 807);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3229, true, 'Alejandro G. Iñarritu', 808),
	(3230, false, 'Christopher Nolan', 808),
	(3231, false, 'David Fincher', 808),
	(3232, false, 'Wes Anderson', 808),
	(3233, false, 'James cameron', 809),
	(3234, false, 'Martin Scorcese', 809),
	(3235, true, 'Quentin Tarantino', 809),
	(3236, false, 'Steven Spielberg', 809),
	(3237, false, 'Butch Coolidge', 810),
	(3238, false, 'Jimmie Dimmick', 810);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3239, false, 'Jules Winnfield', 810),
	(3240, true, 'Vincent Vega', 810),
	(3241, false, 'Francisco Ford Coppola', 811),
	(3242, false, 'Michael Cimino', 811),
	(3243, true, 'Oliver Stone', 811),
	(3244, false, 'Stanley Kubrick', 811),
	(3245, false, 'Adam West', 812),
	(3246, false, 'George Clooney', 812),
	(3247, true, 'Michael Keaton', 812),
	(3248, false, 'Val Kilmer', 812);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3249, false, ' Yun-Fat Chow', 813),
	(3250, true, 'Bruce Lee', 813),
	(3251, false, 'Jackie Chan', 813),
	(3252, false, 'Jet Li', 813),
	(3253, false, 'Kim Demp', 814),
	(3254, false, 'Madison Derpe', 814),
	(3255, false, 'Milla Johnson', 814),
	(3256, true, 'Milla Jovovich', 814),
	(3257, false, 'Harrison Ford', 815),
	(3258, false, 'John Cusack', 815);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3259, true, 'Kurt Russel', 815),
	(3260, false, 'Patrick Swayze', 815),
	(3261, true, 'Jack Black', 816),
	(3262, false, 'Jim Petersson', 816),
	(3263, false, 'McConahey Ramsés', 816),
	(3264, false, 'mirana jones', 816),
	(3265, false, 'Harrison Ford', 817),
	(3266, false, 'Harvey Keitel', 817),
	(3267, false, 'Martin Landau', 817),
	(3268, true, 'Tommy Lee Jones', 817);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3269, false, 'Biff Tannen', 818),
	(3270, false, 'Emmett "Doc" Brown', 818),
	(3271, false, 'George McFly', 818),
	(3272, true, 'Marty McFly', 818),
	(
		3273,
		false,
		'"Aqui está olhando para você, garoto."',
		819
	),
	(
		3274,
		false,
		'"Arredonde os suspeitos habituais."',
		819
	),
	(
		3275,
		true,
		'"Francamente, minha querida, eu não dou a mínima."',
		819
	),
	(
		3276,
		false,
		'“De todas as casas de gim, em todas as cidades, em todo o mundo, ela entra na minha…”',
		819
	),
	(
		3277,
		false,
		'"A verdade é que eu sou seu pai."',
		820
	),
	(3278, false, '"Luke eu sou seu pai."', 820);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3279, true, '"Não. Eu sou seu pai."', 820),
	(
		3280,
		false,
		'"Você está errado. Eu sou seu pai."',
		820
	),
	(3281, false, 'China', 821),
	(3282, false, 'Estados Unidos', 821),
	(3283, false, 'França', 821),
	(3284, true, 'Nigéria', 821),
	(3285, false, 'Iogurte De Cereja', 822),
	(3286, true, 'Molho de Creme e Framboesa', 822),
	(3287, false, 'Sorbet de framboesa', 822),
	(3288, false, 'Sorvete de morango', 822);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3289, false, 'O Conto de Natal dos Muppets', 823),
	(3290, false, 'O filme Muppet', 823),
	(3291, false, 'O Grande Muppet Alcaparra', 823),
	(3292, true, 'Os Muppets Tomam Manhattan', 823),
	(3293, true, ' Masrani Global Corporation', 824),
	(
		3294,
		false,
		'Biologia Sintéticas Tecnologias',
		824
	),
	(
		3295,
		false,
		'International Genetics Incorporated',
		824
	),
	(
		3296,
		false,
		'Tecnologias Genéticas Internacionais',
		824
	),
	(3297, false, '20 de julho de 2015', 825),
	(3298, true, '21 de outubro de 2015', 825);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3299, false, '25 de janeiro de 2015', 825),
	(3300, false, '28 de agosto de 2015', 825),
	(3301, false, 'Chien-Po', 826),
	(3302, false, 'Fa Zhou', 826),
	(3303, false, 'Li Shang', 826),
	(3304, true, 'Shan Yu', 826),
	(3305, false, 'Barliman Butterbur', 827),
	(3306, false, 'Celeborn', 827),
	(3307, false, 'Passolargo', 827),
	(3308, true, 'Tom Bombadil', 827);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3309, false, 'arenoso', 828),
	(3310, true, 'Coral', 828),
	(3311, false, 'Pérola', 828),
	(3312, false, 'Shelly', 828),
	(3313, false, 'Alta sociedade', 829),
	(3314, false, 'Daqui até a eternidade', 829),
	(3315, true, 'meninos e bonecos', 829),
	(3316, false, 'Âncoras Pesadas', 829),
	(3317, false, 'Android', 830),
	(3318, false, 'Fugir', 830);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3319, false, 'Os Exterminadores', 830),
	(3320, true, 'Westworld', 830),
	(3321, false, '1983', 831),
	(3322, true, '1984', 831),
	(3323, false, '1985', 831),
	(3324, false, '1986', 831),
	(3325, false, '1984', 832),
	(3326, true, '1986', 832),
	(3327, false, '2007', 832),
	(3328, false, '2009', 832);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3329, false, '1996', 833),
	(3330, true, '1997', 833),
	(3331, false, '1998', 833),
	(3332, false, '1999', 833),
	(3333, false, 'A Aliança Rebelde', 834),
	(3334, true, 'A Nova República', 834),
	(3335, false, 'a primeira ordem', 834),
	(3336, false, 'O Amanhecer Carmesim', 834),
	(3337, true, 'apocalipse agora', 835),
	(3338, false, 'O caçador de veados', 835);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3339, false, 'Pelotão', 835),
	(
		3340,
		false,
		'Revestimento completo de metal',
		835
	),
	(3341, false, 'Bonnie e Clyde', 836),
	(3342, true, 'Mão Legal Lucas', 836),
	(3343, false, 'No calor da Noite', 836),
	(3344, false, 'O graduado', 836),
	(3345, false, 'bucha de canhão', 837),
	(3346, true, 'Camiseta vermelha', 837),
	(3347, false, 'lacaios', 837),
	(3348, false, 'Produtos descartáveis', 837);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3349, false, 'Começo', 838),
	(3350, false, 'ilha do obturador', 838),
	(3351, false, 'O Lobo de Wall Street', 838),
	(3352, true, 'O Regresso', 838),
	(3353, false, 'Alan Wake', 839),
	(3354, false, 'assassino de aluguel', 839),
	(3355, false, 'Deus da guerra', 839),
	(3356, true, 'Max Payne', 839),
	(3357, false, 'Chrysler Valiant Charger', 840),
	(3358, true, 'ford falcon', 840);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3359, false, 'Holden Monaro', 840),
	(3360, false, 'Pontiac Firebird', 840),
	(3361, false, 'Derek Mears', 841),
	(3362, false, 'Gunnar Hansen', 841),
	(3363, true, 'Jackie Earle Haley', 841),
	(3364, false, 'Tyler Mane', 841),
	(3365, false, 'angelina', 842),
	(3366, false, 'Cristina', 842),
	(3367, false, 'Mary', 842),
	(3368, true, 'pamela', 842);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3369, true, 'Bateria', 843),
	(
		3370,
		false,
		'Pássaros reais cantando ao vivo',
		843
	),
	(3371, false, 'Saxofone', 843),
	(3372, false, 'Violino', 843),
	(3373, false, 'Cocaína', 844),
	(3374, true, 'Heroína', 844),
	(3375, false, 'Maconha', 844),
	(3376, false, 'oxicodona', 844),
	(3377, false, 'Bridlington', 845),
	(3378, true, 'Brighton', 845);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3379, false, 'Eastbourne', 845),
	(3380, false, 'Toca do Rato', 845),
	(
		3381,
		false,
		'Apenas dois caras para uma luta',
		846
	),
	(
		3382,
		false,
		'As lutas vão durar o tempo que for necessário',
		846
	),
	(3383, true, 'Use sempre uma camisa', 846),
	(
		3384,
		false,
		'Você não fala sobre FIGHT CLUB',
		846
	),
	(3385, true, 'Gene Wilder', 847),
	(3386, false, 'Johnny Depp', 847),
	(3387, false, 'Peter Ostrum', 847),
	(3388, false, 'Shia LeBouf', 847);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3389, false, 'I-950', 848),
	(3390, false, 'T-1000', 848),
	(3391, true, 'T-800', 848),
	(3392, false, 'T-888', 848),
	(3393, true, 'equipamento de mineração', 849),
	(3394, false, 'fantasia de palhaço', 849),
	(3395, false, 'roupa de Papai Noel', 849),
	(3396, false, 'uniforme da policia', 849),
	(3397, false, 'Efeito CGI', 850),
	(3398, true, 'Gelatina', 850);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3399, false, 'Pintar', 850),
	(3400, false, 'Tingir', 850),
	(3401, false, 'Motor de ferro duplo', 851),
	(3402, false, 'Motor de início duplo', 851),
	(3403, true, 'Motor de íon duplo', 851),
	(3404, false, 'Motor Twin Interceptador', 851),
	(3405, true, 'Elton John', 852),
	(3406, false, 'Justin Bieber', 852),
	(3407, false, 'Lady Gaga', 852),
	(3408, false, 'Rihanna', 852);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3409, false, 'Chuck Norris', 853),
	(3410, true, 'Jean Claude Van Damme', 853),
	(3411, false, 'Scott Adkins', 853),
	(3412, false, 'Steven Seagal', 853),
	(3413, false, 'George Clooney', 854),
	(3414, false, 'John Travolta', 854),
	(3415, false, 'Kelly McGillis', 854),
	(3416, true, 'Tom Cruise', 854),
	(3417, true, 'Corey Feldman', 855),
	(3418, false, 'Macaulay Culkin', 855);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3419, false, 'Mark Hamill', 855),
	(3420, false, 'Mel Gibson', 855),
	(3421, false, ' Clint Eastwood', 856),
	(3422, false, 'Ben Stiller', 856),
	(3423, true, 'Johnny Depp', 856),
	(3424, false, 'Leonardo Di Caprio', 856),
	(3425, true, 'Bobby Darin', 857),
	(3426, false, 'Dean Martin', 857),
	(3427, false, 'Frank Sinatra', 857),
	(3428, false, 'Louis Armstrong', 857);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3429, false, 'Los Angeles', 858),
	(3430, false, 'Sacramento', 858),
	(3431, true, 'São Francisco', 858),
	(3432, false, 'São José', 858),
	(
		3433,
		false,
		'Austin Powers: Homem Internacional do Mistério',
		859
	),
	(
		3434,
		false,
		'Excelente Aventura de Bill & Ted',
		859
	),
	(3435, false, 'Idiota e mais idiota', 859),
	(3436, true, 'mundo de Wayne', 859),
	(3437, true, 'Gilbert Gottfried', 860),
	(3438, false, 'Jonathan Freeman', 860);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3439, false, 'Pauly Shore', 860),
	(3440, false, 'Robin Williams', 860),
	(3441, false, 'Ip Man 2', 861),
	(3442, false, 'LÉon: O Profissional', 861),
	(3443, false, 'O Legado Bourne', 861),
	(3444, true, 'vitoria', 861),
	(3445, false, 'A Lista de Schindler', 862),
	(3446, true, 'arca russa', 862),
	(3447, false, 'Caça à Boa Vontade', 862),
	(3448, false, 'homem Pássaro', 862);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3449, false, 'A pequena Sereia', 863),
	(3450, false, 'A Raposa e o Cão', 863),
	(3451, false, 'Cento e um Dálmatas', 863),
	(3452, true, 'os aristogatas', 863),
	(3453, false, 'Adam Curtis', 864),
	(3454, false, 'Errol Morris', 864),
	(3455, false, 'Joe Berlinger', 864),
	(3456, true, 'Louis Theroux', 864),
	(3457, false, 'Benício Del Toro', 865),
	(3458, false, 'Gabriel Byrne', 865);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3459, false, 'Kevin Spacey', 865),
	(3460, true, 'Steve Buscemi', 865),
	(3461, false, 'cães de reserva', 866),
	(3462, true, 'Do anoitecer ao Amanhecer', 866),
	(3463, false, 'Jackie Brown', 866),
	(3464, false, 'Pulp Fiction', 866),
	(3465, true, 'Auric Goldfinger', 867),
	(3466, false, 'Dr. Júlio Não', 867),
	(3467, false, 'Emílio Largo', 867),
	(3468, false, 'Rosa Klebb', 867);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3469, false, 'Ben Richards', 868),
	(3470, false, 'Douglas Quaid', 868),
	(3471, false, 'Harry Tasker', 868),
	(3472, true, 'John Matrix', 868),
	(3473, true, 'Açúcar', 869),
	(3474, false, 'Caramelo', 869),
	(3475, false, 'Doce', 869),
	(3476, false, 'Mel', 869),
	(3477, false, 'James Doohan', 870),
	(3478, false, 'Jorge Takei', 870);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3479, true, 'Leonard Nimoy', 870),
	(3480, false, 'William Shatner', 870),
	(3481, true, ' Os Vikings', 871),
	(3482, false, 'Os Navios Compridos', 871),
	(3483, false, 'Príncipe Valente', 871),
	(3484, false, 'Spartacus', 871),
	(3485, false, 'A Raposa e o Cão', 872),
	(3486, true, 'Jogos Olímpicos', 872),
	(3487, false, 'O Caldeirão Negro', 872),
	(3488, false, 'O grande rato detetive', 872);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3489, true, 'Astronauta de Plutão', 873),
	(3490, false, 'o homem de sorte', 873),
	(3491, false, 'Os viajantes do tempo', 873),
	(
		3492,
		false,
		'Viajantes do tempo de Hill Valley',
		873
	),
	(3493, false, 'Coelho', 874),
	(3494, true, 'Esquilo', 874),
	(3495, false, 'Heffalumps', 874),
	(3496, false, 'Tigre', 874),
	(3497, true, 'Dirty Harry', 875),
	(3498, false, 'Harry Potter', 875);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3499, false, 'Indiana Jones', 875),
	(3500, false, 'James Bond', 875),
	(3501, true, 'Dan Marino', 876),
	(3502, false, 'Joe Montana', 876),
	(3503, false, 'John Elway', 876),
	(3504, false, 'Tom Brady', 876),
	(3505, false, 'filho da máscara', 877),
	(
		3506,
		false,
		'Sin City: Uma Dama para Matar',
		877
	),
	(3507, true, 'Toy Story 2', 877),
	(
		3508,
		false,
		'Velocidade 2: Controle de Cruzeiro',
		877
	);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3509, false, 'Os romanos vão em casa', 878),
	(3510, true, 'Romani Ite Domum', 878),
	(3511, false, 'Roxani Ite Domum', 878),
	(3512, false, 'Tomate Ite Domum', 878),
	(3513, false, 'Carl Myers', 879),
	(3514, false, 'Martin Michaels', 879),
	(3515, true, 'Maurice Micklewhite', 879),
	(3516, false, 'Morris Coleman', 879),
	(3517, true, 'Michael Douglas', 880),
	(3518, false, 'Michael Fox', 880);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3519, false, 'Michael Kane', 880),
	(3520, false, 'Michael Richards', 880),
	(3521, true, 'Ben Burt', 881),
	(3522, false, 'Ken Burns', 881),
	(3523, false, 'Miranda Keyes', 881),
	(3524, false, 'Ralph McQuarrie', 881),
	(3525, false, 'Frank Stark', 882),
	(3526, false, 'Jim Kane', 882),
	(3527, true, 'Jim Stark', 882),
	(3528, false, 'Ned Stark', 882);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3529, true, 'Benjamim Franklin Gates', 883),
	(3530, false, 'George Washington Swanson', 883),
	(3531, false, 'John Quincy Beckett', 883),
	(3532, false, 'Thomas Jefferson Walker', 883),
	(
		3533,
		false,
		'Computador analógico do Campus Oeste',
		884
	),
	(
		3534,
		false,
		'Hélice de Pensamento Auto Evolutivo',
		884
	),
	(3535, false, 'Programa de Controle Mestre', 884),
	(
		3536,
		true,
		'Resposta do Plano de Operação de Guerra',
		884
	),
	(3537, true, 'Akan', 885),
	(3538, false, 'Estelle', 885);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3539, false, 'henrique', 885),
	(3540, false, 'Jimmy', 885),
	(3541, false, 'Anoaʻi', 886),
	(3542, false, 'Kealoha', 886),
	(3543, false, 'Kuʻulei', 886),
	(3544, true, 'Pelekai', 886),
	(3545, false, '$ 1 milhão', 887),
	(3546, false, '$ 10 milhões', 887),
	(3547, false, '$ 20.000', 887),
	(3548, true, '$ 6 milhões', 887);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3549, true, '1,2 bilhão de dólares', 888),
	(3550, false, '392 milhões de dólares', 888),
	(3551, false, '456 milhões de dólares', 888),
	(3552, false, '640 milhões de dólares', 888),
	(3553, false, 'E o Vento Levou', 889),
	(3554, false, 'Guerra das Estrelas', 889),
	(3555, false, 'mandíbulas', 889),
	(3556, true, 'Titânico', 889),
	(3557, true, 'Não me pare agora', 890),
	(3558, false, 'Nós vamos balançar você', 890);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3559, false, 'Outro morde a poeira', 890),
	(3560, false, 'Rocha de Brighton', 890),
	(3561, false, 'Brian Thompson', 891),
	(3562, false, 'Dennis Quaid', 891),
	(3563, false, 'Pete Postlethwaite', 891),
	(3564, true, 'Sean Connery', 891),
	(3565, false, 'Liam Neeson', 892),
	(3566, false, 'Morgan Freeman', 892),
	(3567, true, 'Nick Offerman', 892),
	(3568, false, 'Will Arnet', 892);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3569, false, 'Enya', 893),
	(3570, false, 'Kitaro', 893),
	(3571, true, 'Vangelis', 893),
	(3572, false, 'Yanni', 893),
	(3573, false, 'Chris Miller', 894),
	(3574, true, 'Edgar Wright', 894),
	(3575, false, 'Phil Lord', 894),
	(3576, false, 'Seth Rogan', 894),
	(3577, true, 'Christian Bale', 895),
	(3578, false, 'Heath Ledger', 895);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3579, false, 'Michael Caine', 895),
	(3580, false, 'Ron Dean', 895),
	(3581, false, 'John Barry', 896),
	(3582, false, 'Sheena Easton', 896),
	(3583, true, 'Shirley Basey', 896),
	(3584, false, 'Tom Jones', 896),
	(3585, false, 'Boris Karloff', 897),
	(3586, false, 'Lon Chaney Jr.', 897),
	(3587, true, 'Peter Cushing', 897),
	(3588, false, 'Vicente Preço', 897);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3589, false, 'Christian Bale', 898),
	(3590, true, 'George Clooney', 898),
	(3591, false, 'Michael Keaton', 898),
	(3592, false, 'Val Kilmer', 898),
	(3593, false, 'Doug Benson', 899),
	(3594, true, 'Doug Bradley', 899),
	(3595, false, 'Doug Jones', 899),
	(3596, false, 'Doug Savant', 899),
	(3597, false, 'Charlie Sheen', 900),
	(3598, false, 'Johnny Depp', 900);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3599, false, 'Matt Damon', 900),
	(3600, true, 'Willem Dafoe', 900),
	(3601, false, 'Frank Darabont', 901),
	(3602, true, 'Jonathan Demme', 901),
	(3603, false, 'Michael Bay', 901),
	(3604, false, 'Stanley Kubrick', 901),
	(3605, false, 'Cabaré', 902),
	(3606, true, 'Chicago', 902),
	(3607, false, 'garotas dos sonhos', 902),
	(3608, false, 'Todo aquele jazz', 902);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3609, false, 'Allison Kline', 903),
	(3610, false, 'Bruno Cathala', 903),
	(3611, true, 'Reiner Knizia', 903),
	(3612, false, 'Uwe Rosenburg', 903),
	(3613, false, 'Borth Sampson', 904),
	(3614, false, 'Jason LeVine', 904),
	(3615, false, 'Tio Pennybags', 904),
	(3616, true, 'Tom Vasel', 904),
	(
		3617,
		false,
		'Demônios Atiradores de Pedras',
		905
	),
	(3618, false, 'Ember Shot', 905);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3619, false, 'faca de arremesso', 905),
	(3620, true, 'machado de lava', 905),
	(3621, false, 'Besta de carga', 906),
	(3622, false, 'Dirtcowl Wurm', 906),
	(3623, true, 'Dragão relâmpago', 906),
	(3624, false, 'fantasma', 906),
	(3625, false, 'blindagem', 907),
	(3626, false, 'Bloqueio', 907),
	(3627, true, 'interceptando', 907),
	(3628, false, 'Resistindo', 907);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3629, false, '$ 160', 908),
	(3630, true, '$ 180', 908),
	(3631, false, '$ 200', 908),
	(3632, false, '$ 220', 908),
	(3633, false, '$ 30', 909),
	(3634, true, '$ 35', 909),
	(3635, false, '$ 45', 909),
	(3636, false, '$ 50', 909),
	(3637, false, 'Disputa Territorial', 910),
	(3638, false, 'O Jogo do Monopolista', 910);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3639, true, 'O jogo do senhorio', 910),
	(3640, false, 'rixa de propriedade', 910),
	(3641, false, 'arqueiros élficos', 911),
	(3642, true, 'Bog Wraith', 911),
	(3643, false, 'Ilha', 911),
	(3644, false, 'rocha hidra', 911),
	(3645, true, 'Bruxo', 912),
	(3646, false, 'Clérigo', 912),
	(3647, false, 'feiticeiro', 912),
	(3648, false, 'Mago', 912);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3649, false, 'Lotleth Troll', 913),
	(3650, false, 'troll albino', 913),
	(3651, false, 'Troll Colheitadeira', 913),
	(3652, true, 'Uthden Troll', 913),
	(3653, false, 'Descafeinado', 914),
	(3654, false, 'Frappuccino', 914),
	(3655, false, 'macchiato', 914),
	(3656, true, 'mocha latte', 914),
	(3657, false, 'burrito', 915),
	(3658, true, 'chimichanga', 915);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3659, false, 'Enchilada', 915),
	(3660, false, 'taquito', 915),
	(3661, false, 'Dica', 916),
	(3662, true, 'Monopólio', 916),
	(3663, false, 'Risco', 916),
	(3664, false, 'Terra de doces', 916),
	(3665, false, '177', 917),
	(3666, true, '187', 917),
	(3667, false, '197', 917),
	(3668, false, '207', 917);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3669, false, 'A Companhia Elétrica', 918),
	(3670, false, 'Cadeia', 918),
	(3671, true, 'Estacionamento grátis', 918),
	(3672, false, 'ir para a cadeia', 918),
	(3673, true, 'Carcassone', 919),
	(3674, false, 'Clermont-Ferrand', 919),
	(3675, false, 'Marselha', 919),
	(3676, false, 'Paris', 919),
	(3677, false, '1993', 920),
	(3678, true, '1996', 920);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3679, false, '1999', 920),
	(3680, false, '2003', 920),
	(3681, true, 'Casa', 921),
	(3682, false, 'Extra', 921),
	(3683, false, 'Mudar', 921),
	(3684, false, 'Personalizado', 921),
	(3685, true, 'Atlantic City, Nova Jersey', 922),
	(3686, false, 'Charleston, Carolina do Sul', 922),
	(3687, false, 'Duluth, Minnesota', 922),
	(3688, false, 'Las Vegas, Nevada', 922);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3689, false, 'Cluedo', 923),
	(3690, false, 'Coppit', 923),
	(3691, false, 'Dia do pagamento', 923),
	(3692, true, 'Monopólio', 923),
	(
		3693,
		false,
		'Dungeons & Dragons 3.5ª edição',
		924
	),
	(
		3694,
		false,
		'Dungeons & Dragons Avançado 2ª edição',
		924
	),
	(3695, false, 'Dungeons & Dragons Avançados', 924),
	(3696, true, 'Masmorras e Dragões Extremos', 924),
	(3697, true, 'abril de 1966', 925),
	(3698, false, 'fevereiro de 1966', 925);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3699, false, 'janeiro de 1969', 925),
	(3700, false, 'setembro de 1965', 925),
	(3701, false, '16', 926),
	(3702, false, '20', 926),
	(3703, true, '32', 926),
	(3704, false, '36', 926),
	(3705, true, 'Cinco', 927),
	(3706, false, 'Oito', 927),
	(3707, false, 'quatro', 927),
	(3708, false, 'Seis', 927);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3709, false, '15', 928),
	(3710, false, '18', 928),
	(3711, true, '21', 928),
	(3712, false, '24', 928),
	(3713, false, '1', 929),
	(3714, false, '10', 929),
	(3715, false, '3', 929),
	(3716, true, '7', 929),
	(3717, false, 'Laranja', 930),
	(3718, false, 'Marrom', 930);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3719, false, 'Rosa', 930),
	(3720, true, 'Roxo', 930),
	(3721, false, ' Canto de Vitu-Ghazi', 931),
	(3722, false, 'Afirmar autoridade', 931),
	(3723, true, 'Infusão de Blinkmoth', 931),
	(3724, false, 'Vento Vitalizante', 931),
	(3725, false, '1987', 932),
	(3726, true, '1993', 932),
	(3727, false, '1998', 932),
	(3728, false, '2003', 932);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (
		3729,
		false,
		'Adicione os níveis dos monstros para corresponder ao monstro Xyz',
		933
	),
	(
		3730,
		false,
		'Ative um Feitiço e Envie Monstros para o Cemitério',
		933
	),
	(
		3731,
		false,
		'Banir um número de monstros de sua mão e baralho',
		933
	),
	(
		3732,
		true,
		'Sobreponha pelo menos 2 Monstros do Mesmo Nível',
		933
	),
	(3733, false, 'Baú da comunidade', 934),
	(3734, false, 'Chance', 934),
	(3735, true, 'Empresa Elétrica', 934),
	(3736, false, 'obras de água', 934),
	(3737, false, '1989', 935),
	(3738, true, '1991', 935);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3739, false, '1992', 935),
	(3740, false, '1995', 935),
	(3741, true, 'Ir', 936),
	(3742, false, 'Mahjong', 936),
	(3743, false, 'shogi', 936),
	(3744, false, 'Xadrez', 936),
	(3745, true, '10', 937),
	(3746, false, '5', 937),
	(3747, false, '6', 937),
	(3748, false, '8', 937);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3749, true, 'fezes de touro', 938),
	(3750, false, 'um brinquedo racista', 938),
	(3751, false, 'Uma Expansão de Cartão', 938),
	(3752, false, 'urina de gato', 938),
	(3753, false, 'O Kryptkeeper', 939),
	(3754, false, 'O monstro', 939),
	(3755, false, 'O pesadelo', 939),
	(3756, true, 'O porteiro', 939),
	(3757, true, 'Charlotte Brontë', 940),
	(3758, false, 'Emily Brontë', 940);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3759, false, 'Jane Austen', 940),
	(3760, false, 'Louisa May Alcott', 940),
	(3761, true, 'Grandes Expectativas', 941),
	(3762, false, 'Nicholas Nickleby', 941),
	(3763, false, 'Oliver Twist', 941),
	(3764, false, 'Os Papéis de Pickwick', 941),
	(3765, false, 'A refeição favorita do vilão', 942),
	(
		3766,
		false,
		'A relação que tem com matar os inocentes',
		942
	),
	(
		3767,
		false,
		'A voz de inocentes sendo calada pelos poderosos',
		942
	),
	(
		3768,
		true,
		'O trauma da personagem principal na infância',
		942
	);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3769, false, 'Aldeia', 943),
	(3770, false, 'Garoto Rico e o Idiota', 943),
	(3771, true, 'O príncipe e O Plebeu', 943),
	(
		3772,
		false,
		'Uma História Moderna de Twain',
		943
	),
	(3773, false, 'Catch-22', 944),
	(3774, false, 'De ratos e homens', 944),
	(3775, true, 'O Dia do Gafanhoto', 944),
	(3776, false, 'Uma Paz Separada', 944),
	(3777, false, 'Caos', 945),
	(3778, false, 'Justiça', 945);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3779, false, 'Roubo', 945),
	(3780, true, 'Sombra', 945),
	(
		3781,
		false,
		'Albus James Lunae Otto Dumbledore',
		946
	),
	(
		3782,
		true,
		'Albus Percival Wulfric Brian Dumbledore',
		946
	),
	(
		3783,
		false,
		'Albus Valencium Horatio Kul Dumbledore',
		946
	),
	(
		3784,
		false,
		'Albus Valum Jetta Mobius Dumbledore',
		946
	),
	(3785, true, ' Osteogênese imperfeita', 947),
	(3786, false, 'Adrenoleucodistrofia', 947),
	(3787, false, 'Ataxia espinocerebelar', 947),
	(3788, false, 'Fibrose cística', 947);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3789, false, 'Cristóvão', 948),
	(3790, false, 'Haroldo', 948),
	(3791, false, 'James', 948),
	(3792, true, 'Oswald', 948),
	(3793, false, 'faca', 949),
	(3794, false, 'Otaria', 949),
	(3795, true, 'Sarpádia', 949),
	(3796, false, 'Terisiare', 949),
	(3797, false, 'Aerona', 950),
	(3798, false, 'faca', 950);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3799, false, 'Jamuraa', 950),
	(3800, true, 'Terisiare', 950),
	(3801, false, 'Coelho', 951),
	(3802, false, 'Raposa', 951),
	(3803, false, 'Sapo', 951),
	(3804, true, 'Texugo', 951),
	(3805, false, 'Ambridge', 952),
	(3806, false, 'Barsetshire', 952),
	(3807, false, 'Fulchester', 952),
	(3808, true, 'Wessex', 952);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3809, false, 'Cymbeline', 953),
	(3810, false, 'Medida por Medida', 953),
	(3811, true, 'Prova de Temperança', 953),
	(3812, false, 'Tito Andrônico', 953),
	(3813, true, 'Godric''s Hollow', 954),
	(3814, false, 'Hogsmeade', 954),
	(3815, false, 'Ottery St. Catchpole', 954),
	(3816, false, 'Pequeno Hangleton', 954),
	(3817, true, '1984', 955),
	(3818, false, 'Apanhador e o Centeio', 955);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3819, false, 'Matar a esperança', 955),
	(3820, false, 'O homem velho e o mar', 955),
	(3821, false, 'Aliança da Terra', 956),
	(3822, true, 'INGSOC', 956),
	(3823, false, 'neo-bolchevismo', 956),
	(3824, false, 'Obliteração do Self', 956),
	(
		3825,
		false,
		'Harry Potter e a Pedra Filosofal',
		957
	),
	(3826, false, 'O código Da Vinci', 957),
	(3827, false, 'O pequeno Príncipe', 957),
	(3828, true, 'O senhor dos Anéis', 957);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3829, false, ' o Poseidon', 958),
	(3830, false, 'A Atlântida', 958),
	(3831, true, 'O Nautilus', 958),
	(3832, false, 'O Netuno', 958),
	(3833, false, 'Graham Greene', 959),
	(3834, true, 'Ian Fleming', 959),
	(3835, false, 'John Buchan', 959),
	(3836, false, 'Joseph Conrad', 959),
	(
		3837,
		false,
		' O Estranho Caso do Dr. Jekyll e Mr. Hyde',
		960
	),
	(3838, false, 'A Lenda de Sleepy Hollow', 960);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3839, false, 'Drácula', 960),
	(3840, true, 'Frankenstein', 960),
	(3841, false, 'Espinho', 961),
	(3842, true, 'Fofinho', 961),
	(3843, false, 'Poofy', 961),
	(3844, false, 'Ver', 961),
	(3845, false, 'Herbie Hancock Holmes', 962),
	(3846, false, 'Martin Holmes', 962),
	(3847, false, 'Mederi Holmes', 962),
	(3848, true, 'Mycroft Holmes', 962);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3849, false, 'Frank Potter', 963),
	(3850, false, 'joey potter', 963),
	(3851, false, 'Potter Peludo Sr.', 963),
	(3852, true, 'Tiago Potter', 963),
	(3853, false, 'Fletcher Christian', 964),
	(3854, true, 'Holden Caulfield', 964),
	(3855, false, 'Jay Gatsby', 964),
	(3856, false, 'Randall Flagg', 964),
	(3857, false, 'O signo dos quatro', 965),
	(3858, false, 'Os feitos de Raffles Haw', 965);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3859, false, 'Um Caso de Identidade', 965),
	(3860, true, 'Um Estudo em Escarlate', 965),
	(3861, false, 'Daniel Radcliffe', 966),
	(3862, false, 'J. R. R. Tolkien', 966),
	(3863, true, 'JK Rowling', 966),
	(3864, false, 'Terry Pratchett', 966),
	(3865, false, 'Charles Darwin', 967),
	(3866, true, 'Charles Dickens', 967),
	(3867, false, 'Mark Twain', 967),
	(3868, false, 'Roald Dahl', 967);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3869, false, 'F. Scott Fitzgerald', 968),
	(3870, false, 'Henry Miller', 968),
	(3871, true, 'Hunter S. Thompson', 968),
	(3872, false, 'William S. Burroughs', 968),
	(3873, true, 'John Green', 969),
	(3874, false, 'Stephen Chbosky', 969),
	(3875, false, 'Stephenie Meyer', 969),
	(3876, false, 'Suzanne Collins', 969),
	(3877, true, ' John Steinbeck', 970),
	(3878, false, ' Mark Twain', 970);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3879, false, 'George Orwell', 970),
	(3880, false, 'Harper Lee', 970),
	(3881, false, 'Arthur C Clarke', 971),
	(3882, true, 'Arthur Conan Doyle', 971),
	(3883, false, 'Graham Greene', 971),
	(3884, false, 'HG Wells', 971),
	(3885, true, '42', 972),
	(3886, false, 'Amar todos ao seu redor', 972),
	(3887, false, 'Chocolate', 972),
	(3888, false, 'Morte', 972);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3889, true, 'Amy', 973),
	(3890, false, 'bete', 973),
	(3891, false, 'jo', 973),
	(3892, false, 'Meg', 973),
	(3893, false, 'charneca', 974),
	(3894, true, 'Dinah', 974),
	(3895, false, 'esfumaçado', 974),
	(3896, false, 'Oscar', 974),
	(3897, false, 'A Rosa das Medula', 975),
	(3898, false, 'O Espinho das Medula', 975);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3899, true, 'O Espinho de Camorr', 975),
	(3900, false, 'O Espinho de Emberlain', 975),
	(3901, false, 'Batedor', 976),
	(3902, true, 'Buscador', 976),
	(3903, false, 'Caçador', 976),
	(3904, false, 'Guardador', 976),
	(3905, false, 'Hotel Novotel', 977),
	(3906, true, 'o balmoral', 977),
	(3907, false, 'O Hotel Dunstane', 977),
	(3908, false, 'Sheraton Grand Hotel & Spa', 977);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3909, true, 'Bardo', 978),
	(3910, false, 'Bilbo Bolseiro', 978),
	(3911, false, 'Frodo', 978),
	(3912, false, 'Gandalf, o Cinzento', 978),
	(3913, false, 'A coisa', 979),
	(3914, false, 'Drácula', 979),
	(3915, true, 'monstro de Frankenstein', 979),
	(3916, false, 'O homem invisível', 979),
	(3917, false, 'Dilophosaurus', 980),
	(3918, true, 'Procompsognathus', 980);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3919, false, 'Tiranossauro Rex', 980),
	(3920, false, 'Velociraptor', 980),
	(3921, false, '11', 981),
	(3922, false, '13', 981),
	(3923, false, '5', 981),
	(3924, true, '9', 981),
	(3925, false, 'Bombur', 982),
	(3926, false, 'Dwalin', 982),
	(3927, true, 'gloína', 982),
	(3928, false, 'Thorin Escudo de Carvalho', 982);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3929, false, 'Bata em sequência', 983),
	(
		3930,
		false,
		'Bata ritmicamente nos barris com uma varinha',
		983
	),
	(3931, false, 'Fale uma senha', 983),
	(3932, true, 'Responda a um enigma', 983),
	(3933, true, 'Ray Bradbury', 984),
	(3934, false, 'RL Stine', 984),
	(3935, false, 'Stephen King', 984),
	(3936, false, 'Wolfgang Amadeus Mozart', 984),
	(3937, true, 'Antoine de Saint-Exupéry', 985),
	(3938, false, 'F. Scott Fitzgerald', 985);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3939, false, 'Jane Austen', 985),
	(3940, false, 'Miguel de Cervantes Saavedra', 985),
	(3941, false, 'Alvo', 986),
	(3942, false, 'Fagin', 986),
	(3943, true, 'O trapaceiro astuto', 986),
	(3944, false, 'Sr. Fang', 986),
	(3945, false, 'Aldous Huxley', 987),
	(3946, false, 'Ernest Hemingway', 987),
	(3947, true, 'George Orwell', 987),
	(3948, false, 'Ray Bradbury', 987);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3949, true, 'Ana Karenina', 988),
	(3950, false, 'Crime e punição', 988),
	(3951, false, 'Notas do subterrâneo', 988),
	(3952, false, 'Os Irmãos Karamázov', 988),
	(3953, false, 'A Lenda de Xanth', 989),
	(3954, false, 'A Trilogia de Bartemaeus', 989),
	(3955, false, 'Harry Potter', 989),
	(3956, true, 'Passeio Máximo', 989),
	(3957, false, 'Alfie Deyes', 990),
	(3958, true, 'Joe Sugg', 990);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3959, false, 'joe weller', 990),
	(3960, false, 'Zoe Sugg', 990),
	(3961, false, 'George Bernard Shaw', 991),
	(3962, true, 'George Eliot', 991),
	(3963, false, 'George Orwell', 991),
	(3964, false, 'George Saunders', 991),
	(3965, false, 'advogado desonesto', 992),
	(3966, true, 'Ilha do Caminho', 992),
	(3967, false, 'Montanha Cinzenta', 992),
	(3968, false, 'Os litigantes', 992);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3969, false, '1989 Ford Explorer XLT', 993),
	(3970, false, '1989 Jeep Wrangler YJ Sahar', 993),
	(3971, false, 'Mercedes Classe M', 993),
	(3972, true, 'Toyota Land Cruiser 1989', 993),
	(3973, false, 'A máfia', 994),
	(3974, false, 'os forasteiros', 994),
	(3975, true, 'Os Greasers', 994),
	(3976, false, 'os socs', 994),
	(3977, false, 'Gênese', 995),
	(3978, false, 'Levítico', 995);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3979, true, 'Números', 995),
	(3980, false, 'Êxodo', 995),
	(3981, false, '5', 996),
	(3982, false, '6', 996),
	(3983, true, '7', 996),
	(3984, false, '8', 996),
	(
		3985,
		false,
		'Minha vida como um feiticeiro adolescente',
		997
	),
	(3986, true, 'Os arquivos de Dresden', 997),
	(3987, false, 'Os Pináculos de Cinza', 997),
	(3988, false, 'Um chapéu no tempo', 997);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3989, false, 'Charles Dickens', 998),
	(3990, true, 'Hans Christian Andersen', 998),
	(3991, false, 'Lewis Carroll', 998),
	(3992, false, 'Oscar Wilde', 998),
	(3993, false, 'George Eliot', 999),
	(3994, false, 'George Orwell', 999),
	(3995, true, 'George RR Martin', 999),
	(3996, false, 'Jorge Lucas', 999),
	(3997, true, 'Ira Levin', 1000),
	(3998, false, 'Mary Shelley', 1000);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (3999, false, 'Robert Bloch', 1000),
	(4000, false, 'Stephen King', 1000),
	(4001, false, 'Estados Unidos', 1001),
	(4002, false, 'França', 1001),
	(4003, false, 'Grécia', 1001),
	(4004, true, 'Itália', 1001),
	(4005, false, 'Humanos', 1002),
	(4006, false, 'lulas', 1002),
	(4007, true, 'tritões', 1002),
	(4008, false, 'Tubarões', 1002);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4009, false, 'Javert', 1003),
	(4010, false, 'Jean Claude Van Damme', 1003),
	(4011, true, 'Jean Valjean', 1003),
	(4012, false, 'Marius Pontmercy', 1003),
	(4013, true, '4.48 Psicose', 1004),
	(4014, false, 'A festa de aniversário', 1004),
	(4015, false, 'hamilton', 1004),
	(4016, false, 'Muito barulho por nada', 1004),
	(4017, false, 'Macbeth', 1005),
	(4018, false, 'Otelo', 1005);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4019, false, 'Rei Lear', 1005),
	(4020, true, 'Tito Andrônico', 1005),
	(4021, false, 'hamilton', 1006),
	(4022, false, 'Malvado', 1006),
	(4023, false, 'O Livro de Mórmon', 1006),
	(4024, true, 'os elfos', 1006),
	(4025, false, 'Capuleto', 1007),
	(4026, true, 'Coro', 1007),
	(4027, false, 'Montague', 1007),
	(4028, false, 'Refrão', 1007);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4029, true, ' Et tu, Brute?', 1008),
	(4030, false, 'Aegri somnia vana.', 1008),
	(4031, false, 'Iacta alea est!', 1008),
	(4032, false, 'Vidi, vini, vici.', 1008),
	(4033, false, 'A Megera Domada', 1009),
	(4034, false, 'A tempestade', 1009),
	(4035, true, 'Aldeia', 1009),
	(4036, false, 'Otelo', 1009),
	(4037, false, '18', 1010),
	(4038, false, '25', 1010);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4039, true, '37', 1010),
	(4040, false, '54', 1010),
	(4041, false, 'Anthony Neilson', 1011),
	(4042, false, 'Mateus Lopes', 1011),
	(4043, false, 'Tom Stoppard', 1011),
	(4044, true, 'Tony Kusher', 1011),
	(4045, false, 'Francis Scott Key', 1012),
	(4046, false, 'João Phillips Sousa', 1012),
	(4047, true, 'Lin-Manuel Miranda', 1012),
	(4048, false, 'Steven Sondheim', 1012);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4049, false, 'As moscas', 1013),
	(4050, false, 'O Diabo e o Bom Deus', 1013),
	(4051, false, 'Os Condenados de Altona', 1013),
	(4052, true, 'Sem saída', 1013),
	(4053, true, 'Aldeia', 1014),
	(4054, false, 'décima segunda noite', 1014),
	(4055, false, 'Macbeth', 1014),
	(4056, false, 'Rei Lear', 1014),
	(4057, true, 'Aldeia', 1015),
	(4058, false, 'Macbeth', 1015);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4059, false, 'Otelo', 1015),
	(4060, false, 'Rei Lear', 1015),
	(4061, false, 'André Lloyd Webber', 1016),
	(4062, false, 'Emily Dickenson', 1016),
	(4063, false, 'Robert Frost', 1016),
	(4064, true, 'TS Elliot', 1016),
	(4065, false, 'cem para um', 1017),
	(4066, false, 'Um bilhão para um', 1017),
	(4067, true, 'Um milhão para um', 1017),
	(4068, false, 'Um trilhão para um', 1017);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4069, true, 'Merano', 1018),
	(4070, false, 'Milão', 1018),
	(4071, false, 'Roma', 1018),
	(4072, false, 'Veneza', 1018),
	(4073, false, 'Alemanha', 1019),
	(4074, false, 'EUA', 1019),
	(4075, true, 'França', 1019),
	(4076, false, 'Suécia', 1019),
	(4077, false, 'Essa noite', 1020),
	(4078, false, 'mambo', 1020);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4079, false, 'maria', 1020),
	(4080, true, 'o beco', 1020),
	(4081, false, 'A cor roxa', 1021),
	(4082, true, 'Aluguel', 1021),
	(4083, false, 'idiota americano', 1021),
	(4084, false, 'Novidades', 1021),
	(4085, true, 'Carmen', 1022),
	(4086, false, 'dom rodrigue', 1022),
	(4087, false, 'Grisélidis', 1022),
	(4088, false, 'Les pècheurs de perles', 1022);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4089, false, '1605', 1023),
	(4090, true, '1606', 1023),
	(4091, false, '1628', 1023),
	(4092, false, '1723', 1023),
	(4093, true, 'Alex Lacamoire', 1024),
	(4094, false, 'Leslie Odom Jr.', 1024),
	(4095, false, 'Lin-Manuel Miranda', 1024),
	(4096, false, 'Renee Elise-Goldberry', 1024),
	(4097, false, 'Morte de um bacharel', 1025),
	(
		4098,
		true,
		'Muito estranho para viver, muito raro para morrer!',
		1025
	);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (
		4099,
		false,
		'Uma febre que você não pode suar',
		1025
	),
	(4100, false, 'Vícios & Virtudes', 1025),
	(4101, true, 'Birmingham', 1026),
	(4102, false, 'Londres', 1026),
	(4103, false, 'Manchester', 1026),
	(4104, false, 'Newcastle-Upon-Tyne', 1026),
	(4105, false, 'Bumbo', 1027),
	(4106, true, 'Caixa', 1027),
	(4107, false, 'Maraca', 1027),
	(4108, false, 'sino de vaca', 1027);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4109, false, '0', 1028),
	(4110, false, '3', 1028),
	(4111, true, '5', 1028),
	(4112, false, '7', 1028),
	(4113, false, 'Chá gelado', 1029),
	(4114, true, 'coolio', 1029),
	(4115, false, 'Dr. Dre', 1029),
	(4116, false, 'Snoop Dogg', 1029),
	(4117, true, 'Deftones', 1030),
	(4118, false, 'Ferramenta', 1030);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4119, false, 'Korn', 1030),
	(4120, false, 'Tipo o negativo', 1030),
	(
		4121,
		false,
		'Antes que o Amanhecer nos Cure',
		1031
	),
	(4122, false, 'Porcaria', 1031),
	(4123, true, 'Se apresse, estamos sonhando', 1031),
	(4124, false, 'Sábados = Juventude', 1031),
	(4125, false, 'Abbey Road', 1032),
	(4126, false, 'Ajuda!', 1032),
	(4127, false, 'Alma de Borracha', 1032),
	(4128, true, 'Revólver', 1032);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4129, false, '1973', 1033),
	(4130, false, '1980', 1033),
	(4131, true, '1985', 1033),
	(4132, false, '1991', 1033),
	(4133, true, '2011', 1034),
	(4134, false, '2012', 1034),
	(4135, false, '2013', 1034),
	(4136, false, '2014', 1034),
	(4137, false, '1992', 1035),
	(4138, true, '1993', 1035);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4139, false, '1994', 1035),
	(4140, false, '1995', 1035),
	(4141, false, 'Abbey Road', 1036),
	(4142, false, 'Led Zeppelin IV', 1036),
	(
		4143,
		false,
		'Sons de animais de estimação',
		1036
	),
	(
		4144,
		true,
		'The Velvet Underground e Nico',
		1036
	),
	(
		4145,
		false,
		'"Então cante sua música até chegar em casa"',
		1037
	),
	(
		4146,
		false,
		'"Então comece um fogo em sua pedra fria"',
		1037
	),
	(
		4147,
		false,
		'"Então deixe-os saber que estão por conta própria"',
		1037
	),
	(
		4148,
		true,
		'"Então derreta suas dores de cabeça, chame de lar"',
		1037
	);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4149, false, 'Granada', 1038),
	(4150, false, 'Haiti', 1038),
	(4151, false, 'Santa Lúcia', 1038),
	(4152, true, 'Trindade e Tobago', 1038),
	(4153, true, 'David Gilmour', 1039),
	(4154, false, 'Eric Clapton', 1039),
	(4155, false, 'Jimmy Page', 1039),
	(4156, false, 'Mark Knopfler', 1039),
	(4157, false, '13 de março de 2018', 1040),
	(4158, false, '21 de fevereiro de 2018', 1040);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4159, true, '22 de junho de 2018', 1040),
	(4160, false, '9 de maio de 2018', 1040),
	(4161, false, 'cabeça de rádio', 1041),
	(4162, false, 'Correr', 1041),
	(4163, false, 'Pedras rolantes', 1041),
	(4164, true, 'U2', 1041),
	(4165, false, 'David Bowie - "1984"', 1042),
	(4166, false, 'James Blunt - "1973"', 1042),
	(
		4167,
		true,
		'O Esmagador de Abóboras - "1979"',
		1042
	),
	(4168, false, 'Príncipe - "1999"', 1042);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4169, true, 'Céus em Chamas - AC/DC', 1043),
	(
		4170,
		false,
		'Fortunate Son - Creedence Clearwater Revival',
		1043
	),
	(
		4171,
		false,
		'Heathens - Twenty One Pilots',
		1043
	),
	(4172, false, 'Sem mim - Eminem', 1043),
	(4173, false, 'Danny Brown', 1044),
	(4174, false, 'Pusha T', 1044),
	(4175, true, 'Snoop Dogg', 1044),
	(4176, false, 'Vince Staples', 1044),
	(4177, false, 'Dash Berlim', 1045),
	(4178, true, 'Skrillex', 1045);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4179, false, 'Slushii', 1045),
	(4180, false, 'Tiésto', 1045),
	(4181, false, 'Bradley Strider', 1046),
	(4182, true, 'Enterro', 1046),
	(4183, false, 'GAK', 1046),
	(4184, false, 'Janela cáustica', 1046),
	(4185, true, 'Deixado sozinho', 1047),
	(4186, false, 'E nós', 1047),
	(
		4187,
		false,
		'Esta música não é sobre uma garota',
		1047
	),
	(4188, false, 'Largar o jogo', 1047);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4189, true, 'Filme de ação', 1048),
	(4190, false, 'Fora da parede', 1048),
	(4191, false, 'Perigoso', 1048),
	(4192, false, 'Ruim', 1048),
	(4193, true, 'Aardman Animations', 1049),
	(
		4194,
		false,
		'entretenimento de iluminação',
		1049
	),
	(4195, false, 'HIT Entretenimento', 1049),
	(4196, false, 'Mídia VIZ', 1049),
	(4197, false, 'As fantasias finais', 1050),
	(4198, false, 'Os Espers', 1050);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4199, false, 'Os invocadores de rocha', 1050),
	(4200, true, 'Os Magos Negros', 1050),
	(4201, false, 'Brian Jones', 1051),
	(4202, false, 'Jimi Hendrix', 1051),
	(4203, true, 'Viktor Tsoi', 1051),
	(4204, false, 'Vladimir Vysotsky', 1051),
	(4205, true, 'bêbados', 1052),
	(4206, false, 'Lambedor de janela', 1052),
	(
		4207,
		false,
		'Obras ambientais coletadas 85-92',
		1052
	),
	(4208, false, 'Siro', 1052);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (
		4209,
		true,
		'Adeus estrada de tijolos amarelos',
		1053
	),
	(4210, false, 'Bennie e os Jatos', 1053),
	(4211, false, 'Homem foguete', 1053),
	(4212, false, 'rocha do crocodilo', 1053),
	(4213, false, 'Baria Qureshi', 1054),
	(4214, true, 'Jamie xx', 1054),
	(4215, false, 'Oliver Sim', 1054),
	(4216, false, 'Romy Madley Croft', 1054),
	(
		4217,
		false,
		'"E eu gostei da covinha no seu queixo / Seus olhos azuis claros"',
		1055
	),
	(
		4218,
		true,
		'"Um lituano chuvoso / Está dançando como um indiano"',
		1055
	);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (
		4219,
		false,
		'"Você costumava ser tão caloroso e afetuoso... mas agora você se arrepende rapidamente"',
		1055
	),
	(
		4220,
		false,
		'"Voe para longe, meu zéfiro / Eu sinto isso mais do que nunca"',
		1055
	),
	(4221, false, 'Convés de Inspeção', 1056),
	(4222, false, 'GZA', 1056),
	(4223, false, 'Homem metódico', 1056),
	(4224, true, 'Masta Killa', 1056),
	(4225, false, 'Destaques', 1057),
	(4226, true, 'Famoso', 1057),
	(4227, false, 'Feixe ultraleve', 1057),
	(4228, false, 'Lobos', 1057);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4229, false, 'A loja de dinheiro', 1058),
	(4230, false, 'Os poderes que B', 1058),
	(4231, false, 'poço sem fundo', 1058),
	(4232, true, 'Sem Amor Deep Web', 1058),
	(4233, false, 'Fique (perdendo tempo)', 1059),
	(4234, false, 'Não beba a água', 1059),
	(4235, true, 'Pantala Naga Pampa', 1059),
	(4236, false, 'Rapunzel', 1059),
	(4237, false, 'Anika Moa', 1060),
	(4238, false, 'Kesha', 1060);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4239, true, 'Ladyhawke', 1060),
	(4240, false, 'Senhor', 1060),
	(4241, false, '&&&&&&', 1061),
	(4242, true, 'Entrañas', 1061),
	(4243, false, 'Ovelha', 1061),
	(4244, false, 'xen', 1061),
	(4245, true, 'A revolução', 1062),
	(4246, false, 'Os Destruidores de Corações', 1062),
	(4247, false, 'Os mendigos', 1062),
	(4248, false, 'Os Wailers', 1062);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4249, false, 'Demisemicolcheia', 1063),
	(4250, true, 'Hemidemisemicolcheia', 1063),
	(4251, false, 'Semicolcheia', 1063),
	(4252, false, 'Semihemidemisemicolcheia', 1063),
	(
		4253,
		false,
		'Está tudo na sua cabeça 420 / Entenda',
		1064
	),
	(
		4254,
		false,
		'Faça sua jogada 420 / Minha mente',
		1064
	),
	(
		4255,
		false,
		'Fumar maconha 420 / todos os dias',
		1064
	),
	(
		4256,
		true,
		'Lisa Frank 420 / Computação Moderna',
		1064
	),
	(4257, false, '11 de julho de 1992', 1065),
	(4258, false, '14 de fevereiro de 1993', 1065);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4259, false, '21 de outubro de 1994', 1065),
	(4260, true, '26 de março de 1995', 1065),
	(4261, false, '3', 1066),
	(4262, false, '48', 1066),
	(4263, false, '6', 1066),
	(4264, true, '9', 1066),
	(4265, false, 'Febre Noturna', 1067),
	(4266, false, 'Mantendo-se vivo', 1067),
	(4267, true, 'Tragédia', 1067),
	(4268, false, 'Você deveria estar dançando', 1067);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4269, false, 'Ben Leven', 1068),
	(4270, false, 'Ian Jones Quartey', 1068),
	(4271, false, 'Matt Burnett', 1068),
	(4272, true, 'Rebeca Açúcar', 1068),
	(4273, true, 'AlunaGeorge', 1069),
	(4274, false, 'DJ Cobra', 1069),
	(4275, false, 'Major Lazer', 1069),
	(4276, false, 'Steve Aoki', 1069),
	(4277, false, 'Pete Best', 1070),
	(4278, false, 'Ringo Starr', 1070);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4279, false, 'Stuart Sutcliffe', 1070),
	(4280, true, 'Tommy Moore', 1070),
	(4281, false, 'Andy Rourke', 1071),
	(4282, true, 'Martin Chambers', 1071),
	(4283, false, 'Mike Joyce', 1071),
	(4284, false, 'Morrissey', 1071),
	(4285, false, ' Ana Yvette', 1072),
	(4286, false, 'Danyka Nadeau', 1072),
	(4287, true, 'Laura Brehm', 1072),
	(4288, false, 'Veela', 1072);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4289, false, 'fandango', 1073),
	(4290, true, 'O piadista', 1073),
	(4291, false, 'Pegue o dinheiro e corra', 1073),
	(4292, false, 'Voar como uma águia', 1073),
	(4293, true, 'Aqua', 1074),
	(4294, false, 'Eiffel 65', 1074),
	(4295, false, 'Faixa!', 1074),
	(4296, false, 'Vengaboys', 1074),
	(4297, false, ' Bruce Willis', 1075),
	(4298, false, 'Alec Baldwin', 1075);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4299, false, 'Dwayne Johnson', 1075),
	(4300, true, 'Jamie Foxx', 1075),
	(4301, true, 'Nokia Tune', 1076),
	(
		4302,
		false,
		'Olá Moto [Motorola Ringtone]',
		1076
	),
	(4303, false, 'Toque da Microsoft', 1076),
	(4304, false, 'Toque Droid', 1076),
	(4305, false, ' Justin Bieber', 1077),
	(4306, false, 'Kory Lefkowits', 1077),
	(4307, true, 'Leonard Cohen', 1077),
	(4308, false, 'Ryan Letourneau', 1077);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4309, false, 'Frosty, o boneco de neve', 1078),
	(4310, false, 'Lá vem Papai Noel', 1078),
	(4311, true, 'Natal branco', 1078),
	(
		4312,
		false,
		'Rudolph, a rena do nariz vermelho',
		1078
	),
	(4313, false, 'anos 30', 1079),
	(4314, false, 'anos 40', 1079),
	(4315, false, 'anos 50', 1079),
	(4316, true, 'anos 60', 1079),
	(4317, false, '1998', 1080),
	(4318, true, '1999', 1080);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4319, false, '2000', 1080),
	(4320, false, '2001', 1080),
	(4321, true, 'Daft Punk', 1081),
	(4322, false, 'deadmau5', 1081),
	(4323, false, 'Divulgação', 1081),
	(4324, false, 'DJ Sombra', 1081),
	(4325, false, 'calgary', 1082),
	(4326, false, 'Ottawa', 1082),
	(4327, true, 'Toronto', 1082),
	(4328, false, 'Vancouver', 1082);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4329, true, 'Alemanha', 1083),
	(4330, false, 'Armênia', 1083),
	(4331, false, 'Bélgica', 1083),
	(4332, false, 'Áustria', 1083),
	(4333, false, '2011', 1084),
	(4334, false, '2013', 1084),
	(4335, false, '2017', 1084),
	(4336, true, '2018', 1084),
	(4337, false, 'Beck', 1085),
	(4338, false, 'Beyoncé', 1085);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4339, false, 'MF DOOM', 1085),
	(4340, true, 'Taylor Swift', 1085),
	(4341, false, 'Dave', 1086),
	(4342, false, 'Fernando', 1086),
	(4343, true, 'Fígaro', 1086),
	(4344, false, 'Ângelo', 1086),
	(4345, false, 'Duduk', 1087),
	(4346, false, 'Oboé', 1087),
	(4347, false, 'Trombone', 1087),
	(4348, true, 'Viola', 1087);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4349, true, 'CA/CC', 1088),
	(4350, false, 'Dama de Ferro', 1088),
	(4351, false, 'Metallica', 1088),
	(4352, false, 'Sábado Negro', 1088),
	(4353, true, 'baauer', 1089),
	(4354, false, 'Flosstradamus', 1089),
	(4355, false, 'NGHTMRE', 1089),
	(4356, false, 'RL Grime', 1089),
	(4357, false, 'Dia Verde', 1090),
	(4358, false, 'Foo Fighters', 1090);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4359, false, 'Linkin Park', 1090),
	(4360, true, 'pimenta malagueta vermelha', 1090),
	(4361, true, 'A cura', 1091),
	(4362, false, 'Eco e os Coelhinhos', 1091),
	(4363, false, 'Nova ordem', 1091),
	(4364, false, 'Os Smiths', 1091),
	(4365, false, 'A polícia', 1092),
	(4366, false, 'Jogo frio', 1092),
	(4367, true, 'loira', 1092),
	(4368, false, 'Paramore', 1092);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4369, false, 'A cura', 1093),
	(4370, false, 'Depeche Mode', 1093),
	(4371, true, 'Duran Duran', 1093),
	(4372, false, 'Nova ordem', 1093),
	(4373, false, 'Ellie Goulding', 1094),
	(4374, true, 'Justin Bieber', 1094),
	(4375, false, 'O fim de semana', 1094),
	(4376, false, 'Selena Gomez', 1094),
	(4377, false, 'colapso do século 21', 1095),
	(4378, false, 'infinito nas alturas', 1095);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4379, true, 'Por Sangue e Império', 1095),
	(
		4380,
		false,
		'Sem almofadas, sem capacetes... Apenas bolas',
		1095
	),
	(
		4381,
		false,
		'Acho que é por isso que chamam de blues',
		1096
	),
	(4382, false, 'Garota da Ilha', 1096),
	(4383, false, 'Sua música', 1096),
	(4384, true, 'velas ao vento', 1096),
	(
		4385,
		false,
		'Monstros Assustadores e Bons Sprites',
		1097
	),
	(4386, true, 'Recreio', 1097),
	(
		4387,
		false,
		'Rock N Roll (Levará Você para a Montanha)',
		1097
	),
	(
		4388,
		false,
		'Tudo é justo no amor e Brostep',
		1097
	);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4389, true, 'Cesto', 1098),
	(4390, false, 'Dr. Heckyll e Sr. Jive', 1098),
	(4391, false, 'Quem poderia ser agora?', 1098),
	(4392, false, 'Seja Bom Johnny', 1098),
	(4393, true, '12', 1099),
	(4394, false, '19', 1099),
	(4395, false, '21', 1099),
	(4396, false, '25', 1099),
	(4397, false, 'Gritar', 1100),
	(4400, false, 'grito', 1100);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4401, false, 'animais', 1101),
	(4402, true, 'Imagens em movimento', 1101),
	(4403, false, 'O Lado Escuro da Lua', 1101),
	(
		4404,
		false,
		'Queria que você estivesse aqui',
		1101
	),
	(4405, false, 'Borgonha', 1102),
	(4406, true, 'Loiro', 1102),
	(4407, false, 'Morena', 1102),
	(4408, false, 'Preto', 1102),
	(4409, false, 'Estilos de Harry', 1103),
	(4410, false, 'Gary Barlow', 1103);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4411, false, 'Justin Timberlake', 1103),
	(4412, true, 'Robbie Williams', 1103),
	(4413, false, 'Descoberta', 1104),
	(4414, false, 'Humano Apesar de tudo', 1104),
	(
		4415,
		false,
		'Memórias de acesso aleatório',
		1104
	),
	(4416, true, 'Trabalho de casa', 1104),
	(4417, false, 'A batalha de Los Angeles', 1105),
	(4418, false, 'Bombtrack', 1105),
	(4419, false, 'Império do mal', 1105),
	(4420, true, 'Raiva contra a máquina', 1105);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4421, true, 'Adele, 25', 1106),
	(4422, false, 'Fetty Wap, Fetty Wap', 1106),
	(4423, false, 'Justin Bieber, propósito', 1106),
	(4424, false, 'Taylor Swift, 1989', 1106),
	(4425, false, 'Beastie Boys', 1107),
	(4426, false, 'Clã Wu-Tang', 1107),
	(4427, true, 'NWA', 1107),
	(4428, false, 'Run-DMC', 1107),
	(4429, true, 'Eric Clapton', 1108),
	(4430, false, 'Jeff Beck', 1108);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4431, false, 'Jimmy Page', 1108),
	(4432, false, 'Mark Knopfler', 1108),
	(4433, false, 'Fazendo isso certo', 1109),
	(4434, false, 'O jogo do amor', 1109),
	(4435, false, 'Paixoneta instantânea', 1109),
	(4436, true, 'Ter sorte', 1109),
	(4437, false, 'Chuva', 1110),
	(4438, false, 'granizo', 1110),
	(4439, true, 'Neve', 1110),
	(4440, false, 'Saudação', 1110);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4441, false, 'Bela', 1111),
	(4442, false, 'Branca de Neve', 1111),
	(4443, true, 'Cinderela', 1111),
	(4444, false, 'Pocahontas', 1111),
	(4445, true, '2 Chainz', 1112),
	(4446, false, 'Fatman Scoop', 1112),
	(4447, false, 'Futuro', 1112),
	(4448, false, 'Kendrick Lamar', 1112),
	(4449, false, 'LIRIK', 1113),
	(4450, true, 'molho de vinho', 1113);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4451, false, 'Sodapoppin', 1113),
	(4452, false, 'The8BitDrummer', 1113),
	(4453, true, '22, Um Milhão', 1114),
	(4454, false, 'banco de sangue EP', 1114),
	(4455, false, 'Bom Iver, Bom Iver', 1114),
	(
		4456,
		false,
		'Para Emma, Para Sempre Atrás',
		1114
	),
	(4457, false, 'Casas do Sagrado', 1115),
	(4458, false, 'Grafite Físico', 1115),
	(4459, false, 'Led Zeppelin III', 1115),
	(4460, true, 'Led Zeppelin IV', 1115);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4461, true, 'Deixa para lá', 1116),
	(4462, false, 'incesticídio', 1116),
	(4463, false, 'No utero', 1116),
	(4464, false, 'Água sanitária', 1116),
	(4465, false, 'Abbey Road', 1117),
	(4466, false, 'Alma de Borracha', 1117),
	(4467, false, 'Passeio Mágico Misterioso', 1117),
	(4468, true, 'The Beatles (Álbum Branco)', 1117),
	(4469, true, 'Cleópatra', 1118),
	(4470, false, 'Faixas do sótão', 1118);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4471, false, 'Inverno', 1118),
	(4472, false, 'Os Lumineers', 1118),
	(4473, false, 'AIA', 1119),
	(4474, false, 'CIA', 1119),
	(4475, false, 'KIA', 1119),
	(4476, true, 'MIA', 1119),
	(4477, false, 'Kyary Pamyu Pamyu', 1120),
	(4478, true, 'Kyoko Ito', 1120),
	(4479, false, 'LiSA', 1120),
	(4480, false, 'Yoko Ono', 1120);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4481, true, 'Dave Mustaine', 1121),
	(4482, false, 'James Hetfield', 1121),
	(4483, false, 'Rob Halford', 1121),
	(4484, false, 'Vince Neil', 1121),
	(4485, false, '4', 1122),
	(4486, false, 'III', 1122),
	(4487, true, 'V', 1122),
	(4488, false, 'x', 1122),
	(4489, false, 'Abbey Road', 1123),
	(4490, false, 'de volta em preto', 1123);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4491, true, 'Filme de ação', 1123),
	(4492, false, 'O Lado Escuro da Lua', 1123),
	(4493, false, '2011', 1124),
	(4494, true, '2012', 1124),
	(4495, false, '2013', 1124),
	(4496, false, '2014', 1124),
	(4497, true, '4', 1125),
	(4498, false, '5', 1125),
	(4499, false, '6', 1125),
	(4500, false, '8', 1125);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4501, false, 'Cinco', 1126),
	(4502, false, 'Dois', 1126),
	(4503, false, 'quatro', 1126),
	(4504, true, 'Três', 1126),
	(4505, false, '1', 1127),
	(4506, false, '2', 1127),
	(4507, true, '4', 1127),
	(4508, false, '5', 1127),
	(4509, true, 'assistir o trono', 1128),
	(4510, false, 'Negócios inacabados', 1128);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4511, false, 'Parentes distantes', 1128),
	(4512, false, 'Que Hora de Estar Vivo', 1128),
	(4513, false, 'Avicii', 1129),
	(4514, false, 'Estilos de Harry', 1129),
	(4515, true, 'Mike Posner', 1129),
	(4516, false, 'Robbie Williams', 1129),
	(4517, true, 'Carl Douglas', 1130),
	(4518, false, 'Kool e a turma', 1130),
	(4519, false, 'onda de calor', 1130),
	(4520, false, 'Os Bee Gees', 1130);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4521, false, 'Camafeu', 1131),
	(4522, false, 'Michael Jackson', 1131),
	(4523, true, 'Principe', 1131),
	(4524, false, 'Rick James', 1131),
	(4525, false, 'Dan de aço', 1132),
	(4526, false, 'Estrangeiro', 1132),
	(4527, false, 'Jornada', 1132),
	(4528, true, 'Totó', 1132),
	(4529, false, 'Gerard Way', 1133),
	(4530, true, 'Jared Leto', 1133);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4531, false, 'Mateus Bellamy', 1133),
	(4532, false, 'Mike Shinoda', 1133),
	(4533, true, 'Chris Martin', 1134),
	(4534, false, 'Guy Berryman', 1134),
	(4535, false, 'Jonny Buckland', 1134),
	(4536, false, 'será campeão', 1134),
	(4537, false, 'Chris Connelly', 1135),
	(4538, false, 'Chris Isaak', 1135),
	(4539, true, 'Chris Martin', 1135),
	(4540, false, 'Chris Wallace', 1135);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4541, true, 'Alex Turner', 1136),
	(4542, false, 'Jamie Cook', 1136),
	(4543, false, 'Matt Helders', 1136),
	(4544, false, 'Nick O''Malley', 1136),
	(4545, false, 'Chapeuzinho Vermelho', 1137),
	(4546, true, 'Dave Grohl', 1137),
	(4547, false, 'Dave Mustaine', 1137),
	(4548, false, 'James Hetfield', 1137),
	(4549, true, 'Eddie Vedder', 1138),
	(4550, false, 'Gossard de pedra', 1138);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4551, false, 'Kurt Cobain', 1138),
	(4552, false, 'Ozzy Osbourne', 1138),
	(4553, false, 'Bebe um pouco de água', 1139),
	(4554, false, 'Mergulhe nu', 1139),
	(4555, true, 'Tire todas as suas roupas', 1139),
	(4556, false, 'Tome um banho frio', 1139),
	(4557, true, 'Baixo', 1140),
	(4558, false, 'Bateria', 1140),
	(4559, false, 'Guitarra', 1140),
	(4560, false, 'teclados', 1140);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4561, true, 'Atlanta', 1141),
	(4562, false, 'Augusta', 1141),
	(4563, false, 'marieta', 1141),
	(4564, false, 'Savana', 1141),
	(4565, false, 'Avicii', 1142),
	(4566, true, 'Glitch Mob', 1142),
	(4567, false, 'Pavilhão Fluxo', 1142),
	(4568, false, 'XXYYXX', 1142),
	(4569, false, 'Adele', 1143),
	(4570, false, 'Billy joel', 1143);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4571, true, 'Bob Dylan', 1143),
	(4572, false, 'elvis', 1143),
	(4573, false, 'Ghostface Killah', 1144),
	(4574, true, 'GZA', 1144),
	(4575, false, 'Raekwon o Chef', 1144),
	(4576, false, 'Velho Bastardo Sujo', 1144),
	(4577, false, 'As pulseiras', 1145),
	(4578, false, 'O Oceano Azul', 1145),
	(4579, true, 'Os Connells', 1145),
	(4580, false, 'REM', 1145);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4581, false, 'Gritos de críquete', 1146),
	(4582, false, 'peidos', 1146),
	(4583, false, 'Pessoas conversando', 1146),
	(4584, true, 'Silêncio', 1146),
	(4585, true, 'Baba O''Riley', 1147),
	(
		4586,
		false,
		'Não Vou Ser Enganado Novamente',
		1147
	),
	(4587, false, 'O Buscador', 1147),
	(4588, false, 'Pinball Wizard', 1147),
	(4589, false, 'Austrália', 1148),
	(4590, true, 'Canadá', 1148);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4591, false, 'Estados Unidos', 1148),
	(4592, false, 'Reino Unido', 1148),
	(4593, false, 'chinês', 1149),
	(4594, false, 'finlandês', 1149),
	(4595, false, 'húngaro', 1149),
	(4596, true, 'sueco', 1149),
	(4597, false, 'A corrente', 1150),
	(4598, false, 'Febre Noturna', 1150),
	(
		4599,
		true,
		'Gimmie! Gimmie! Me dê! (Um homem depois da meia-noite)',
		1150
	),
	(4600, false, 'Permanecendo vivo', 1150);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4601, false, 'A Banda da Rua Smith', 1151),
	(4602, false, 'os anos maravilhosos', 1151),
	(4603, true, 'Os Fundos da Frente', 1151),
	(4604, false, 'Vinte e um pilotos', 1151),
	(4605, false, 'A parede', 1152),
	(4606, true, 'animais', 1152),
	(4607, false, 'O corte final', 1152),
	(
		4608,
		false,
		'Queria que você estivesse aqui',
		1152
	),
	(4609, false, 'Amarelo Especial', 1153),
	(4610, false, 'Especial Azul', 1153);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4611, false, 'Especial Verde', 1153),
	(4612, true, 'vermelho especial', 1153),
	(4613, false, 'Ben 10 Força Alienígena', 1154),
	(4614, true, 'biônico', 1154),
	(4615, false, 'Fábrica de heróis', 1154),
	(4616, false, 'Guerra das Estrelas', 1154),
	(4617, false, 'Elvis Presley', 1155),
	(4618, false, 'Michael Jackson', 1155),
	(4619, true, 'Os Beatles', 1155),
	(4620, false, 'Pink Floyd', 1155);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4621, true, 'Eleanor Rigby', 1156),
	(4622, false, 'Lady Madonna', 1156),
	(4623, false, 'Loretta Martin', 1156),
	(4624, false, 'Molly Jones', 1156),
	(4625, false, 'Aldershot', 1157),
	(4626, false, 'Bagshot', 1157),
	(4627, true, 'camberley', 1157),
	(4628, false, 'Guildford', 1157),
	(4629, false, 'Atlanta', 1158),
	(4630, false, 'Detroit', 1158);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4631, true, 'Miami', 1158),
	(4632, false, 'Nova Iorque', 1158),
	(4633, false, 'A queda', 1159),
	(4634, false, 'dias demoníacos', 1159),
	(4635, false, 'Humanz', 1159),
	(4636, true, 'praia de plastico', 1159),
	(4637, false, 'América', 1160),
	(4638, false, 'Canadá', 1160),
	(4639, false, 'Inglaterra', 1160),
	(4640, true, 'País de Gales', 1160);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4641, false, 'China', 1161),
	(4642, false, 'Coreia do Sul', 1161),
	(4643, true, 'Japão', 1161),
	(4644, false, 'Vietnã', 1161),
	(4645, false, 'Alemanha', 1162),
	(4646, false, 'Estados Unidos', 1162),
	(4647, false, 'Finlândia', 1162),
	(4648, true, 'Suécia', 1162),
	(4649, false, 'Dinamarca', 1163),
	(4650, false, 'Finlândia', 1163);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4651, false, 'Noruega', 1163),
	(4652, true, 'Suécia', 1163),
	(4653, false, 'Alemanha', 1164),
	(4654, false, 'França', 1164),
	(4655, true, 'Itália', 1164),
	(4656, false, 'Áustria', 1164),
	(4657, false, 'verdadeiro guerreiro', 1165),
	(4658, false, 'Verdadeiro Kung Fury', 1165),
	(4659, false, 'Verdadeiro lutador', 1165),
	(4660, true, 'Verdadeiro Sobrevivente', 1165);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4661, true, 'Bob Dylan', 1166),
	(4662, false, 'Brian Epstein', 1166),
	(4663, false, 'Jerry Garcia', 1166),
	(4664, false, 'Jim Morrison', 1166),
	(4665, true, 'admirável mundo novo', 1167),
	(4666, false, 'Dança da morte', 1167),
	(4667, false, 'Em algum lugar no tempo', 1167),
	(
		4668,
		false,
		'Uma questão de vida ou morte',
		1167
	),
	(4669, false, '2000', 1168),
	(4670, false, '2004', 1168);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4671, true, '2008', 1168),
	(4672, false, '2015', 1168),
	(4673, false, '1992', 1169),
	(4674, false, '1997', 1169),
	(4675, true, '1999', 1169),
	(4676, false, '2000', 1169),
	(4677, false, '1979', 1170),
	(4678, false, '1983', 1170),
	(4679, true, '1986', 1170),
	(4680, false, '1987', 1170);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4681, true, 'Ferir', 1171),
	(4682, false, 'Grande homem com uma arma', 1171),
	(4683, false, 'Mais perto', 1171),
	(4684, false, 'Um Lugar Quente', 1171),
	(4685, false, 'Cogumelo infectado', 1172),
	(4686, false, 'O Método do Cristal', 1172),
	(4687, true, 'O prodígio', 1172),
	(4688, false, 'Os irmãos químicos', 1172),
	(4689, false, 'George Harrison', 1173),
	(4690, false, 'John Lennon', 1173);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4691, true, 'Paul McCartney', 1173),
	(4692, false, 'Ringo Starr', 1173),
	(4693, false, 'Chuck Norris', 1174),
	(4694, false, 'Godzilla', 1174),
	(4695, false, 'homem Morcego', 1174),
	(4696, true, 'Sr. Rogers', 1174),
	(4697, false, '12', 1175),
	(4698, false, '24', 1175),
	(4699, true, '88', 1175),
	(4700, false, '96', 1175);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4701, false, 'dedo médio direito', 1176),
	(4702, false, 'Nariz', 1176),
	(4703, true, 'Olho esquerdo', 1176),
	(4704, false, 'Orelha direita', 1176),
	(4705, false, '1985', 1177),
	(4706, false, '1986', 1177),
	(4707, true, '1987', 1177),
	(4708, false, '1988', 1177),
	(4709, true, 'Igreja', 1178),
	(4710, false, 'Mesquita', 1178);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4711, false, 'Sinagoga', 1178),
	(4712, false, 'têmpora', 1178),
	(4713, false, 'dias felizes', 1179),
	(4714, false, 'idílico', 1179),
	(4715, true, 'luzes', 1179),
	(4716, false, 'Luzes brilhantes', 1179),
	(4717, false, 'Amarelo', 1180),
	(4718, false, 'Azul', 1180),
	(4719, true, 'Branco', 1180),
	(4720, false, 'Preto', 1180);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4721, false, 'Bem vindo à máquina', 1181),
	(4722, true, 'Brilhe em seu diamante louco', 1181),
	(4723, false, 'fumar um charuto', 1181),
	(
		4724,
		false,
		'Queria que você estivesse aqui',
		1181
	),
	(4725, false, 'DVBBS', 1182),
	(4726, false, 'KRN', 1182),
	(4727, false, 'LOUDPVCK', 1182),
	(4728, true, 'NGHTMRE', 1182),
	(4729, false, 'Charli XCX', 1183),
	(4730, false, 'Kanye West', 1183);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4731, true, 'Senhor', 1183),
	(4732, false, 'Tove Lo', 1183),
	(4733, false, 'A WHO', 1184),
	(4734, false, 'As pedras rolantes', 1184),
	(
		4735,
		true,
		'Orquestra de luz elétrica de Jeff Lynne',
		1184
	),
	(4736, false, 'Pink Floyd', 1184),
	(4737, false, ' Daft Punk', 1185),
	(4738, false, 'David Guetta', 1185),
	(4739, false, 'Divulgação', 1185),
	(4740, true, 'Feito em', 1185);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4741, true, 'cabeça de rádio', 1186),
	(4742, false, 'Jogo frio', 1186),
	(4743, false, 'Nirvana', 1186),
	(4744, false, 'REM', 1186),
	(4745, true, 'cabeça de rádio', 1187),
	(4746, false, 'Jogo frio', 1187),
	(4747, false, 'Nirvana', 1187),
	(4748, false, 'U2', 1187),
	(4749, true, 'Def Leppard', 1188),
	(4750, false, 'Estrangeiro', 1188);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4751, false, 'Lynyrd Skynyrd', 1188),
	(4752, false, 'Os Beatles', 1188),
	(4753, false, 'As garotas da capa', 1189),
	(4754, false, 'DeBarge', 1189),
	(4755, false, 'Os Jacksons', 1189),
	(4756, true, 'os jatos', 1189),
	(4757, false, 'Franz Ferdinand', 1190),
	(4758, false, 'Fénix', 1190),
	(4759, true, 'MGMT', 1190),
	(4760, false, 'Poço da Paixão', 1190);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4761, true, 'Foo Fighters', 1191),
	(4762, false, 'Jogo frio', 1191),
	(4763, false, 'Nickelback', 1191),
	(4764, false, 'Os Lábios Flamejantes', 1191),
	(4765, false, 'América', 1192),
	(4766, false, 'Chicago', 1192),
	(4767, true, 'Pão', 1192),
	(4768, false, 'Smokie', 1192),
	(4769, false, 'John', 1193),
	(4770, false, 'Jorge', 1193);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4771, true, 'Paulo', 1193),
	(4772, false, 'Ringo', 1193),
	(4773, true, 'John', 1194),
	(4774, false, 'Jorge', 1194),
	(4775, false, 'Paulo', 1194),
	(4776, false, 'Ringo', 1194),
	(4777, true, 'Aloe Blacc', 1195),
	(4778, false, 'Cee Lo Green', 1195),
	(4779, false, 'João Lenda', 1195),
	(4780, false, 'Pharrell Williams', 1195);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4781, false, 'Londres chamando', 1196),
	(4782, false, 'O Lado Escuro da Lua', 1196),
	(4783, true, 'Prazeres Desconhecidos', 1196),
	(
		4784,
		false,
		'The Velvet Underground & Nico',
		1196
	),
	(4785, false, 'Berlim', 1197),
	(4786, false, 'Bruxelas', 1197),
	(4787, false, 'Paris', 1197),
	(4788, true, 'Viena', 1197),
	(4789, false, 'Apocalyptica', 1198),
	(4790, false, 'Lordi', 1198);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4791, true, 'sabaton', 1198),
	(4792, false, 'Waltari', 1198),
	(4793, false, 'CA/CC', 1199),
	(4794, false, 'Metallica', 1199),
	(4795, true, 'Pink Floyd', 1199),
	(4796, false, 'Red Hot Chili Peppers', 1199),
	(4797, true, 'Homem chuva', 1200),
	(4798, false, 'Kim', 1200),
	(4799, false, 'Quadrilha', 1200),
	(4800, false, 'sem mim', 1200);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4801, false, 'benzina', 1201),
	(4802, false, 'Du Hast', 1201),
	(4803, true, 'Du Riechst So Gut', 1201),
	(4804, false, 'Mein Teil', 1201),
	(4805, false, 'Ao longo da Torre de Vigia', 1202),
	(4806, false, 'casa do sol nascente', 1202),
	(
		4807,
		false,
		'Sargento Pepper''s Lonely Hearts Club Band',
		1202
	),
	(4808, true, 'Todas essas músicas', 1202),
	(
		4809,
		true,
		'Campos de morangos para sempre',
		1203
	),
	(4810, false, 'Consertando um Buraco', 1203);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4811, false, 'Lucy no céu com diamantes', 1203),
	(4812, false, 'Melhorando', 1203),
	(4813, false, 'Dave Lombardo', 1204),
	(4814, true, 'Dave Mustaine', 1204),
	(4815, false, 'Joey Beladona', 1204),
	(4816, false, 'Kurt Cobain', 1204),
	(4817, false, 'diplo', 1205),
	(4818, false, 'fogo Walshy', 1205),
	(4819, false, 'Jillionaire', 1205),
	(4820, true, 'Skrillex', 1205);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4821, true, 'Alesso', 1206),
	(4822, false, 'Axwell', 1206),
	(4823, false, 'Sebastião Ingrosso', 1206),
	(4824, false, 'Steve Angello', 1206),
	(4825, false, 'Ar', 1207),
	(4826, false, 'Daft Punk', 1207),
	(4827, false, 'Justiça', 1207),
	(4828, true, 'Os irmãos químicos', 1207),
	(4829, false, 'Espanhol', 1208),
	(4830, false, 'Francês', 1208);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4831, false, 'japonês', 1208),
	(4832, true, 'Português', 1208),
	(4833, false, 'John Cascella', 1209),
	(4834, false, 'John Denver', 1209),
	(4835, true, 'John Lennon', 1209),
	(4836, false, 'Johnny Thunders', 1209),
	(4837, true, 'Dr. Dre', 1210),
	(4838, false, 'GZA', 1210),
	(4839, false, 'Homem metódico', 1210),
	(4840, false, 'Velho Bastardo Sujo', 1210);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4841, true, 'A parede', 1211),
	(4842, false, 'animais', 1211),
	(4843, false, 'O Lado Escuro da Lua', 1211),
	(
		4844,
		false,
		'Queria que você estivesse aqui',
		1211
	),
	(4845, false, 'BAMF', 1212),
	(4846, false, 'coisa do pântano', 1212),
	(4847, false, 'Emoji', 1212),
	(4848, true, 'Lágrimas WiFi', 1212),
	(
		4849,
		false,
		'A continuação da história de Bungalow Bill',
		1213
	),
	(
		4850,
		false,
		'Por que não fazemos isso na estrada?',
		1213
	);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (
		4851,
		true,
		'Sendo para o benefício do Sr. Kite!',
		1213
	),
	(
		4852,
		false,
		'Todo mundo tem algo a esconder, exceto eu e meu macaco',
		1213
	),
	(4853, false, 'A glória', 1214),
	(4854, false, 'Eu me pergunto', 1214),
	(4855, false, 'Grande irmão', 1214),
	(4856, true, 'Ondas', 1214),
	(4857, false, 'Aquecimento global', 1215),
	(4858, false, 'Armando', 1215),
	(4859, true, 'Bem-vindo a Miami', 1215),
	(4860, false, 'vale', 1215);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4861, true, 'A vida de Pablo', 1216),
	(4862, false, 'Mate-se meu homem', 1216),
	(
		4863,
		false,
		'Seus covardes nem fumam crack',
		1216
	),
	(4864, false, 'Sua esposa me algema', 1216),
	(4865, false, '/', 1217),
	(4866, false, '+', 1217),
	(4867, true, '-', 1217),
	(4868, false, 'x', 1217),
	(4869, true, 'A parede', 1218),
	(4870, false, 'Abbey Road', 1218);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4871, false, 'Passeio Mágico Misterioso', 1218),
	(4872, false, 'Revólver', 1218),
	(4873, true, 'MGMT', 1219),
	(4874, false, 'MSTRKRFT', 1219),
	(4875, false, 'SBTRKT', 1219),
	(4876, false, 'STRFKR', 1219),
	(4877, false, ' Tom Morello', 1220),
	(4878, false, 'Billy Corgan', 1220),
	(4879, true, 'Dave Navarro', 1220),
	(4880, false, 'Ed O''Brien', 1220);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4881, true, 'Ar', 1221),
	(4882, false, 'Fogo', 1221),
	(4883, false, 'Terra', 1221),
	(4884, false, 'Água', 1221),
	(4885, false, 'Mais', 1222),
	(
		4886,
		true,
		'O flautista nos portões do amanhecer',
		1222
	),
	(4887, false, 'Ummagumma', 1222),
	(4888, false, 'Átomo Coração Mãe', 1222),
	(4889, false, '8 Diagramas', 1223),
	(4890, false, 'A Saga Continua', 1223);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4891, true, 'Era Uma Vez em Shaolin', 1223),
	(4892, false, 'Um amanhã melhor', 1223),
	(4893, false, 'carter', 1224),
	(4894, false, 'Edwards', 1224),
	(4895, false, 'Johnson', 1224),
	(4896, true, 'jones', 1224),
	(4897, false, 'as curvas', 1225),
	(4898, false, 'garoto A', 1225),
	(4899, true, 'Pablo Mel', 1225),
	(4900, false, 'Uma piscina em forma de lua', 1225);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4901, false, '(Você me deixa louco', 1226),
	(4902, true, '...Bebé mais uma vez', 1226),
	(4903, false, 'Ops!... Fiz de Novo', 1226),
	(4904, false, 'Tóxico', 1226),
	(4905, false, 'Oden', 1227),
	(4906, true, 'Sukiyaki', 1227),
	(4907, false, 'Sushi', 1227),
	(4908, false, 'takoyaki', 1227),
	(4909, false, 'Fernando', 1228),
	(4910, false, 'Mamma Mia', 1228);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4911, false, 'Rainha dançante', 1228),
	(4912, true, 'Waterloo', 1228),
	(4913, false, 'A história de Lex Diamond', 1229),
	(
		4914,
		true,
		'Construído apenas 4 Linx cubanos',
		1229
	),
	(4915, false, 'O selvagem', 1229),
	(4916, false, 'Shaolin vs Wu-Tang', 1229),
	(4917, true, 'Cidade da meia noite', 1230),
	(4918, false, 'Espere', 1230),
	(4919, false, 'Outro', 1230),
	(4920, false, 'Reunião', 1230);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4921, false, 'Emma Bunton', 1231),
	(4922, true, 'Geri Halliwell', 1231),
	(4923, false, 'Melanie Brown', 1231),
	(4924, false, 'Victoria Beckham', 1231),
	(4925, false, 'George Harrison', 1232),
	(4926, false, 'John Lennon', 1232),
	(4927, false, 'Paul McCartney', 1232),
	(4928, true, 'Ringo Starr', 1232),
	(4929, false, 'Desvanecer-se na escuridão', 1233),
	(4930, true, 'Níveis', 1233);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4931, false, 'Procure Bromance', 1233),
	(4932, false, 'Silhuetas', 1233),
	(4933, true, 'Alguém para amar', 1234),
	(4934, false, 'Bohemian Rhapsody', 1234),
	(4935, false, 'Clarão', 1234),
	(4936, false, 'Sob pressão', 1234),
	(4937, true, 'Aquela parte', 1235),
	(4938, false, 'Grande corpo', 1235),
	(4939, false, 'Neva MUDANÇA', 1235),
	(4940, false, 'rosto em branco', 1235);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4941, false, 'Coração de madeira', 1236),
	(4942, false, 'Jailhouse Rock', 1236),
	(4943, false, 'No gueto', 1236),
	(
		4944,
		true,
		'Não Posso Ajudar a Apaixonar-se',
		1236
	),
	(4945, false, 'colheita inesperada', 1237),
	(4946, false, 'monodia', 1237),
	(4947, false, 'Poder infinito!', 1237),
	(4948, true, 'Subida', 1237),
	(4949, false, 'A teoria do limite inferior', 1238),
	(
		4950,
		false,
		'Entre no Wu-Tang (36 Câmaras)',
		1238
	);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4951, true, 'Illmatic', 1238),
	(4952, false, 'O Crônico', 1238),
	(4953, true, '808s e desgosto', 1239),
	(4954, false, 'A vida de Pablo', 1239),
	(4955, false, 'Graduação', 1239),
	(4956, false, 'Registro tardio', 1239),
	(4957, false, 'A queda', 1240),
	(4958, false, 'dias demoníacos', 1240),
	(4959, true, 'Humanz', 1240),
	(4960, false, 'praia de plastico', 1240);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4961, false, '1/2', 1241),
	(4962, false, '2/4', 1241),
	(4963, true, '4/4', 1241),
	(4964, false, '8/12', 1241),
	(
		4965,
		true,
		'Construa Deus, depois conversaremos',
		1242
	),
	(
		4966,
		false,
		'Escrevo pecados, não tragédias',
		1242
	),
	(
		4967,
		false,
		'Mentir é a maior diversão que uma garota pode ter sem tirar a roupa',
		1242
	),
	(
		4968,
		false,
		'Unhas para o café da manhã, tachas para lanches',
		1242
	),
	(4969, false, 'Bater', 1243),
	(4970, false, 'Rem', 1243);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4971, false, 'Ren', 1243),
	(4972, true, 'Rin', 1243),
	(4973, false, 'A cidade', 1244),
	(4974, true, 'Aventura', 1244),
	(4975, false, 'Cultura pop', 1244),
	(4976, false, 'Icaro', 1244),
	(4977, true, 'Mulher', 1245),
	(4978, false, 'Prazer', 1245),
	(4979, false, 'randy', 1245),
	(4980, false, 'São e salvo', 1245);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4981, false, 'Adam Richard Willes', 1246),
	(4982, true, 'Joel Zimmerman', 1246),
	(4983, false, 'Sonny Moore', 1246),
	(4984, false, 'Thomas Wesley Pentz', 1246),
	(4985, false, 'André jovem', 1247),
	(4986, true, 'Aubrey Graham', 1247),
	(4987, false, 'Dwayne Carter', 1247),
	(4988, false, 'Shaun Carter', 1247),
	(4989, false, '2009', 1248),
	(4990, false, '2011', 1248);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (4991, true, '2013', 1248),
	(4992, false, '2014', 1248),
	(4993, false, '1967', 1249),
	(4994, false, '2010', 1249),
	(4995, true, '2012', 1249),
	(4996, false, '2015', 1249),
	(4997, false, '1960', 1250),
	(4998, true, '1963', 1250),
	(4999, false, '1969', 1250),
	(5000, false, '1970', 1250);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5001, false, '19.5', 1251),
	(5002, true, '20,5', 1251),
	(5003, false, '22,5', 1251),
	(5004, false, '25,5', 1251),
	(5005, false, '18', 1252),
	(5006, false, '2', 1252),
	(5007, true, '4', 1252),
	(5008, false, '5', 1252),
	(5009, true, '10', 1253),
	(5010, false, '12', 1253);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5011, false, '7', 1253),
	(5012, false, '9', 1253),
	(5013, true, '21 de setembro', 1254),
	(5014, false, '23 de setembro', 1254),
	(5015, false, '24 de setembro', 1254),
	(5016, false, '26 de setembro', 1254),
	(5017, false, 'adam lambert', 1255),
	(5018, false, 'Koven', 1255),
	(5019, false, 'Mitis', 1255),
	(5020, true, 'P!nk', 1255);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5021, false, 'Os Empreendimentos', 1256),
	(5022, false, 'Os Spotnicks', 1256),
	(5023, true, 'os tornados', 1256),
	(5024, false, 'Os Tremeloes', 1256),
	(5025, false, 'Eric Clapton', 1257),
	(5026, false, 'Jimi Hendrix', 1257),
	(5027, false, 'John Densmore', 1257),
	(5028, true, 'Robby Krieger', 1257),
	(5029, false, 'Chris Martin', 1258),
	(5030, false, 'George Michael', 1258);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5031, true, 'Michael Stipe', 1258),
	(5032, false, 'Thom Yorke', 1258),
	(5033, false, 'duque ellington', 1259),
	(5034, true, 'George Gershwin', 1259),
	(5035, false, 'Irving Berlin', 1259),
	(5036, false, 'Johnny Mandel', 1259),
	(5037, true, 'Eddie Van Halen', 1260),
	(5038, false, 'Kirk Hammet', 1260),
	(5039, false, 'Steve Vai', 1260),
	(5040, false, 'Zakk Wylde', 1260);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5041, true, 'Andreas Vollenweider', 1261),
	(5042, false, 'Bing Crosby', 1261),
	(5043, false, 'Enya', 1261),
	(5044, false, 'Jean-Michel Jarre', 1261),
	(5045, false, ' Barry White', 1262),
	(5046, true, 'Andrew Gold', 1262),
	(5047, false, 'Elton John', 1262),
	(5048, false, 'Léo Sayer', 1262),
	(5049, false, 'CA/CC', 1263),
	(5050, false, 'Correr', 1263);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5051, true, 'Foco', 1263),
	(5052, false, 'Piloto', 1263),
	(5053, false, 'Andy Gibb', 1264),
	(5054, false, 'Billy joel', 1264),
	(5055, false, 'Elton John', 1264),
	(5056, true, 'Léo Sayer', 1264),
	(5057, false, ' Terminal Dan', 1265),
	(5058, false, 'carpinteiro bruto', 1265),
	(5059, false, 'GOST', 1265),
	(5060, true, 'perturbador', 1265);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5061, false, 'Alex Lifeson', 1266),
	(5062, false, 'Geddy Lee', 1266),
	(5063, false, 'John Rutsey', 1266),
	(5064, true, 'Neil Peart', 1266),
	(5065, true, 'Billy Corgan', 1267),
	(5066, false, 'Cebolinha Brett', 1267),
	(5067, false, 'chino moreno', 1267),
	(5068, false, 'Eddie Vedder', 1267),
	(5069, false, 'Jay Van Dyke', 1268),
	(5070, false, 'Jeremias Fraites', 1268);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5071, false, 'Neyla Pekarek', 1268),
	(5072, true, 'Wesley Schultz', 1268),
	(5073, false, ' Fúria', 1269),
	(5074, true, ' Inveja', 1269),
	(5075, false, 'Luxúria', 1269),
	(5076, false, 'Preguiça', 1269),
	(5077, false, 'Arnold Schwarzenegger', 1270),
	(5078, false, 'Mike Tyson', 1270),
	(5079, true, 'Muhammad Ali', 1270),
	(5080, false, 'Sylvester Stallone', 1270);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5081, false, '13 de abril de 2009', 1271),
	(5082, true, '25 de outubro de 2014', 1271),
	(5083, false, '28 de agosto de 2003', 1271),
	(5084, false, '8 de abril de 2012', 1271),
	(5085, true, '1970', 1272),
	(5086, false, '1985', 1272),
	(5087, false, '1990', 1272),
	(5088, false, '2000', 1272),
	(5089, false, '1999', 1273),
	(5090, false, '2001', 1273);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5091, true, '2003', 1273),
	(5092, false, '2006', 1273),
	(5093, true, 'James Howlett', 1274),
	(5094, false, 'John Savage', 1274),
	(5095, false, 'Logan Lobo', 1274),
	(5096, false, 'Thomas Wilde', 1274),
	(5097, false, 'cidade dourada', 1275),
	(5098, false, 'lua amarela', 1275),
	(5099, true, 'Prospit', 1275),
	(5100, false, 'sem nome', 1275);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5101, false, 'Debbi', 1276),
	(5102, false, 'Ethel', 1276),
	(5103, true, 'Joani', 1276),
	(5104, false, 'margarida', 1276),
	(5105, false, 'Construa, Jogue, Mude', 1277),
	(5106, false, 'Forjar, construir, lutar', 1277),
	(5107, false, 'Trabalhe, divirta-se, viva', 1277),
	(5108, true, 'Unidade, Dever, Destino', 1277),
	(
		5109,
		false,
		'Aikter Frekik e Xagrai Ollomu',
		1278
	),
	(
		5110,
		false,
		'Grekei Ceknux e Riya Camacho',
		1278
	);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (
		5111,
		true,
		'Mierfa Durgas e Nektan Whelan',
		1278
	),
	(
		5112,
		false,
		'The Wrycrown e Voksea Olkido',
		1278
	),
	(5113, false, 'A aranha', 1279),
	(5114, true, 'Lagosta Johnson', 1279),
	(5115, false, 'O Wendigo', 1279),
	(5116, false, 'Roger, o Homúnculo', 1279),
	(5117, false, 'Auburn', 1280),
	(5118, true, 'Loiro', 1280),
	(5119, false, 'Marrom', 1280),
	(5120, false, 'Preto', 1280);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5121, false, 'BW1129', 1281),
	(5122, false, 'BWayne13', 1281),
	(5123, false, 'eu sou o Batman', 1281),
	(5124, true, 'JonDoe297', 1281),
	(5125, true, 'Derse', 1282),
	(5126, false, 'O médio', 1282),
	(5127, false, 'Prospit', 1282),
	(5128, false, 'Skaia', 1282),
	(5129, false, 'becquerel', 1283),
	(5130, false, 'Doc Scratch', 1283);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5131, false, 'Halley', 1283),
	(5132, true, 'Irmão', 1283),
	(5133, true, 'cidade espiral', 1284),
	(5134, false, 'Cidade estrela', 1284),
	(5135, false, 'Mega-Cidade Um', 1284),
	(5136, false, 'Rockwood', 1284),
	(5137, false, 'carcaju', 1285),
	(5138, false, 'Hulk', 1285),
	(5139, true, 'Temerário', 1285),
	(5140, false, 'Thor', 1285);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5141, false, 'Calvin Coolidge', 1286),
	(5142, false, 'Calvin Klein', 1286),
	(5143, true, 'João Calvino', 1286),
	(5144, false, 'Philip Calvin McGraw', 1286),
	(5145, false, 'Alex Kidd', 1287),
	(5146, false, 'Bola do Super Macaco', 1287),
	(5147, true, 'mega homem', 1287),
	(5148, false, 'Super Mário Irmãos', 1287),
	(5149, true, 'guardiões do globo', 1288),
	(5150, false, 'Liga da Justiça', 1288);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5151, false, 'Tartarugas Ninja Mutantes', 1288),
	(5152, false, 'Vingadores', 1288),
	(5153, false, 'irken', 1289),
	(5154, false, 'Kree', 1289),
	(5155, false, 'Kryptoniano', 1289),
	(5156, true, 'Viltrumite', 1289),
	(5157, false, 'Rachel', 1290),
	(5158, false, 'Rosa', 1290),
	(5159, true, 'rosalyn', 1290),
	(5160, false, 'Rubi', 1290);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5161, false, '1932', 1291),
	(5162, false, '1936', 1291),
	(5163, true, '1939', 1291),
	(5164, false, '1951', 1291),
	(5165, false, 'Malcolm Wheeler-Nicholson', 1292),
	(5166, false, 'Robert Crumb', 1292),
	(5167, true, 'Robert Kirkman', 1292),
	(5168, false, 'Stan Lee', 1292),
	(5169, false, 'Ivo Robotnik', 1293),
	(5170, false, 'Julian Robotnik', 1293);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5171, true, 'Professor Charles o Ouriço', 1293),
	(5172, false, 'Snively Robotnik', 1293),
	(5173, false, 'Sr. Bunbun', 1294),
	(5174, false, 'Sr. Coelho', 1294),
	(5175, false, 'Sr. Hoppy', 1294),
	(5176, true, 'Sr. Pão', 1294),
	(5177, false, 'Sr. Boreman', 1295),
	(5178, false, 'Sr. Moe', 1295),
	(5179, true, 'Sr. Saliva', 1295),
	(5180, false, 'Sr. Spitling', 1295);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5181, false, 'Carlos', 1296),
	(5182, true, 'charlie', 1296),
	(5183, false, 'Dave', 1296),
	(5184, false, 'Nathaniel', 1296),
	(5185, true, 'Sonic the Hedgehog #11', 1297),
	(5186, false, 'Sonic the Hedgehog #161', 1297),
	(5187, false, 'Sonic the Hedgehog #47', 1297),
	(5188, false, 'Universo Sônico #32', 1297),
	(5189, true, 'Adamantium', 1298),
	(5190, false, 'Carbonádio', 1298);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5191, false, 'Titânio', 1298),
	(5192, false, 'vibranium', 1298),
	(5193, false, 'A União', 1299),
	(5194, false, 'Escorpião', 1299),
	(5195, false, 'máfia do tigre', 1299),
	(5196, true, 'Zodíaco', 1299),
	(5197, false, 'Eobard Thawne', 1300),
	(5198, false, 'Jay Garrick', 1300),
	(5199, false, 'Johnny Quick', 1300),
	(5200, true, 'Wally West', 1300);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5201, false, 'Benjamim Daimio', 1301),
	(5202, false, 'Johann Kraus', 1301),
	(5203, false, 'Kate Corrigan', 1301),
	(5204, true, 'Trevor Bruttenholm', 1301),
	(5205, false, 'Alexis Bolota', 1302),
	(5206, true, 'Elias Bolota', 1302),
	(5207, false, 'Frederick Bolota', 1302),
	(5208, false, 'Maximiliano Bolota', 1302),
	(5209, false, 'Dimitri', 1303),
	(5210, false, 'Kragok', 1303);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5211, true, 'Lien-Da', 1303),
	(5212, false, 'Remington', 1303),
	(5213, false, 'David Hobbes', 1304),
	(5214, false, 'John Hobbes', 1304),
	(5215, false, 'Nathaniel Hobbes', 1304),
	(5216, true, 'Thomas hobbes', 1304),
	(5217, false, 'Canário preto', 1305),
	(5218, false, 'Dick Grayson', 1305),
	(5219, false, 'Rainha Emiko', 1305),
	(5220, true, 'Roy Harper', 1305);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5221, false, 'Jason & Sarah', 1306),
	(5222, false, 'Joey & Jackie', 1306),
	(5223, true, 'Thomas e Marta', 1306),
	(5224, false, 'Todd e Mira', 1306),
	(5225, false, 'Terra-10005', 1307),
	(5226, true, 'Terra-199999', 1307),
	(5227, false, 'Terra-2008', 1307),
	(5228, false, 'Terra-616', 1307),
	(5229, false, 'Luz solar', 1308),
	(5230, false, 'Madeira', 1308);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5231, true, 'Ouro', 1308),
	(5232, false, 'Prata', 1308),
	(5233, false, 'Alberto e Pogo', 1309),
	(5234, false, 'amendoim', 1309),
	(5235, true, 'Calvin e Hobbes', 1309),
	(5236, false, 'ursinho Pooh', 1309),
	(5237, true, 'Antimônio', 1310),
	(5238, false, 'Bismuto', 1310),
	(5239, false, 'Cobalto', 1310),
	(5240, false, 'Mercúrio', 1310);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5241, false, 'Carlos Xavier', 1311),
	(5242, false, 'Johann Schmidt', 1311),
	(5243, true, 'Max Eisenhardt', 1311),
	(5244, false, 'Pietro Maximoff', 1311),
	(5245, true, 'makara', 1312),
	(5246, false, 'Makare', 1312),
	(5247, false, 'Makera', 1312),
	(5248, false, 'Makrea', 1312),
	(5249, true, 'Anung Un Rama', 1313),
	(5250, false, 'Azzael', 1313);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5251, false, 'Mão direita da desgraça', 1313),
	(5252, false, 'Ogdru Jahad', 1313),
	(5253, false, 'Amadeus Cho', 1314),
	(5254, true, 'Henrique Pym', 1314),
	(5255, false, 'Reed Richards', 1314),
	(5256, false, 'Tony Stark', 1314),
	(5257, true, 'Augusto Picard', 1315),
	(5258, false, 'J. Cecil Maby', 1315),
	(5259, false, 'Jacques Piccard', 1315),
	(5260, false, 'Will Morris', 1315);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5261, true, 'doce magro', 1316),
	(5262, false, 'Hattie Hargrove', 1316),
	(5263, false, 'Livro James "Jim"', 1316),
	(5264, false, 'Pearl Jones', 1316),
	(5265, false, 'Adrian Veidt', 1317),
	(5266, true, 'Daniel Dreiberg', 1317),
	(5267, false, 'Hollis Mason', 1317),
	(5268, false, 'Nelson Gardner', 1317),
	(5269, false, 'Garoto conhece o mundo', 1318),
	(5270, false, 'NYPD azul', 1318);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5271, false, 'O arquivo x', 1318),
	(5272, true, 'Roseanne', 1318),
	(5273, false, 'Karon''gahk', 1319),
	(5274, false, 'Nova Jersey', 1319),
	(5275, true, 'Sto-vo-kor', 1319),
	(5276, false, 'Valhalla', 1319),
	(5277, false, 'Alemanha', 1320),
	(5278, true, 'Escócia', 1320),
	(5279, false, 'Inglaterra', 1320),
	(5280, false, 'Suécia', 1320);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5281, false, 'Ele quer punir os brutos.', 1321),
	(5282, true, 'Ele é o grande kahuna.', 1321),
	(
		5283,
		false,
		'Para descobrir onde estão todas as bananas.',
		1321
	),
	(5284, false, 'Porque Diddy Kong o forçou.', 1321),
	(5285, false, 'homem diurno', 1322),
	(5286, true, 'o homem do lixo', 1322),
	(5287, false, 'O Maníaco', 1322),
	(5288, false, 'pássaro de guerra', 1322),
	(5289, false, 'Klingworms', 1323),
	(5290, false, 'macarrão espaguete', 1323);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5291, false, 'minhocas', 1323),
	(5292, true, 'Vermes Serpentes', 1323),
	(5293, false, 'molho de pimenta doce', 1324),
	(5294, true, 'molho grapok', 1324),
	(5295, false, 'molho grapork', 1324),
	(5296, false, 'Pudim Gazorpazorp', 1324),
	(
		5297,
		false,
		'Aterrissagem forçada ao chegar ao aeroporto de Keflavík',
		1325
	),
	(
		5298,
		true,
		'Escorregar de um penhasco e quase se afogar na água gelada',
		1325
	),
	(
		5299,
		false,
		'Sendo servido frango mal cozido em seu hotel',
		1325
	),
	(
		5300,
		false,
		'Um pequeno acidente de carro em uma tempestade de neve',
		1325
	);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5301, true, 'Sarek', 1326),
	(5302, false, 'Surak', 1326),
	(5303, false, 'T''Pal', 1326),
	(5304, false, 'Tuvok', 1326),
	(5305, false, '0', 1327),
	(5306, false, '3', 1327),
	(5307, false, '6', 1327),
	(5308, true, '9', 1327),
	(5309, false, 'Ape-Nesia', 1328),
	(5310, false, 'Para o Babuíno da Lua', 1328);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (
		5311,
		false,
		'Show de mensagem em uma garrafa',
		1328
	),
	(5312, true, 'É uma vida maravilhosa', 1328),
	(5313, false, 'crime milionário', 1329),
	(5314, true, 'Grande Fraude', 1329),
	(5315, false, 'Tosse Maior', 1329),
	(5316, false, 'Trapaceiro de Ingram', 1329),
	(5317, false, 'Delia Derbyshire', 1330),
	(5318, false, 'ouro Murray', 1330),
	(5319, false, 'Peter Howell', 1330),
	(5320, true, 'Ron Grainer', 1330);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5321, false, 'Adrian Edmondson', 1331),
	(5322, false, 'Christopher Ryan', 1331),
	(5323, false, 'Nigel Planer', 1331),
	(5324, true, 'Rik Mayall', 1331),
	(5325, false, 'Dennis Miller', 1332),
	(5326, true, 'George Clooney', 1332),
	(5327, false, 'Matthew Perry', 1332),
	(5328, false, 'Pierce Brosnan', 1332),
	(5329, true, 'Christopher Eccleston', 1333),
	(5330, false, 'David Tennant', 1333);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5331, false, 'Matt smith', 1333),
	(5332, false, 'Tom Baker', 1333),
	(5333, false, 'Carlos', 1334),
	(5334, false, 'Esteban', 1334),
	(5335, true, 'Pablo', 1334),
	(5336, false, 'Pato', 1334),
	(5337, true, 'Amanda Barrie', 1335),
	(5338, false, 'Jean Alexandre', 1335),
	(5339, false, 'Sue Nicholls', 1335),
	(5340, false, 'Violet Carson', 1335);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5341, true, '10 de outubro de 2010', 1336),
	(5342, false, '14 de abril de 1984', 1336),
	(5343, false, '18 de maio de 2015', 1336),
	(5344, false, '6 de novembro de 2010', 1336),
	(5345, false, 'Botha', 1337),
	(5346, false, 'Humano', 1337),
	(5347, true, 'klingon', 1337),
	(5348, false, 'vulcano', 1337),
	(5349, false, 'Hank', 1338),
	(5350, false, 'Hans', 1338);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5351, false, 'heidi', 1338),
	(5352, true, 'heinz', 1338),
	(5353, false, 'Bryce Kranyik', 1339),
	(5354, false, 'Chris Mundorf', 1339),
	(5355, true, 'Dan Gheesling', 1339),
	(5356, false, 'Ryan Sutfin', 1339),
	(5357, true, 'Jéssica Smith', 1340),
	(5358, false, 'Lisa Brockwell', 1340),
	(5359, false, 'Pui Fan Lee', 1340),
	(5360, false, 'Sue Monroe', 1340);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5361, false, 'A Roda do Tempo', 1341),
	(5362, false, 'Harry Potter', 1341),
	(5363, false, 'O caderno', 1341),
	(5364, true, 'Uma música de gelo e Fogo', 1341),
	(5365, false, 'Billy Familia', 1342),
	(5366, false, 'Dan Bell', 1342),
	(5367, true, 'ESTÚDIOS RiDGiD', 1342),
	(5368, false, 'VeganGainz', 1342),
	(5369, true, 'bete', 1343),
	(5370, false, 'jerry', 1343);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5371, false, 'morty', 1343),
	(5372, false, 'Rick', 1343),
	(5373, false, 'Alguém para cuida de mim', 1344),
	(5374, false, 'Contraponto', 1344),
	(5375, true, 'Desbravador', 1344),
	(5376, false, 'Mensagem em uma garrafa', 1344),
	(5377, false, 'asa de pato', 1345),
	(5378, true, 'Duckburg', 1345),
	(5379, false, 'pirueta', 1345),
	(5380, false, 'Wingford', 1345);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5381, false, 'Lancel Lannister', 1346),
	(5382, true, 'Petyr Baelish', 1346),
	(5383, false, 'Podrick Payne', 1346),
	(5384, false, 'Torrhen Karstark', 1346),
	(5385, true, 'Essos', 1347),
	(5386, false, 'Esuntos', 1347),
	(5387, false, 'Oesteeste', 1347),
	(5388, false, 'Páscoa', 1347),
	(5389, false, 'Califórnia', 1348),
	(5390, false, 'Flórida', 1348);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5391, false, 'Nova Jersey', 1348),
	(5392, true, 'Pensilvânia', 1348),
	(5393, false, 'Canadá', 1349),
	(5394, false, 'Inglaterra', 1349),
	(5395, true, 'Os Estados Unidos da América', 1349),
	(5396, false, 'Venezuela', 1349),
	(5397, false, 'Dave', 1350),
	(5398, false, 'Mike', 1350),
	(5399, true, 'reitor', 1350),
	(5400, false, 'Steve', 1350);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5401, true, 'Jake', 1351),
	(5402, false, 'James', 1351),
	(5403, false, 'Jeremy', 1351),
	(5404, false, 'John', 1351),
	(5405, false, 'A flecha', 1352),
	(5406, false, 'Canário preto', 1352),
	(5407, true, 'O Flash', 1352),
	(5408, false, 'Temerário', 1352),
	(5409, false, 'Ainsley Harriott', 1353),
	(5410, true, 'Guy Fieri', 1353);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5411, false, 'Guy Martin', 1353),
	(5412, false, 'Guy Ritchie', 1353),
	(5413, false, 'chefe de gabinete', 1354),
	(5414, true, 'Chicote da maioria da casa', 1354),
	(5415, false, 'Presidente', 1354),
	(5416, false, 'procurador-geral', 1354),
	(5417, false, 'Beth Smith', 1355),
	(5418, true, 'Pencilvester', 1355),
	(5419, false, 'Sr. Poopy Butthole', 1355),
	(5420, false, 'Summer Smith', 1355);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5421, true, 'caminhantes', 1356),
	(5422, false, 'larvas', 1356),
	(5423, false, 'Porcos do Inferno', 1356),
	(5424, false, 'trepadeiras', 1356),
	(5425, true, 'Tibério', 1357),
	(5426, false, 'tirone', 1357),
	(5427, false, 'Travis', 1357),
	(5428, false, 'Trevor', 1357),
	(5429, false, 'bacon e ovos', 1358),
	(5430, false, 'Brinde', 1358);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5431, false, 'Capitão Crunch', 1358),
	(5432, true, 'Ovo Waffles', 1358),
	(5433, false, 'Cada vilão é uma limonada', 1359),
	(5434, false, 'Todo Vilão é Limes', 1359),
	(5435, true, 'Todo Vilão é Limão', 1359),
	(5436, false, 'Todo vilão é uma limonada', 1359),
	(5437, false, 'leonardo', 1360),
	(5438, true, 'Magnitude', 1360),
	(5439, false, 'Queimaduras Estelares', 1360),
	(5440, false, 'Senhor Chang', 1360);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5441, false, 'Bebê azul', 1361),
	(5442, true, 'Céu azul', 1361),
	(5443, false, 'Rock Candy', 1361),
	(5444, false, 'vidro puro', 1361),
	(5445, false, 'Donald Draper', 1362),
	(5446, false, 'John Ashbury', 1362),
	(5447, false, 'Michael "Mikey" Guilherme', 1362),
	(5448, true, 'Ricardo "Dick" Whitman', 1362),
	(5449, false, 'Caçador', 1363),
	(5450, false, 'Gavião Arqueiro', 1363);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5451, false, 'Lábios quentes', 1363),
	(5452, true, 'Radar', 1363),
	(5453, false, 'fritar Felipe', 1364),
	(5454, false, 'Fry J. Philip', 1364),
	(5455, false, 'Fry Rodríguez', 1364),
	(5456, true, 'Philip J. Fry', 1364),
	(5457, false, 'Kingloname', 1365),
	(5458, true, 'Lordgenome', 1365),
	(5459, false, 'Rei Loname', 1365),
	(5460, false, 'Senhor Genoma', 1365);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (
		5461,
		false,
		'Cachorro de corda de auxiliar de banheiro é sopa',
		1366
	),
	(
		5462,
		false,
		'Tempo e Dimensões de Repouso no Espaço',
		1366
	),
	(
		5463,
		false,
		'Tempo e dimensões relativas em grande estilo',
		1366
	),
	(
		5464,
		true,
		'Tempo e dimensões relativas no espaço',
		1366
	),
	(5465, false, 'Azul', 1367),
	(5466, false, 'Roxo', 1367),
	(5467, true, 'Verde', 1367),
	(5468, false, 'Vermelho', 1367),
	(5469, false, 'Daryl Dixon', 1368),
	(5470, false, 'Negan', 1368);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5471, true, 'O governador', 1368),
	(5472, false, 'Rick Grimes', 1368),
	(5473, true, ' Bryan Cranston', 1369),
	(5474, false, 'Aaron Paul', 1369),
	(5475, false, 'André Lincoln', 1369),
	(5476, false, 'RJ Mitte', 1369),
	(5477, false, 'Karen', 1370),
	(5478, false, 'Lucas', 1370),
	(5479, false, 'Mike', 1370),
	(5480, true, 'Onze', 1370);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5481, false, 'Lennie Turtletaub', 1371),
	(5482, false, 'Princesa Carolyn', 1371),
	(5483, true, 'Todd Chavez', 1371),
	(5484, false, 'Tom Jumbo-Grumbo', 1371),
	(5485, false, 'A nova escola do imperador', 1372),
	(5486, false, 'cory na casa', 1372),
	(5487, false, 'Hannah Montana', 1372),
	(5488, true, 'Ponto!', 1372),
	(5489, false, 'Chris Daughtry', 1373),
	(5490, false, 'Justino Guarini', 1373);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5491, true, 'Kelly Clarkson', 1373),
	(5492, false, 'Ruben Studdard', 1373),
	(5493, false, 'Emmy', 1374),
	(5494, false, 'Grammy', 1374),
	(5495, true, 'Oscar', 1374),
	(5496, false, 'Tony', 1374),
	(5497, true, 'Amazonas', 1375),
	(5498, false, 'BBC', 1375),
	(5499, false, 'CCTV', 1375),
	(5500, false, 'Netflix', 1375);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5501, false, 'dorothy', 1376),
	(5502, false, 'Dália', 1376),
	(5503, false, 'hermione', 1376),
	(5504, true, 'sabrina', 1376),
	(5505, false, 'Barbrady', 1377),
	(5506, true, 'Dibble', 1377),
	(5507, false, 'Mahoney', 1377),
	(5508, false, 'Murphy', 1377),
	(5509, false, 'O Limite da Destruição', 1378),
	(5510, false, 'Os astecas', 1378);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5511, false, 'os Daleks', 1378),
	(5512, true, 'Uma criança sobrenatural', 1378),
	(5513, false, 'AC Slater', 1379),
	(5514, true, 'guincho', 1379),
	(5515, false, 'Sr. Belding', 1379),
	(5516, false, 'Zack', 1379),
	(5517, false, 'Contos de Pato', 1380),
	(5518, true, 'LazyTown', 1380),
	(5519, false, 'Sofia a primeira', 1380),
	(5520, false, 'tom e Jerry', 1380);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5521, true, 'Atraiu', 1381),
	(5522, false, 'grego', 1381),
	(5523, false, 'Jerônimo', 1381),
	(5524, false, 'Joe', 1381),
	(5525, true, 'Gallifrey', 1382),
	(5526, false, 'Mondas', 1382),
	(5527, false, 'Skaro', 1382),
	(5528, false, 'sontar', 1382),
	(5529, false, 'Diddy Kong', 1383),
	(5530, true, 'Eddie, o Mau Velho Yeti', 1383);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5531, false, 'Kiddy Kong', 1383),
	(5532, false, 'Rei K. Rool', 1383),
	(5533, true, '2013', 1384),
	(5534, false, '2014', 1384),
	(5535, false, '2015', 1384),
	(5536, false, '2016', 1384),
	(5537, true, '10', 1385),
	(5538, false, '12', 1385),
	(5539, false, '3', 1385),
	(5540, false, '7', 1385);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5541, false, '10', 1386),
	(5542, false, '2', 1386),
	(5543, true, '5', 1386),
	(5544, false, '7', 1386),
	(5545, false, '10', 1387),
	(5546, true, '2', 1387),
	(5547, false, '3', 1387),
	(5548, false, '5', 1387),
	(5549, true, 'Achado não é roubado', 1388),
	(5550, false, 'desafio duplo', 1388);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5551, false, 'Nick Arcade', 1388),
	(5552, false, 'Nickelodeon Guts', 1388),
	(5553, false, 'Homem de familia', 1389),
	(5554, false, 'pai americano', 1389),
	(5555, false, 'Parque Sul', 1389),
	(5556, true, 'Rick & Morty', 1389),
	(5557, false, 'Amigos', 1390),
	(5558, false, 'becker', 1390),
	(5559, false, 'Frasier', 1390),
	(5560, true, 'Seinfeld', 1390);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5561, false, 'David Tennant', 1391),
	(5562, false, 'Peter Capaldi', 1391),
	(5563, false, 'Tom Baker', 1391),
	(5564, true, 'William Hartnell', 1391),
	(5565, false, 'Christopher Hall', 1392),
	(5566, true, 'Helen Wood', 1392),
	(5567, false, 'Pauline Bennet', 1392),
	(5568, false, 'Pavandeep "Pav" Paul', 1392),
	(5569, false, 'Eric Idle', 1393),
	(5570, false, 'Graham Chapman', 1393);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5571, false, 'John Cleese', 1393),
	(5572, true, 'Terry Jones', 1393),
	(5573, false, 'Jesse Pinkman', 1394),
	(5574, false, 'Saul Goodman', 1394),
	(5575, false, 'Skyler Branco', 1394),
	(5576, true, 'Walter White', 1394),
	(5577, false, 'Anjo', 1395),
	(5578, false, 'leite preto', 1395),
	(5579, true, 'Lágrima', 1395),
	(5580, false, 'Proteção', 1395);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5581, false, '1981', 1396),
	(5582, true, '1983', 1396),
	(5583, false, '1985', 1396),
	(5584, false, '1987', 1396),
	(5585, false, 'Bananaman', 1397),
	(5586, false, 'capitão estrela', 1397),
	(5587, true, 'rato perigoso', 1397),
	(5588, false, 'SuperTed', 1397),
	(5589, false, 'O enigmático', 1398),
	(5590, true, 'O piadista', 1398);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5591, false, 'pinguim', 1398),
	(5592, false, 'Sr. Freeze', 1398),
	(5593, false, 'ben o soldado', 1399),
	(5594, false, 'Colin o Ladrão', 1399),
	(
		5595,
		false,
		'Kevin Gallagher, também conhecido como Lil'' Kevin',
		1399
	),
	(
		5596,
		true,
		'Matthew "Rickety Cricket" Mara',
		1399
	),
	(5597, false, 'Nenhuma das acima', 1400),
	(5598, false, 'Pequeno', 1400),
	(5599, true, 'Tilly', 1400),
	(5600, false, 'Tom', 1400);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5601, false, 'cara dos quadrinhos', 1401),
	(5602, false, 'Edward Stone', 1401),
	(5603, false, 'Jack Richardson', 1401),
	(5604, true, 'Jeff Albertson', 1401),
	(
		5605,
		true,
		' Depois de ter o dinheiro deles, você nunca o devolve.',
		1402
	),
	(5606, false, 'A ganância é eterna', 1402),
	(
		5607,
		false,
		'Nunca coloque a amizade acima do lucro',
		1402
	),
	(
		5608,
		false,
		'Nunca permita que a família fique no caminho da oportunidade',
		1402
	),
	(5609, false, 'Priya', 1403),
	(5610, false, 'Rajesh', 1403);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5611, false, 'Sheldor', 1403),
	(5612, true, 'Wolowizard', 1403),
	(5613, false, 'Guilherme Adama', 1404),
	(5614, false, 'Harry Stills', 1404),
	(5615, true, 'Laura Roslin', 1404),
	(5616, false, 'Tricia Helfer', 1404),
	(5617, false, 'Guilherme Lobo', 1405),
	(5618, false, 'Wally Morsa', 1405),
	(5619, true, 'Walter White', 1405),
	(5620, false, 'Willy Wonka', 1405);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5621, false, 'Agulha', 1406),
	(5622, true, 'garra longa', 1406),
	(5623, false, 'lamento da viúva', 1406),
	(5624, false, 'Oathkeeper', 1406),
	(5625, false, '2001', 1407),
	(5626, false, '2007', 1407),
	(5627, true, '2010', 1407),
	(5628, false, '2012', 1407),
	(5629, false, 'Jim Caviezel', 1408),
	(5630, false, 'Kevin Chapman', 1408);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5631, true, 'Michael Emerson', 1408),
	(5632, false, 'Taraji P. Henson', 1408),
	(5633, false, '10 metros', 1409),
	(5634, false, '2 metros', 1409),
	(5635, false, '5 metros', 1409),
	(5636, true, '7 metros', 1409),
	(5637, true, 'cabeça de alfinete', 1410),
	(5638, false, 'Dan sujo', 1410),
	(5639, false, 'Estrela do Mar', 1410),
	(5640, false, 'larry', 1410);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5641, true, 'azevinho linho', 1411),
	(5642, false, 'Jan Levinson', 1411),
	(5643, false, 'Pam Beesly', 1411),
	(5644, false, 'Ângela Martins', 1411),
	(5645, true, 'Alex', 1412),
	(5646, false, 'Grimus', 1412),
	(5647, false, 'neal', 1412),
	(5648, false, 'Todd', 1412),
	(5649, true, 'Devo ficar ou devo ir?', 1413),
	(5650, false, 'Este homem charmoso', 1413);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5651, false, 'O amor vai nos separar', 1413),
	(5652, false, 'África', 1413),
	(5653, false, 'Adam Sandler', 1414),
	(5654, false, 'Magnús Scheving', 1414),
	(5655, true, 'Stefán Stefánsson', 1414),
	(5656, false, 'Stephen Carl', 1414),
	(5657, true, 'David Tennant', 1415),
	(5658, false, 'Peter Capaldi', 1415),
	(5659, false, 'Peter Davison', 1415),
	(5660, false, 'William Hartnell', 1415);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5661, false, '11', 1416),
	(5662, true, '12', 1416),
	(5663, false, '13', 1416),
	(5664, false, '15', 1416),
	(5665, false, 'Amigos', 1417),
	(5666, false, 'Frasier', 1417),
	(5667, false, 'Saúde', 1417),
	(5668, true, 'Seinfeld', 1417),
	(5669, false, '1993', 1418),
	(5670, true, '1994', 1418);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5671, false, '1998', 1418),
	(5672, false, '1999', 1418),
	(5673, false, 'Jimmy Fallon', 1419),
	(5674, false, 'Larry Rubert', 1419),
	(5675, true, 'Oprah', 1419),
	(5676, false, 'sábado à noite ao vivo', 1419),
	(5677, false, 'chave catraca', 1420),
	(5678, true, 'Para-lamas', 1420),
	(5679, false, 'patins', 1420),
	(5680, false, 'Sideswipe', 1420);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5681, false, 'Dia do Mikey', 1421),
	(5682, false, 'Kate McKinnon', 1421),
	(5683, false, 'Sasheer Zamata', 1421),
	(5684, true, 'Tina Fey', 1421),
	(5685, false, 'Campeão', 1422),
	(5686, false, 'jojo', 1422),
	(5687, false, 'Jorge', 1422),
	(5688, true, 'marcelo', 1422),
	(5689, true, 'cata-vento', 1423),
	(5690, false, 'Espalhe!', 1423);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5691, false, 'KidsTV', 1423),
	(5692, false, 'MTVKids', 1423),
	(5693, false, 'Phil Ford', 1424),
	(5694, false, 'Russel T Davies', 1424),
	(5695, true, 'Steven Moffatt', 1424),
	(5696, false, 'Toby Whithouse', 1424),
	(5697, true, 'Bolhas (2016)', 1425),
	(5698, false, 'brilho do crepúsculo', 1425),
	(5699, false, 'Harley Quinn', 1425),
	(5700, false, 'Timmy Turner', 1425);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5701, true, 'Frank Bruno', 1426),
	(5702, false, 'Henry Cooper', 1426),
	(5703, false, 'Joe Fraiser', 1426),
	(5704, false, 'Muhammad Ali', 1426),
	(5705, false, 'Eagleton, Indiana', 1427),
	(5706, false, 'Londres, Inglaterra', 1427),
	(5707, false, 'Pasadena, Califórnia', 1427),
	(5708, true, 'Pawnee, Indiana', 1427),
	(5709, false, 'A Sociedade da Justiça', 1428),
	(
		5710,
		false,
		'A Sociedade da Justiça da América',
		1428
	);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5711, false, 'heróis do amanhã', 1428),
	(5712, true, 'lendas do amanha', 1428),
	(5713, false, 'Dicketson', 1429),
	(5714, false, 'Dickinson', 1429),
	(5715, true, 'Dixon', 1429),
	(5716, false, 'Grimes', 1429),
	(5717, false, '1', 1430),
	(5718, true, '2', 1430),
	(5719, false, '4', 1430),
	(5720, false, '5', 1430);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5721, false, '49', 1431),
	(5722, false, '62', 1431),
	(5723, true, '74', 1431),
	(5724, false, '88', 1431),
	(5725, false, 'Adam Baldwin', 1432),
	(5726, true, 'Alan Tudyk', 1432),
	(5727, false, 'Nathan Fillion', 1432),
	(5728, false, 'Sean Maher', 1432),
	(5729, false, 'Boxer', 1433),
	(5730, false, 'Doberman Pinscher', 1433);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5731, true, 'Dogue Alemão', 1433),
	(5732, false, 'pitbull', 1433),
	(5733, false, ' Tennessee Ernie Ford', 1434),
	(5734, true, 'Frankie Laine', 1434),
	(5735, false, 'Guy Mitchell', 1434),
	(5736, false, 'Magro Whitman', 1434),
	(5737, true, 'Jon Tron', 1435),
	(5738, false, 'Marcador', 1435),
	(5739, false, 'Tobusco', 1435),
	(
		5740,
		false,
		'Youtuber com mais subs do mundo',
		1435
	);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5741, true, 'Ataque de pânico', 1436),
	(5742, false, 'caos 2', 1436),
	(5743, false, 'disco hipno', 1436),
	(5744, false, 'razer', 1436),
	(5745, false, 'abraçe-me Laurie', 1437),
	(5746, false, 'Kevin Bacon', 1437),
	(5747, true, 'Kiefer Sutherland', 1437),
	(5748, false, 'Rob Lowe', 1437),
	(5749, true, 'FME-7', 1438),
	(5750, false, 'MMC5', 1438);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5751, false, 'VRC6', 1438),
	(5752, false, 'VRC7', 1438),
	(5753, false, 'Arrepios', 1439),
	(5754, true, 'Myst', 1439),
	(5755, false, 'Ruína', 1439),
	(5756, false, 'trópico', 1439),
	(5757, true, 'Ace Combat', 1440),
	(5758, false, 'céus carmesins', 1440),
	(5759, false, 'Deus Ex', 1440),
	(5760, false, 'rádio jet set', 1440);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5761, true, 'Armadilha Noturna', 1441),
	(5762, false, 'Assassino Cadáver', 1441),
	(5763, false, 'O Encontro de Dédalo', 1441),
	(5764, false, 'tubarão de esgoto', 1441),
	(5765, false, 'Frango', 1442),
	(5766, true, 'Porco', 1442),
	(5767, false, 'Vaca', 1442),
	(5768, false, 'zumbi', 1442),
	(5769, false, 'Esmagar e Esmurrar', 1443),
	(5770, false, 'Lutador das Eras: Conquista', 1443);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5771, true, 'Rei Dragão: O Jogo de Luta', 1443),
	(5772, false, 'Torneio de Campeões', 1443),
	(5773, false, 'Alphys', 1444),
	(5774, false, 'Papiro', 1444),
	(5775, true, 'toriel', 1444),
	(5776, false, 'undyne', 1444),
	(
		5777,
		true,
		'Envia um anúncio para alguém se mudar.',
		1445
	),
	(
		5778,
		false,
		'Materializa um novo ser em seu local.',
		1445
	),
	(
		5779,
		false,
		'Teletransporta alguém de algum lugar do planeta onde está colocado.',
		1445
	),
	(
		5780,
		false,
		'Teletransporta uma pessoa aleatória para o local.',
		1445
	);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5781, true, 'Cantando em um microfone', 1446),
	(5782, false, 'Ouviu os pássaros no parque', 1446),
	(5783, false, 'tocando um piano', 1446),
	(5784, false, 'Usando um Software Composer', 1446),
	(5785, true, 'Como o inferno', 1447),
	(5786, false, 'um pico', 1447),
	(5787, false, 'um poffin', 1447),
	(5788, false, 'Uma lâmina de gelatina', 1447),
	(5789, false, 'Al Arlington e Sal DeLuca', 1448),
	(5790, false, 'Jessica Rose e Jack Vincent', 1448);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5791, false, 'Richtofen', 1448),
	(5792, true, 'Sal DeLuca e Finn O''Leary', 1448),
	(5793, false, 'Der Eisendrache', 1449),
	(5794, false, 'Lua', 1449),
	(5795, true, 'O gigante', 1449),
	(5796, false, 'Sombras do Mal', 1449),
	(5797, false, 'Excalibore', 1450),
	(5798, true, 'Excalipoor', 1450),
	(5799, false, 'Excalisnore', 1450),
	(5800, false, 'Excalisore', 1450);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5801, true, 'Limite', 1451),
	(5802, false, 'Sanghelios', 1451),
	(5803, false, 'Substância', 1451),
	(5804, false, 'Te', 1451),
	(5805, false, 'Ágil', 1452),
	(5806, true, 'El Niño', 1452),
	(5807, false, 'La Niña', 1452),
	(5808, false, 'Rápido', 1452),
	(5809, false, 'Aldeia Tapu', 1453),
	(5810, false, 'cidade de heahea', 1453);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5811, false, 'cidade de Iki', 1453),
	(5812, true, 'Po Town', 1453),
	(5813, false, '100HP', 1454),
	(5814, false, '150.000 HP', 1454),
	(5815, true, '50.000 HP', 1454),
	(5816, false, '9.000.000 HP', 1454),
	(5817, true, 'Ao limpar a cada 7º episódio', 1455),
	(
		5818,
		false,
		'Ao limpar todos os episódios envolvendo um "Segredo"',
		1455
	),
	(
		5819,
		false,
		'Desbloqueando todos os bocais que o FLUDD pode usar',
		1455
	),
	(5820, false, 'Obtendo 70 Shines', 1455);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5821, true, 'Confronto', 1456),
	(5822, false, 'Espeto', 1456),
	(5823, false, 'Hadouken', 1456),
	(5824, false, 'realejo', 1456),
	(5825, true, '185', 1457),
	(5826, false, '195', 1457),
	(5827, false, '215', 1457),
	(5828, false, '225', 1457),
	(5829, true, 'A Bíblia', 1458),
	(5830, false, 'Enxofre', 1458);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5831, false, 'Livro de Sombras', 1458),
	(5832, false, 'o halo', 1458),
	(5833, false, '12', 1459),
	(5834, false, '5', 1459),
	(5835, true, '7', 1459),
	(5836, false, '8', 1459),
	(5969, false, '"Espere agora."', 1493),
	(5837, true, 'David Baszucki e Erik Cassel', 1460),
	(5838, false, 'Erik Cassel', 1460),
	(5839, false, 'James Kolein', 1460);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5840, false, 'Jonas Alto e Sarah Smith', 1460),
	(5841, false, 'pintura alegre', 1461),
	(5842, false, 'Pintura melancólica', 1461),
	(5843, false, 'Pintura Neutra', 1461),
	(5844, true, 'Pintura Quente', 1461),
	(5845, false, '7256380', 1462),
	(5846, true, '7355608', 1462),
	(5847, false, '7726354', 1462),
	(5848, false, '7890728', 1462),
	(5849, false, ' Clubstep', 1463);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5850, false, 'Clutterfunk', 1463),
	(5851, true, 'Electroman aventuras', 1463),
	(5852, false, 'teoria de tudo', 1463),
	(5853, true, 'Overbeck', 1464),
	(5854, false, 'Peixe', 1464),
	(5855, false, 'Roberts', 1464),
	(5856, false, 'Stevenson', 1464),
	(5857, true, 'espírito desequilibrado', 1465),
	(5858, false, 'motim demoníaco', 1465),
	(5859, false, 'Provocar', 1465);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5860, false, 'shoryugeki', 1465),
	(5861, true, '1998', 1466),
	(5862, false, '1999', 1466),
	(5863, false, '2000', 1466),
	(5864, false, '2001', 1466),
	(5865, false, 'Amaldiçoado', 1467),
	(5866, false, 'Lento', 1467),
	(5867, false, 'sangramento', 1467),
	(5868, true, 'Veneno', 1467),
	(5869, true, 'Karazhan', 1468);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5870, false, 'Templo de Ahn''Qiraj', 1468),
	(5871, false, 'Toca do Asa Negra', 1468),
	(5872, false, 'Zul''Aman', 1468),
	(5873, false, 'Esgrimista Explosivo', 1469),
	(5874, false, 'Guerreiro Bastião', 1469),
	(5875, false, 'Víbora Alada', 1469),
	(5876, true, 'Águia partidária', 1469),
	(5877, true, 'George Lazenby', 1470),
	(5878, false, 'Roger Moore', 1470),
	(5879, false, 'Sean Connery', 1470);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5880, false, 'Timothy Dalton', 1470),
	(
		5881,
		false,
		'Castlevania: Sinfonia da Noite',
		1471
	),
	(5882, false, 'Contra', 1471),
	(5883, false, 'Gradius', 1471),
	(5884, true, 'Policiais', 1471),
	(
		5885,
		true,
		' Devil May Cry 3: O Despertar de Dante',
		1472
	),
	(5886, false, 'Devil May Cry', 1472),
	(5887, false, 'Devil May Cry 2', 1472),
	(5888, false, 'Devil May Cry 4', 1472),
	(5889, false, '376', 1473);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5890, false, '432', 1473),
	(5891, true, '474', 1473),
	(5892, false, '589', 1473),
	(5893, true, 'Bansai Ichiyanagi', 1474),
	(5894, false, 'Gregory Edgeworth', 1474),
	(5895, false, 'Manfred Von Karma', 1474),
	(5896, false, 'Tateyuki Shigaraki', 1474),
	(5897, false, 'Huragok', 1475),
	(5898, false, 'Sangheili', 1475),
	(5899, true, 'Unggoy', 1475);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5900, false, 'Yanme''e', 1475),
	(5901, false, 'Harebell', 1476),
	(5902, false, 'hortênsia', 1476),
	(5903, true, 'lírio do vale', 1476),
	(5904, false, 'Yarrow', 1476),
	(5905, false, '14 de dezembro de 2069', 1477),
	(5906, false, '15 de maio de 2058', 1477),
	(5907, true, '23 de outubro de 2077', 1477),
	(5908, false, '5 de novembro de 2076', 1477),
	(5909, false, 'Júlio', 1478);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5910, false, 'Kurt Zisa', 1478),
	(5911, true, 'Mestre Yen Sid', 1478),
	(5912, false, 'Sephiroth', 1478),
	(5913, true, 'Mario Kart Arcade GP DX', 1479),
	(5914, false, 'Mario Kart: Double Dash', 1479),
	(5915, false, 'Mário Kart DS', 1479),
	(5916, false, 'Super Circuito Mário Kart', 1479),
	(5917, false, 'Boston, Massachusetts', 1480),
	(5918, true, 'Chicago, Illinois', 1480),
	(
		5919,
		false,
		'Cidade de Nova York, Nova York',
		1480
	);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5920, false, 'Dallas, Texas', 1480),
	(5921, false, 'bolha de água', 1481),
	(5922, false, 'hidratação', 1481),
	(5923, false, 'Pressão', 1481),
	(5924, true, 'Telepatia', 1481),
	(5925, true, 'bactéria', 1482),
	(5926, false, 'Belsar', 1482),
	(5927, false, 'bydo', 1482),
	(5928, false, 'Império ORN', 1482),
	(5929, true, 'T. Yoshisaur Munchakoopas', 1483);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5930, false, 'T. Yoshisotop Munchakoopas', 1483),
	(5931, false, 'Yoshi', 1483),
	(5932, false, 'Yossy', 1483),
	(5933, true, 'Andariel', 1484),
	(5934, false, 'Kashya', 1484),
	(5935, false, 'Maltael', 1484),
	(5936, false, 'Valla', 1484),
	(5937, false, 'Bwonsamdi', 1485),
	(5938, true, 'Elortha no Shadra', 1485),
	(5939, false, 'Hakkar', 1485);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5940, false, 'Shirvallah', 1485),
	(5941, false, 'Mamãe Brickolini', 1486),
	(5942, false, 'Oficial Nick Brick', 1486),
	(5943, false, 'Papa Brickolini', 1486),
	(5944, true, 'Policial Laura Brick', 1486),
	(
		5945,
		false,
		'Documento de texto sobre ervas',
		1487
	),
	(5946, false, 'Documento sobre BOWs', 1487),
	(5947, false, 'Nada', 1487),
	(5948, true, 'Um Documento GDC', 1487),
	(5949, false, '110 m/s^2', 1488);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5950, false, '4,4 m/s^2', 1488),
	(5951, false, '9,42 m/s^2', 1488),
	(5952, true, '91,28 m/s^2', 1488),
	(5953, false, 'Macaco', 1489),
	(5954, false, 'Porco', 1489),
	(5955, false, 'Urso', 1489),
	(5956, true, 'Vaca', 1489),
	(5957, false, 'Edifício de dois andares', 1490),
	(5958, true, 'Escadaria', 1490),
	(5959, false, 'lançador de foguetes', 1490);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5960, false, 'Peça de teatro', 1490),
	(5961, true, 'IDCLIP', 1491),
	(5962, false, 'IDDQD', 1491),
	(5963, false, 'IDFA', 1491),
	(5964, false, 'IDSPISPOPD', 1491),
	(5965, false, 'Ascender da escuridão', 1492),
	(5966, false, 'Espete a Besta Alada', 1492),
	(5967, true, 'Levante o inferno', 1492),
	(5968, false, 'Liberdade', 1492),
	(5970, false, '"Não se mova."', 1493);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5971, false, '"Uau lá."', 1493),
	(5972, true, '"Você fez?"', 1493),
	(5973, false, '10.000', 1494),
	(5974, false, '15.000', 1494),
	(5975, true, '20.000', 1494),
	(5976, false, '25.000', 1494),
	(5977, false, 'brecourt', 1495),
	(5978, false, 'Castelo', 1495),
	(5979, true, 'Festung Recogne', 1495),
	(5980, false, 'Ste. Mere-Eglise (dia)', 1495);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5981, false, 'Dançarino Definitivo', 1496),
	(5982, false, 'Detetive Definitivo', 1496),
	(5983, false, 'jogador final', 1496),
	(5984, true, 'nadador final', 1496),
	(5985, false, 'A bala', 1497),
	(5986, true, 'O bruxo', 1497),
	(5987, false, 'O Cultista', 1497),
	(5988, false, 'O robô', 1497),
	(5989, true, 'O IDPD', 1498),
	(5990, false, 'o YVGG', 1498);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (5991, false, 'os bandidos', 1498),
	(5992, false, 'Os Homens-Peixe', 1498),
	(5993, false, '10', 1499),
	(5994, true, '13', 1499),
	(5995, false, '18', 1499),
	(5996, false, '6', 1499),
	(5997, false, 'Gerador 3', 1500),
	(5998, false, 'Gerador 4', 1500),
	(5999, true, 'Gerador 5', 1500),
	(6000, false, 'Local de escavação', 1500);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6001, true, 'DJ_Hyperfresh', 1501),
	(6002, false, 'I<30ffTh3H00k', 1501),
	(6003, false, 'Kidnotsquid123', 1501),
	(6004, false, 'MC.princesa', 1501),
	(6005, false, 'eu', 1502),
	(6006, false, 'm', 1502),
	(6007, false, 'n', 1502),
	(6008, true, 's', 1502),
	(
		6009,
		false,
		'Colt 1851 Revólver da Marinha',
		1503
	),
	(6010, false, 'Colt M1892', 1503);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6011, false, 'Colt Python', 1503),
	(6012, true, 'Exército de ação única Colt', 1503),
	(6013, false, 'larvesta', 1504),
	(6014, false, 'pikachu', 1504),
	(6015, true, 'Scyther', 1504),
	(6016, false, 'Sneasel', 1504),
	(6017, false, 'Atlas / P-Body', 1505),
	(6018, false, 'Caverna Johnson', 1505),
	(6019, true, 'GLaDOS', 1505),
	(6020, false, 'Wheatley', 1505);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6021, false, 'Anafi', 1506),
	(6022, true, 'Lemnos', 1506),
	(6023, false, 'Naxos', 1506),
	(6024, false, 'Ítaca', 1506),
	(6025, true, 'asa zero', 1507),
	(6026, false, 'Comandante de voo', 1507),
	(6027, false, 'F-Zero', 1507),
	(6028, false, 'Guerra nas Estrelas: X-Wing', 1507),
	(
		6029,
		true,
		'Ambos foram anunciados em 2013.',
		1508
	),
	(
		6030,
		false,
		'Ambos foram desenvolvidos por estúdios independentes.',
		1508
	);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (
		6031,
		false,
		'Ambos foram financiados coletivamente.',
		1508
	),
	(
		6032,
		false,
		'Ambos foram lançados para o PlayStation 3.',
		1508
	),
	(6033, true, 'Novos Lumos', 1509),
	(6034, false, 'O Arranha-Céus', 1509),
	(6035, false, 'Outro mundo', 1509),
	(6036, false, 'Peculia', 1509),
	(6037, false, 'Doença', 1510),
	(6038, false, 'Lesões', 1510),
	(6039, false, 'Perigo para os outros', 1510),
	(6040, true, 'Problemas de saúde mental', 1510);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6041, true, ' Arco', 1511),
	(6042, false, 'Arma de arco pesada', 1511),
	(6043, false, 'Arma leve', 1511),
	(6044, false, 'Martelo', 1511),
	(6045, true, 'Baía', 1512),
	(6046, false, 'Corrida', 1512),
	(6047, false, 'Deserto', 1512),
	(6048, false, 'Neve', 1512),
	(6049, false, '0x10c', 1513),
	(6050, true, 'Fortaleza dos Anões', 1513);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6051, false, 'Minecraft', 1513),
	(6052, false, 'Wurm Online', 1513),
	(6053, true, 'Fujin', 1514),
	(6054, false, 'Raijin', 1514),
	(6055, false, 'Seifer', 1514),
	(6056, false, 'Zell', 1514),
	(6057, false, 'Herbert P. Urso', 1515),
	(6058, true, 'O diretor', 1515),
	(6059, false, 'Presa', 1515),
	(6060, false, 'Ultimate Proto-Bot 10000', 1515);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6061, false, 'Electabuzz', 1516),
	(6062, true, 'Jynx', 1516),
	(6063, false, 'Magmar', 1516),
	(6064, false, 'Rhydon', 1516),
	(6065, false, 'de_açúcar cana', 1517),
	(6066, false, 'de_canais', 1517),
	(6067, false, 'de_militia', 1517),
	(6068, true, 'de_temporada', 1517),
	(6069, true, 'Arbok', 1518),
	(6070, false, 'Linoone', 1518);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6071, false, 'Nidoking', 1518),
	(6072, false, 'Touro', 1518),
	(
		6073,
		false,
		'A Lenda de Zelda: Aventuras em Quatro Espadas',
		1519
	),
	(
		6074,
		false,
		'A Lenda de Zelda: Máscara de Majora',
		1519
	),
	(
		6075,
		true,
		'A Lenda de Zelda: Princesa do Crepúsculo',
		1519
	),
	(
		6076,
		false,
		'Zelda II: A Aventura de Link',
		1519
	),
	(
		6077,
		false,
		'A Lenda de Zelda: Princesa do Crepúsculo',
		1520
	),
	(
		6078,
		false,
		'A Lenda de Zelda: Quatro Espadas',
		1520
	),
	(
		6079,
		true,
		'Lenda de Zelda: O Boné Minish',
		1520
	),
	(
		6080,
		false,
		'The Legend of Zelda: Spirit Tracks',
		1520
	);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6081, true, 'Contra-ataque', 1521),
	(6082, false, 'Half-Life 2: Episódio Dois', 1521),
	(6083, false, 'Portal', 1521),
	(6084, false, 'Team Fortress 2', 1521),
	(6085, false, 'Contra-ataque', 1522),
	(6086, false, 'Dia de derrota', 1522),
	(6087, false, 'Enxame Alienígena', 1522),
	(6088, true, 'Ricochete', 1522),
	(6089, true, 'contínuo', 1523),
	(6090, false, 'eRa Eternidade', 1523);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6091, false, 'GIFU', 1523),
	(6092, false, 'Santos Destreza', 1523),
	(
		6093,
		false,
		'Gordon o Motociclista Alienígena',
		1524
	),
	(
		6094,
		false,
		'Gordon o Motociclista Espacial',
		1524
	),
	(
		6095,
		false,
		'Ivan, o Motociclista Alienígena',
		1524
	),
	(
		6096,
		true,
		'Ivan, o Motociclista Espacial',
		1524
	),
	(6097, false, 'celeste', 1525),
	(6098, true, 'madona', 1525),
	(6099, false, 'Nina', 1525),
	(6100, false, 'Serra', 1525);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6101, false, 'Arthur', 1526),
	(6102, false, 'Cara de Gisbourne', 1526),
	(6103, true, 'Dirk, o ousado', 1526),
	(6104, false, 'Sir Toby Belch', 1526),
	(
		6105,
		false,
		'Artes marciais: King of the Hill',
		1527
	),
	(
		6106,
		false,
		'Guerreiros Aéreos: Batalha Suprema',
		1527
	),
	(6107, false, 'Lendas da Nintendo: Lute!', 1527),
	(6108, true, 'Rei Dragão: O Jogo de Luta', 1527),
	(6109, false, 'Kaguya Houraisan', 1528),
	(6110, false, 'Mystia Lorelei', 1528);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6111, false, 'rúmia', 1528),
	(6112, true, 'Tewi Inaba', 1528),
	(6113, true, 'Projeto Agulha', 1529),
	(6114, false, 'Projeto Bluespike', 1529),
	(6115, false, 'Projeto Darksphere', 1529),
	(6116, false, 'Projeto Roboegg', 1529),
	(6117, true, 'Corrida Automática Mattel', 1530),
	(6118, false, 'Game Boy', 1530),
	(6119, false, 'Jogo e Assistir', 1530),
	(6120, false, 'microvisão', 1530);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6121, false, 'Enterrado', 1531),
	(6122, false, 'Lua', 1531),
	(6123, true, 'multidão dos mortos', 1531),
	(6124, false, 'Origens', 1531),
	(6125, true, 'Eva Parasita', 1532),
	(6126, false, 'Final Fantasy VIII', 1532),
	(6127, false, 'história vagabunda', 1532),
	(6128, false, 'Missão de Frente', 1532),
	(6129, false, 'Guerra espacial!', 1533),
	(6130, false, 'pong', 1533);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6131, true, 'tênis para dois', 1533),
	(6132, false, 'Viagem ao espaço', 1533),
	(6133, false, 'Almas Demoníacas', 1534),
	(6134, false, 'Bloodborne', 1534),
	(6135, false, 'Dark Souls I', 1534),
	(6136, true, 'Dark Souls III', 1534),
	(6137, false, 'Caçador de Monstros 2', 1535),
	(6138, true, 'Caçador de Monstros 4', 1535),
	(
		6139,
		false,
		'Histórias de Caçadores de Monstros',
		1535
	),
	(
		6140,
		false,
		'Liberdade do Caçador de Monstros',
		1535
	);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (
		6141,
		false,
		'Fronteira do Caçador de Monstros',
		1536
	),
	(
		6142,
		false,
		'Gerações de Caçadores de Monstros',
		1536
	),
	(
		6143,
		false,
		'Monster Hunter Freedom Unite',
		1536
	),
	(6144, true, 'Monster Hunter Tri', 1536),
	(6145, false, '365/2 dias', 1537),
	(6146, true, 'Distância da queda do sonho', 1537),
	(6147, false, 'Nascimento pelo Sono', 1537),
	(6148, false, 'Re: cadeia de memórias', 1537),
	(6149, false, 'Almas Demoníacas', 1538),
	(6150, false, 'Almas escuras', 1538);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6151, false, 'almas negras 3', 1538),
	(6152, true, 'Almas Sombrias 2', 1538),
	(6153, true, 'Caneta TriIcelon', 1539),
	(6154, false, 'Escuro Perfeito', 1539),
	(
		6155,
		false,
		'Sylvester e Tweety em Cagey Capers',
		1539
	),
	(6156, false, 'Tetrisfera', 1539),
	(6157, false, 'C++', 1540),
	(6158, false, 'HTML 5', 1540),
	(6159, true, 'Java', 1540),
	(6160, false, 'Pitão', 1540);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6161, false, 'Motorista de entrega', 1541),
	(6162, false, 'Motorista de fuga', 1541),
	(6163, true, 'Piloto de corrida', 1541),
	(6164, false, 'Taxista', 1541),
	(6165, false, 'Kouya Aotsuki', 1542),
	(6166, true, 'Shin Kuroi', 1542),
	(6167, false, 'Soutarou Touno', 1542),
	(6168, false, 'Torahiko Ooshima', 1542),
	(6169, false, 'Etrian Odyssey', 1543),
	(6170, false, 'Persona', 1543);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6171, true, 'Professor Layton', 1543),
	(6172, false, 'Sam & Max', 1543),
	(6173, false, 'MP5K', 1544),
	(6174, true, 'MP5N', 1544),
	(6175, false, 'MP5RAS', 1544),
	(6176, false, 'MP5SD', 1544),
	(6177, false, 'aventura sônica', 1545),
	(6178, false, 'Madden 99', 1545),
	(6179, true, 'Tiger Woods 99 PGA Tour', 1545),
	(6180, false, 'Tony Hawk''s Pro Skater 3', 1545);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6181, false, 'asteróides', 1546),
	(6182, false, 'galaga', 1546),
	(6183, true, 'Invasores do espaço', 1546),
	(6184, false, 'Pac-Man', 1546),
	(6185, false, 'Abra seu coração', 1547),
	(6186, false, 'O seu mundo', 1547),
	(6187, true, 'Viva e aprenda', 1547),
	(
		6188,
		false,
		'Você consegue sentir o brilho do sol?',
		1547
	),
	(6189, false, ' Primeiro Sargento', 1548),
	(6190, false, 'Capitão', 1548);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6191, false, 'Funcionário Sargento', 1548),
	(6192, true, 'Primeiro-tenente', 1548),
	(6193, false, '100 km/h', 1549),
	(6194, true, '1000 km/h', 1549),
	(6195, false, '320 km/h', 1549),
	(6196, false, '500 km/h', 1549),
	(6197, false, 'Doisac', 1550),
	(6198, false, 'Eayn', 1550),
	(6199, true, 'Sanghelios', 1550),
	(6200, false, 'Te', 1550);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6201, true, 'armas negras', 1551),
	(6202, false, 'Colmeia Negra', 1551),
	(6203, false, 'O eclipse', 1551),
	(6204, false, 'o enxame', 1551),
	(6205, false, 'Ebola', 1552),
	(6206, true, 'gripe do dolar', 1552),
	(6207, false, 'Varíola', 1552),
	(6208, false, 'veneno vermelho', 1552),
	(6209, false, 'Bitmap', 1553),
	(6210, false, 'Peacehead', 1553);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6211, true, 'Raster', 1553),
	(6212, false, 'Vectorkid', 1553),
	(6213, false, 'Amonkhet', 1554),
	(6214, false, 'Ravnica', 1554),
	(6215, true, 'Shandalar', 1554),
	(6216, false, 'theros', 1554),
	(6217, true, 'Dr. N. Gin', 1555),
	(6218, false, 'Dr. Neo Cortex', 1555),
	(6219, false, 'Irmãos Komodo', 1555),
	(6220, false, 'minúsculo tigre', 1555);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6221, false, '13 de março de 1997', 1556),
	(6222, false, '22 de março de 1997', 1556),
	(6223, true, '24 de agosto de 1996', 1556),
	(6224, false, '26 de dezembro de 1994', 1556),
	(6225, false, '1997', 1557),
	(6226, true, '1998', 1557),
	(6227, false, '1999', 1557),
	(6228, false, '2004', 1557),
	(6229, false, '14 de novembro de 2002', 1558),
	(6230, false, '18 de julho de 2004', 1558);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6231, false, '1º de dezembro de 2003', 1558),
	(6232, true, '29 de outubro de 2003', 1558),
	(6233, false, '2 de janeiro de 2017', 1559),
	(6234, false, '24 de maio de 2016', 1559),
	(6235, false, '5 de junho de 2016', 1559),
	(6236, true, '6 de julho de 2016', 1559),
	(6237, true, '2003', 1560),
	(6238, false, '2004', 1560),
	(6239, false, '2007', 1560),
	(6240, false, '2011', 1560);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6241, false, '1 milhão', 1561),
	(6242, true, '1.5 milhões', 1561),
	(6243, false, '250 mil', 1561),
	(6244, false, 'menos de 250 mil', 1561),
	(6245, true, '107', 1562),
	(6246, false, '108', 1562),
	(6247, false, '93', 1562),
	(6248, false, '96', 1562),
	(6249, false, '12 horas', 1563),
	(6250, false, '4 horas', 1563);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6251, false, '5 horas', 1563),
	(6252, true, '8 horas', 1563),
	(6253, false, '12 minutos, 59 segundos', 1564),
	(6254, true, '20 minutos, 41 segundos', 1564),
	(6255, false, '45 minutos, 32 segundos', 1564),
	(6256, false, '5 minutos, 50 segundos', 1564),
	(6257, false, '100', 1565),
	(6258, false, '132', 1565),
	(6259, true, '169', 1565),
	(6260, false, '245', 1565);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6261, false, '3', 1566),
	(6262, false, '4', 1566),
	(6263, true, '5', 1566),
	(6264, false, '6', 1566),
	(6265, false, '10', 1567),
	(6266, false, '12', 1567),
	(6267, false, '6', 1567),
	(6268, true, '8', 1567),
	(6269, false, '100', 1568),
	(6270, true, '105', 1568);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6271, false, '73', 1568),
	(6272, false, '98', 1568),
	(6273, false, '10', 1569),
	(6274, false, '6', 1569),
	(6275, true, '7', 1569),
	(6276, false, '9', 1569),
	(6277, false, '48', 1570),
	(6278, false, '51', 1570),
	(6279, false, '55', 1570),
	(6280, true, '58', 1570);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6281, false, 'Lagosta', 1571),
	(6283, false, 'Peixe-espada', 1571),
	(6284, false, 'Salmão', 1571),
	(6285, true, 'Acelerador Cronal', 1572),
	(
		6286,
		false,
		'Manipulador de Deslocamento Espacial',
		1572
	),
	(6287, false, 'PISCAR', 1572),
	(
		6288,
		false,
		'TMD (dispositivo de manipulação de tempo)',
		1572
	),
	(6289, true, 'Deid Mann', 1573),
	(6290, false, 'Frank Sahwit', 1573),
	(6291, false, 'Raymond Shields', 1573);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6292, false, 'Shey De Killer', 1573),
	(6293, true, ' Shedinja', 1574),
	(6294, false, ' Silvally', 1574),
	(6295, false, 'Sableye', 1574),
	(6296, false, 'Spiritomb', 1574),
	(6297, true, 'Diamante/Pérola', 1575),
	(6298, false, 'Preto branco', 1575),
	(6299, false, 'rubi/safira', 1575),
	(6300, false, 'X/Y', 1575),
	(6301, false, 'Aluno Azarado Final', 1576);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6302, true, 'Aluno sortudo', 1576),
	(6303, false, 'corredor final', 1576),
	(6304, false, 'Detetive Definitivo', 1576),
	(6305, false, 'Grand Theft Auto V', 1577),
	(6306, true, 'Minecraft', 1577),
	(6307, false, 'não virado', 1577),
	(6308, false, 'roblox', 1577),
	(6309, false, 'Bellevue', 1578),
	(6310, true, 'Las Vegas', 1578),
	(6311, false, 'Londres', 1578);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6312, false, 'Paris', 1578),
	(6313, false, 'Deixado 4 Morto 2', 1579),
	(6314, false, 'Dota 2', 1579),
	(6315, false, 'meia-vida 3', 1579),
	(6316, true, 'Portal 2', 1579),
	(6317, false, 'Berretas Duplas', 1580),
	(6318, true, 'Glock-18', 1580),
	(6319, false, 'Tec-9', 1580),
	(6320, false, 'Águia do deserto', 1580),
	(6321, false, 'Austin, Texas', 1581);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6322, true, 'Bellevue, Washington', 1581),
	(6323, false, 'Seattle, Washington', 1581),
	(6324, false, 'São Francisco, Califórnia', 1581),
	(6325, false, 'Invasores do espaço', 1582),
	(6326, false, 'Lutador de rua', 1582),
	(6327, false, 'manopla', 1582),
	(6328, true, 'Pac-Man', 1582),
	(6329, false, 'Empreendimento', 1583),
	(6330, false, 'Infinidade', 1583),
	(6331, true, 'Normandia', 1583);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6332, false, 'Osiris', 1583),
	(6333, true, 'Caçarola', 1584),
	(6334, false, 'Pizza de Calabresa', 1584),
	(6335, false, 'Sopa de galinha', 1584),
	(6336, false, 'Subsanduíche', 1584),
	(6337, true, 'Horrível Lawton', 1585),
	(6338, false, 'Longino', 1585),
	(6339, false, 'predador', 1585),
	(6340, false, 'V-R11', 1585),
	(6341, false, 'Gersch Device', 1586);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6342, true, 'Pack-A-Punch', 1586),
	(6343, false, 'pontapé de mula', 1586),
	(6344, false, 'Wunderfizz', 1586),
	(6345, false, 'A Irmandade de Aço', 1587),
	(6346, true, 'O Enclave', 1587),
	(6347, false, 'O Instituto', 1587),
	(6348, false, 'Os Minutemen', 1587),
	(6349, true, 'Lúcio', 1588),
	(6350, false, 'Misericórdia', 1588),
	(6351, false, 'Reinhardt', 1588);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6352, false, 'Sombra', 1588),
	(6353, true, 'Boston', 1589),
	(6354, false, 'Detroit', 1589),
	(6355, false, 'Nova Iorque', 1589),
	(6356, false, 'Sidney', 1589),
	(6357, true, 'Espião', 1590),
	(6358, false, 'Médico', 1590),
	(6359, false, 'Pesado', 1590),
	(6360, false, 'piro', 1590),
	(6361, true, 'Eu nunca pedi isso', 1591);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6362, false, 'Extremo', 1591),
	(6363, false, 'Guru', 1591),
	(6364, false, 'Pesadelo', 1591),
	(6365, false, 'O traje HEV', 1592),
	(6366, false, 'seus punhos', 1592),
	(6367, true, 'um pé de cabra', 1592),
	(6368, false, 'uma pistola', 1592),
	(6369, true, 'Über Update', 1593),
	(6370, false, 'Atualização da Mann-Conomy', 1593),
	(6371, false, 'Atualização da Piromania', 1593);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6372, false, 'Atualização do engenheiro', 1593),
	(6373, false, 'oranda', 1594),
	(6374, true, 'orendi', 1594),
	(6375, false, 'Orendoo', 1594),
	(6376, false, 'randy', 1594),
	(6377, false, 'Carcer', 1595),
	(6378, false, 'Liberdade', 1595),
	(6379, true, 'Steelport', 1595),
	(6380, false, 'Stilwater', 1595),
	(6381, false, 'Ana', 1596);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6382, false, 'Betty', 1596),
	(6383, false, 'diana', 1596),
	(6384, true, 'Sasha', 1596),
	(6385, true, 'Marlon', 1597),
	(6386, false, 'Marnie', 1597),
	(6387, false, 'marvin', 1597),
	(6388, false, 'Morris', 1597),
	(6389, false, 'cão impertinente', 1598),
	(6390, false, 'Guarda do Infinito', 1598),
	(6391, false, 'jogos de marreta', 1598);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6392, true, 'Treyarch', 1598),
	(6393, false, 'Maria', 1599),
	(6394, true, 'Morgana', 1599),
	(6395, false, 'peluche', 1599),
	(6396, false, 'Ryuji', 1599),
	(6397, false, 'Chloe Preço', 1600),
	(6398, true, 'Maxine Caulfield', 1600),
	(6399, false, 'Stella Colina', 1600),
	(6400, false, 'Victoria Chase', 1600),
	(6401, true, 'Estus Flask', 1601);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6402, false, 'frasco cinza', 1601),
	(6403, false, 'Poção de saúde', 1601),
	(6404, false, 'Suco de laranja', 1601),
	(6405, true, 'Link', 1602),
	(6406, false, 'Mário', 1602),
	(6407, false, 'Poço', 1602),
	(6408, false, 'Zelda', 1602),
	(6409, false, 'Dunban', 1603),
	(6410, false, 'Fiora', 1603),
	(6411, false, 'Reyn', 1603);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6412, true, 'Shulk', 1603),
	(6413, false, '#001', 1604),
	(6414, true, '#025', 1604),
	(6415, false, '#031', 1604),
	(6416, false, '#109', 1604),
	(6417, false, 'Almasy', 1605),
	(6418, true, 'De coração', 1605),
	(6419, false, 'Loire', 1605),
	(6420, false, 'Trepe', 1605),
	(6421, true, 'aréola', 1606);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6422, false, 'Sombras', 1606),
	(6423, false, 'Suíte de abertura', 1606),
	(6424, false, 'Suíte Outono', 1606),
	(6425, false, 'Ceifador da Perdição', 1607),
	(6426, false, 'Doom Guy', 1607),
	(6427, false, 'Doom Marine', 1607),
	(6428, true, 'Doom Slayer', 1607),
	(6429, true, 'Adão, o Palhaço', 1608),
	(6430, false, 'Larry o açougueiro', 1608),
	(6431, false, 'Os condenados', 1608);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6432, false, 'penhasco Hudson', 1608),
	(6433, false, '13 de janeiro de 2019', 1609),
	(6434, false, '1º de outubro de 2019', 1609),
	(6435, true, '31 de outubro de 2019', 1609),
	(6436, false, '6 de setembro de 2018', 1609),
	(6437, true, '17 de novembro de 2009', 1610),
	(6438, false, '3 de maio de 2008', 1610),
	(6439, false, '30 de junho de 2010', 1610),
	(6440, false, '30 de novembro de 2009', 1610),
	(6441, false, '2007', 1611);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6442, false, '2009', 1611),
	(6443, true, '2011', 1611),
	(6444, false, '2014', 1611),
	(6445, false, '2000', 1612),
	(6446, true, '2003', 1612),
	(6447, false, '2006', 1612),
	(6448, false, '2010', 1612),
	(6449, true, '17 de maio de 2009', 1613),
	(6450, false, '17 de setembro de 2009', 1613),
	(6451, false, '18 de novembro de 2011', 1613);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6452, false, '7 de outubro de 2011', 1613),
	(6453, false, '5', 1614),
	(6454, false, '6', 1614),
	(6455, true, '7', 1614),
	(6456, false, '8', 1614),
	(6457, false, '3', 1615),
	(6458, false, '4', 1615),
	(6459, false, '5', 1615),
	(6460, true, '6', 1615),
	(6461, true, '10', 1616);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6462, false, '13', 1616),
	(6463, false, '14', 1616),
	(6464, false, '16', 1616),
	(6465, false, '1', 1617),
	(6466, false, '2', 1617),
	(6467, false, '3', 1617),
	(6468, true, '4', 1617),
	(6469, true, 'Counter-Strike 1.6', 1618),
	(6470, false, 'Meia-vida', 1618),
	(6471, false, 'meia-vida 2', 1618);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6472, false, 'Team Fortress', 1618),
	(6473, false, 'Dragão', 1619),
	(6474, false, 'Dragão de fogo', 1619),
	(6475, false, 'Fogo', 1619),
	(6476, true, 'Fogo/Voar', 1619),
	(
		6477,
		false,
		'Dinheiro de sangue assassino',
		1620
	),
	(6478, false, 'Grand Theft Auto Vice City', 1620),
	(
		6479,
		true,
		'Grand Theft Auto: San Andreas',
		1620
	),
	(6480, false, 'Mamãe cozinhando', 1620),
	(6481, false, 'Liu Kang', 1621);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6482, false, 'Raiden', 1621),
	(6483, false, 'Shang Tsung', 1621),
	(6484, true, 'Shao Kahn', 1621),
	(6485, false, 'Artes eletrônicas', 1622),
	(6486, false, 'Jogos Pixeltail', 1622),
	(6487, false, 'Ubisoft', 1622),
	(6488, true, 'Válvula', 1622),
	(6489, false, 'Gunpei Yokoi', 1623),
	(6490, true, 'Hideo Kojima', 1623),
	(6491, false, 'Hiroshi Yamauchi', 1623);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6492, false, 'Shigeru Miyamoto', 1623),
	(6493, false, ' Tommy Refenes', 1624),
	(6494, true, 'Alec Holowka', 1624),
	(6495, false, 'Ron Gilbert', 1624),
	(6496, false, 'Tim Schafer', 1624),
	(6497, false, 'David Hayter', 1625),
	(6498, false, 'Hideo Kojima', 1625),
	(6499, true, 'Kiefer Sutherland', 1625),
	(6500, false, 'Norman Reedus', 1625),
	(6501, false, 'Amy', 1626);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6502, true, 'Caudas', 1626),
	(6503, false, 'juntas', 1626),
	(6504, false, 'Sombra', 1626),
	(6505, false, 'Bill Trinen', 1627),
	(6506, false, 'Hideo Kojima', 1627),
	(6507, true, 'Masahiro Sakurai', 1627),
	(6508, false, 'Reggie Fils-AimÉ', 1627),
	(6509, false, 'Crepúsculo Fronteira', 1628),
	(6510, false, 'junho', 1628),
	(6511, false, 'Tasofro', 1628);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6512, true, 'Zun', 1628),
	(6513, false, 'Ben Affleck', 1629),
	(6514, true, 'Chris Metzen', 1629),
	(6515, false, 'Jason Derulo', 1629),
	(6516, false, 'Jim Carrey', 1629),
	(6517, false, 'Caverna Johnson', 1630),
	(6518, false, 'Saxton Hale', 1630),
	(6519, false, 'Wallace Breem', 1630),
	(6520, true, 'Zepheniah Mann', 1630),
	(6521, false, 'CABALA', 1631);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6522, false, 'Joseph Stalin', 1631),
	(6523, true, 'Kane', 1631),
	(6524, false, 'Yuri', 1631),
	(6525, false, 'Branca', 1632),
	(6526, false, 'candela', 1632),
	(6527, true, 'Fagulha', 1632),
	(6528, false, 'Salgueiro', 1632),
	(6529, true, 'Branca', 1633),
	(6530, false, 'candela', 1633),
	(6531, false, 'Fagulha', 1633);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6532, false, 'Salgueiro', 1633),
	(6533, false, 'Branca', 1634),
	(6534, true, 'candela', 1634),
	(6535, false, 'Fagulha', 1634),
	(6536, false, 'Salgueiro', 1634),
	(6537, true, 'Adrian Shephard', 1635),
	(6538, false, 'Alyx Vance', 1635),
	(6539, false, 'Barney Calhoun', 1635),
	(6540, false, 'Gordon Freeman', 1635),
	(6541, false, 'chefe mestre', 1636);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6542, false, 'Comandante Shepard', 1636),
	(6543, false, 'Gordon Freeman', 1636),
	(6544, true, 'Isaac Clarke', 1636),
	(6545, true, 'Hajime Hinata', 1637),
	(6546, false, 'Junko Enoshima', 1637),
	(6547, false, 'Makoto Naegi', 1637),
	(6548, false, 'Nagito Komaeda', 1637),
	(6549, true, 'Eric Idle', 1638),
	(6550, false, 'John Cleese', 1638),
	(6551, false, 'Michael Palin', 1638);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6552, false, 'Terry Gilliam', 1638),
	(6553, false, 'aviões', 1639),
	(6554, true, 'carros', 1639),
	(6555, false, 'helicópteros', 1639),
	(6556, false, 'submarinos', 1639),
	(6557, false, '2', 1640),
	(6558, true, '3', 1640),
	(6559, false, '4', 1640),
	(6560, false, '5', 1640),
	(6561, true, 'Atire neles', 1641);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6562, false, 'Casual', 1641),
	(6563, false, 'Estratégia', 1641),
	(6564, false, 'FPS', 1641),
	(6565, true, '1111', 1642),
	(6566, false, '1337', 1642),
	(6567, false, '1432', 1642),
	(6568, false, 'Nenhum código', 1642),
	(6569, false, '13', 1643),
	(6570, false, '2', 1643),
	(6571, true, '3', 1643);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6572, false, '5', 1643),
	(6573, false, 'Nia', 1644),
	(6574, false, 'rex', 1644),
	(6575, true, 'Torá', 1644),
	(6576, false, 'Zeke', 1644),
	(6577, true, 'Dab', 1645),
	(6578, false, 'Dodge Roll', 1645),
	(6579, false, 'lançamento de pizza', 1645),
	(6580, false, 'Spin Dash', 1645),
	(6581, false, 'Cabala', 1646);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6582, true, 'Corvo', 1646),
	(6583, false, 'Icaro', 1646),
	(6584, false, 'Legião', 1646),
	(6585, true, 'Contrabando', 1647),
	(6586, false, 'diminuído', 1647),
	(6587, false, 'Interrompido', 1647),
	(6588, false, 'Limitado', 1647),
	(6589, false, 'Hajime Hinata', 1648),
	(6590, false, 'Komaru Naegi', 1648),
	(6591, true, 'Makoto Naegi', 1648);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6592, false, 'Nagito Komaeda', 1648),
	(6593, true, 'Fane', 1649),
	(6594, false, 'Lohse', 1649),
	(
		6595,
		false,
		'Não há personagens de origem esquelética',
		1649
	),
	(6596, false, 'o príncipe vermelho', 1649),
	(6597, false, 'Gamorah', 1650),
	(6598, true, 'Lucky 38', 1650),
	(6599, false, 'Os topos', 1650),
	(6600, false, 'Ultra Luxo', 1650),
	(6601, false, 'Céu nas alturas', 1651);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (
		6602,
		false,
		'Instalação de Pesquisa Aeteroquímica',
		1651
	),
	(6603, true, 'palácio dos mortos', 1651),
	(6604, false, 'Templo Submerso de Qarn', 1651),
	(6605, false, 'De Santos', 1652),
	(6606, false, 'Simpson', 1652),
	(6607, true, 'Townley', 1652),
	(6608, false, 'Watson', 1652),
	(6609, false, '10', 1653),
	(6610, false, '12', 1653),
	(6611, false, '13', 1653);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6612, true, '14', 1653),
	(6613, false, 'Comida Burro', 1654),
	(
		6614,
		false,
		'Posto Avançado de Vídeo "Too"',
		1654
	),
	(6615, true, 'Snack Falcão', 1654),
	(6616, false, 'velha picareta', 1654),
	(6617, true, 'Clarão', 1655),
	(6618, false, 'Corte', 1655),
	(6619, false, 'Força', 1655),
	(6620, false, 'Voar', 1655),
	(6621, false, 'Google', 1656);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6622, false, 'Maçã', 1656),
	(6623, true, 'Microsoft', 1656),
	(6624, false, 'Yahoo', 1656),
	(6625, false, 'mega homem', 1657),
	(6626, true, 'Rad Mobile', 1657),
	(6627, false, 'Sonic O ouriço', 1657),
	(6628, false, 'Super Mário 64', 1657),
	(6629, false, 'Mario Golf: Tour Toadstool', 1658),
	(6630, false, 'Mario Kart: Double Dash!!', 1658),
	(6631, false, 'Mario Party 3', 1658);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6632, true, 'Mário Tênis', 1658),
	(6633, false, 'iD Tech 1', 1659),
	(6634, true, 'iD Tech 2', 1659),
	(6635, false, 'iD Tech 3', 1659),
	(6636, false, 'motor irreal', 1659),
	(6637, true, ' almas', 1660),
	(6638, false, ' Fantasia final', 1660),
	(6639, false, 'A lenda de Zelda', 1660),
	(6640, false, 'Caçador de monstros', 1660),
	(6641, false, '1987', 1661);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6642, true, '1998', 1661),
	(6643, false, '2001', 1661),
	(6644, false, '2004', 1661),
	(6645, false, '2011', 1662),
	(6646, false, '2012', 1662),
	(6647, true, '2013', 1662),
	(6648, false, '2014', 1662),
	(6649, false, '2011', 1663),
	(6650, true, '2012', 1663),
	(6651, false, '2013', 1663);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6652, false, '2014', 1663),
	(6653, false, '2008', 1664),
	(6654, false, '2011', 1664),
	(6655, true, '2012', 1664),
	(6656, false, '2013', 1664),
	(6657, false, '2005', 1665),
	(6658, true, '2007', 1665),
	(6659, false, '2009', 1665),
	(6660, false, '2010', 1665),
	(6661, true, '2007', 1666);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6662, false, '2008', 1666),
	(6663, false, '2009', 1666),
	(6664, false, '2010', 1666),
	(6665, false, '1983', 1667),
	(6666, true, '1985', 1667),
	(6667, false, '1986', 1667),
	(6668, false, '1987', 1667),
	(6669, false, '2008', 1668),
	(6670, false, '2011', 1668),
	(6671, true, '2014', 1668);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6672, false, '2015', 1668),
	(6673, false, '2011', 1669),
	(6674, false, '2012', 1669),
	(6675, false, '2013', 1669),
	(6676, true, '2014', 1669),
	(6677, false, '2001', 1670),
	(6678, false, '2003', 1670),
	(6679, true, '2009', 1670),
	(6680, false, '2010', 1670),
	(6681, false, '2003', 1671);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6682, false, '2004', 1671),
	(6683, true, '2006', 1671),
	(6684, false, '2007', 1671),
	(6685, false, '2011', 1672),
	(6686, false, '2013', 1672),
	(6687, true, '2015', 1672),
	(6688, false, '2016', 1672),
	(6689, true, 'Cidade 17', 1673),
	(6690, false, 'Cidade 18', 1673),
	(6691, false, 'cidade 45', 1673);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6692, false, 'cidade 6', 1673),
	(6693, false, '3ª Guerra Mundial', 1674),
	(6694, true, 'Guerra Fria', 1674),
	(6695, false, 'Primeira Guerra Mundial', 1674),
	(6696, false, 'Vietnã', 1674),
	(
		6697,
		false,
		'Centro Comercial Praça Central',
		1675
	),
	(6698, false, 'Centro Comercial Twin Pines', 1675),
	(
		6699,
		true,
		'Centro Comercial Willamette Parkview',
		1675
	),
	(6700, false, 'Liberty Mall', 1675),
	(6701, true, '1', 1676);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6702, false, '2', 1676),
	(6703, false, '3', 1676),
	(6704, false, '5', 1676),
	(6705, false, 'Callie & Marie', 1677),
	(6706, false, 'Diamond & Aquamarina', 1677),
	(6707, false, 'DJ Octavio & Crusty Sean', 1677),
	(6708, true, 'Pérola e Marina', 1677),
	(6709, false, 'Bowser', 1678),
	(6710, false, 'luigi', 1678),
	(6711, true, 'Sapo', 1678);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6712, false, 'Yoshi', 1678),
	(6713, false, 'Carro novo', 1679),
	(6714, false, 'Dinheiro', 1679),
	(6715, true, 'Mais perguntas', 1679),
	(6716, false, 'Misericórdia', 1679),
	(6717, false, 'Azul', 1680),
	(6718, true, 'Laranja', 1680),
	(6719, false, 'Marrom', 1680),
	(6720, false, 'Verde', 1680),
	(6721, true, 'Donkey Kong', 1681);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6722, false, 'Kirby', 1681),
	(6723, false, 'Mário', 1681),
	(6724, false, 'Zelda', 1681),
	(
		6725,
		true,
		'Arena de batalha online multijogador (MOBA)',
		1682
	),
	(
		6726,
		false,
		'Estratégia em Tempo Real (RTS)',
		1682
	),
	(6727, false, 'Role Playing Game (RPG)', 1682),
	(
		6728,
		false,
		'Tiro em primeira pessoa (FPS)',
		1682
	),
	(6729, false, 'As pessoas', 1683),
	(6730, false, 'O ajuste de contas', 1683),
	(6731, true, 'O pacto', 1683);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6732, false, 'Os Assassinos', 1683),
	(6733, false, 'Braço', 1684),
	(6734, true, 'Cabeça', 1684),
	(6735, false, 'Peito', 1684),
	(6736, false, 'Perna', 1684),
	(6737, false, 'Agente 27', 1685),
	(6738, true, 'Agente 47', 1685),
	(6739, false, 'Agente 67', 1685),
	(6740, false, 'Agente Smith', 1685),
	(6741, false, 'Billy Cobra', 1686);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6742, false, 'Cobra Kulus', 1686),
	(6743, false, 'Gilur Cobra', 1686),
	(6744, true, 'Serpente Líquida', 1686),
	(6745, false, 'Altaïr Ibn-La''Ahad', 1687),
	(6746, false, 'Assunto 16', 1687),
	(6747, true, 'Assunto 17', 1687),
	(6748, false, 'Assunto 18', 1687),
	(6749, false, 'Argamassa', 1688),
	(6750, false, 'Ataque Aéreo', 1688),
	(6751, true, 'Bazuca', 1688);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6752, false, 'Granada', 1688),
	(6753, false, 'Fio de Fibra', 1689),
	(6754, false, 'Katana', 1689),
	(6755, false, 'Marreta', 1689),
	(6756, true, 'Pé de cabra', 1689),
	(6757, false, 'Eliwood', 1690),
	(6758, true, 'Marth', 1690),
	(6759, false, 'Robin', 1690),
	(6760, false, 'Roy', 1690),
	(6761, true, 'Lenda do Rank 1', 1691);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6762, false, 'Mestre de Nível 1', 1691),
	(6763, false, 'Rank 1 Elite', 1691),
	(6764, false, 'Rank 1 Supremo', 1691),
	(6765, false, 'Ana e Faraó', 1692),
	(6766, true, 'Junkrat e Roadhog', 1692),
	(6767, false, 'McCree e Deadeye', 1692),
	(6768, false, 'Roadrat e Junkhog', 1692),
	(6769, false, 'Ricardo Epcar', 1693),
	(6770, false, 'Steve Blum', 1693),
	(6771, true, 'Will Stamper', 1693);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6772, false, 'Yuri Lowenthal', 1693),
	(6773, true, 'Beowulf', 1694),
	(6774, false, 'cerebelo', 1694),
	(6775, false, 'Grande banda', 1694),
	(6776, false, 'Squigly', 1694),
	(6777, false, 'Alice', 1695),
	(6778, false, 'Jéssica', 1695),
	(6779, false, 'olívia', 1695),
	(6780, true, 'sophia', 1695),
	(6781, false, 'cabanela', 1696);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6782, true, 'Jeego míope', 1696),
	(6783, false, 'Míssil', 1696),
	(6784, false, 'Um Passo à Frente Tengo', 1696),
	(6785, true, 'Esqueleto', 1697),
	(6786, false, 'Horror', 1697),
	(6787, false, 'Plantar', 1697),
	(6788, false, 'Sapo', 1697),
	(6789, false, 'Cynder', 1698),
	(6790, false, 'Feiticeira', 1698),
	(6791, true, 'Gnasty Gnorc', 1698);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6792, false, 'Ripto', 1698),
	(6793, false, 'Carvão', 1699),
	(6795, false, 'Corda', 1699),
	(6796, false, 'Trigo', 1699),
	(6797, false, 'Madeira e carvão', 1700),
	(6798, false, 'Madeira e Fogo', 1700),
	(6799, true, 'Pau e Carvão', 1700),
	(6800, false, 'Vara e fogo', 1700),
	(6801, false, 'A arte de esgueirar-se', 1701),
	(6802, false, 'Raccoonus Teachus', 1701);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6803, true, 'Thievius Raccoonus', 1701),
	(6804, false, 'Treinamento de guaxinim 101', 1701),
	(6805, false, 'Alex Mercer', 1702),
	(6806, false, 'Dana Mercer', 1702),
	(6807, true, 'James Heller', 1702),
	(
		6808,
		false,
		'Qualquer Golias vagando por aí',
		1702
	),
	(6809, true, 'Campeão', 1703),
	(6810, false, 'Duque', 1703),
	(6811, false, 'Krotchy', 1703),
	(6812, false, 'Snoopy', 1703);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6813, true, 'batedor', 1704),
	(6814, false, 'Engenheiro', 1704),
	(6815, false, 'Espião', 1704),
	(6816, false, 'piro', 1704),
	(6817, false, '3ª Guerra Mundial', 1705),
	(
		6818,
		false,
		'A bomba nuclear de Black Mesa',
		1705
	),
	(6819, true, 'A cascata de ressonância', 1705),
	(6820, false, 'O Ataque Xen', 1705),
	(6821, false, 'a combinação', 1706),
	(6822, true, 'A UCE', 1706);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6823, false, 'Navy Seals', 1706),
	(6824, false, 'os fuzileiros navais', 1706),
	(6825, false, 'Faraó', 1707),
	(6826, false, 'Hanzo', 1707),
	(6827, true, 'McCree', 1707),
	(6828, false, 'Soldado: 76', 1707),
	(6829, false, 'Christopher Lloyd', 1708),
	(6830, true, 'JK Simmons', 1708),
	(6831, false, 'John Patrick Lowrie', 1708),
	(6832, false, 'Nolan Norte', 1708);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6833, true, 'Combate mortal', 1709),
	(6834, false, 'Duke Nukem', 1709),
	(6835, false, 'Resident Evil', 1709),
	(6836, false, 'Ruína', 1709),
	(6837, false, 'Nome de uma nave espacial', 1710),
	(6838, false, 'O nome do chefe final', 1710),
	(
		6839,
		false,
		'O nome do personagem principal',
		1710
	),
	(6840, true, 'Um inimigo no jogo', 1710),
	(
		6841,
		false,
		'Eu Odiaria Ser Seu Motorista',
		1711
	),
	(
		6842,
		false,
		'Eu quero ter bebês que você para baixo',
		1711
	);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (
		6843,
		false,
		'Eu teria comprado seu cachorro',
		1711
	),
	(6844, true, 'Eu teria sido seu pai', 1711),
	(6845, false, 'caixa de metal', 1712),
	(6846, true, 'Caixa de papelão', 1712),
	(6847, false, 'dispositivo de camuflagem', 1712),
	(6848, false, 'Recorte de papelão', 1712),
	(6849, false, 'Mago', 1713),
	(6850, false, 'Noites de inverno nunca', 1713),
	(6851, true, 'Os Pergaminhos Antigos', 1713),
	(6852, false, 'Senhor dos Anéis', 1713);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6853, false, 'Leite, Açúcar e Trigo', 1714),
	(6854, true, 'Leite, Açúcar, Ovo e Trigo', 1714),
	(
		6855,
		false,
		'Leite, Cana de Açúcar, Ovo e Trigo',
		1714
	),
	(6856, false, 'Leite, Pão, Ovo e Trigo', 1714),
	(6857, false, 'GTA IV e GTA San Andreas', 1715),
	(6858, false, 'GTA IV e GTA Vice City', 1715),
	(6859, true, 'GTA V e GTA San Andreas', 1715),
	(6860, false, 'GTA V e GTA Vice City', 1715),
	(6861, true, 'CDC', 1716),
	(6862, false, 'Limpadores', 1716);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6863, false, 'Rikers', 1716),
	(6864, false, 'último batalhão', 1716),
	(6865, false, 'Revólver R8', 1717),
	(6866, false, 'SG553', 1717),
	(6867, false, 'USP-S', 1717),
	(6868, true, 'XM1014', 1717),
	(6869, false, 'aviário', 1718),
	(6870, false, 'Humano', 1718),
	(6871, false, 'Hylotl', 1718),
	(6872, true, 'Novakid', 1718);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6873, false, 'Criador de jogos: Studio', 1719),
	(6874, true, 'Irreal', 1719),
	(6875, false, 'Motor de Choro', 1719),
	(6876, false, 'Unidade', 1719),
	(6877, true, 'Colina do Cogumelo', 1720),
	(6878, false, 'fuga da cidade', 1720),
	(6879, false, 'Planeta Wisp', 1720),
	(6880, false, 'Santuário Celeste', 1720),
	(6881, false, 'Alex Kidd', 1721),
	(6882, false, 'Dynamite Headdy', 1721);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6883, false, 'Opa-Opa', 1721),
	(6884, true, 'Sonic O ouriço', 1721),
	(6885, false, 'arma de raios', 1722),
	(6886, false, 'Carniceiro', 1722),
	(6887, false, 'GKZ-45 Mk3', 1722),
	(6888, true, 'R115 Ressonador', 1722),
	(6889, true, 'Curador', 1723),
	(6890, false, 'Demoman', 1723),
	(6891, false, 'Espião', 1723),
	(6892, false, 'piro', 1723);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6893, false, 'A Irmandade', 1724),
	(6894, true, 'O Império Zin', 1724),
	(6895, false, 'Os Filhos de Samedi', 1724),
	(6896, false, 'os ronins', 1724),
	(6897, false, 'Assalto', 1725),
	(6898, false, 'Cache', 1725),
	(6899, false, 'Miragem', 1725),
	(6900, true, 'Plataforma de petróleo', 1725),
	(6901, false, 'Conta', 1726),
	(6902, false, 'Louis', 1726);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6903, true, 'usuario', 1726),
	(6904, false, 'zoey', 1726),
	(6905, true, 'Invocador', 1727),
	(6906, false, 'Misericórdia', 1727),
	(6907, false, 'Winston', 1727),
	(6908, false, 'Zenyatta', 1727),
	(6909, false, 'Franklin', 1728),
	(6910, true, 'Lamar', 1728),
	(6911, false, 'Michael', 1728),
	(6912, false, 'Trevor', 1728);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6913, false, 'Equipe Instinto', 1729),
	(6914, false, 'Equipe Mystic', 1729),
	(6915, true, 'Equipe Rocket', 1729),
	(6916, false, 'Valor da equipe', 1729),
	(6917, true, 'Comandante Keen', 1730),
	(6918, false, 'Peixe Freddi', 1730),
	(6919, false, 'Pijama Sam', 1730),
	(6920, false, 'Putt-Putt', 1730),
	(6921, true, 'Esqueleto', 1731),
	(6922, false, 'Lobisomem', 1731);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6923, false, 'Minotauro', 1731),
	(6924, false, 'Vampiro', 1731),
	(6925, false, 'Corrida do ouro', 1732),
	(6926, false, 'Hoodoo', 1732),
	(6927, false, 'Para cima', 1732),
	(6928, true, 'Pedreira', 1732),
	(6929, false, 'Grand Theft Auto 5', 1733),
	(6930, true, 'Justa causa 2', 1733),
	(
		6931,
		false,
		'The Elder Scrolls 4: Oblivion',
		1733
	),
	(
		6932,
		false,
		'The Witcher 3: Caçada Selvagem',
		1733
	);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6933, false, 'Drasna', 1734),
	(6934, true, 'malva', 1734),
	(6935, false, 'Siebold', 1734),
	(6936, false, 'Wikstrom', 1734),
	(6937, false, 'mega homem', 1735),
	(6938, false, 'Paperman', 1735),
	(6939, true, 'Rockman', 1735),
	(6940, false, 'Tesoura', 1735),
	(6941, true, 'Elenco dos sonhos', 1736),
	(6942, false, 'SNES', 1736);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6943, false, 'Trocar', 1736),
	(6944, false, 'Wii', 1736),
	(6945, false, 'Ibuki', 1737),
	(6946, false, 'Laura Matsuda', 1737),
	(6947, true, 'Mai Shiranui', 1737),
	(6948, false, 'Sakura Kasugano', 1737),
	(6949, false, 'Monika', 1738),
	(6950, false, 'natsuki', 1738),
	(6951, true, 'Nico', 1738),
	(6952, false, 'Sayori', 1738);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6953, true, 'Marcador', 1739),
	(6954, false, 'Sombra', 1739),
	(6955, false, 'Symmetra', 1739),
	(6956, false, 'viúva', 1739),
	(6957, false, 'Aço', 1740),
	(6958, false, 'Escuro', 1740),
	(6959, false, 'Fada', 1740),
	(6960, true, 'Gelo', 1740),
	(6961, true, 'Blizzard Entertainment', 1741),
	(6962, false, 'Estúdios Hi-Rez', 1741);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (
		6963,
		false,
		'Software da caixa de velocidades',
		1741
	),
	(6964, false, 'Válvula', 1741),
	(6965, false, 'Activision', 1742),
	(6966, false, 'Artes eletrônicas', 1742),
	(6967, true, 'Harmonix', 1742),
	(6968, false, 'Konami', 1742),
	(
		6969,
		true,
		'Team Fortress 2: Irmandade de Armas',
		1743
	),
	(
		6970,
		false,
		'Team Fortress 2: Mercenários do Deserto',
		1743
	),
	(
		6971,
		false,
		'Team Fortress 2: Operação Gear Grinder',
		1743
	),
	(
		6972,
		false,
		'Team Fortress 2: Retorno ao Clássico',
		1743
	);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6973, false, 'Fantasma', 1744),
	(6974, true, 'Titã', 1744),
	(6975, false, 'Ómega', 1744),
	(6976, false, 'Ômnico', 1744),
	(6977, false, 'Coco Bandicoot', 1745),
	(6978, false, 'Toupeira Maravilhosa', 1745),
	(6979, false, 'Wally Wombat', 1745),
	(6980, true, 'Willie Wombat', 1745),
	(6981, false, 'Chefe de cozinha', 1746),
	(6982, true, 'fotojornalista', 1746);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6983, false, 'Taxista', 1746),
	(6984, false, 'Zelador', 1746),
	(6985, false, '21 de maio de 2009', 1747),
	(6986, false, '22 de junho de 2010', 1747),
	(6987, false, '28 de julho de 2008', 1747),
	(6988, true, '29 de abril de 2008', 1747),
	(6989, false, 'Campo de batalha 1', 1748),
	(6990, true, 'Campo de batalha 1942', 1748),
	(6991, false, 'Campo de batalha 2', 1748),
	(6992, false, 'Campo de batalha do Vietnã', 1748);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (6993, true, 'aréola', 1749),
	(6994, false, 'Campo de batalha', 1749),
	(6995, false, 'Chamada à ação', 1749),
	(6996, false, 'Fronteiras', 1749),
	(6997, false, 'Game Boy Advance', 1750),
	(6998, false, 'Game Boy Advance SP', 1750),
	(6999, true, 'Game Boy Color', 1750),
	(7000, false, 'Gameboy micro', 1750),
	(7001, false, 'Leite', 1751),
	(7002, false, 'Ovo', 1751);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7003, true, 'Pão', 1751),
	(7004, false, 'Trigo', 1751),
	(7005, false, 'Mudkip', 1752),
	(7006, false, 'Oshawott', 1752),
	(7007, true, 'Piplup', 1752),
	(7008, false, 'Totodile', 1752),
	(
		7009,
		false,
		'Animal Crossing: Mundo Selvagem',
		1753
	),
	(7010, false, 'Animal Crossing: New Leaf', 1753),
	(
		7011,
		false,
		'Animal Crossing: população crescendo!',
		1753
	),
	(
		7012,
		true,
		'Animal Crossing: Povo da Cidade',
		1753
	);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7013, true, 'a aventura de kirby', 1754),
	(7014, false, 'A Terra dos Sonhos de Kirby', 1754),
	(7015, false, 'Kirby Super Star', 1754),
	(7016, false, 'Kirby''s Dream Land 2', 1754),
	(7017, false, 'Mario Party 2', 1755),
	(7018, false, 'papel mario', 1755),
	(7019, true, 'Super Mário 64', 1755),
	(7020, false, 'Super Smash Bros.', 1755),
	(7021, false, 'CD do Sonic', 1756),
	(7022, false, 'Explosão 3D Sônica', 1756);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7023, true, 'Sonic & Knuckles', 1756),
	(7024, false, 'Sonic 2', 1756),
	(7025, false, 'Final Fantasy IX', 1757),
	(7026, false, 'Final Fantasy V', 1757),
	(7027, true, 'Final Fantasy X-2', 1757),
	(7028, false, 'Final Fantasy XIII-2', 1757),
	(7029, false, 'Cidade de Salém', 1758),
	(7030, true, 'Entre no Gungeon', 1758),
	(7031, false, 'Torre Unida', 1758),
	(7032, false, 'Undertale', 1758);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7033, false, 'Alfa', 1759),
	(7034, true, 'lambda', 1759),
	(7035, false, 'Sigma', 1759),
	(7036, false, 'Ómega', 1759),
	(7037, false, 'Nuketown', 1760),
	(7038, true, 'Origens', 1760),
	(7039, false, 'revelações', 1760),
	(7040, false, 'Shangri-lá', 1760),
	(7041, false, 'bruno', 1761),
	(7042, true, 'Lança', 1761);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7043, false, 'Lorelei', 1761),
	(7044, false, 'ágatha', 1761),
	(7045, false, 'Elizabeth', 1762),
	(7046, false, 'margarida', 1762),
	(7047, false, 'Maria', 1762),
	(7048, true, 'Teodoro', 1762),
	(7049, true, 'Eles Foram Assim', 1763),
	(
		7050,
		false,
		'Isso não é um chute na cabeça',
		1763
	),
	(7051, false, 'Ring-a-Ding Ding', 1763),
	(7052, false, 'Venha voar comigo', 1763);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7053, false, ' vietnamita', 1764),
	(7054, false, 'chinês', 1764),
	(7055, true, 'coreano', 1764),
	(7056, false, 'japonês', 1764),
	(7057, false, '55', 1765),
	(7058, true, '60', 1765),
	(7059, false, '65', 1765),
	(7060, false, '70', 1765),
	(7061, false, 'Conta', 1766),
	(7062, false, 'Drake', 1766);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7063, false, 'Mallary', 1766),
	(7064, true, 'Scooter', 1766),
	(7065, false, 'Lucas', 1767),
	(7066, false, 'mega homem', 1767),
	(7067, false, 'Samus', 1767),
	(7068, true, 'Xeque', 1767),
	(7069, false, 'Arceus', 1768),
	(7070, true, 'Audino', 1768),
	(7071, false, 'Silvally', 1768),
	(7072, false, 'Tipo: Nulo', 1768);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7073, false, 'buggy', 1769),
	(7074, false, 'Dácia', 1769),
	(7075, true, 'Motocicleta', 1769),
	(7076, false, 'PG-117', 1769),
	(7077, false, 'AWP', 1770),
	(7078, true, 'Cicatriz-20/G3SG1', 1770),
	(7079, false, 'M4A1', 1770),
	(7080, false, 'Revólver R8', 1770),
	(7081, true, ' Corações honestos', 1771),
	(7082, false, 'Blues do Velho Mundo', 1771);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7083, false, 'Dinheiro Morto', 1771),
	(7084, false, 'estrada solitária', 1771),
	(7085, false, 'anômalo', 1772),
	(7086, false, 'comedor de almas', 1772),
	(7087, true, 'o ancião', 1772),
	(7088, false, 'O Rei Lich', 1772),
	(7089, false, '2009', 1773),
	(7090, true, '2011', 1773),
	(7091, false, '2012', 1773),
	(7092, false, '2014', 1773);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7093, false, ' Asura', 1774),
	(7094, false, 'charr', 1774),
	(7095, false, 'Sylvari', 1774),
	(7096, true, 'tengu', 1774),
	(7097, true, 'annie', 1775),
	(7098, false, 'lulu', 1775),
	(7099, false, 'Tristana', 1775),
	(7100, false, 'Veigar', 1775),
	(7101, true, '50 Bênçãos', 1776),
	(7102, false, '50 santos', 1776);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7103, false, 'Bênçãos Americanas', 1776),
	(7104, false, 'Bênçãos da URSS', 1776),
	(7105, false, 'Ellie', 1777),
	(7106, false, 'marlene', 1777),
	(7107, true, 'sara', 1777),
	(7108, false, 'tess', 1777),
	(
		7109,
		true,
		'Hack Earthbound Halloween da Radiation',
		1778
	),
	(7110, false, 'Homestuck: [S] Wake', 1778),
	(7111, false, 'Mãe: Dissonância Cognitiva', 1778),
	(7112, false, 'Undertale', 1778);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7113, false, 'ALGOL', 1779),
	(7114, false, 'C', 1779),
	(7115, false, 'C++', 1779),
	(7116, true, 'Montagem x86', 1779),
	(7117, false, 'Infame 2', 1780),
	(
		7118,
		true,
		'Need for Speed: Most Wanted (2005)',
		1780
	),
	(7119, false, 'Saints Row: O Terceiro', 1780),
	(7120, false, 'Vingança de Burnout', 1780),
	(7121, true, '2004', 1781),
	(7122, false, '2006', 1781);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7123, false, '2007', 1781),
	(7124, false, '2008', 1781),
	(7125, false, ' Prédio', 1782),
	(
		7126,
		false,
		'Estratégia Baseada em Turnos',
		1782
	),
	(7127, false, 'MMORPG', 1782),
	(
		7128,
		true,
		'Shoot ''em up (bullet-hell) e luta',
		1782
	),
	(
		7129,
		true,
		' Fuga Zero Dilema de Tempo Zero',
		1783
	),
	(
		7130,
		false,
		' Nove horas, nove pessoas, nove portas',
		1783
	),
	(
		7131,
		false,
		'A última recompensa de Zero Escape Virtue',
		1783
	),
	(
		7132,
		false,
		'O jogo Nonary: a última vida de Sigma',
		1783
	);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7133, false, 'Mini Thwomp', 1784),
	(7134, false, 'Pequeno Thwomp', 1784),
	(7135, true, 'Thwimps', 1784),
	(7136, false, 'Tiny Tims', 1784),
	(
		7137,
		true,
		' Mário está desaparecido! Versão MS-DOS',
		1785
	),
	(
		7138,
		false,
		'Mário está desaparecido! Versão do NES',
		1785
	),
	(
		7139,
		false,
		'Mário está desaparecido! Versão MSX',
		1785
	),
	(
		7140,
		false,
		'Mário está desaparecido! Versão SNES',
		1785
	),
	(
		7141,
		false,
		'Capacidade dos cartuchos de ROM em megabytes',
		1786
	),
	(
		7142,
		false,
		'O número de megabytes de RAM',
		1786
	);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (
		7143,
		true,
		'Os bits na arquitetura da CPU',
		1786
	),
	(
		7144,
		false,
		'Velocidade do clock da CPU em Hertz',
		1786
	),
	(7145, false, 'chocolate alemão', 1787),
	(7146, false, 'chocolate derretido', 1787),
	(7147, false, 'comida do diabo', 1787),
	(7148, true, 'Floresta Negra', 1787),
	(7149, false, 'Insinuações', 1788),
	(7150, true, 'Mário', 1788),
	(7151, false, 'Octolings', 1788),
	(7152, false, 'Zelda', 1788);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7153, false, 'Arthur', 1789),
	(7154, true, 'Citar', 1789),
	(7155, false, 'Encaracolado', 1789),
	(7156, false, 'Kazuma', 1789),
	(
		7157,
		false,
		'A história não foi boa o suficiente',
		1790
	),
	(
		7158,
		false,
		'Eles não ficaram satisfeitos com o resultado',
		1790
	),
	(
		7159,
		false,
		'Muitos bugs para serem corrigidos',
		1790
	),
	(7160, true, 'O código-fonte vazou', 1790),
	(7161, false, 'Assassinato', 1791),
	(7162, true, 'Corrida armamentista', 1791);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7163, false, 'Desativação da bomba', 1791),
	(7164, false, 'Resgate de Reféns', 1791),
	(7165, false, 'Antártica', 1792),
	(7166, false, 'Austrália', 1792),
	(7167, true, 'Nova Zelândia', 1792),
	(7168, false, 'África do Sul', 1792),
	(7169, false, 'dito', 1793),
	(7170, false, 'Gysahl', 1793),
	(7171, false, 'Hyrule', 1793),
	(7172, true, 'Término', 1793);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7173, false, 'EA', 1794),
	(7174, false, 'nintendo', 1794),
	(7175, false, 'sony', 1794),
	(7176, true, 'Ubisoft', 1794),
	(7177, false, '14 de janeiro de 2005', 1795),
	(7178, false, '17 de junho de 2001', 1795),
	(7179, true, '20 de maio de 2003', 1795),
	(7180, false, '29 de setembro de 2003', 1795),
	(7181, true, 'Alexey Pajitnov', 1796),
	(7182, false, 'Allan Alcorn', 1796);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7183, false, 'Toru Iwatani', 1796),
	(7184, false, 'William Higinbotham', 1796),
	(
		7185,
		false,
		'Microsoft® Estúdios de jogos™ | XBox™',
		1797
	),
	(
		7186,
		true,
		'Nintendo® Ltda. | GameCube™',
		1797
	),
	(
		7187,
		false,
		'Sega® Enterprises Co. Ltd. | Dreamcast™',
		1797
	),
	(
		7188,
		false,
		'Sony® Entretenimento de computador Co Inc. | PlayStation® 2',
		1797
	),
	(7189, false, 'Combate mortal', 1798),
	(7190, false, 'Lutador de rua', 1798),
	(7191, false, 'missão do Dragão', 1798),
	(7192, true, 'Tekken', 1798);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7193, false, 'Diddy Kong', 1799),
	(7194, true, 'Lucas', 1799),
	(7195, false, 'mega homem', 1799),
	(7196, false, 'Meta Cavaleiro', 1799),
	(7197, false, 'Alphys e Undyne', 1800),
	(7198, true, 'Frisk & Chara', 1800),
	(7199, false, 'Sans & Papyrus', 1800),
	(7200, false, 'Toriel & Asgore', 1800),
	(7201, false, 'Papai e Nana', 1801),
	(7202, false, 'Papai e Nina', 1801);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7203, true, 'Popo e Nana', 1801),
	(7204, false, 'Popo e Nina', 1801),
	(7205, true, 'Double Tap Root Beer', 1802),
	(7206, false, 'Juggernog', 1802),
	(7207, false, 'pontapé de mula', 1802),
	(7208, false, 'Quem é quem', 1802),
	(7209, false, 'Daft Punk', 1803),
	(7210, false, 'DJ Sombra', 1803),
	(7211, true, 'Dr. Dre', 1803),
	(7212, false, 'Grande Mestre Flash', 1803);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7213, false, 'Brendan Gleeson', 1804),
	(7214, false, 'Kiefer Sutherland', 1804),
	(7215, true, 'Liam Neeson', 1804),
	(7216, false, 'Robbie Coltrane', 1804),
	(7217, true, 'Caso de fuga', 1805),
	(7218, false, 'Caso Esports 2014', 1805),
	(7219, false, 'Caso Vanguarda', 1805),
	(7220, false, 'Estojo Sombra', 1805),
	(7221, true, ' Michael Jackson', 1806),
	(7222, false, ' Sorvete de baunilha', 1806);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7223, false, 'George Michael', 1806),
	(7224, false, 'Principe', 1806),
	(7225, false, 'BMW Z8', 1807),
	(7226, false, 'Ford Coroa Vitória', 1807),
	(7227, false, 'McLaren F1', 1807),
	(7228, true, 'Toyota MR2', 1807),
	(7229, false, 'Atlanta', 1808),
	(7230, true, 'Cluj-Napoca', 1808),
	(7231, false, 'Colônia', 1808),
	(7232, false, 'Londres', 1808);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7233, false, 'Cortana', 1809),
	(7234, false, 'Princesa pêssego', 1809),
	(7235, true, 'Sarah Kerrigan', 1809),
	(7236, false, 'zoey', 1809),
	(7237, false, 'fantasma', 1810),
	(7238, true, 'Médico', 1810),
	(7239, false, 'SCV', 1810),
	(7240, false, 'Vaso Científico', 1810),
	(7241, false, 'Clockwerk', 1811),
	(7242, true, 'Dimitri Lousteau', 1811);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7243, false, 'Muggshot', 1811),
	(7244, false, 'Mz. Rubi', 1811),
	(7245, false, 'CZ-75', 1812),
	(7246, true, 'SCAR-20', 1812),
	(7247, false, 'SG 550', 1812),
	(7248, false, 'XM1014', 1812),
	(7249, false, 'Antecipação', 1813),
	(7250, true, 'Outro meio', 1813),
	(7251, false, 'Ruínas', 1813),
	(7252, false, 'tensão desnecessária', 1813);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7253, true, 'Areia', 1814),
	(7254, false, 'Pedra do Fim', 1814),
	(7255, false, 'Placas de madeira', 1814),
	(7256, false, 'Água', 1814),
	(7257, true, 'Worms 4: Desordem', 1815),
	(7258, false, 'Worms Recarregados', 1815),
	(7259, false, 'Worms WMD', 1815),
	(7260, false, 'Worms: Open Warfare 2', 1815),
	(7261, false, 'Mario Kart: Double Dash', 1816),
	(7262, true, 'Mario Kart: Super Circuito', 1816);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7263, false, 'Mário Kart 64', 1816),
	(7264, false, 'Super Mário Kart', 1816),
	(7265, false, 'Ruína', 1817),
	(7266, true, 'Spasim', 1817),
	(7267, false, 'Terremoto', 1817),
	(7268, false, 'Wolfenstein', 1817),
	(7269, false, 'Além do bem e do mal', 1818),
	(7270, true, 'Folclore', 1818),
	(7271, false, 'ICO', 1818),
	(7272, false, 'sombra do colosso', 1818);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (
		7273,
		false,
		'Dominic "Bandido" Brunsmeier',
		1819
	),
	(7274, false, 'Eliza "Ash" Cohen', 1819),
	(
		7275,
		true,
		'Rastreamento "Thermite" de Jordan',
		1819
	),
	(7276, false, 'Seamus "Sledge" Cowden', 1819),
	(7277, true, 'disfarce', 1820),
	(7278, false, 'Escolta', 1820),
	(7279, false, 'Olhe', 1820),
	(7280, false, 'Transportador', 1820),
	(7281, true, 'espeta o texugo', 1821),
	(7282, false, 'espio o camaleão', 1821);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7283, false, 'Poderoso o Tatu', 1821),
	(7284, false, 'Rouge o Morcego', 1821),
	(7285, false, 'Bowser', 1822),
	(7286, false, 'Mewtwo', 1822),
	(7287, true, 'Pêssego', 1822),
	(7288, false, 'Rei Dededé', 1822),
	(7289, false, 'irmãos Komodo', 1823),
	(7290, false, 'Nitro Óxido', 1823),
	(7291, false, 'papu papu', 1823),
	(7292, true, 'Ripper Roo', 1823);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7293, false, 'Meta Cavaleiro', 1824),
	(7294, false, 'Poço', 1824),
	(7295, false, 'ROUBAR', 1824),
	(7296, true, 'Serpente Sólida', 1824),
	(7297, false, 'Conexão Phoenix', 1825),
	(7298, false, 'Guerra de guerrilha', 1825),
	(7299, true, 'Milícia Centro-Oeste', 1825),
	(7300, false, 'Tripulação de Elite', 1825),
	(7301, false, '747', 1826),
	(7302, false, 'Havana', 1826);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7303, false, 'Plataforma de petróleo', 1826),
	(7304, true, 'Prodígio', 1826),
	(7305, false, 'Branca', 1827),
	(7306, false, 'candela', 1827),
	(7307, false, 'Fagulha', 1827),
	(7308, true, 'leif', 1827),
	(7309, false, 'Las Venturas', 1828),
	(7310, true, 'San Andreas', 1828),
	(7311, false, 'San Fierro', 1828),
	(7312, false, 'vice-cidade', 1828);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7313, true, 'Belushya Guba', 1829),
	(7314, false, 'Georgopol', 1829),
	(7315, false, 'pochinki', 1829),
	(7316, false, 'Yasnaya Polyana', 1829),
	(7317, false, 'Candyman', 1830),
	(7318, true, 'rex', 1830),
	(7319, false, 'Sonata', 1830),
	(7320, false, 'Trocar', 1830),
	(7321, false, '300SL Roadster', 1831),
	(7322, false, 'Cascavel de Ossos', 1831);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7323, false, 'Dasher', 1831),
	(7324, true, 'Wiggler selvagem', 1831),
	(7325, false, 'Cthulu', 1832),
	(7326, false, 'Espinho', 1832),
	(7327, true, 'Hidra', 1832),
	(7328, false, 'Tremor', 1832),
	(7329, true, 'Call of Duty 3', 1833),
	(
		7330,
		false,
		'Call of Duty 4: Modern Warfare',
		1833
	),
	(
		7331,
		false,
		'Call of Duty: Caminhos para a Vitória',
		1833
	),
	(
		7332,
		false,
		'Call of Duty: Mundo em Guerra',
		1833
	);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7333, false, 'Grand Theft Auto', 1834),
	(7334, false, 'Grand Theft Auto 2', 1834),
	(7335, true, 'Grand Theft Auto III', 1834),
	(7336, false, 'Grand Theft Auto Vice City', 1834),
	(7337, false, 'Burt Reynolds', 1835),
	(7338, false, 'Hulk Hogan', 1835),
	(7339, true, 'Ron Jeremy', 1835),
	(7340, false, 'Sasha Gray', 1835),
	(7341, true, 'cogumelo dourado', 1836),
	(7342, false, 'Estrela', 1836);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7343, false, 'Projeto de lei', 1836),
	(7344, false, 'Vaia', 1836),
	(7345, false, 'Pokémon Black', 1837),
	(7346, true, 'Pokémon Crystal', 1837),
	(7347, false, 'Pokémon FireRed', 1837),
	(7348, false, 'Pokémon Platinum', 1837),
	(
		7349,
		true,
		'Divisores de tempo: futuro perfeito',
		1838
	),
	(
		7350,
		false,
		'Dragon Ball Z: Budokai Tenkaichi 3',
		1838
	),
	(7351, false, 'Marvel vs. Capcom 2', 1838),
	(7352, false, 'Mortal Kombat: Armagedom', 1838);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7353, false, 'Fallout 3', 1839),
	(7354, false, 'Fallout 4', 1839),
	(7355, true, 'Fallout: Nova Vegas', 1839),
	(7356, false, 'The Elder Scrolls V: Skyrim', 1839),
	(7357, false, 'Araquanid', 1840),
	(7358, false, 'Dragalge', 1840),
	(7359, true, 'Luminídeo', 1840),
	(7360, false, 'Mandibuzz', 1840),
	(7361, false, 'Godot', 1841),
	(7362, false, 'Jacques Portsman', 1841);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7363, true, 'Jake Marshall', 1841),
	(7364, false, 'Miles Edgeworth', 1841),
	(7365, false, 'Chris Redfield', 1842),
	(7366, false, 'Helena Harper', 1842),
	(7367, true, 'Jill Valentine', 1842),
	(7368, false, 'Sherry Birkin', 1842),
	(7369, true, 'Cayde-6', 1843),
	(7370, false, 'Leon S. Kennedy', 1843),
	(7371, false, 'Mordecai, o Caçador', 1843),
	(7372, false, 'Ostrava de Boletaria', 1843);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7373, false, 'Blizzard Entertainment', 1844),
	(7374, false, 'jogos de cauda de andorinha', 1844),
	(7375, true, 'Olá jogos', 1844),
	(7376, false, 'Válvula', 1844),
	(7377, false, 'Jogos da Groenlândia', 1845),
	(7378, true, 'Jogos Greenheart', 1845),
	(7379, false, 'MomCorp', 1845),
	(7380, false, 'Os magnatas', 1845),
	(7381, false, 'Capcom', 1846),
	(7382, false, 'Konami', 1846);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7383, false, 'Nevasca', 1846),
	(7384, true, 'Square Enix', 1846),
	(7385, false, 'Guild Wars', 1847),
	(7386, false, 'Meridiano 59', 1847),
	(7387, true, 'ultima online', 1847),
	(7388, false, 'World of Warcraft', 1847),
	(7389, false, 'Jaguatirica', 1848),
	(7390, false, 'Moleiro', 1848),
	(7391, true, 'Serpente "Venom" punida', 1848),
	(7392, false, 'Serpente Sólida', 1848);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7393, false, ' Zona Altíssimo', 1849),
	(7394, true, 'Zona da cidade de genocídio', 1849),
	(7395, false, 'Zona Mecânica', 1849),
	(7396, false, 'Zona Stardust Speedway', 1849),
	(7397, true, 'A coisa', 1850),
	(7398, false, 'Estrangeiro', 1850),
	(7399, false, 'Os mortos maus', 1850),
	(7400, false, 'Serra', 1850),
	(7401, true, 'Atualização Sniper vs. Spy', 1851),
	(
		7402,
		false,
		'Conheça sua atualização de correspondência',
		1851
	);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (
		7403,
		false,
		'Espião vs. Atualização do engenheiro',
		1851
	),
	(7404, false, 'GUERRA! Atualizar', 1851),
	(7405, false, 'Call of Duty Black Ops', 1852),
	(
		7406,
		false,
		'Call of Duty Modern Warfare 2',
		1852
	),
	(7407, false, 'Call of Duty: Black Ops III', 1852),
	(
		7408,
		true,
		'Call of Duty: Mundo em Guerra',
		1852
	),
	(7409, false, 'Destinos', 1853),
	(7410, false, 'Dota 2', 1853),
	(7411, false, 'meia-vida 2', 1853),
	(7412, true, 'O laboratório', 1853);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7413, false, ' Tekken', 1854),
	(7414, false, 'engrenagem de metal', 1854),
	(7415, true, 'fuga do macaco', 1854),
	(7416, false, 'Tumba 2!', 1854),
	(7417, false, 'Mário Kart 7', 1855),
	(7418, false, 'Novo Super Mario Bros. 2', 1855),
	(7419, false, 'Super Mário Maker', 1855),
	(7420, true, 'Terra Super Mário 3D', 1855),
	(7421, false, 'Battletoads', 1856),
	(7422, false, 'País de Donkey Kong', 1856);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7423, false, 'RC Pro-Am', 1856),
	(7424, true, 'Ziguezague', 1856),
	(7425, true, 'Cinturão de Astros', 1857),
	(7426, false, 'covil do dragão', 1857),
	(7427, false, 'MAC 3', 1857),
	(7428, false, 'Missão do Cubo', 1857),
	(7429, false, 'Buddyfight', 1858),
	(7430, false, 'Pokémon', 1858),
	(7431, true, 'Relógio Yo-kai', 1858),
	(7432, false, 'Yu-gi-oh', 1858);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7433, false, 'assassino Templar', 1859),
	(7434, true, 'Comandante da Legião', 1859),
	(7435, false, 'Guardiao da Luz', 1859),
	(7436, false, 'Machado', 1859),
	(7437, true, 'Cristiano Ronaldo', 1860),
	(7438, false, 'Harry Kane', 1860),
	(7439, false, 'Lionel Messi', 1860),
	(7440, false, 'Neymar', 1860),
	(7441, false, 'Boulder Dash', 1861),
	(7442, false, 'intrigado', 1861);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7443, false, 'Jenga', 1861),
	(7444, true, 'tetris', 1861),
	(7445, false, 'Caos; Criança', 1862),
	(7446, true, 'Ocultismo; Nove', 1862),
	(7447, false, 'Robótica; Notas', 1862),
	(7448, false, 'Steins; Portão', 1862),
	(7449, false, 'Caminhada TNT', 1863),
	(7450, false, 'esquimós', 1863),
	(7451, false, 'pinguins', 1863),
	(7452, true, 'Ursos polares', 1863);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7453, false, 'chuva de caveira', 1864),
	(7454, false, 'concha de veludo', 1864),
	(7455, true, 'corvo vermelho', 1864),
	(7456, false, 'Linha de poeira', 1864),
	(7457, false, 'Aurélia', 1865),
	(7458, false, 'Austrália', 1865),
	(7459, false, 'Japão', 1865),
	(7460, true, 'O mar', 1865),
	(7461, false, 'Ana', 1866),
	(7462, false, 'Ceifador', 1866);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7463, true, 'Misericórdia', 1866),
	(7464, false, 'sônica', 1866),
	(7465, true, 'lutadores Mii', 1867),
	(7466, false, 'Mewtwo', 1867),
	(7467, false, 'Ness', 1867),
	(7468, false, 'ROUBAR', 1867),
	(7469, false, 'Lester Crista', 1868),
	(7470, true, 'Michael Cárdenas', 1868),
	(7471, false, 'Packie McReary', 1868),
	(7472, false, 'Tommy Vercetti', 1868);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7473, true, 'o garoto', 1869),
	(7474, false, 'Rucks', 1869),
	(7475, false, 'Zia', 1869),
	(7476, false, 'Zulf', 1869),
	(7477, true, 'AK-47', 1870),
	(7478, false, 'AK-74', 1870),
	(7479, false, 'CZ-75 AUTO', 1870),
	(7480, false, 'M4A4', 1870),
	(7481, true, 'Conta', 1871),
	(7482, false, 'Francisco', 1871);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7483, false, 'Louis', 1871),
	(7484, false, 'zoey', 1871),
	(7485, false, 'Fnatic', 1872),
	(7486, true, 'SK Gaming', 1872),
	(7487, false, 'Team Liquid', 1872),
	(7488, false, 'Virtus.pro', 1872),
	(
		7489,
		false,
		'Counter-Strike: Ofensiva Global',
		1873
	),
	(7490, false, 'Deixado 4 Morto 2', 1873),
	(7491, true, 'Portal 2', 1873),
	(7492, false, 'Team Fortress 2', 1873);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7493, false, '100', 1874),
	(7494, false, '50', 1874),
	(7495, true, '70', 1874),
	(7496, false, '95', 1874),
	(
		7497,
		true,
		'10 anos de prisão e multa de $ 50.000',
		1875
	),
	(
		7498,
		false,
		'15 anos de prisão e multa de $ 10.000',
		1875
	),
	(7499, false, 'Multa de $ 5.000', 1875),
	(7500, false, 'Nada', 1875),
	(7501, false, 'Auxílio abutre', 1876),
	(7502, true, 'cereja elétrica', 1876);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7503, false, 'Lápide', 1876),
	(7504, false, 'Revitalização rápida', 1876),
	(7505, false, 'lesma', 1877),
	(7506, true, 'minhoca trufada', 1877),
	(7507, false, 'Peixe de aparência suspeita', 1877),
	(7508, false, 'rei gafanhoto', 1877),
	(7509, false, 'Kátia Managan', 1878),
	(7510, true, 'Margarida Borowski', 1878),
	(7511, false, 'Marlena Woborski', 1878),
	(7512, false, 'Milena Catharina', 1878);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7513, true, 'As pedras sagradas', 1879),
	(7514, false, 'caminho da radiação', 1879),
	(7515, false, 'Despertar', 1879),
	(7516, false, 'Espada Flamejante', 1879),
	(7517, false, 'Andazi', 1880),
	(7518, false, 'Lobo', 1880),
	(7519, false, 'Nico', 1880),
	(7520, true, 'trico', 1880),
	(7521, false, 'conchas do mar', 1881),
	(7522, false, 'Folhas', 1881);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7523, false, 'Insetos', 1881),
	(7524, true, 'sinos', 1881),
	(7525, true, 'Anti-espectrômetro de massa', 1882),
	(7526, false, 'gerador de oscilação', 1882),
	(7527, false, 'Reator de fusão escura', 1882),
	(7528, false, 'ressonador de fusão escura', 1882),
	(7529, true, 'Baunilha', 1883),
	(7530, false, 'hortelã', 1883),
	(7531, false, 'Morango', 1883),
	(7532, false, 'Pêssego', 1883);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7533, true, 'Arsene', 1884),
	(7534, false, 'Izanagi', 1884),
	(7535, false, 'Mara', 1884),
	(7536, false, 'Sandaflon', 1884),
	(7537, false, 'AK', 1885),
	(7538, false, 'AK-74', 1885),
	(7539, true, 'CV-47', 1885),
	(7540, false, 'CZ-75', 1885),
	(7541, false, 'Boregard', 1886),
	(7542, true, 'hora', 1886);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7543, false, 'Jackson', 1886),
	(7544, false, 'James', 1886),
	(7545, false, 'O diretor', 1887),
	(7546, false, 'O Supervisor', 1887),
	(7547, false, 'O zelador', 1887),
	(7548, true, 'zelador', 1887),
	(7549, false, 'anel de aço', 1888),
	(7550, false, 'Despejo', 1888),
	(7551, true, 'Sempre Fi', 1888),
	(7552, false, 'vendeta', 1888);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7553, false, 'FOXALIVE', 1889),
	(7554, true, 'FOXDIE', 1889),
	(7555, false, 'FOXENGINE', 1889),
	(7556, false, 'FOXKILL', 1889),
	(7557, false, 'Glukkons', 1890),
	(7558, false, 'Scrabs', 1890),
	(7559, true, 'Sligs', 1890),
	(7560, false, 'Slogs', 1890),
	(7561, true, 'Final Fantasy Versus XIII', 1891),
	(7562, false, 'Final Fantasy XIII-3', 1891);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7563, false, 'Final Fantasy XVI', 1891),
	(7564, false, 'Final Fantasy: Renascer', 1891),
	(7565, false, 'Atari 2600', 1892),
	(7566, false, 'Coleco Telstar', 1892),
	(
		7567,
		false,
		'Jogo de TV em cores da Nintendo',
		1892
	),
	(7568, true, 'Magnavox Odyssey', 1892),
	(7569, true, 'Davi', 1893),
	(7570, false, 'Huey', 1893),
	(7571, false, 'John', 1893),
	(7572, false, 'Serpente Sólida', 1893);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7573, false, 'Igglybuff', 1894),
	(7574, true, 'iluminar', 1894),
	(7575, false, 'Infernape', 1894),
	(7576, false, 'Ivysaur', 1894),
	(7577, false, '25 de outubro de 2016', 1895),
	(7578, true, '29 de novembro de 2016', 1895),
	(7579, false, '30 de novembro de 2016', 1895),
	(7580, false, '31 de dezembro de 2016', 1895),
	(7581, false, 'abril de 1990', 1896),
	(7582, false, 'agosto de 1956', 1896);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7583, false, 'junho de 2001', 1896),
	(7584, true, 'março de 1986', 1896),
	(7585, false, '12 de novembro de 2004', 1897),
	(7586, false, '13 de dezembro de 2004', 1897),
	(7587, false, '13 de novembro de 2004', 1897),
	(7588, true, '24 de dezembro de 2004', 1897),
	(7589, false, '21 de outubro de 2005', 1898),
	(7590, false, '22 de novembro de 2004', 1898),
	(7591, true, '24 de outubro de 2005', 1898),
	(7592, false, '29 de março de 2006', 1898);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7593, false, '1989', 1899),
	(7594, false, '1992', 1899),
	(7595, true, '1995', 1899),
	(7596, false, '1997', 1899),
	(7597, false, 'Halo 3: Fantasma', 1900),
	(7598, false, 'Halo 3: Guerrilha', 1900),
	(7599, false, 'Halo 3: Helljumpers', 1900),
	(7600, true, 'Halo 3: Recon', 1900),
	(7601, false, '14 de agosto de 1989', 1901),
	(7602, false, '1º de setembro de 1986', 1901);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7603, true, '29 de outubro de 1988', 1901),
	(7604, false, '30 de novembro de 1990', 1901),
	(7605, false, '18 de dezembro de 2004', 1902),
	(7606, false, '21 de novembro de 2006', 1902),
	(7607, true, '31 de outubro de 2005', 1902),
	(7608, false, '9 de setembro de 2007', 1902),
	(7609, false, '16 de fevereiro de 2015', 1903),
	(7610, false, '23 de outubro de 1997', 1903),
	(7611, false, '7 de janeiro de 2007', 1903),
	(7612, true, '9 de março de 2017', 1903);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7613, false, 'Cinco', 1904),
	(7614, false, 'Oito', 1904),
	(7615, true, 'Seis', 1904),
	(7616, false, 'Sete', 1904),
	(7617, false, '10', 1905),
	(7618, false, '7', 1905),
	(7619, false, '8', 1905),
	(7620, true, '9', 1905),
	(7621, false, '1', 1906),
	(7622, true, '3', 1906);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7623, false, '4', 1906),
	(7624, false, '6', 1906),
	(7625, false, '2', 1907),
	(7626, true, '3', 1907),
	(7627, false, '4', 1907),
	(7628, false, '5', 1907),
	(7629, true, '$ 0 USD', 1908),
	(7630, false, 'US$ 10', 1908),
	(7631, false, 'US$ 15', 1908),
	(7632, false, 'US$ 5', 1908);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7633, false, '15', 1909),
	(7634, true, '16', 1909),
	(7635, false, '19', 1909),
	(7636, false, '24', 1909),
	(7637, false, '6', 1910),
	(7638, false, '7', 1910),
	(7639, true, '8', 1910),
	(7640, false, '9', 1910),
	(7641, false, '3', 1911),
	(7642, false, '4', 1911);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7643, true, '5', 1911),
	(7644, false, '6', 1911),
	(7645, false, '2', 1912),
	(7646, true, '4', 1912),
	(7647, false, '6', 1912),
	(7648, false, '8', 1912),
	(7649, false, '10', 1913),
	(7650, false, '12', 1913),
	(7651, false, '5', 1913),
	(7652, true, '7', 1913);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7653, false, '3', 1914),
	(7654, true, '4', 1914),
	(7655, false, '5', 1914),
	(7656, false, '6', 1914),
	(7657, true, ' 87 Bazilhões', 1915),
	(7658, false, ' 87 Gazillion', 1915),
	(7659, false, '87 milhões', 1915),
	(7660, false, '87 trilhões', 1915),
	(7661, false, '15', 1916),
	(7662, true, '30', 1916);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7663, false, '5', 1916),
	(7664, false, '60', 1916),
	(7665, false, '53.593', 1917),
	(7666, true, '53.594', 1917),
	(7667, false, '53.595', 1917),
	(7668, false, '53.596', 1917),
	(7669, false, 'jacarés', 1918),
	(7670, false, 'lagartos', 1918),
	(7671, true, 'macacos', 1918),
	(7672, false, 'pombos', 1918);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (
		7673,
		false,
		'MMO (Massively Multiplayer Online)',
		1919
	),
	(7674, false, 'RPG (RPG)', 1919),
	(
		7675,
		true,
		'RTS (Estratégia em Tempo Real)',
		1919
	),
	(
		7676,
		false,
		'TBS (estratégia baseada em turnos)',
		1919
	),
	(
		7677,
		false,
		'Dragonforce - Através do Fogo e das Chamas',
		1920
	),
	(
		7678,
		true,
		'Dream Theater - Puxe-me para baixo',
		1920
	),
	(
		7679,
		false,
		'King Crimson - Homem Esquizóide do Século XXI',
		1920
	),
	(7680, false, 'Lynyrd Skynyrd - Free Bird', 1920),
	(7681, false, 'jumpman', 1921),
	(7682, false, 'Mário', 1921);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7683, true, 'Ossan', 1921),
	(7684, false, 'Senhor Vídeo', 1921),
	(7685, true, '11037', 1922),
	(7686, false, '3, 9, 11, 12, 15, 17,', 1922),
	(7687, false, '4, 8, 15, 16, 23, 42', 1922),
	(7688, false, '55730', 1922),
	(7689, false, 'Apontar e clicar', 1923),
	(7690, true, 'Atire neles', 1923),
	(7691, false, 'MMORPG', 1923),
	(7692, false, 'Simulação', 1923);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7693, false, 'Crygor', 1924),
	(7694, true, 'Elvin Gadd', 1924),
	(7695, false, 'Nirona', 1924),
	(7696, false, 'Robert Fludd', 1924),
	(7697, false, 'Dr. Josef Mengele', 1925),
	(7698, true, 'Dr. Otto Wolfgang Ort-Meyer', 1925),
	(
		7699,
		false,
		'Professor Hertz Amadeus Schneider',
		1925
	),
	(7829, false, 'Capitão Gancho', 1958),
	(7700, false, 'Professor Otto Rothwinkler', 1925),
	(7701, false, 'Daisuke Amaya', 1926);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7702, true, 'Eric Barone', 1926),
	(7703, false, 'Jasper Byrne', 1926),
	(7704, false, 'Lucas Papa', 1926),
	(7705, false, 'Hideo Kojima', 1927),
	(7706, true, 'James McCaffrey', 1927),
	(7707, false, 'Lago Sam', 1927),
	(7708, false, 'Troy Baker', 1927),
	(7709, false, ' Jennifer Hale', 1928),
	(7710, false, 'Jenn Taylor', 1928),
	(7711, false, 'Lori Alan', 1928);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7712, true, 'Terri Brosius', 1928),
	(7713, true, 'Casey Mongillo', 1929),
	(7714, false, 'Rob Wiethoff', 1929),
	(7715, false, 'Tara Forte', 1929),
	(7716, false, 'Troy Baker', 1929),
	(7717, true, 'Alex Kidd', 1930),
	(7718, false, 'NOITES', 1930),
	(7719, false, 'opa opa', 1930),
	(7720, false, 'Ristar', 1930),
	(7721, false, 'Álvaro Neves', 1931);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7722, false, 'Armando Becker', 1931),
	(7723, false, 'Milo Rego', 1931),
	(7724, true, 'Victor Branco', 1931),
	(7725, false, ' Indústria Robotnik', 1932),
	(7726, true, ' Joja Co', 1932),
	(7727, false, 'Império', 1932),
	(7728, false, 'Ronin', 1932),
	(7729, false, 'Don Woods', 1933),
	(7730, false, 'Júlio Smith', 1933),
	(7731, true, 'Warren Robinett', 1933);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7732, false, 'Will Crowther', 1933),
	(7733, false, 'Adam Engels', 1934),
	(7734, false, 'André Spinks', 1934),
	(7735, true, 'Robert Topala', 1934),
	(7736, false, 'Scott Cawthon', 1934),
	(7737, true, 'Haley Joel Osment', 1935),
	(7738, false, 'Jesse mccartney', 1935),
	(7739, false, 'Kōki Uchiyama', 1935),
	(7740, false, 'Miyu Irino', 1935),
	(7741, false, 'kairi', 1936);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7742, false, 'Mickey', 1936),
	(7743, false, 'Riku', 1936),
	(7744, true, 'Roxas', 1936),
	(7745, true, 'cobra nua', 1937),
	(7746, false, 'Serpente Líquida', 1937),
	(7747, false, 'Serpente Sólida', 1937),
	(7748, false, 'Serpente Venenosa', 1937),
	(7749, false, 'Marcus Holloway', 1938),
	(7750, false, 'Mário Frigo', 1938),
	(7751, true, 'Rico Rodriguez', 1938);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7752, false, 'Tom Sheldon', 1938),
	(7753, true, 'Madotsuki', 1939),
	(7754, false, 'massada', 1939),
	(7755, false, 'Poniko', 1939),
	(7756, false, 'Uboa', 1939),
	(7757, false, 'Chama', 1940),
	(7758, true, 'Cifra', 1940),
	(7759, false, 'Mobius 1', 1940),
	(7760, false, 'pixy', 1940),
	(7761, false, 'Dr. Cortox', 1941);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7762, false, 'Dr. Evo-Cortex', 1941),
	(7763, true, 'Dr. Neo Cortex', 1941),
	(7764, false, 'Sir Cartex', 1941),
	(7765, false, ' Rainha Sectonia', 1942),
	(7766, false, 'Landia', 1942),
	(7767, true, 'Magolor', 1942),
	(7768, false, 'Rei Dededé', 1942),
	(7769, true, 'Chuck Greene', 1943),
	(7770, false, 'Frank West', 1943),
	(7771, false, 'Katie Greene', 1943);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7772, false, 'Nick Ramos', 1943),
	(7773, true, 'Link', 1944),
	(7774, false, 'Q*berto', 1944),
	(7775, false, 'Serpente Sólida', 1944),
	(7776, false, 'Wario', 1944),
	(
		7777,
		false,
		' The Elder Scrolls III: Morrowind',
		1945
	),
	(
		7778,
		true,
		'The Elder Scrolls IV: Oblivion',
		1945
	),
	(7779, false, 'The Elder Scrolls Online', 1945),
	(7780, false, 'The Elder Scrolls V: Skyrim', 1945),
	(7781, false, 'Junkrat', 1946);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7782, true, 'McCree', 1946),
	(7783, false, 'Roadhog', 1946),
	(7784, false, 'Soldado 76', 1946),
	(
		7785,
		false,
		'A data (10 de março) em que Donkey Kong foi lançado.',
		1947
	),
	(7786, false, 'encanador de Satoru Iwata', 1947),
	(
		7787,
		true,
		'O proprietário da sede americana',
		1947
	),
	(7788, false, 'Sogro de Shigeru Miyamoto', 1947),
	(7789, false, 'Arceus', 1948),
	(7790, false, 'Bulbasaur', 1948),
	(7791, false, 'Mew', 1948);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7792, true, 'Rhyhorn', 1948),
	(7793, false, 'Ascensão', 1949),
	(7794, false, 'Die Rise', 1949),
	(7795, false, 'Lua', 1949),
	(7796, true, 'Shangri-lá', 1949),
	(7797, false, 'Ascensão', 1950),
	(7798, true, 'Die Rise', 1950),
	(7799, false, 'multidão dos mortos', 1950),
	(7800, false, 'Origens', 1950),
	(7801, false, 'bombas de macaco', 1951);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7802, true, 'Munição máxima', 1951),
	(7803, false, 'Máquina da morte', 1951),
	(7804, false, 'Uma arma Pack-A-Punched', 1951),
	(7805, false, 'Chamada da morte', 1952),
	(7806, true, 'Der Riese', 1952),
	(7807, false, 'Shi No Numa', 1952),
	(7808, false, 'Tranzit', 1952),
	(7809, true, 'Ascensão', 1953),
	(7810, false, 'Chamada da morte', 1953),
	(7811, false, 'Die Rise', 1953);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7812, false, 'Lua', 1953),
	(7813, false, 'baxter', 1954),
	(7814, false, 'Fido', 1954),
	(7815, true, 'Fofinho', 1954),
	(7816, false, 'henrique', 1954),
	(7817, false, '031 Testemunho Exuberante', 1955),
	(7818, true, '2401 Penitente Tangente', 1955),
	(7819, false, '252 Biodis Expolsion', 1955),
	(7820, false, '343 Faísca Culpada', 1955),
	(7821, false, 'Agrabah', 1956);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7822, false, 'Cidade da Disney', 1956),
	(7823, true, 'Destiny Islands', 1956),
	(7824, false, 'Terra de Partida', 1956),
	(
		7825,
		true,
		'Para encontrar o portador da chave e ficar com ele!',
		1957
	),
	(
		7826,
		false,
		'Para encontrar o portador da chave e matá-lo!',
		1957
	),
	(
		7827,
		false,
		'Para encontrar o portador da chave e relatar de volta!',
		1957
	),
	(
		7828,
		false,
		'Para encontrar o portador da chave e roubar a chave!',
		1957
	),
	(7830, true, 'Riku', 1958),
	(7831, false, 'Réplica Riku', 1958),
	(7832, false, 'Xaldin', 1958);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7833, false, 'Gabriel Reis', 1959),
	(7834, false, 'Jack "McCree" Morrison', 1959),
	(7835, false, 'Jamison "Deadeye" Fawkes', 1959),
	(7836, true, 'Jesse McCree', 1959),
	(7837, false, 'Barragem de Foguetes', 1960),
	(7838, false, 'Earthshatter', 1960),
	(7839, false, 'núcleo derretido', 1960),
	(7840, true, 'Valquíria', 1960),
	(7841, false, '100', 1961),
	(7842, false, '200', 1961);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7843, true, '300', 1961),
	(7844, false, '400', 1961),
	(7845, false, 'besta pesada', 1962),
	(7846, true, 'HRL-7', 1962),
	(7847, false, 'pistola vassoura', 1962),
	(7848, false, 'Thanatos 0,50 cal', 1962),
	(7849, false, 'Mylta', 1963),
	(7850, false, 'Novorepnoye', 1963),
	(7851, true, 'Sosnovka', 1963),
	(7852, false, 'Yasnaya', 1963);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7853, false, 'C-Virus', 1964),
	(7854, false, 'E-vírus', 1964),
	(7855, true, 'G-Virus', 1964),
	(7856, false, 'T-Virus', 1964),
	(7857, false, 'Sam', 1965),
	(7858, true, 'Scott', 1965),
	(7859, false, 'shaun', 1965),
	(7860, false, 'Simão', 1965),
	(7861, false, 'Carlos', 1966),
	(7862, true, 'ed.', 1966);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7863, false, 'Lee', 1966),
	(7864, false, 'Walter', 1966),
	(
		7865,
		false,
		'Falha de duplicação de chapéu de festa',
		1967
	),
	(7866, false, 'Falha do Noclip', 1967),
	(7867, false, 'Massacre de TzHaar', 1967),
	(7868, true, 'O Massacre de Falador', 1967),
	(7869, true, ' Raul Menéndez', 1968),
	(7870, false, ' Vladimir Makarov', 1968),
	(7871, false, 'De Falco', 1968),
	(7872, false, 'Frank Woods', 1968);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7873, false, '20', 1969),
	(7874, true, '25', 1969),
	(7875, false, '30', 1969),
	(7876, false, '35', 1969),
	(7877, false, 'cavar e cavar', 1970),
	(7878, true, 'Gordon & Freeman', 1970),
	(7879, false, 'Nathan & Drake', 1970),
	(7880, false, 'Sam & Fisher', 1970),
	(7881, false, 'Alhambra', 1971),
	(7882, false, 'As pirâmides', 1971);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7883, false, 'Mausoléu de Maussollos', 1971),
	(7884, true, 'Petra', 1971),
	(7885, false, 'Banehallow Ambry', 1972),
	(7886, false, 'Barathrum', 1972),
	(7887, false, 'Carl', 1972),
	(7888, true, 'Raigor Stonehoof', 1972),
	(7889, true, 'T-45', 1973),
	(7890, false, 'T-51', 1973),
	(7891, false, 'T-60', 1973),
	(7892, false, 'X-01', 1973);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7893, false, '1', 1974),
	(7894, false, '3', 1974),
	(7895, true, '4', 1974),
	(7896, false, '5', 1974),
	(7897, true, 'Joseph Clarence', 1975),
	(7898, false, 'Manuel Delgado', 1975),
	(7899, false, 'Maynard John', 1975),
	(7900, false, 'rei do balanço', 1975),
	(7901, true, 'larxeno', 1976),
	(7902, false, 'Lea', 1976);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7903, false, 'Mickey', 1976),
	(7904, false, 'Xehanort', 1976),
	(7905, true, 'A bruxa', 1977),
	(7906, false, 'O Cuspidor', 1977),
	(7907, false, 'o fumante', 1977),
	(7908, false, 'O tanque', 1977),
	(7909, false, 'Febre amarela', 1978),
	(7910, true, 'gripe verde', 1978),
	(7911, false, 'Sniffles de framboesa', 1978),
	(7912, false, 'T-Virus', 1978);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7913, false, 'Arzuros', 1979),
	(7914, true, 'Astalos', 1979),
	(7915, false, 'Gore Magala', 1979),
	(7916, false, 'Malfestio', 1979),
	(7917, true, 'BMW M3 GT', 1980),
	(7918, false, 'Ford Mustang', 1980),
	(7919, false, 'Nissan 240SX', 1980),
	(7920, false, 'Porsche 911 Turbo', 1980),
	(7921, false, '10', 1981),
	(7922, true, '15', 1981);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7923, false, '20', 1981),
	(7924, false, '5', 1981),
	(7925, false, 'Acura Integra Type R', 1982),
	(7926, false, 'Mazda RX-7 FD3S', 1982),
	(7927, true, 'Nissan Skyline GT-R (R34)', 1982),
	(7928, false, 'Subaru Impreza 2.5RS', 1982),
	(7929, false, 'Baixo', 1983),
	(7930, true, 'Bateria', 1983),
	(7931, false, 'Piano', 1983),
	(7932, false, 'Saxofone', 1983);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7933, true, 'Doce', 1984),
	(7934, false, 'Jenny', 1984),
	(7935, false, 'Kate', 1984),
	(7936, false, 'margarida', 1984),
	(7937, false, 'Lúcio Chupar Prima', 1985),
	(7938, true, 'Lúcio Correia Dos Santos', 1985),
	(7939, false, 'Lúcio João Lucas', 1985),
	(7940, false, 'Lúcio Luiz Lós Guilherme', 1985),
	(7941, false, '59', 1986),
	(7942, true, '61', 1986);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7943, false, '62', 1986),
	(7944, false, '65', 1986),
	(7945, false, 'Caverna rebelde', 1987),
	(7946, false, 'Grama na Rota 209', 1987),
	(7947, false, 'Negociando com um NPC', 1987),
	(7948, true, 'árvores de mel', 1987),
	(7949, false, 'Um limão', 1988),
	(7950, false, 'Um tomate', 1988),
	(7951, true, 'Uma batata', 1988),
	(7952, false, 'Uma maçã', 1988);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7953, true, 'Azul', 1989),
	(7954, false, 'Laranja', 1989),
	(7955, false, 'Roxo', 1989),
	(7956, false, 'Vermelho', 1989),
	(7957, false, 'Amarelo', 1990),
	(7958, false, 'Azul', 1990),
	(7959, true, 'Roxo', 1990),
	(7960, false, 'Vermelho', 1990),
	(7961, false, 'Berlim', 1991),
	(7962, false, 'Hamburgo', 1991);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7963, true, 'Hanôver', 1991),
	(7964, false, 'Munique', 1991),
	(7965, false, 'Carolina do Norte', 1992),
	(7966, false, 'Idaho', 1992),
	(7967, true, 'Montana', 1992),
	(7968, false, 'Wyoming', 1992),
	(7969, false, 'Call of Duty Black Ops', 1993),
	(7970, false, 'Call of duty black ops II', 1993),
	(7971, true, 'Call Of Duty: Black Ops III', 1993),
	(7972, false, 'Call Of Duty: World At War', 1993);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7973, true, 'Mario Party 4', 1994),
	(7974, false, 'Mundo Super Mário 3D', 1994),
	(7975, false, 'Mário Kart Wii', 1994),
	(7976, false, 'Novo Super Mário Bros.', 1994),
	(7977, false, 'Dr. Mário 64', 1995),
	(7978, true, 'Galeria de jogos do Mario', 1995),
	(7979, false, 'Mário Tênis', 1995),
	(7980, false, 'Super Mário 64', 1995),
	(7981, false, 'Almas escuras', 1996),
	(7982, true, 'meia-vida 2', 1996);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (
		7983,
		false,
		'Sam sério: o segundo encontro',
		1996
	),
	(7984, false, 'Team Fortress 2', 1996),
	(7985, false, 'OSX 10.9.5', 1997),
	(7986, true, 'PC-98', 1997),
	(7987, false, 'Windows 98', 1997),
	(7988, false, 'Windows ME', 1997),
	(7989, true, 'Alemanha', 1998),
	(7990, false, 'China', 1998),
	(7991, false, 'França', 1998),
	(7992, false, 'Japão', 1998);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (7993, false, '2008', 1999),
	(7994, false, '2009', 1999),
	(7995, false, '2010', 1999),
	(7996, true, '2011', 1999),
	(7997, false, '2006', 2000),
	(7998, true, '2007', 2000),
	(7999, false, '2008', 2000),
	(8000, false, '2009', 2000),
	(8001, false, '2010', 2001),
	(8002, true, '2011', 2001);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8003, false, '2012', 2001),
	(8004, false, '2014', 2001),
	(8005, false, '2000', 2002),
	(8006, true, '2002', 2002),
	(8007, false, '2003', 2002),
	(8008, false, '2004', 2002),
	(8009, false, '1989', 2003),
	(8010, true, '1991', 2003),
	(8011, false, '1993', 2003),
	(8012, false, '1995', 2003);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8013, false, '2002', 2004),
	(8014, true, '2004', 2004),
	(8015, false, '2005', 2004),
	(8016, false, '2006', 2004),
	(8017, false, 'briga', 2005),
	(8018, true, 'John O''Groats', 2005),
	(8019, false, 'Kearvaig', 2005),
	(8020, false, 'Talmine', 2005),
	(8021, false, 'Eles têm fome', 2006),
	(8022, true, 'Half-Life: Força Opositora', 2006);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8023, false, 'Meia-vida: Decadência', 2006),
	(8024, false, 'Meia-vida: Mudança Azul', 2006),
	(8025, false, 'Fonte', 2007),
	(8026, true, 'GoldSrc', 2007),
	(8027, false, 'Irreal', 2007),
	(8028, false, 'Terremoto', 2007),
	(8029, false, 'Congelamento 3', 2008),
	(8030, false, 'Cryengine', 2008),
	(8031, true, 'Motor de Origem', 2008),
	(8032, false, 'motor irreal', 2008);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8033, false, '20', 2009),
	(8034, false, '30', 2009),
	(8035, true, '40', 2009),
	(8036, false, '50', 2009),
	(8037, false, '1, 2, 3', 2010),
	(8038, false, '1, 3, 2', 2010),
	(8039, false, '2, 1, 3', 2010),
	(8040, true, '2, 3, 1', 2010),
	(8041, false, 'Canadá', 2011),
	(8042, false, 'Estados Unidos da América', 2011);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8043, true, 'Israel', 2011),
	(8044, false, 'México', 2011),
	(8045, true, 'avalice', 2012),
	(8046, false, 'Galaxytrail', 2012),
	(8047, false, 'Liberdade', 2012),
	(8048, false, 'Shang Mu', 2012),
	(8049, false, 'Contra-ataque: Fonte', 2013),
	(8050, true, 'Meia-vida', 2013),
	(8051, false, 'meia-vida 2', 2013),
	(
		8052,
		false,
		'É um jogo independente, não um mod',
		2013
	);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8053, false, 'Como referência a um filme', 2014),
	(8054, false, 'Depois de um dublador', 2014),
	(
		8055,
		false,
		'Depois que um dos escritores do jogo',
		2014
	),
	(
		8056,
		true,
		'Em homenagem a um fã que faleceu',
		2014
	),
	(8057, false, '10', 2015),
	(8058, false, '13', 2015),
	(8059, true, '14', 2015),
	(8060, false, '16', 2015),
	(8061, false, 'Engenheiro', 2016),
	(8062, false, 'Pesado', 2016);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8063, false, 'Soldado', 2016),
	(8064, true, 'Todos Listados', 2016),
	(8065, false, 'Lâmina Destruidora', 2017),
	(8066, true, 'picareta', 2017),
	(8067, false, 'Pwnhammer', 2017),
	(8068, false, 'rifle de laser', 2017),
	(8069, true, 'Ankh Charm', 2018),
	(8070, false, 'Cajado do Venom', 2018),
	(8071, false, 'Ferramentas Orichalcum', 2018),
	(8072, false, 'Fratura do céu', 2018);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8073, false, 'Arquimedes', 2019),
	(8074, false, 'Astrid', 2019),
	(8075, true, 'Cícero', 2019),
	(8076, false, 'Lucien Lachance', 2019),
	(8077, false, 'Hakurei Reimu', 2020),
	(8078, true, 'Izayoi Sakuya', 2020),
	(8079, false, 'Kirisame Marisa', 2020),
	(8080, false, 'Kochiya Sanae', 2020),
	(8081, false, 'noite florida', 2021),
	(8082, true, 'ONU Owen era ela', 2021);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (
		8083,
		false,
		'Pierrot da bandeira estrelada',
		2021
	),
	(
		8084,
		false,
		'Septette para a Princesa Morta',
		2021
	),
	(8085, false, '12G', 2022),
	(8086, false, '40G', 2022),
	(8087, false, '7G', 2022),
	(8088, true, '9999G', 2022),
	(8089, false, 'O Descarte', 2023),
	(8090, false, 'O elefante', 2023),
	(8091, true, 'o figurão', 2023),
	(8092, false, 'o moicano', 2023);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8093, false, 'AWP', 2024),
	(8094, false, 'M4A1', 2024),
	(8095, true, 'M4A4', 2024),
	(8096, false, 'MP9', 2024),
	(8097, false, '10', 2025),
	(8098, false, '3', 2025),
	(8099, false, '6', 2025),
	(8100, true, '9', 2025),
	(8101, false, 'Final Fantasy II', 2026),
	(8102, true, 'Final Fantasy III', 2026);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8103, false, 'Final Fantasy V', 2026),
	(8104, false, 'Final Fantasy VI', 2026),
	(8105, false, 'Marc Laidlaw', 2027),
	(8106, true, 'Mike Harrington', 2027),
	(8107, false, 'Robin Walker', 2027),
	(8108, false, 'Stephen Bahl', 2027),
	(8109, false, 'Davao', 2028),
	(8110, false, 'Macau', 2028),
	(8111, false, 'Palau', 2028),
	(8112, true, 'Panau', 2028);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8113, false, 'Deus Ex: Guerra Invisível', 2029),
	(8114, false, 'Postal', 2029),
	(8115, true, 'Torneio irreal 2004', 2029),
	(8116, false, 'Torneio irreal 3', 2029),
	(8117, false, '1998', 2030),
	(8118, true, '2000', 2030),
	(8119, false, '2001', 2030),
	(8120, false, '2003', 2030),
	(8121, false, 'Eslováquia', 2031),
	(8122, false, 'Peru', 2031);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8123, true, 'Quênia', 2031),
	(8124, false, 'Índia', 2031),
	(
		8125,
		false,
		'A Teoria de Isaac Newton Disprovador',
		2032
	),
	(
		8126,
		false,
		'Dispositivo Universal de Manipulação de Gravidade',
		2032
	),
	(
		8127,
		true,
		'Manipulador de campo de energia de ponto zero',
		2032
	),
	(
		8128,
		false,
		'Modificador de Deslocamento de Energia Quântica',
		2032
	),
	(8129, false, 'Ambos são advogados', 2033),
	(8130, false, 'Eles são amigos', 2033),
	(
		8131,
		false,
		'Eles são colegas de trabalho',
		2033
	),
	(8132, true, 'Eles são meio-irmãos', 2033);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8133, false, 'Alado', 2034),
	(8134, true, 'Amarelo', 2034),
	(8135, false, 'Branco', 2034),
	(8136, false, 'Vermelho', 2034),
	(8137, true, 'Carolina', 2035),
	(8138, false, 'Jane', 2035),
	(8139, false, 'melissa', 2035),
	(8140, false, 'Mesclado', 2035),
	(8141, false, 'Anti-rad', 2036),
	(8142, false, 'Medkit', 2036);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8143, true, 'radioprotetor', 2036),
	(8144, false, 'Vodka', 2036),
	(8145, false, 'máscara de Majora', 2037),
	(8146, false, 'O Wind Waker', 2037),
	(8147, true, 'Ocarina of Time', 2037),
	(8148, false, 'Uma ligação ao passado', 2037),
	(8149, true, 'Caverna Johnson', 2038),
	(8150, false, 'GLaDOs', 2038),
	(8151, false, 'Gordon Freeman', 2038),
	(8152, false, 'Wallace Breen', 2038);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8153, true, 'Frota da Justiça Particular', 2039),
	(8154, false, 'Frota da Redenção Furiosa', 2039),
	(
		8155,
		false,
		'Frota da Sagrada Consagração',
		2039
	),
	(8156, false, 'Frota de Vigilância Justa', 2039),
	(8157, false, 'Haley Joel Osment', 2040),
	(8158, false, 'Jason Dohring', 2040),
	(8159, false, 'Jesse mccartney', 2040),
	(8160, true, 'Mark Hamill', 2040),
	(8161, false, 'Chão', 2041),
	(8162, false, 'Erro', 2041);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8163, false, 'Grama', 2041),
	(8164, true, 'Pedra', 2041),
	(8165, true, 'acessórios de abertura', 2042),
	(
		8166,
		false,
		'Inovadores da Ciência da Aperture',
		2042
	),
	(8167, false, 'Laboratórios Wheatley', 2042),
	(8168, false, 'Lavatórios de abertura', 2042),
	(
		8169,
		true,
		'Super Mario Land 2: As 6 moedas de ouro',
		2043
	),
	(8170, false, 'Super Mário Land', 2043),
	(8171, false, 'Super Mário Mundo', 2043),
	(8172, false, 'Terra Super Mário 3D', 2043);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8173, true, 'Alexandros Mograine', 2044),
	(8174, false, 'Arthas Menethil', 2044),
	(8175, false, 'Tirion Fordring', 2044),
	(8176, false, 'Uther, o Portador da Luz', 2044),
	(8177, false, 'Garrus', 2045),
	(8178, false, 'mordin', 2045),
	(8179, true, 'pastor', 2045),
	(8180, false, 'Thane', 2045),
	(8181, true, ' Bumerangue', 2046),
	(8182, false, 'Besta', 2046);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8183, false, 'estilingue', 2046),
	(8184, false, 'Lança', 2046),
	(8185, false, '4', 2047),
	(8186, false, '5', 2047),
	(8187, true, '6', 2047),
	(8188, false, '8', 2047),
	(8189, true, 'Aston Martin Vulcano', 2048),
	(8190, false, 'Ferrari FXX-K', 2048),
	(8191, false, 'Lótus E23', 2048),
	(8192, false, 'McLaren P1 GTR', 2048);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8193, false, 'Azul', 2049),
	(8194, true, 'Roxo', 2049),
	(8195, false, 'Verde', 2049),
	(8196, false, 'Vermelho', 2049),
	(8197, true, 'Meio Humano / Meio Urso', 2050),
	(8198, false, 'Meio Lobo/Meio Urso', 2050),
	(8199, false, 'Meio Tigre / Meio Humano', 2050),
	(8200, false, 'Um humano', 2050),
	(8201, false, 'Nyeh heh heh!', 2051),
	(8202, false, 'Sim!', 2051);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8203, false, 'Uau lá!', 2051),
	(8204, true, 'Viva!', 2051),
	(8205, false, 'Chino Mashido', 2052),
	(8206, false, 'Masaki Narinaka', 2052),
	(8207, false, 'Tunki Sunada', 2052),
	(8208, true, 'Yu Narukami', 2052),
	(8209, false, 'Apolo', 2053),
	(8210, false, 'finlandês', 2053),
	(8211, true, 'rufo', 2053),
	(8212, false, 'rutus', 2053);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8213, false, 'Construindo', 2054),
	(8214, false, 'Multijogador', 2054),
	(8215, false, 'Prédio', 2054),
	(8216, true, 'Terraformação', 2054),
	(8217, false, 'O destruidor', 2055),
	(8218, true, 'Olho de Cthulhu', 2055),
	(8219, false, 'Plantera', 2055),
	(8220, false, 'Skeletron Prime', 2055),
	(8221, true, 'Alphys', 2056),
	(8222, false, 'Asgore', 2056);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8223, false, 'Sans', 2056),
	(8224, false, 'undyne', 2056),
	(8225, false, 'O açougueiro', 2057),
	(8226, true, 'O dentista', 2057),
	(8227, false, 'O elefante', 2057),
	(8228, false, 'Vlad', 2057),
	(8229, false, ' Troy Baker', 2058),
	(8230, false, 'John DiMaggio', 2058),
	(8231, false, 'Mark Hamill', 2058),
	(8232, true, 'Nolan Norte', 2058);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8233, true, 'goombario', 2059),
	(8234, false, 'Goombarry', 2059),
	(8235, false, 'goombella', 2059),
	(8236, false, 'Goomby', 2059),
	(8237, false, '15', 2060),
	(8238, false, '16', 2060),
	(8239, true, '17', 2060),
	(8240, false, '18', 2060),
	(8241, false, 'FBI', 2061),
	(8242, false, 'GIGN', 2061);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8243, true, 'Navy Seals', 2061),
	(8244, false, 'SAS', 2061),
	(8245, false, ' O Eviscerador', 2062),
	(8246, false, 'Lamentação', 2062),
	(8247, false, 'O Ceifador', 2062),
	(8248, true, 'O ceifeiro', 2062),
	(
		8249,
		true,
		'Dispositivo de Emaranhamento Quântico',
		2063
	),
	(
		8250,
		false,
		'Dispositivo de qualidade Edward',
		2063
	),
	(8251, false, 'Driver Ectoplásmico Quad', 2063),
	(8252, false, 'Questione todos os cães', 2063);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8253, false, '3', 2064),
	(8254, false, '5', 2064),
	(8255, true, '6', 2064),
	(8256, false, '8', 2064),
	(8257, false, 'O arqueiro', 2065),
	(8258, false, 'O bruxo', 2065),
	(8259, true, 'O Cavaleiro', 2065),
	(8260, false, 'O guerreiro', 2065),
	(
		8261,
		false,
		'Bender, Andrew, Allison e Brian',
		2066
	),
	(8262, true, 'Francis, Bill, Zoey e Louis', 2066);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (
		8263,
		false,
		'Harry, Rony, Hermione e Dumbledore',
		2066
	),
	(
		8264,
		false,
		'Treinador, Ellis, Nick e Rochelle',
		2066
	),
	(8265, true, 'Flowey', 2067),
	(8266, false, 'Papiro', 2067),
	(8267, false, 'Sans', 2067),
	(8268, false, 'toriel', 2067),
	(8269, false, '11', 2068),
	(8270, false, '13', 2068),
	(8271, true, '14', 2068),
	(8272, false, '16', 2068);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8273, false, 'Akali', 2069),
	(8274, true, 'Catarina', 2069),
	(8275, false, 'Shaco', 2069),
	(8276, false, 'Zed', 2069),
	(8277, false, 'Helios', 2070),
	(8278, false, 'Icaro', 2070),
	(8279, false, 'orion', 2070),
	(8280, true, 'pandora', 2070),
	(8281, true, 'Dragão Campeão', 2071),
	(8282, false, 'Guardiao da Luz', 2071);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8283, false, 'mirana', 2071),
	(8284, false, 'Vidente escuro', 2071),
	(8285, false, 'Arquivil', 2072),
	(8286, true, 'cavaleiro infernal', 2072),
	(8287, false, 'Mancubus', 2072),
	(8288, false, 'mindinho', 2072),
	(8289, false, 'Leve-Médio', 2073),
	(8290, false, 'Luz', 2073),
	(8291, false, 'Médio', 2073),
	(8292, true, 'Pesado', 2073);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8293, false, 'Bruins de New Haven', 2074),
	(8294, false, 'Cambridge Bruins', 2074),
	(8295, false, 'Hartford Bruins', 2074),
	(8296, true, 'Providence Bruins', 2074),
	(8297, false, 'Mark Woodforde', 2075),
	(8298, false, 'Mary Carillo', 2075),
	(8299, false, 'Michael Stich', 2075),
	(8300, true, 'Pedro Fleming', 2075),
	(8301, false, '1968', 2076),
	(8302, true, '1969', 2076);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8303, false, '1970', 2076),
	(8304, false, '1971', 2076),
	(8305, true, '1', 2077),
	(8306, false, '2', 2077),
	(8307, false, '3', 2077),
	(8308, false, '4', 2077),
	(8309, true, 'Corrida de cavalo', 2078),
	(8310, false, 'Esgrima', 2078),
	(8311, false, 'Justa', 2078),
	(8312, false, 'Xadrez', 2078);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8313, false, 'Barcelona', 2079),
	(8314, false, 'Los Angeles', 2079),
	(8315, true, 'Moscou', 2079),
	(8316, false, 'Tóquio', 2079),
	(8317, false, 'Ecaterimburgo', 2080),
	(8318, false, 'Kaliningrado', 2080),
	(8319, false, 'Rostov do Don', 2080),
	(8320, true, 'Vladivostok', 2080),
	(8321, false, 'Jun Mizutani (Japão)', 2081),
	(8322, true, 'Ma Long (China)', 2081);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (
		8323,
		false,
		'Vladimir Samsonov (Bielorrússia)',
		2081
	),
	(8324, false, 'Zhang Jike (China)', 2081),
	(8325, false, 'Ai FUKUHARA (Japão)', 2082),
	(8326, true, 'DING Ning (China)', 2082),
	(8327, false, 'Li Xiaoxia (China)', 2082),
	(8328, false, 'Song KIM (Coréia do Norte)', 2082),
	(8329, true, 'mazda', 2083),
	(8330, false, 'nissan', 2083),
	(8331, false, 'subaru', 2083),
	(8332, false, 'Toyota', 2083);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8333, false, 'Cardiff City', 2084),
	(8334, false, 'cidade de Bristol', 2084),
	(8335, true, 'cidade de casco', 2084),
	(8336, false, 'Cidade de Manchester', 2084),
	(8337, false, 'Chave de fenda', 2085),
	(8338, false, 'chave inglesa', 2085),
	(8339, false, 'Furar', 2085),
	(8340, true, 'Martelo', 2085),
	(8341, false, 'Barzagli', 2086),
	(8342, false, 'Giaccherini', 2086);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8343, false, 'insígnia', 2086),
	(8344, true, 'Pele', 2086),
	(8345, false, 'David Beckham', 2087),
	(8346, false, 'Eric Cantona', 2087),
	(8347, true, 'Ryan Giggs', 2087),
	(8348, false, 'Wayne Rooney', 2087),
	(8349, false, 'Chelsea', 2088),
	(8350, true, 'Liverpool', 2088),
	(8351, false, 'Man City', 2088),
	(8352, false, 'Real Madrid', 2088);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8353, true, 'cidade de Quebec', 2089),
	(8354, false, 'Houston', 2089),
	(8355, false, 'Montreal', 2089),
	(8356, false, 'Nova Iorque', 2089),
	(8357, false, '2006', 2090),
	(8358, false, '2007', 2090),
	(8359, true, '2009', 2090),
	(8360, false, '2010', 2090),
	(8361, false, '2008', 2091),
	(8362, false, '2009', 2091);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8363, true, '2010', 2091),
	(8364, false, '2011', 2091),
	(8365, true, 'Badminton', 2092),
	(8366, false, 'Grilo', 2092),
	(8367, false, 'rugby', 2092),
	(8368, false, 'Tênis de mesa', 2092),
	(8369, false, ' Don Taylor', 2093),
	(8370, true, 'Don Cherry', 2093),
	(8371, false, 'Don McKellar', 2093),
	(8372, false, 'Donald Sutherland', 2093);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8373, false, '1-5', 2094),
	(8374, false, '1-6', 2094),
	(8375, true, '1-7', 2094),
	(8376, false, '2-6', 2094),
	(8377, true, '0', 2095),
	(8378, false, '2', 2095),
	(8379, false, '3', 2095),
	(8380, false, '5', 2095),
	(8381, false, '1', 2096),
	(8382, false, '2', 2096);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8383, false, '3', 2096),
	(8384, true, '4', 2096),
	(8385, false, 'Flamingo', 2097),
	(8386, false, 'Passarinho', 2097),
	(8387, true, 'Peru', 2097),
	(8388, false, 'Águia', 2097),
	(8389, false, 'Albatroz', 2098),
	(8390, false, 'bicho-papão', 2098),
	(8391, false, 'Passarinho', 2098),
	(8392, true, 'Águia', 2098);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8393, false, 'Boston', 2099),
	(8394, true, 'brooklyn', 2099),
	(8395, false, 'Las Vegas', 2099),
	(8396, false, 'Seattle', 2099),
	(8397, false, '17 de agosto', 2100),
	(8398, false, '19 de agosto', 2100),
	(8399, true, '21 de agosto', 2100),
	(8400, false, '23 de agosto', 2100),
	(
		8401,
		false,
		'Green Bay Packers e Pittsburgh Steelers',
		2101
	),
	(
		8402,
		true,
		'New York Giants e New England Patriots',
		2101
	);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (
		8403,
		false,
		'Philadelphia Eagles e New England Patriots',
		2101
	),
	(
		8404,
		false,
		'Seattle Seahawks e Denver Broncos',
		2101
	),
	(8405, false, 'Curt Flood', 2102),
	(8406, true, 'Jackie Robinson', 2102),
	(8407, false, 'Roy Campanella', 2102),
	(8408, false, 'Satchell Paige', 2102),
	(8409, false, 'Evander Holyfield', 2103),
	(8410, false, 'Lennox Lewis', 2103),
	(8411, true, 'Mike Tyson', 2103),
	(8412, false, 'Roy Jones Jr.', 2103);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8413, false, 'Cidade de Bradford', 2104),
	(8414, true, 'Cidade de Leicester', 2104),
	(8415, false, 'Cidade de Northampton', 2104),
	(8416, false, 'West Bromwich Albion', 2104),
	(8417, false, '0 - 1', 2105),
	(8418, false, '16 - 0', 2105),
	(8419, false, '3 - 4', 2105),
	(8420, true, '7 - 1', 2105),
	(8421, false, ' Mario Lemieux', 2106),
	(8422, false, 'Gordie Howe', 2106);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8423, false, 'Sidney Crosby', 2106),
	(8424, true, 'Wayne Gretzky', 2106),
	(8425, false, 'Alemanha', 2107),
	(8426, false, 'Austrália', 2107),
	(8427, false, 'China', 2107),
	(8428, true, 'Japão', 2107),
	(8429, false, 'Alemanha', 2108),
	(8430, false, 'Arábia Saudita', 2108),
	(8431, false, 'Estados Unidos', 2108),
	(8432, true, 'Rússia', 2108);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8433, false, 'Ayrton Senna', 2109),
	(8434, false, 'Fernando Alonso', 2109),
	(8435, false, 'Jim Clark', 2109),
	(8436, true, 'Michael Schumacher', 2109),
	(8437, true, 'Alemanha', 2110),
	(8438, false, 'Argentina', 2110),
	(8439, false, 'Brasil', 2110),
	(8440, false, 'Holanda', 2110),
	(8441, true, 'Alemanha Ocidental', 2111),
	(8442, false, 'Brasil', 2111);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8443, false, 'Portugal', 2111),
	(8444, false, 'União Soviética', 2111),
	(8445, true, 'Canadenses de Montreal', 2112),
	(8446, false, 'Chicago Blackhawks', 2112),
	(8447, false, 'Detroit Red Wings', 2112),
	(8448, false, 'Toronto Maple Leafs', 2112),
	(8449, false, 'Colorado Rapids', 2113),
	(8450, false, 'Impacto de Montreal', 2113),
	(8451, true, 'Seattle Sounders', 2113),
	(8452, false, 'Toronto FC', 2113);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8453, false, 'cheslea', 2114),
	(8454, true, 'Cidade de Leicester', 2114),
	(8455, false, 'Liverpool', 2114),
	(8456, false, 'Manchester United', 2114),
	(8457, false, 'anfield', 2115),
	(
		8458,
		false,
		'Estádio da Cidade de Manchester',
		2115
	),
	(8459, true, 'Old Trafford', 2115),
	(8460, false, 'St James Park', 2115),
	(8461, false, 'Bola lenta', 2116),
	(8462, true, 'Bola rápida', 2116);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8463, false, 'palmball', 2116),
	(8464, false, 'Screwball', 2116),
	(8465, true, '1904', 2117),
	(8466, false, '1909', 2117),
	(8467, false, '1999', 2117),
	(8468, false, '2008', 2117),
	(8469, false, '20', 2118),
	(8470, true, '22', 2118),
	(8471, false, '24', 2118),
	(8472, false, '26', 2118);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8473, false, '19', 2119),
	(8474, true, '25', 2119),
	(8475, false, '41', 2119),
	(8476, false, '69', 2119),
	(8477, false, 'Bill Tilden', 2120),
	(8478, false, 'Boris Becker', 2120),
	(8479, false, 'Pete Sampras', 2120),
	(8480, true, 'Roger Federer', 2120),
	(8481, false, 'Atletico Madrid', 2121),
	(8482, false, 'Bayern de Munique', 2121);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8483, false, 'Manchester City FC', 2121),
	(8484, true, 'Real Madrid CF', 2121),
	(8485, false, 'AS Monaco FC', 2122),
	(8486, false, 'Atletico Madrid', 2122),
	(8487, false, 'Juventus FC', 2122),
	(8488, true, 'Real Madrid CF', 2122),
	(8489, false, 'Kimi Raikkonen', 2123),
	(8490, false, 'Lewis hamilton', 2123),
	(8491, false, 'Max Verstappen', 2123),
	(8492, true, 'Nico Rosberg', 2123);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8493, true, 'Lewis hamilton', 2124),
	(8494, false, 'Max Verstappen', 2124),
	(8495, false, 'Nico Rosberg', 2124),
	(8496, false, 'Sebastian Vettel', 2124),
	(8497, true, 'Cidade de Leicester', 2125),
	(8498, false, 'Stoke City', 2125),
	(8499, false, 'Tottenham Hotspur', 2125),
	(8500, false, 'Watford', 2125),
	(
		8501,
		true,
		'Morte de Ayrton Senna (San Marino)',
		2126
	),
	(
		8502,
		false,
		'Schumacher''s Ban (Reino Unido)',
		2126
	);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8503, false, 'The Showdown (Austrália)', 2126),
	(
		8504,
		false,
		'Verstappen em chamas (Alemanha)',
		2126
	),
	(8505, true, 'Madeira', 2127),
	(8506, false, 'porto santo', 2127),
	(8507, false, 'santa maria', 2127),
	(8508, false, 'Terceira', 2127),
	(8509, false, 'Austrália', 2128),
	(8510, false, 'Camboja', 2128),
	(8511, false, 'Peru', 2128),
	(8512, true, 'Índia', 2128);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8513, false, ' Vauxhall', 2129),
	(8514, false, 'Battersea', 2129),
	(8515, false, 'Hammersmith', 2129),
	(8516, true, 'putney', 2129),
	(8517, true, 'Esquiar', 2130),
	(8518, false, 'Ginástica', 2130),
	(8519, false, 'Hipismo', 2130),
	(8520, false, 'Natação', 2130),
	(8521, false, 'Amarelo', 2131),
	(8522, false, 'Azul', 2131);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8523, false, 'Marrom', 2131),
	(8524, true, 'Verde', 2131),
	(
		8525,
		false,
		'Cowboys do Norte de Queensland',
		2132
	),
	(8526, true, 'Penrith Panthers', 2132),
	(8527, false, 'Sydney Roosters', 2132),
	(8528, false, 'Tempestade em Melbourne', 2132),
	(8529, false, 'Ayrton Senna', 2133),
	(8530, false, 'Gilles Villeneuve', 2133),
	(8531, true, 'Júlio Bianchi', 2133),
	(8532, false, 'Ronald Ratzenberger', 2133);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (
		8533,
		true,
		'Para evitar a visualização de jogos de fora do parque.',
		2134
	),
	(8534, false, 'Para exibir anúncios.', 2134),
	(
		8535,
		false,
		'Para fornecer assentos extras.',
		2134
	),
	(
		8536,
		false,
		'Para tornar mais difícil chegar em casa.',
		2134
	),
	(8537, false, 'Estados Unidos da América', 2135),
	(8538, false, 'Holanda', 2135),
	(8539, false, 'Itália', 2135),
	(8540, true, 'Tunísia', 2135),
	(8541, false, 'Boston Bruins', 2136),
	(8542, true, 'Philadelphia Flyers', 2136);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8543, false, 'Rangers de Nova York', 2136),
	(8544, false, 'Toronto Maple Leafs', 2136),
	(8545, false, 'Jacob de Grom', 2137),
	(8546, true, 'José Fernandez', 2137),
	(8547, false, 'Matt Harvey', 2137),
	(8548, false, 'Shelby Miller', 2137),
	(8549, false, 'Cristiano Ronaldo', 2138),
	(8550, false, 'David Beckham', 2138),
	(8551, false, 'Robin Van Persie', 2138),
	(8552, true, 'Wayne Rooney', 2138);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8553, false, 'Aberto da Austrália', 2139),
	(8554, false, 'Aberto da França', 2139),
	(8555, true, 'US Open', 2139),
	(8556, false, 'wimbledon', 2139),
	(8557, false, 'Corrida de cavalo', 2140),
	(8558, true, 'futebol americano', 2140),
	(8559, false, 'Luta livre', 2140),
	(8560, false, 'Tiro com arco', 2140),
	(8561, false, 'Audi', 2141),
	(8562, false, 'Ferrari', 2141);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8563, true, 'Porsche', 2141),
	(8564, false, 'Toyota', 2141),
	(8565, false, 'Audi', 2142),
	(8566, false, 'chevrolet', 2142),
	(8567, true, 'Porsche', 2142),
	(8568, false, 'Toyota', 2142),
	(8569, false, 'Kareem Abdul-Jabbar', 2143),
	(8570, false, 'Kevin Garnett', 2143),
	(8571, false, 'Kobe Bryant', 2143),
	(8572, true, 'Robert Parish', 2143);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8573, false, 'Al Snow', 2144),
	(8574, false, 'Chris Benoit', 2144),
	(8575, false, 'Lex Luger', 2144),
	(8576, true, 'Owen Hart', 2144),
	(8577, false, 'Bolívia', 2145),
	(8578, true, 'Catar', 2145),
	(8579, false, 'Uganda', 2145),
	(8580, false, 'Vietnã', 2145),
	(8581, false, 'Alemanha', 2146),
	(8582, false, 'Canadá', 2146);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8583, false, 'Estados Unidos', 2146),
	(8584, true, 'Rússia', 2146),
	(8585, true, 'Carlos Sainz Jr.', 2147),
	(8586, false, 'Daniil Kvyat', 2147),
	(8587, false, 'jolyon palmer', 2147),
	(8588, false, 'Rio Haryanto', 2147),
	(8589, false, 'celtas de Boston', 2148),
	(8590, false, 'Golden State Warriors', 2148),
	(8591, true, 'Los Angeles Lakers', 2148),
	(8592, false, 'Philadelphia 76ers', 2148);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8593, false, 'Atlanta Hawks', 2149),
	(8594, false, 'Cleveland Cavaliers', 2149),
	(8595, false, 'Foguetes Houston', 2149),
	(8596, true, 'Golden State Warriors', 2149),
	(8597, false, 'Branco', 2150),
	(8598, true, 'Preto', 2150),
	(8599, false, 'Verde', 2150),
	(8600, false, 'Vermelho', 2150),
	(8601, true, '61', 2151),
	(8602, false, '63', 2151);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8603, false, '65', 2151),
	(8604, false, '67', 2151),
	(8605, true, 'Atlanta Braves', 2152),
	(8606, false, 'Cardeais de São Luís', 2152),
	(8607, false, 'Chicago Cubs', 2152),
	(8608, false, 'Cincinnati Reds', 2152),
	(8609, false, '102', 2153),
	(8610, false, '42', 2153),
	(8611, false, '62', 2153),
	(8612, true, '82', 2153);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8613, false, '2', 2154),
	(8614, false, '4', 2154),
	(8615, true, '6', 2154),
	(8616, false, '9', 2154),
	(8617, false, '11', 2155),
	(8618, true, '13', 2155),
	(8619, false, '20', 2155),
	(8620, false, '22', 2155),
	(8621, false, 'Alemanha', 2156),
	(8622, false, 'França', 2156);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8623, false, 'Inglaterra', 2156),
	(8624, true, 'Portugal', 2156),
	(8625, false, 'David Beckham', 2157),
	(8626, false, 'Michael Owen', 2157),
	(8627, false, 'Steven Gerrard', 2157),
	(8628, true, 'Wayne Rooney', 2157),
	(8629, true, 'Boston Bruins', 2158),
	(8630, false, 'Montreal Canadiens', 2158),
	(8631, false, 'Rangers de Nova York', 2158),
	(8632, false, 'Toronto Maple Leafs', 2158);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8633, true, 'Daniel Ricciardo', 2159),
	(8634, false, 'Kimi Raikkonen', 2159),
	(8635, false, 'Lewis hamilton', 2159),
	(8636, false, 'Sebastian Vettel', 2159),
	(8637, false, 'Alabama Crimson Tide', 2160),
	(8638, true, 'Buckeyes do estado de Ohio', 2160),
	(8639, false, 'Texugos de Wisconsin', 2160),
	(8640, false, 'Tigres de Clemson', 2160),
	(8641, false, 'David Beckham', 2161),
	(8642, false, 'Ryan Giggs', 2161);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8643, false, 'Senhor Bobby Charlton', 2161),
	(8644, true, 'Wayne Rooney', 2161),
	(8645, false, ' campo de futebol', 2162),
	(8646, true, 'Campo de Golfe', 2162),
	(8647, false, 'Campo externo de críquete', 2162),
	(8648, false, 'mesa de fliperama', 2162),
	(8649, true, 'Amsterdã', 2163),
	(8650, false, 'Hong Kong', 2163),
	(8651, false, 'Rio de Janeiro', 2163),
	(8652, false, 'Toronto', 2163);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8653, false, 'China', 2164),
	(8654, false, 'México', 2164),
	(8655, false, 'Nepal', 2164),
	(8656, true, 'Nova Zelândia', 2164),
	(8657, false, 'Indonésia', 2165),
	(8658, false, 'tailândia', 2165),
	(8659, false, 'Vietnã', 2165),
	(8660, true, 'Índia', 2165),
	(8661, false, 'Chile', 2166),
	(8662, false, 'Fiji', 2166);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8663, true, 'Indonésia', 2166),
	(8664, false, 'Nova Zelândia', 2166),
	(8665, false, 'Chade e Líbia', 2167),
	(8666, true, 'Egito e Sudão', 2167),
	(8667, false, 'Iraque e Arábia Saudita', 2167),
	(8668, false, 'Israel e Jordânia', 2167),
	(8669, false, 'mar Aral', 2168),
	(8670, false, 'Mar Cáspio', 2168),
	(8671, true, 'Mar Morto', 2168),
	(8672, false, 'Salton Sea', 2168);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8673, false, ' Halifax, Nova Escócia', 2169),
	(8674, false, 'Calgary, Alberta', 2169),
	(8675, true, 'Sudbury, Ontário', 2169),
	(
		8676,
		false,
		'Victoria, Colúmbia Britânica',
		2169
	),
	(8677, false, '1634', 2170),
	(8678, false, '1783', 2170),
	(8679, true, '1848', 2170),
	(8680, false, '1901', 2170),
	(8681, false, 'China', 2171),
	(8682, false, 'Coreia do Sul', 2171);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8683, true, 'Coréia do Norte', 2171),
	(8684, false, 'Japão', 2171),
	(8685, true, 'Estônia', 2172),
	(8686, false, 'Finlândia', 2172),
	(8687, false, 'Polônia', 2172),
	(8688, false, 'Suécia', 2172),
	(8689, false, 'Alemanha', 2173),
	(8690, false, 'República Checa', 2173),
	(8691, false, 'Suíça', 2173),
	(8692, true, 'Áustria', 2173);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8693, true, 'Coroa', 2174),
	(8694, false, 'Foice', 2174),
	(8695, false, 'Pássaro', 2174),
	(8696, false, 'Árvore', 2174),
	(8697, true, 'Afeganistão e Paquistão', 2175),
	(8698, false, 'Paquistão e Índia', 2175),
	(8699, false, 'Tadjiquistão e Quirguistão', 2175),
	(8700, false, 'Índia e Nepal', 2175),
	(8701, true, 'chinês', 2176),
	(8702, false, 'indiano', 2176);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8703, false, 'japonês', 2176),
	(8704, false, 'russo', 2176),
	(8705, true, 'Cataratas do Niágara', 2177),
	(8706, false, 'mundo da Disney', 2177),
	(8707, false, 'Parque Nacional de Yosemite', 2177),
	(
		8708,
		false,
		'Whistler, Colúmbia Britânica',
		2177
	),
	(8709, false, 'Anaheim, Califórnia', 2178),
	(8710, false, 'Miami, Flórida', 2178),
	(8711, false, 'San Diego, Califórnia', 2178),
	(8712, true, 'Tyler, Texas', 2178);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8713, true, 'Edimburgo', 2179),
	(8714, false, 'Manchester', 2179),
	(8715, false, 'Oxford', 2179),
	(8716, false, 'Southampton', 2179),
	(8717, true, 'Barbados', 2180),
	(8718, false, 'Fiji', 2180),
	(8719, false, 'Maldivas', 2180),
	(8720, false, 'Seychelles', 2180),
	(8721, false, 'Cingapura', 2181),
	(8722, false, 'Geórgia', 2181);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8723, false, 'Rússia', 2181),
	(8724, true, 'Suriname', 2181),
	(8725, false, 'Ahmedabad', 2182),
	(8726, false, 'Ghaziabad', 2182),
	(8727, false, 'Hyderabad', 2182),
	(8728, true, 'Islamabad', 2182),
	(8729, true, 'placa atlântica', 2183),
	(8730, false, 'Placa da Eurásia', 2183),
	(8731, false, 'Prato de Nazca', 2183),
	(8732, false, 'prato norte-americano', 2183);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8733, false, 'Fujian', 2184),
	(8734, false, 'guangdong', 2184),
	(8735, false, 'Sichuan', 2184),
	(8736, true, 'Yangtze', 2184),
	(8737, false, 'Botsuana', 2185),
	(8738, true, 'Lesoto', 2185),
	(8739, false, 'Suazilândia', 2185),
	(8740, false, 'Zimbábue', 2185),
	(8741, true, 'hamilton', 2186),
	(8742, false, 'Havana', 2186);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8743, false, 'Santo Domingo', 2186),
	(8744, false, 'São João', 2186),
	(8745, false, 'Port Moresby', 2187),
	(8746, true, 'Porto Louis', 2187),
	(8747, false, 'Porto Príncipe', 2187),
	(8748, false, 'Porto Vila', 2187),
	(8749, false, 'Baía Verde', 2188),
	(8750, true, 'madison', 2188),
	(8751, false, 'milwaukee', 2188),
	(8752, false, 'Wisconsin Dells', 2188);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8753, true, 'colombo', 2189),
	(8754, false, 'Kandy', 2189),
	(8755, false, 'moratuwa', 2189),
	(8756, false, 'negombo', 2189),
	(8757, true, 'Ilha de Baffin', 2190),
	(8758, false, 'Ilha de Vancouver', 2190),
	(8759, false, 'Ilha Principe Edward', 2190),
	(8760, false, 'Terra Nova', 2190),
	(8761, false, 'Mont Tremblant', 2191),
	(8762, false, 'Montanha azul', 2191);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8763, false, 'Montanha Whistler', 2191),
	(8764, true, 'Monte Logan', 2191),
	(8765, false, 'Arábia Saudita', 2192),
	(8766, true, 'Indonésia', 2192),
	(8767, false, 'Irã', 2192),
	(8768, false, 'Sudão', 2192),
	(8769, false, 'Eesti', 2193),
	(8770, false, 'MagyarorszÁg', 2193),
	(8771, true, 'Suomi', 2193),
	(8772, false, 'Sverige', 2193);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8773, true, 'Esporão dos Abruzos', 2194),
	(8774, false, 'linha mágica', 2194),
	(8775, false, 'linha polonesa', 2194),
	(8776, false, 'Rota Cesen', 2194),
	(8777, true, 'Kaunas', 2195),
	(8778, false, 'Klaipeda', 2195),
	(8779, false, 'Panevėžys', 2195),
	(8780, false, 'Vilnius', 2195),
	(8781, false, 'Australásia', 2196),
	(8782, false, 'Istmo de Suez', 2196);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8783, true, 'Istmo do Panamá', 2196),
	(8784, false, 'Urais', 2196),
	(8785, false, '0,10km^2', 2197),
	(8786, true, '0,44km^2', 2197),
	(8787, false, '0,86km^2', 2197),
	(8788, false, '12,00km^2', 2197),
	(8789, true, ' Lago Superior', 2198),
	(8790, false, 'Lago Huron', 2198),
	(8791, false, 'Lago Michigan', 2198),
	(8792, false, 'Mar Cáspio', 2198);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8793, true, 'escudo canadense', 2199),
	(8794, false, 'Himalaia', 2199),
	(8795, false, 'Montanhas Apalaches', 2199),
	(8796, false, 'montanhas Rochosas', 2199),
	(8797, false, 'Hulaulá;', 2200),
	(8798, false, 'Lishan Didan', 2200),
	(8799, true, 'Lishana Deni', 2200),
	(8800, false, 'Neo-aramaico caldeu', 2200),
	(8801, false, 'Estandarte com Folhas', 2201),
	(8802, false, 'Marcha da Queda do Puck', 2201);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8803, true, 'O Canadá', 2201),
	(8804, false, 'O Red Maple', 2201),
	(8805, false, 'Bundesbahnen der Schweiz', 2202),
	(8806, true, 'Schweizerische Bundesbahnen', 2202),
	(
		8807,
		false,
		'Schweizerische Nationalbahnen',
		2202
	),
	(8808, false, 'Schweizerische Staatsbahnen', 2202),
	(8809, false, '12 de novembro', 2203),
	(8810, false, '2 de janeiro', 2203),
	(8811, true, '6 de dezembro', 2203),
	(8812, false, '8 de fevereiro', 2203);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8813, false, '43', 2204),
	(8814, false, '47', 2204),
	(8815, true, '49', 2204),
	(8816, false, '51', 2204),
	(8817, false, '1', 2205),
	(8818, false, '3', 2205),
	(8819, true, '4', 2205),
	(8820, false, '6', 2205),
	(
		8821,
		true,
		'Hall da Fama do Beisebol Nacional',
		2206
	),
	(
		8822,
		false,
		'Hall da Fama do Brinquedo Nacional',
		2206
	);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8823, false, 'Museu de Arte Moderna', 2206),
	(8824, false, 'Museu Metropolitano de Arte', 2206),
	(8825, true, 'Canadá e Estados Unidos', 2207),
	(8826, false, 'Chile e Argentina', 2207),
	(8827, false, 'Rússia e China', 2207),
	(8828, false, 'Índia e Paquistão', 2207),
	(8829, true, 'Dinamarca', 2208),
	(8830, false, 'Noruega', 2208),
	(8831, false, 'Reino Unido', 2208),
	(8832, false, 'Suécia', 2208);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8833, false, '1', 2209),
	(8834, false, '2', 2209),
	(8835, true, '3', 2209),
	(8836, false, '4', 2209),
	(
		8837,
		false,
		'Polônia, Islândia, Itália, Groenlândia, Espanha',
		2210
	),
	(
		8838,
		false,
		'Polônia, Islândia, Itália, Grécia, Sérvia',
		2210
	),
	(
		8839,
		true,
		'Portugal, Irlanda, Itália, Grécia, Espanha',
		2210
	),
	(
		8840,
		false,
		'Portugal, Islândia, Irlanda, Grécia, Sérvia',
		2210
	),
	(8841, false, 'Los Angles', 2211),
	(8842, true, 'Seattle', 2211);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8843, false, 'Toronto', 2211),
	(8844, false, 'Vancouver', 2211),
	(8845, false, 'Barcelona, Espanha', 2212),
	(8846, false, 'Berlim, Alemanha', 2212),
	(8847, false, 'Londres, Inglaterra', 2212),
	(8848, true, 'Roma, Itália', 2212),
	(8849, false, 'América do Norte', 2213),
	(8850, true, 'Europa', 2213),
	(8851, false, 'África', 2213),
	(8852, false, 'Ásia', 2213);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8853, false, 'Albany', 2214),
	(8854, false, 'Los Angeles', 2214),
	(8855, false, 'Seattle', 2214),
	(8856, true, 'Washington DC', 2214),
	(8857, true, 'georgiano', 2215),
	(8858, false, 'suaíli', 2215),
	(8859, false, 'turco', 2215),
	(8860, false, 'vietnamita', 2215),
	(8861, true, 'Alberta', 2216),
	(8862, false, 'Nova Gales do Sul', 2216);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8863, false, 'Queensland', 2216),
	(8864, false, 'vitoria', 2216),
	(8865, false, 'Angola', 2217),
	(8866, false, 'Camarões', 2217),
	(8867, false, 'Guiné', 2217),
	(8868, true, 'Guiné Equatorial', 2217),
	(8869, false, 'Alexandria', 2218),
	(8870, false, 'Luxor', 2218),
	(8871, true, 'Memphis', 2218),
	(8872, false, 'Tebas', 2218);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8873, false, 'Bósnia e Herzegovina', 2219),
	(8874, false, 'Croácia', 2219),
	(8875, false, 'Montenegro', 2219),
	(8876, true, 'Sérvia', 2219),
	(8877, false, 'Butão', 2220),
	(8878, false, 'Escócia', 2220),
	(8879, false, 'Kiribati', 2220),
	(8880, true, 'Sri Lanka', 2220),
	(8881, true, 'Califórnia', 2221),
	(8882, false, 'Flórida', 2221);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8883, false, 'Nova Iorque', 2221),
	(8884, false, 'Texas', 2221),
	(8885, true, 'Alasca', 2222),
	(8886, false, 'Califórnia', 2222),
	(8887, false, 'Texas', 2222),
	(8888, false, 'Washington', 2222),
	(8889, false, 'Austrália', 2223),
	(8890, false, 'Estados Unidos da América', 2223),
	(8891, false, 'Nações Unidas', 2223),
	(
		8892,
		true,
		'Ninguém, mas há reivindicações.',
		2223
	);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8893, true, 'Kaliningrado', 2224),
	(8894, false, 'Nizhny Novgorod', 2224),
	(8895, false, 'Omsk', 2224),
	(8896, false, 'samara', 2224),
	(8897, false, 'atlântico', 2225),
	(8898, false, 'indiano', 2225),
	(8899, true, 'Pacífico', 2225),
	(8900, false, 'ártico', 2225),
	(8901, false, 'Escócia', 2226),
	(8902, false, 'Inglaterra', 2226);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8903, false, 'Irlanda do Norte', 2226),
	(8904, true, 'País de Gales', 2226),
	(8905, false, 'Bielorrússia', 2227),
	(8906, true, 'Romênia', 2227),
	(8907, false, 'Tadjiquistão', 2227),
	(8908, false, 'Turquemenistão', 2227),
	(8909, true, 'Canadá', 2228),
	(8910, false, 'China', 2228),
	(8911, false, 'Estados Unidos da América', 2228),
	(8912, false, 'Rússia', 2228);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8913, false, 'Kitakyushu', 2229),
	(8914, false, 'Pyongyang', 2229),
	(8915, true, 'Seul', 2229),
	(8916, false, 'taegu', 2229),
	(8917, false, 'Aalborg', 2230),
	(8918, false, 'Aarhus', 2230),
	(8919, true, 'copenhague', 2230),
	(8920, false, 'Odense', 2230),
	(8921, false, 'Dundee', 2231),
	(8922, true, 'Edimburgo', 2231);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8923, false, 'Glasgow', 2231),
	(8924, false, 'Londres', 2231),
	(8925, false, 'Barcelona', 2232),
	(8926, true, 'Madri', 2232),
	(8927, false, 'Sevilha', 2232),
	(8928, false, 'Toledo', 2232),
	(8929, false, 'Bridgetown', 2233),
	(8930, true, 'Kingston', 2233),
	(8931, false, 'Porto Príncipe', 2233),
	(8932, false, 'São João', 2233);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8933, true, 'Albany', 2234),
	(8934, false, 'Búfalo', 2234),
	(8935, false, 'Nova Iorque', 2234),
	(8936, false, 'Rochester', 2234),
	(8937, true, 'Fénix', 2235),
	(8938, false, 'Montgomery', 2235),
	(8939, false, 'Raleigh', 2235),
	(8940, false, 'Tallahassee', 2235),
	(8941, false, 'Amarelo', 2236),
	(8942, false, 'Branco', 2236);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8943, false, 'Preto', 2236),
	(8944, true, 'Vermelho', 2236),
	(8945, false, 'crioulo', 2237),
	(8946, true, 'Espanhol', 2237),
	(8947, false, 'Inglês', 2237),
	(8948, false, 'Português', 2237),
	(8949, true, 'Ilha Principe Edward', 2238),
	(8950, false, 'Nova Brunswick', 2238),
	(8951, false, 'nova Escócia', 2238),
	(8952, false, 'Yukon', 2238);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8953, false, 'o décimo sexto estado', 2239),
	(8954, false, 'o quinquagésimo estado', 2239),
	(8955, false, 'O Segundo Estado', 2239),
	(8956, true, 'primeiro estado', 2239),
	(8957, false, 'Brasil', 2240),
	(8958, false, 'Canadá', 2240),
	(8960, false, 'China', 2240),
	(8962, false, 'Estados Unidos', 2240),
	(8963, true, 'Federação Russa', 2240),
	(8964, true, 'Rússia', 2240);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8965, true, 'Cidade do Vaticano', 2241),
	(8966, false, 'Maldivas', 2241),
	(8967, false, 'Malta', 2241),
	(8968, false, 'Mônaco', 2241),
	(8969, false, 'Península do Peloponeso', 2242),
	(8970, false, 'península escandinava', 2242),
	(8971, false, 'Península Européia', 2242),
	(8972, true, 'Península Ibérica', 2242),
	(8973, true, 'maori', 2243),
	(8974, false, 'polinésios', 2243);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8975, false, 'samoanos', 2243),
	(8976, false, 'Vikings', 2243),
	(8977, false, 'Flórida', 2244),
	(8978, false, 'Idaho', 2244),
	(8979, false, 'Novo México', 2244),
	(8980, true, 'Ohio', 2244),
	(8981, false, '0', 2245),
	(8982, false, '2', 2245),
	(8983, true, '4', 2245),
	(8984, false, '5', 2245);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8985, true, '1', 2246),
	(8986, false, '2', 2246),
	(8987, false, '3', 2246),
	(8988, false, '4', 2246),
	(8989, false, 'Adrianópolis', 2247),
	(8990, true, 'Constantinopla', 2247),
	(8991, false, 'HÜdavendigar', 2247),
	(8992, false, 'SöğÜt', 2247),
	(8993, false, 'Aterragem', 2248),
	(8994, false, 'Combball', 2248);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (8995, true, 'Futebol americano', 2248),
	(8996, false, 'Handebol', 2248),
	(8997, false, 'estoniano', 2249),
	(8998, false, 'finlandês', 2249),
	(8999, false, 'húngaro', 2249),
	(9000, true, 'Samoieda', 2249),
	(9001, true, 'Kaliningrado', 2250),
	(9002, false, 'Kazan', 2250),
	(9003, false, 'Krasnodar', 2250),
	(9004, false, 'Kursk', 2250);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9005, true, 'Anatólia', 2251),
	(9006, false, 'Ismute da Anatólia', 2251),
	(9007, false, 'Ismuth de Ottoma', 2251),
	(9008, false, 'Ottoma', 2251),
	(9009, false, 'Bélgica', 2252),
	(9010, false, 'França', 2252),
	(9011, false, 'Reino Unido', 2252),
	(9012, true, 'Suíça', 2252),
	(9013, false, 'Andorra', 2253),
	(9014, true, 'Bélgica', 2253);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9015, false, 'França', 2253),
	(9016, false, 'Luxemburgo', 2253),
	(9017, false, 'Astúrias', 2254),
	(9018, false, 'León', 2254),
	(9019, true, 'Múrcia', 2254),
	(9020, false, 'Navarra', 2254),
	(9021, true, 'Barbados', 2255),
	(9022, false, 'Cuba', 2255),
	(9023, false, 'Dominica', 2255),
	(9024, false, 'Jamaica', 2255);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9025, true, 'Austrália Ocidental', 2256),
	(9026, false, 'Sul da Austrália', 2256),
	(9027, false, 'Tasmânia', 2256),
	(9028, false, 'Território do Norte', 2256),
	(9029, false, 'Burkina Faso', 2257),
	(9030, true, 'Mali', 2257),
	(9031, false, 'Níger', 2257),
	(9032, false, 'Senegal', 2257),
	(
		9033,
		false,
		'Condado de Braxton, Virgínia',
		2258
	),
	(9034, true, 'Condado de Fairfax, Virgínia', 2258);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9035, false, 'Lemon Grove, Califórnia', 2258),
	(9036, false, 'Medford, Óregon', 2258),
	(9037, false, '2', 2259),
	(9038, false, '3', 2259),
	(9039, false, '4', 2259),
	(9040, true, '5', 2259),
	(9041, false, ' Bulawayo', 2260),
	(9042, false, 'Moçambique', 2260),
	(9043, true, 'Rodésia', 2260),
	(9044, false, 'Zâmbia', 2260);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9045, false, 'Andorra', 2261),
	(9046, true, 'Caxemira', 2261),
	(9047, false, 'Gibraltar', 2261),
	(9048, false, 'Quin', 2261),
	(9049, false, 'Cambridgeshire', 2262),
	(9050, false, 'Essex', 2262),
	(9051, true, 'Norfolk', 2262),
	(9052, false, 'Suffolk', 2262),
	(9053, false, 'Buckinghamshire', 2263),
	(9054, true, 'Hampshire', 2263);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9055, false, 'Oxfordshire', 2263),
	(9056, false, 'Surrey', 2263),
	(9057, false, 'América do Sul', 2264),
	(9058, false, 'Europa', 2264),
	(9059, true, 'África', 2264),
	(9060, false, 'Ásia', 2264),
	(9061, false, 'América do Sul', 2265),
	(9062, false, 'Europa', 2265),
	(9063, true, 'África', 2265),
	(9064, false, 'Ásia', 2265);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9065, true, 'Amarelo', 2266),
	(9066, false, 'Azul', 2266),
	(9067, false, 'Verde', 2266),
	(9068, false, 'Vermelho', 2266),
	(9069, false, 'Kentucky', 2267),
	(9070, true, 'Michigan', 2267),
	(9071, false, 'Pensilvânia', 2267),
	(9072, false, 'Virgínia', 2267),
	(9073, false, 'Espanha', 2268),
	(9074, false, 'França', 2268);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9075, false, 'Portugal', 2268),
	(9076, true, 'Reino Unido', 2268),
	(9077, false, 'Alberta', 2269),
	(9078, false, 'nova Escócia', 2269),
	(9079, false, 'Ontário', 2269),
	(9080, true, 'Quebec', 2269),
	(9081, false, '10', 2270),
	(9082, true, '103', 2270),
	(9083, false, '59', 2270),
	(9084, false, '79', 2270);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9085, false, ' Otaku Central', 2271),
	(9086, true, 'cidade elétrica', 2271),
	(9087, false, 'Olhos grandes', 2271),
	(9088, false, 'Rio Passeio da Lua', 2271),
	(9089, false, 'México e Estados Unidos', 2272),
	(9090, true, 'Peru e Bolívia', 2272),
	(9091, false, 'Quênia e Uganda', 2272),
	(9092, false, 'Índia e Bangladesh', 2272),
	(9093, false, 'Argentina', 2273),
	(9094, false, 'Austrália', 2273);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9095, false, 'Japão', 2273),
	(9096, true, 'O Reino Unido', 2273),
	(9097, true, 'América do Norte', 2274),
	(9098, false, 'América do Sul', 2274),
	(9099, false, 'África', 2274),
	(9100, false, 'Ásia', 2274),
	(9101, false, 'Brasil', 2275),
	(9102, false, 'Colômbia', 2275),
	(9103, false, 'Equador', 2275),
	(9104, true, 'Peru', 2275);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9105, false, 'No Mar do Caribe', 2276),
	(
		9106,
		true,
		'Oceano Atlântico Norte, entre a Flórida e Porto Rico',
		2276
	),
	(
		9107,
		false,
		'Oceano Pacífico Norte, entre o Japão e os EUA',
		2276
	),
	(
		9108,
		false,
		'Oceano Pacífico Sul, longe do Chile',
		2276
	),
	(9109, false, 'Lesoto e Suazilândia', 2277),
	(9110, false, 'Ruanda e Burundi', 2277),
	(9111, false, 'Togo e Benin', 2277),
	(9112, true, 'Zâmbia e Zimbábue', 2277),
	(
		9113,
		false,
		'Dakota do Sul, Minnesota, Nebraska, Iowa',
		2278
	),
	(
		9114,
		false,
		'Kansas, Oklahoma, Arkansas, Louisiana',
		2278
	);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (
		9115,
		true,
		'Utah, Colorado, Arizona, Novo México',
		2278
	),
	(9116, false, 'Óregon, Idaho, Nevada, Utah', 2278),
	(9117, false, 'Berlim', 2279),
	(9118, false, 'Dortmund', 2279),
	(9119, false, 'Hamburgo', 2279),
	(9120, true, 'Munique', 2279),
	(9121, false, 'Amsterdã', 2280),
	(9122, false, 'Berlim', 2280),
	(9123, true, 'Birmingham', 2280),
	(9124, false, 'Veneza', 2280);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9125, true, 'Berna', 2281),
	(9126, false, 'Frankfurt', 2281),
	(9127, false, 'rico em zÜ', 2281),
	(9128, false, 'Viena', 2281),
	(9129, false, 'Catar', 2282),
	(9130, false, 'Jordânia', 2282),
	(9131, false, 'Kuwait', 2282),
	(9132, true, 'Líbano', 2282),
	(9133, true, 'altaico', 2283),
	(9134, false, 'Dravidiano', 2283);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9135, false, 'indo-europeu', 2283),
	(9136, false, 'sino-tibetana', 2283),
	(9137, false, 'Cairo', 2284),
	(9138, false, 'Moscou', 2284),
	(9139, false, 'Pequim', 2284),
	(9140, true, 'Sidney', 2284),
	(9141, false, 'Filadélfia, Pensilvânia', 2285),
	(9142, false, 'Phoenix, Arizona', 2285),
	(9143, false, 'San Antonio, Texas', 2285),
	(9144, true, 'São Francisco, Califórnia', 2285);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9145, false, 'França', 2286),
	(9146, false, 'Holanda', 2286),
	(9147, true, 'Lituânia', 2286),
	(9148, false, 'Noruega', 2286),
	(9149, false, 'Argélia', 2287),
	(9150, false, 'Burkina Faso', 2287),
	(9151, false, 'Moçambique', 2287),
	(9152, true, 'Suriname', 2287),
	(9153, false, 'Montenegro', 2288),
	(9154, true, 'Niue', 2288);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9155, false, 'Sudão do Sul', 2288),
	(9156, false, 'Tuvalu', 2288),
	(9157, false, 'Eslováquia', 2289),
	(9158, false, 'Finlândia', 2289),
	(9159, false, 'Hong Kong', 2289),
	(9160, true, 'Noruega', 2289),
	(9161, false, 'Iki', 2290),
	(9162, false, 'Odaiba', 2290),
	(9163, false, 'Okinawa', 2290),
	(9164, true, 'Shikoku', 2290);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9165, true, 'Java', 2291),
	(9166, false, 'Luzon', 2291),
	(9167, false, 'Mindanau', 2291),
	(9168, false, 'Palawan', 2291),
	(9169, false, 'Bolívia', 2292),
	(9170, false, 'Etiópia', 2292),
	(9171, false, 'Suíça', 2292),
	(9172, true, 'Uzbequistão', 2292),
	(9173, false, 'México', 2293),
	(9174, false, 'Peru', 2293);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9175, true, 'tailândia', 2293),
	(9176, false, 'África do Sul', 2293),
	(9177, false, 'Azerbaijão', 2294),
	(9178, false, 'Irã', 2294),
	(9179, true, 'Paquistão', 2294),
	(9180, false, 'Peru', 2294),
	(9181, true, 'Alemanha', 2295),
	(9182, false, 'Canadá', 2295),
	(9183, false, 'Suécia', 2295),
	(9184, false, 'Áustria', 2295);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9185, false, 'Danúbio', 2296),
	(9186, false, 'Dnieper', 2296),
	(9187, false, 'Urais', 2296),
	(9188, true, 'Volga', 2296),
	(9189, true, ' Rhode Island', 2297),
	(9190, false, 'Maine', 2297),
	(9191, false, 'Massachusetts', 2297),
	(9192, false, 'Vermont', 2297),
	(9193, false, 'Cidade do México', 2298),
	(9194, false, 'Los Angeles', 2298);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9195, false, 'Nova Iorque', 2298),
	(9196, true, 'São Paulo', 2298),
	(9197, false, 'Escócia', 2299),
	(9198, false, 'Ilha de Wight', 2299),
	(9199, false, 'Irlanda', 2299),
	(9200, true, 'País de Gales', 2299),
	(9201, false, 'Canadá', 2300),
	(9202, false, 'China', 2300),
	(9203, false, 'Nenhum país', 2300),
	(9204, true, 'Suíça', 2300);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9205, false, 'China', 2301),
	(9206, false, 'Reino Unido', 2301),
	(9207, false, 'Somália', 2301),
	(9208, true, 'África do Sul', 2301),
	(9209, false, '1.225 pés', 2302),
	(9210, true, '1.776 pés', 2302),
	(9211, false, '1.888 pés', 2302),
	(9212, false, '1.960 pés', 2302),
	(9213, false, 'Brisbane', 2303),
	(9214, true, 'Canberra', 2303);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9215, false, 'Melbourne', 2303),
	(9216, false, 'Sidney', 2303),
	(9217, false, 'Kiev', 2304),
	(9218, true, 'Minsk', 2304),
	(9219, false, 'Varsóvia', 2304),
	(9220, false, 'Vilnius', 2304),
	(9221, false, 'Kelowna', 2305),
	(9222, false, 'Ter esperança', 2305),
	(9223, false, 'Vancouver', 2305),
	(9224, true, 'vitoria', 2305);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9225, true, 'Bratislava', 2306),
	(9226, false, 'Liubliana', 2306),
	(9227, false, 'Sarajevo', 2306),
	(9228, false, 'Sofia', 2306),
	(9229, true, 'Liubliana', 2307),
	(9230, false, 'Maribor', 2307),
	(9231, false, 'Trbovlje', 2307),
	(9232, false, 'Velenje', 2307),
	(9233, false, 'Helsinque', 2308),
	(9234, false, 'Riga', 2308);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9235, true, 'Tallin', 2308),
	(9236, false, 'Tartu', 2308),
	(9237, false, 'Helsinque', 2309),
	(9238, false, 'Riga', 2309),
	(9239, false, 'Tallin', 2309),
	(9240, true, 'Vilnius', 2309),
	(9241, false, 'Auckland', 2310),
	(9242, false, 'Christchurch', 2310),
	(9243, false, 'Melbourne', 2310),
	(9244, true, 'Wellington', 2310);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9245, false, 'Luanda', 2311),
	(9246, false, 'N''Djamena', 2311),
	(9247, false, 'Trípoli', 2311),
	(9248, true, 'vitoria', 2311),
	(9249, true, 'Carson City', 2312),
	(9250, false, 'Henderson', 2312),
	(9251, false, 'Las Vegas', 2312),
	(9252, false, 'Reno', 2312),
	(9253, false, 'Buenos Aires', 2313),
	(9254, true, 'Lima', 2313);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9255, false, 'Montevidéu', 2313),
	(9256, false, 'Santiago', 2313),
	(9257, false, 'Conacri', 2314),
	(9258, true, 'Dacar', 2314),
	(9259, false, 'Monróvia', 2314),
	(9260, false, 'Nouakchott', 2314),
	(9261, true, 'Dzongkha', 2315),
	(9262, false, 'groma', 2315),
	(9263, false, 'Karen', 2315),
	(9264, false, 'Ladakhi', 2315);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9265, true, 'Casablanca', 2316),
	(9266, false, 'Fez', 2316),
	(9267, false, 'Oferta', 2316),
	(9268, false, 'rabat', 2316),
	(9269, false, 'Bornéu', 2317),
	(9270, true, 'Groenlândia', 2317),
	(9271, false, 'Madagáscar', 2317),
	(9272, false, 'Nova Guiné', 2317),
	(9273, false, 'Annapurna', 2318),
	(9274, false, 'Kangchenjunga', 2318);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9275, true, 'Monte Everest', 2318),
	(9276, false, 'Monte Godwin Austen', 2318),
	(9277, false, ' Estação McMurdo, Antártica', 2319),
	(9278, true, 'Alerta, Canadá', 2319),
	(9279, false, 'HonningsvÅg, Noruega', 2319),
	(9280, false, 'Nagurskoye, Rússia', 2319),
	(9281, false, 'Lago Malawi', 2320),
	(9282, false, 'Lago Tanganica', 2320),
	(9283, false, 'Lago Turkana', 2320),
	(9284, true, 'Lago Vitória', 2320);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9285, false, 'Danúbio', 2321),
	(9286, false, 'Reno', 2321),
	(9287, false, 'Tâmisa', 2321),
	(9288, true, 'Volga', 2321),
	(9289, false, 'Brasil', 2322),
	(9290, false, 'Chile', 2322),
	(9291, true, 'Suriname', 2322),
	(9292, false, 'Uruguai', 2322),
	(9293, false, 'Abecásia', 2323),
	(9294, false, 'Checoslováquia', 2323);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9295, true, 'Iugoslávia', 2323),
	(9296, false, 'Ossétia do Sul', 2323),
	(9297, false, 'Porto de Amsterdã', 2324),
	(9298, false, 'Porto de Antuérpia', 2324),
	(9299, false, 'Porto de Hamburgo', 2324),
	(9300, true, 'Porto de Roterdã', 2324),
	(9301, false, ' Sequóia', 2325),
	(9302, false, 'Montanha rochosa', 2325),
	(9303, true, 'Yellowstone', 2325),
	(9304, false, 'Yosemite', 2325);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9305, false, 'Amazonas', 2326),
	(9306, false, 'Missouri', 2326),
	(9307, true, 'Nilo', 2326),
	(9308, false, 'Yangtze', 2326),
	(9309, false, 'Angola', 2327),
	(9310, false, 'Egito', 2327),
	(9311, true, 'Nepal', 2327),
	(9312, false, 'Panamá', 2327),
	(9313, false, '10', 2328),
	(9314, true, '12', 2328);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9315, false, '13', 2328),
	(9316, false, '14', 2328),
	(9317, false, '5', 2329),
	(9318, true, '6', 2329),
	(9319, false, '7', 2329),
	(9320, false, '8', 2329),
	(9321, false, '153', 2330),
	(9322, false, '178', 2330),
	(9323, true, '195', 2330),
	(9324, false, '201', 2330);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9325, true, '11', 2331),
	(9326, false, '16', 2331),
	(9327, false, '24', 2331),
	(9328, false, '6', 2331),
	(9329, true, '11', 2332),
	(9330, false, '2', 2332),
	(9331, false, '5', 2332),
	(9332, false, '8', 2332),
	(9333, false, '2', 2333),
	(9334, true, '3', 2333);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9335, false, '4', 2333),
	(9336, false, '5', 2333),
	(9337, false, 'Dois', 2334),
	(9338, true, 'quatro', 2334),
	(9339, false, 'Três', 2334),
	(9340, false, 'Um', 2334),
	(9341, false, '10', 2335),
	(9342, true, '12', 2335),
	(9343, false, '8', 2335),
	(9344, false, '9', 2335);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9345, true, '0', 2336),
	(9346, false, '1', 2336),
	(9347, false, '2', 2336),
	(9348, false, '3', 2336),
	(9349, false, 'Alpes', 2337),
	(9350, false, 'Cárpatos', 2337),
	(9351, true, 'Pirinéus', 2337),
	(9352, false, 'Urais', 2337),
	(9353, false, 'Fuerteventura', 2338),
	(9354, false, 'Grã-Canária', 2338);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9355, false, 'Maui', 2338),
	(9356, true, 'Tenerife', 2338),
	(9357, false, 'Botsuana', 2339),
	(9358, false, 'Gabão', 2339),
	(9359, false, 'Ir', 2339),
	(9360, true, 'Moçambique', 2339),
	(9361, false, 'Irlanda', 2340),
	(9362, false, 'Lituânia', 2340),
	(9363, true, 'Noruega', 2340),
	(9364, false, 'Tcheca', 2340);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9365, true, 'Andorra', 2341),
	(9366, false, 'Liechtenstein', 2341),
	(9367, false, 'Mônaco', 2341),
	(9368, false, 'San Marino', 2341),
	(9369, false, 'Alemanha', 2342),
	(9370, false, 'Dinamarca', 2342),
	(9371, false, 'Noruega', 2342),
	(9372, true, 'Suécia', 2342),
	(9373, false, 'Londres', 2343),
	(9374, false, 'Rungata', 2343);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9375, true, 'Urutora', 2343),
	(9376, false, 'Washington', 2343),
	(9377, false, 'Austrália', 2344),
	(9378, false, 'Chile', 2344),
	(9379, true, 'Estados Unidos', 2344),
	(9380, false, 'Noruega', 2344),
	(9381, false, 'astecas', 2345),
	(9382, false, 'incas', 2345),
	(9383, true, 'maias', 2345),
	(9384, false, 'toltecas', 2345);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9385, true, '1066', 2346),
	(9386, false, '1204', 2346),
	(9387, false, '1420', 2346),
	(9388, false, '911', 2346),
	(9389, true, 'Aragão', 2347),
	(9390, false, 'galiza', 2347),
	(9391, false, 'León', 2347),
	(9392, false, 'Navarra', 2347),
	(9393, false, 'Arcádio', 2348),
	(9394, false, 'Constantino IV', 2348);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9395, true, 'Justiniano I', 2348),
	(9396, false, 'Teodósio, o Grande', 2348),
	(9397, false, 'Insultou suas mães', 2349),
	(
		9398,
		true,
		'Joguei-os para fora de uma janela',
		2349
	),
	(9399, false, 'Pendurado eles.', 2349),
	(9400, false, 'Trancou-os em paliçadas', 2349),
	(9401, false, 'Argentina', 2350),
	(9402, false, 'Bulgária', 2350),
	(9403, false, 'Nepal', 2350),
	(9404, true, 'África do Sul', 2350);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9405, false, '1 º de junho', 2351),
	(9406, false, '1º de dezembro', 2351),
	(9407, true, '25 de março', 2351),
	(9408, false, '25 de setembro', 2351),
	(9409, false, 'aiúbida', 2352),
	(9410, true, 'mameluco', 2352),
	(9411, false, 'seljúcida', 2352),
	(9412, false, 'Ummayyad', 2352),
	(9413, false, 'Grande Príncipe de Novgorod', 2353),
	(
		9414,
		true,
		'Líder dos cossacos ucranianos',
		2353
	);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9415, false, 'Príncipe da Valáquia', 2353),
	(
		9416,
		false,
		'Secretário-Geral do Partido Comunista da URSS',
		2353
	),
	(9417, false, 'Argel', 2354),
	(9418, true, 'Brazzaville', 2354),
	(9419, false, 'Paris', 2354),
	(9420, false, 'Túnis', 2354),
	(9421, false, 'Henrique V', 2355),
	(9422, false, 'Ricardo III', 2355),
	(9423, true, 'Ricardo Neville', 2355),
	(9424, false, 'Thomas Warwick', 2355);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9425, false, 'Alemanha, Espanha, Áustria', 2356),
	(9426, false, 'França, Rússia, Alemanha', 2356),
	(9427, true, 'Inglaterra, Alemanha, Rússia', 2356),
	(9428, false, 'Sérvia, Rússia, Croácia', 2356),
	(9429, true, ' hispania', 2357),
	(9430, false, 'Gália', 2357),
	(9431, false, 'Itália', 2357),
	(9432, false, 'Ásia', 2357),
	(9433, false, '1774', 2358),
	(9434, false, '1775', 2358);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9435, true, '1776', 2358),
	(9436, false, '1777', 2358),
	(9437, false, '1668', 2359),
	(9438, false, '1798', 2359),
	(9439, false, '1859', 2359),
	(9440, true, '1867', 2359),
	(9441, false, '1991', 2360),
	(9442, true, '1995', 2360),
	(9443, false, '2001', 2360),
	(9444, false, '2011', 2360);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9445, false, '21 de novembro de 1969', 2361),
	(9446, true, '27 de outubro de 1980', 2361),
	(9447, false, '29 de outubro de 1969', 2361),
	(9448, false, '9 de dezembro de 1991', 2361),
	(9449, false, '28 de abril', 2362),
	(9450, false, '28 de janeiro', 2362),
	(9451, true, '28 de julho', 2362),
	(9452, false, '28 de junho', 2362),
	(
		9453,
		false,
		'Aquemênida, Média, Parta, Sassânida',
		2363
	),
	(
		9454,
		false,
		'Aquemênida, Média, Sassânida, Parta',
		2363
	);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (
		9455,
		true,
		'Mediana, Aquemênida, Parta, Sassânida',
		2363
	),
	(
		9456,
		false,
		'Mediana, Aquemênida, Sassânida, Parta',
		2363
	),
	(9457, false, 'Guilherme e Isabel', 2364),
	(9458, false, 'Jorge e Ana', 2364),
	(9459, false, 'José e Catarina', 2364),
	(9460, true, 'João e Maria', 2364),
	(9461, true, 'Anselmo de Cantuária', 2365),
	(9462, false, 'Aristóteles', 2365),
	(9463, false, 'Immanuel Kant', 2365),
	(9464, false, 'RenÉ Descartes', 2365);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9465, false, 'Catalunha', 2366),
	(9466, false, 'galiza', 2366),
	(9467, false, 'granada', 2366),
	(9468, true, 'Navarra', 2366),
	(9469, true, 'Alexandre VI', 2367),
	(9470, false, 'Pio III', 2367),
	(9471, false, 'Urbano II', 2367),
	(9472, false, 'V inocente', 2367),
	(9473, false, 'Atena', 2368),
	(9474, false, 'Atena e Zeus', 2368);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (
		9475,
		true,
		'Qualquer deus que eles quisessem',
		2368
	),
	(9476, false, 'Zeus', 2368),
	(9477, false, 'Barroco', 2369),
	(9478, false, 'Clássico', 2369),
	(9479, false, 'Renascimento', 2369),
	(9480, true, 'Romântico', 2369),
	(9481, false, 'Crimeia', 2370),
	(9482, true, 'Cáucaso', 2370),
	(9483, false, 'Stalingrado', 2370),
	(9484, false, 'Voronezh', 2370);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9485, false, ' Refrigerantes', 2371),
	(9486, true, 'cartões postais', 2371),
	(9487, false, 'cigarros', 2371),
	(9488, false, 'Álcool', 2371),
	(9489, false, 'Austrália e Nova Zelândia', 2372),
	(9490, false, 'Canadá e Noruega', 2372),
	(9491, false, 'Estados Unidos e Inglaterra', 2372),
	(9492, true, 'França e Brasil', 2372),
	(9493, false, 'Ataque a Pearl Harbor', 2373),
	(9494, false, 'Ataque à Ilha Truk', 2373);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9495, true, 'Batalha de Midway', 2373),
	(9496, false, 'Batalha do Mar de Coral', 2373),
	(
		9497,
		false,
		'Guardião da Casa da Moeda Real',
		2374
	),
	(9498, false, 'Membro do Parlamento', 2374),
	(9499, false, 'Professor de matemática', 2374),
	(
		9500,
		true,
		'Surveyor para a cidade de Londres',
		2374
	),
	(9501, false, 'Carlos V', 2375),
	(9502, false, 'Filipe II', 2375),
	(9503, true, 'Filipe V', 2375),
	(9504, false, 'Francisco José', 2375);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9505, false, 'Albert Einstein', 2376),
	(9506, false, 'John von Neumann', 2376),
	(9507, false, 'Max Planck', 2376),
	(9508, true, 'Werner Heisenberg', 2376),
	(9509, false, 'Ofensiva da Criméia', 2377),
	(
		9510,
		false,
		'Ofensiva Leningrado-Novgorod',
		2377
	),
	(9511, true, 'Ofensiva Vístula-Oder', 2377),
	(9512, false, 'Operação Bagration', 2377),
	(9513, false, 'Caixa Azul', 2378),
	(9514, false, 'Operação Barbarossa', 2378);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9515, false, 'Operação Girassol', 2378),
	(9516, true, 'operação tufão', 2378),
	(9517, false, 'Naapolion van Bonijpaart', 2379),
	(9518, true, 'Napoleão de Bonaparte', 2379),
	(9519, false, 'Napoleão de Buenoparte', 2379),
	(9520, false, 'Napoleão do Boaparte', 2379),
	(9521, true, 'Anel Culper', 2380),
	(9522, false, 'Espiões de Washington', 2380),
	(
		9523,
		false,
		'Rede de Espiões de Nova York',
		2380
	),
	(9524, false, 'Sem nome', 2380);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9525, true, 'Nova Amsterdã', 2381),
	(9526, false, 'Nova Londres', 2381),
	(9527, false, 'Nova Paris', 2381),
	(9528, false, 'Nova Roma', 2381),
	(9529, false, 'Diturak Zhulati', 2382),
	(9530, true, 'Gjergj Kastrioti', 2382),
	(9531, false, 'Iskander Bejko', 2382),
	(9532, false, 'Mirash Krasniki', 2382),
	(9533, false, 'Austrália', 2383),
	(9534, true, 'Hong Kong', 2383);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9535, false, 'Irlanda', 2383),
	(9536, false, 'Índia', 2383),
	(9537, false, 'Ganhando Independência', 2384),
	(9538, false, 'Juros baixos', 2384),
	(9539, true, 'Sufrágio universal genuíno', 2384),
	(
		9540,
		false,
		'Volte sob o domínio britânico',
		2384
	),
	(9541, false, 'Eduardo II', 2385),
	(9542, false, 'Eduardo III', 2385),
	(9543, false, 'Henrique IV', 2385),
	(9544, true, 'Ricardo II', 2385);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9545, false, 'Henrique I', 2386),
	(9546, true, 'Henrique II', 2386),
	(9547, false, 'Henrique V', 2386),
	(9548, false, 'Ricardo I', 2386),
	(9549, false, 'DD-444', 2387),
	(9550, true, 'DD-445', 2387),
	(9551, false, 'DD-446', 2387),
	(9552, false, 'DD-992', 2387),
	(9553, false, '1º de setembro de 1941', 2388),
	(9554, false, '21 de fevereiro de 1926', 2388);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9555, true, '4 de abril de 1925', 2388),
	(9556, false, '8 de março de 1935', 2388),
	(9557, false, '1º de setembro de 1939', 2389),
	(9558, false, '27 de fevereiro de 1933', 2389),
	(9559, true, '30 de janeiro de 1933', 2389),
	(9560, false, '6 de outubro de 1939', 2389),
	(9561, false, '1756', 2390),
	(9562, true, '1789', 2390),
	(9563, false, '1799', 2390),
	(9564, false, '1823', 2390);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9565, false, '1º de julho de 1763', 2391),
	(9566, false, '1º de julho de 1832', 2391),
	(9567, true, '1º de julho de 1867', 2391),
	(9568, false, '1º de julho de 1902', 2391),
	(9569, false, '100.000', 2392),
	(9570, false, '225.000', 2392),
	(9571, true, '350.000', 2392),
	(9572, false, '500.000', 2392),
	(9573, false, '21', 2393),
	(9574, false, '31', 2393);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9575, true, '32', 2393),
	(9576, false, '50', 2393),
	(9577, false, '20 dias', 2394),
	(9578, false, '224 dias', 2394),
	(9579, false, '55 dias', 2394),
	(9580, true, '63 dias', 2394),
	(9581, true, '35', 2395),
	(9582, false, '62', 2395),
	(9583, false, '73', 2395),
	(9584, false, '87', 2395);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9585, true, 'Charles Guiteau', 2396),
	(9586, false, 'John Wilkes Booth', 2396),
	(9587, false, 'Leon Czolgosz', 2396),
	(9588, false, 'Sirhan Sirhan', 2396),
	(9589, false, 'Joseph Stalin', 2397),
	(9590, true, 'Karl Marx', 2397),
	(9591, false, 'Vladimir Lenin', 2397),
	(9592, false, 'Vladimir Putin', 2397),
	(9593, false, 'Democrata', 2398),
	(9594, false, 'Independente', 2398);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9595, true, 'Republicano', 2398),
	(9596, false, 'whig', 2398),
	(9597, false, ' Crucificação', 2399),
	(9598, false, 'Decapitação', 2399),
	(9599, false, 'Pelotão de fuzilamento', 2399),
	(9600, true, 'Tóxico', 2399),
	(9601, false, 'Kagoshima', 2400),
	(9602, false, 'Kawasaki', 2400),
	(9603, true, 'Nagasaki', 2400),
	(9604, false, 'Tóquio', 2400);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9605, false, 'Atenas', 2401),
	(9606, true, 'Constantinopla', 2401),
	(9607, false, 'Hamburgo', 2401),
	(9608, false, 'Roma', 2401),
	(9609, false, 'Daniel Defoe', 2402),
	(9610, true, 'John Blunt', 2402),
	(9611, false, 'John Churchill', 2402),
	(9612, false, 'Robert Harley', 2402),
	(9613, false, 'Checoslováquia', 2403),
	(9614, false, 'Hungria', 2403);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9615, true, 'Polônia', 2403),
	(9616, false, 'Áustria', 2403),
	(9617, false, '1899', 2404),
	(9618, false, '1907', 2404),
	(9619, true, '1911', 2404),
	(9620, false, '1917', 2404),
	(9621, false, '1905', 2405),
	(9622, true, '1914', 2405),
	(9623, false, '1919', 2405),
	(9624, false, '1925', 2405);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9625, false, '1925', 2406),
	(9626, true, '1929', 2406),
	(9627, false, '1930', 2406),
	(9628, false, '1932', 2406),
	(9629, true, '1721', 2407),
	(9630, false, '1724', 2407),
	(9631, false, '1726', 2407),
	(9632, false, '1727', 2407),
	(9633, false, 'Alemanha', 2408),
	(9634, true, 'Geórgia', 2408);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9635, false, 'Polônia', 2408),
	(9636, false, 'Rússia', 2408),
	(9637, false, 'Bangladesh e Butão', 2409),
	(
		9638,
		false,
		'Coreia do Norte e Coreia do Sul',
		2409
	),
	(9639, false, 'Hutu e Ruanda', 2409),
	(9640, true, 'Polônia e Lituânia', 2409),
	(9641, true, 'André Jackson', 2410),
	(9642, false, 'Harry S. Truman', 2410),
	(9643, false, 'John Quincy Adams', 2410),
	(9644, false, 'Martin Van Buren', 2410);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9645, true, 'Harper''s Ferry', 2411),
	(9646, false, 'Harrisonburg', 2411),
	(9647, false, 'Martinsburgo', 2411),
	(9648, false, 'Richmond', 2411),
	(9649, false, '1891', 2412),
	(9650, false, '1990', 2412),
	(9651, true, '1991', 2412),
	(9652, false, '1992', 2412),
	(9653, false, 'Guerra da Crimeia', 2413),
	(9654, true, 'Primeira Guerra Mundial', 2413);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9655, false, 'revolução sérvia', 2413),
	(9656, false, 'Segunda Guerra Balcânica', 2413),
	(
		9657,
		true,
		'A assinatura da Declaração de Independência',
		2414
	),
	(
		9658,
		false,
		'A ratificação da Constituição',
		2414
	),
	(9659, false, 'A travessia do rio Delaware', 2414),
	(
		9660,
		false,
		'O aniversário da Batalha de Gettysburg',
		2414
	),
	(9661, false, 'Iorque', 2415),
	(9662, false, 'Lencastre', 2415),
	(9663, false, 'Stuart', 2415),
	(9664, true, 'tudor', 2415);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9665, false, 'M4 Sherman', 2416),
	(9666, false, 'T-34', 2416),
	(9667, false, 'Tigre H1', 2416),
	(9668, true, 'Tog II', 2416),
	(9669, false, 'Espada', 2417),
	(9670, false, 'Juno', 2417),
	(9671, false, 'Ouro', 2417),
	(9672, true, 'Prata', 2417),
	(9673, true, ' União Soviética', 2418),
	(9674, false, 'Alemanha', 2418);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9675, false, 'Itália', 2418),
	(9676, false, 'Japão', 2418),
	(9677, false, 'aqueus', 2419),
	(9678, false, 'dórios', 2419),
	(9679, true, 'ilírios', 2419),
	(9680, false, 'Jônios', 2419),
	(9681, false, ' A Serpente Azul', 2420),
	(9682, false, 'O artilheiro da Alemanha', 2420),
	(9683, true, 'O Barão Vermelho', 2420),
	(9684, false, 'O ás voando alto', 2420);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9685, false, 'estrada das especiarias', 2421),
	(9686, false, 'estrada de barro', 2421),
	(9687, false, 'estrada do sal', 2421),
	(9688, true, 'Rota da Seda', 2421),
	(9689, false, 'Alexandre o grande', 2422),
	(9690, true, 'canibal', 2422),
	(9691, false, 'Garmanicus', 2422),
	(9692, false, 'Tibério', 2422),
	(9693, false, 'Czar Nicolau II', 2423),
	(9694, false, 'Henry VIII', 2423);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9695, false, 'Isabel I', 2423),
	(9696, true, 'Maria Antonieta', 2423),
	(9697, true, 'Afeganistão', 2424),
	(9698, false, 'China', 2424),
	(9699, false, 'Iraque', 2424),
	(9700, false, 'Rússia', 2424),
	(9701, false, 'Badulla', 2425),
	(9702, true, 'Ceilão', 2425),
	(9703, false, 'colombo', 2425),
	(9704, false, 'Mianmar', 2425);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9705, false, '1º de agosto de 1916', 2426),
	(9706, true, '1º de julho de 1916', 2426),
	(9707, false, '2 de julho de 1916', 2426),
	(9708, false, '30 de junho de 1916', 2426),
	(9709, false, '12 de dezembro de 1989', 2427),
	(9710, true, '4 de setembro de 1998', 2427),
	(9711, false, '7 de fevereiro de 2000', 2427),
	(9712, false, '9 de outubro de 1997', 2427),
	(9713, false, '4 anos', 2428),
	(9714, false, '5 anos', 2428);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9715, true, '6 anos', 2428),
	(9716, false, '7 anos', 2428),
	(9717, false, '43', 2429),
	(9718, false, '47', 2429),
	(9719, true, '56', 2429),
	(9720, false, '65', 2429),
	(9721, false, '1', 2430),
	(9722, false, '3', 2430),
	(9723, true, '6', 2430),
	(9724, false, '7', 2430);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9725, false, 'Bulgária', 2431),
	(9726, true, 'Croácia', 2431),
	(9727, false, 'Eslovênia', 2431),
	(9728, false, 'Peru', 2431),
	(9729, false, 'Egito', 2432),
	(9730, false, 'Grécia', 2432),
	(9731, true, 'Peru', 2432),
	(9732, false, 'Síria', 2432),
	(9733, false, 'Henry Longfellow', 2433),
	(9734, false, 'Nathan Hale', 2433);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9735, true, 'Paul Revere', 2433),
	(9736, false, 'Thomas Paine', 2433),
	(9737, true, 'Alexandre Flemming', 2434),
	(9738, false, 'Alfred nobel', 2434),
	(9739, false, 'Louis Pasteur', 2434),
	(9740, false, 'Marie Curie', 2434),
	(9741, false, 'Fumimaro Konoe', 2435),
	(9742, true, 'Hideki Tojo', 2435),
	(9743, false, 'Isoroku Yamamoto', 2435),
	(9744, false, 'Michinomiya Hirohito', 2435);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9745, false, 'Albert Putin', 2436),
	(9746, false, 'Bang-Ding Ow', 2436),
	(9747, true, 'O presidente polonês', 2436),
	(9748, false, 'Papa João Paulo II', 2436),
	(9749, true, 'Alan Shephard', 2437),
	(9750, false, 'Jim Lovell', 2437),
	(9751, false, 'John Glenn', 2437),
	(9752, false, 'Neil Armstrong', 2437),
	(9753, true, 'George Washington', 2438),
	(9754, false, 'James K. Polk', 2438);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9755, false, 'James Madison', 2438),
	(9756, false, 'Thomas Jefferson', 2438),
	(9757, false, 'Alexandre Mackenzie', 2439),
	(9758, false, 'John Abbott', 2439),
	(9759, true, 'John Macdonald', 2439),
	(9760, false, 'Robert Borden', 2439),
	(9761, false, 'Joseph Stalin', 2440),
	(9762, false, 'Mikhail Gorbachev', 2440),
	(9763, true, 'Vladimir Lenin', 2440),
	(9764, false, 'Vladimir Putin', 2440);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9765, false, 'Espanha', 2441),
	(9766, false, 'França', 2441),
	(9767, false, 'Os Países Baixos', 2441),
	(9768, true, 'Portugal', 2441),
	(9769, false, 'A República', 2442),
	(9770, false, 'As leis', 2442),
	(9771, false, 'O Eutífron', 2442),
	(9772, true, 'O pedido de desculpas', 2442),
	(9773, false, 'Eduardo V', 2443),
	(9774, false, 'Henrique VII', 2443);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9775, false, 'James I', 2443),
	(9776, true, 'Ricardo III', 2443),
	(9777, false, '1492', 2444),
	(9778, true, '1962', 2444),
	(9779, false, '1963', 2444),
	(9780, false, '1987', 2444),
	(9781, false, ' Kaiser Guilherme', 2445),
	(9782, false, 'Frederico o 2º', 2445),
	(9783, true, 'Otto von Bismark', 2445),
	(9784, false, 'Robert Koch', 2445);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9785, false, 'Alemanha', 2446),
	(9786, true, 'França', 2446),
	(9787, false, 'Itália', 2446),
	(9788, false, 'Áustria', 2446),
	(9789, false, 'Antoni Gaudí', 2447),
	(9790, false, 'Frank Gehry', 2447),
	(9791, true, 'Frank Lloyd Wright', 2447),
	(9792, false, 'Le Corbusier', 2447),
	(9793, false, '1912', 2448),
	(9794, false, '1945', 2448);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9795, true, '1950', 2448),
	(9796, false, '1960', 2448),
	(9797, true, 'Paz da Vestfália', 2449),
	(9798, false, 'Paz de Praga', 2449),
	(9799, false, 'Tratado de Paris', 2449),
	(9800, false, 'Tratado de Versalhes', 2449),
	(9801, false, 'Colt armas de fogo', 2450),
	(9802, true, 'Elétrica geral', 2450),
	(9803, false, 'Heckler & Koch', 2450),
	(9804, false, 'Sig Sauer', 2450);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9805, false, 'Aristóteles', 2451),
	(9806, true, 'Homero', 2451),
	(9807, false, 'Sócrates', 2451),
	(9808, false, 'Ulisses', 2451),
	(9809, false, '12 de junho de 1889', 2452),
	(9810, false, '16 de abril de 1889', 2452),
	(9811, true, '20 de abril de 1889', 2452),
	(9812, false, '6 de fevereiro de 1889', 2452),
	(9813, false, 'Canário', 2453),
	(9814, false, 'Córsega', 2453);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9815, false, 'Elba', 2453),
	(9816, true, 'Santa Helena', 2453),
	(9817, false, 'Ana Bolena', 2454),
	(9818, true, 'Catarina de Aragão', 2454),
	(9819, false, 'Catherine Parr', 2454),
	(9820, false, 'Jane Seymour', 2454),
	(9821, true, 'A Bolsa Colombiana', 2455),
	(9822, false, 'A Rota da Seda', 2455),
	(
		9823,
		false,
		'Comércio Transatlântico de Escravos',
		2455
	),
	(9824, false, 'Comércio Triângulo', 2455);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9825, true, 'curdo', 2456),
	(9826, false, 'egípcio', 2456),
	(9827, false, 'sírio', 2456),
	(9828, false, 'árabe', 2456),
	(9829, false, 'Depressão econômica', 2457),
	(9830, false, 'Samurai', 2457),
	(9831, false, 'Tornados', 2457),
	(9832, true, 'tufões', 2457),
	(9833, false, 'Campanha Antietam', 2458),
	(9834, false, 'Campanha de Gettysburg', 2458);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9835, true, 'Cerco de Petersburgo', 2458),
	(9836, false, 'Cerco de Vicksburg', 2458),
	(9837, false, 'aborígines', 2459),
	(9838, true, 'Maori', 2459),
	(9839, false, 'papuas', 2459),
	(9840, false, 'polinésios', 2459),
	(9841, false, 'Conway, Arkansas', 2460),
	(9842, true, 'Goldsboro, Carolina do Norte', 2460),
	(9843, false, 'Hicksville, Nova York', 2460),
	(9844, false, 'Jacksonville, Flórida', 2460);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9845, false, '1899', 2461),
	(9846, true, '1901', 2461),
	(9847, false, '1910', 2461),
	(9848, false, '1911', 2461),
	(9849, false, '1822', 2462),
	(9850, false, '1934', 2462),
	(9851, true, '1983', 2462),
	(9852, false, '1984', 2462),
	(9853, true, '1914', 2463),
	(9854, false, '1917', 2463);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9855, false, '1930', 2463),
	(9856, false, '1939', 2463),
	(9857, false, '1435', 2464),
	(9858, false, '1440', 2464),
	(9859, true, '1453', 2464),
	(9860, false, '1454', 2464),
	(9861, true, '1977', 2465),
	(9862, false, '1980', 2465),
	(9863, false, '1982', 2465),
	(9864, false, '1990', 2465);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9865, false, '1981', 2466),
	(9866, true, '1982', 2466),
	(9867, false, '1999', 2466),
	(9868, false, '2005', 2466),
	(9869, false, '102 EC', 2467),
	(9870, true, '107 aC', 2467),
	(9871, false, '264 aC', 2467),
	(9872, false, '42 aC', 2467),
	(9873, false, '1965', 2468),
	(9874, false, '1966', 2468);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9875, true, '1969', 2468),
	(9876, false, '1973', 2468),
	(9877, false, '1903', 2469),
	(9878, false, '1913', 2469),
	(9879, true, '1923', 2469),
	(9880, false, '1933', 2469),
	(9881, false, '1782', 2470),
	(9882, false, '1788', 2470),
	(9883, true, '1792', 2470),
	(9884, false, '1798', 2470);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9885, true, '1836', 2471),
	(9886, false, '1838', 2471),
	(9887, false, '1844', 2471),
	(9888, false, '1845', 2471),
	(9889, false, '1401', 2472),
	(9890, true, '1415', 2472),
	(9891, false, '1422', 2472),
	(9892, false, '1463', 2472),
	(9893, false, '1970', 2473),
	(9894, false, '1982', 2473);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9895, true, '1983', 2473),
	(9896, false, '1993', 2473),
	(9897, false, '2002', 2474),
	(9898, true, '2004', 2474),
	(9899, false, '2006', 2474),
	(9900, false, '2008', 2474),
	(9901, false, '1967', 2475),
	(9902, false, '1969', 2475),
	(9903, true, '1975', 2475),
	(9904, false, '1978', 2475);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9905, true, '11 de setembro de 1941', 2476),
	(9906, false, '15 de janeiro de 1943', 2476),
	(9907, false, '15 de junho de 1947', 2476),
	(9908, false, '2 de setembro de 1962', 2476),
	(9909, true, '19 de agosto', 2477),
	(9910, false, '21 de agosto', 2477),
	(9911, false, '24 de dezembro', 2477),
	(9912, false, '26 de dezembro', 2477),
	(9913, false, 'Abadia de Ebrach', 2478),
	(9914, false, 'Hohenasperg', 2478);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9915, true, 'prisão de Landsberg', 2478),
	(9916, false, 'Prisão de Spandau', 2478),
	(9917, false, 'Aliança Real Irlandesa', 2479),
	(9918, false, 'Aliança Rebelde Irlandesa', 2479),
	(
		9919,
		false,
		'Exército da Reforma Irlandesa',
		2479
	),
	(
		9920,
		true,
		'Exército Republicano Irlandês',
		2479
	),
	(9921, false, 'Ateu', 2480),
	(9922, false, 'católico', 2480),
	(9923, false, 'judaico', 2480),
	(9924, true, 'mórmon', 2480);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9925, false, 'Assassinato de Aluguel', 2481),
	(9926, false, 'Evasão fiscal', 2481),
	(9927, false, 'Fraude de Identidade', 2481),
	(9928, true, 'Roubar trens', 2481),
	(9929, false, 'Argentina', 2482),
	(9930, false, 'Brasil', 2482),
	(9931, true, 'Chile', 2482),
	(9932, false, 'Peru', 2482),
	(9933, false, 'A Federação dos Impérios', 2483),
	(9934, false, 'Aliança Autoritária', 2483);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9935, true, 'As Potências Centrais', 2483),
	(9936, false, 'As Potências do Eixo', 2483),
	(9937, true, 'Alemão', 2484),
	(9938, false, 'americano', 2484),
	(9939, false, 'Britânico', 2484),
	(9940, false, 'polonês', 2484),
	(9941, true, 'Alemanha', 2485),
	(9942, false, 'Bélgica', 2485),
	(9943, false, 'França', 2485),
	(9944, false, 'Grã-Bretanha', 2485);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (
		9945,
		false,
		'Implantes mamários da Turquia',
		2486
	),
	(
		9946,
		false,
		'Transfusão de sangue de porco',
		2486
	),
	(
		9947,
		false,
		'Transplante de fígado de vaca',
		2486
	),
	(
		9948,
		true,
		'Transplante de testículo de cabra',
		2486
	),
	(9949, false, 'A Libertação de Paris', 2487),
	(9950, false, 'Ataque a Pearl Harbor', 2487),
	(
		9951,
		false,
		'Bombardeios atômicos de Hiroshima e Nagasaki',
		2487
	),
	(9952, true, 'dia D', 2487),
	(9953, false, 'Grifo 65', 2488),
	(9954, false, 'Merlim 50', 2488);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9955, true, 'Merlim 66', 2488),
	(9956, false, 'Merlim X', 2488),
	(9957, false, ' Cromwell', 2489),
	(9958, false, ' Panzer IV', 2489),
	(9959, false, 'M4 Sherman', 2489),
	(9960, true, 'RenaultFT', 2489),
	(9961, true, 'Eslovênia, Croácia', 2490),
	(9962, false, 'Eslovênia, Macedônia', 2490),
	(9963, false, 'Macedônia, Montenegro', 2490),
	(9964, false, 'Montenegro, Eslovênia', 2490);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9965, false, 'Os astecas', 2491),
	(9966, false, 'Os incas', 2491),
	(9967, true, 'Os Maias', 2491),
	(9968, false, 'os navajos', 2491),
	(9969, false, 'conquistas mongóis', 2492),
	(9970, false, 'Guerra dos Três Reinos', 2492),
	(9971, false, 'Rebelião Taiping', 2492),
	(9972, true, 'Segunda Guerra Mundial', 2492),
	(9973, true, 'Batalha de Adrianópolis', 2493),
	(9974, false, 'Batalha de Constantinopla', 2493);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9975, false, 'Batalha de Pollentia', 2493),
	(9976, false, 'Batalha de Tessalônica', 2493),
	(9977, false, 'acadiano', 2494),
	(9978, false, 'maltês', 2494),
	(9979, false, 'Mandaico', 2494),
	(9980, true, 'sumério', 2494),
	(9981, false, 'banho turco', 2495),
	(9982, false, 'Canil', 2495),
	(9983, false, 'quadra de squash', 2495),
	(9984, true, 'quarto de desmaio', 2495);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9985, false, 'Alexandre Hamilton', 2496),
	(9986, true, 'James Monroe', 2496),
	(9987, false, 'Roger Sherman', 2496),
	(9988, false, 'Samuel Adams', 2496),
	(9989, true, 'Afeganistão', 2497),
	(9990, false, 'Cazaquistão', 2497),
	(9991, false, 'Turquemenistão', 2497),
	(9992, false, 'Uzbequistão', 2497),
	(9993, true, 'Brasil', 2498),
	(9994, false, 'Madagáscar', 2498);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (9995, false, 'Moçambique', 2498),
	(9996, false, 'Índia', 2498),
	(9997, false, 'Adolf Hitler', 2499),
	(9998, false, 'Joseph Stalin', 2499),
	(9999, false, 'Kim Il Sung', 2499),
	(10000, true, 'Mao Zedong', 2499),
	(10001, true, 'assírios', 2500),
	(10002, false, 'babilônios', 2500),
	(10003, false, 'elamitas', 2500),
	(10004, false, 'hititas', 2500);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10005, false, 'Ashur-nasir-pal II', 2501),
	(10006, false, 'Esharhaddon', 2501),
	(10007, false, 'Shalmaneser V', 2501),
	(10008, true, 'Shamshi-Adad III', 2501),
	(10009, true, 'A Casa Branca', 2502),
	(
		10010,
		false,
		'Edifício da Grande Assembleia Nacional',
		2502
	),
	(10011, false, 'palácio da nação', 2502),
	(10012, false, 'Parlamento', 2502),
	(10013, false, '1042 pés | 317,6 m', 2503),
	(10014, false, '759 pés | 231,3 m', 2503);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10015, false, '825 pés | 251,5 m', 2503),
	(10016, true, '882 pés | 268,8 m', 2503),
	(10017, false, 'Operação em chamas', 2504),
	(10018, false, 'Operação Embarque', 2504),
	(10019, false, 'Operação Ironclad', 2504),
	(10020, true, 'Operação Queda', 2504),
	(10021, true, 'Hampton Court', 2505),
	(10022, false, 'Palácio de Buckingham', 2505),
	(10023, false, 'Palácio de São Tiago', 2505),
	(10024, false, 'Tribunal de Coughton', 2505);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10025, true, 'Agente laranja', 2506),
	(10026, false, 'Cianeto de hidrogenio', 2506),
	(10027, false, 'Fosgênio', 2506),
	(10028, false, 'Gás mostarda', 2506),
	(10029, false, ' Oesterreich', 2507),
	(10030, true, 'República de Weimar', 2507),
	(
		10031,
		false,
		'República Democrática Alemã',
		2507
	),
	(
		10032,
		false,
		'República Federal da Alemanha',
		2507
	),
	(10033, false, 'ögedei', 2508),
	(10034, false, 'Möngke', 2508);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10035, true, 'TemÜjin', 2508),
	(10036, false, 'TemÜr', 2508),
	(10037, true, 'A Batalha de Antietam', 2509),
	(10038, false, 'A Batalha de Gettysburg', 2509),
	(
		10039,
		false,
		'As Batalhas de Chancellorsville',
		2509
	),
	(10040, false, 'O cerco de Vicksburg', 2509),
	(10041, true, 'Operação Barbarossa', 2510),
	(10042, false, 'Operação impensável', 2510),
	(10043, false, 'Operação Kaiserschlact', 2510),
	(10044, false, 'Operação Molotov', 2510);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10045, false, ' Heinz Guderian', 2511),
	(10046, true, 'Erwin Rommel', 2511),
	(10047, false, 'Gerd von Rundstadt', 2511),
	(10048, false, 'Wilhelm Keitel', 2511),
	(10049, false, 'Luís XIII', 2512),
	(10050, true, 'Luís XIV', 2512),
	(10051, false, 'Luís XV', 2512),
	(10052, false, 'Luís XVI', 2512),
	(10053, false, 'Apolo 11', 2513),
	(10054, false, 'Apolo 13', 2513);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10055, false, 'Apolo 15', 2513),
	(10056, true, 'Apolo 17', 2513),
	(10057, false, 'Espanha', 2514),
	(10058, false, 'Holanda', 2514),
	(10059, true, 'Portugal', 2514),
	(10060, false, 'Suécia', 2514),
	(10061, false, 'Alemanha', 2515),
	(10062, false, 'Itália', 2515),
	(10063, false, 'Japão', 2515),
	(10064, true, 'União Soviética', 2515);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10065, false, 'Alemanha', 2516),
	(10066, false, 'Espanha', 2516),
	(10067, true, 'França', 2516),
	(10068, false, 'Inglaterra', 2516),
	(10069, false, 'Bielorrússia', 2517),
	(10070, false, 'Letônia', 2517),
	(10071, false, 'Lituânia', 2517),
	(10072, true, 'Ucrânia', 2517),
	(10073, false, ' George W. Bush', 2518),
	(10074, true, 'George HW Bush', 2518);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10075, false, 'Richard Nixon', 2518),
	(10076, false, 'Ronald Regan', 2518),
	(10077, false, 'gerald ford', 2519),
	(10078, true, 'Jimmy Carter', 2519),
	(10079, false, 'Lydon B. Johnson', 2519),
	(10080, false, 'Ronald Reagan', 2519),
	(10081, true, 'Kurt Knispel', 2520),
	(10082, false, 'Michael Wittmann', 2520),
	(10083, false, 'Otto Carius', 2520),
	(10084, false, 'Walter Kniep', 2520);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (
		10085,
		false,
		'Decapitado, Morreu, Divorciado, Divorciado, Decapitado, Sobreviveu',
		2521
	),
	(
		10086,
		true,
		'Divorciado, Decapitado, Morreu, Divorciado, Decapitado, Sobreviveu',
		2521
	),
	(
		10087,
		false,
		'Morto, Decapitado, Divorciado, Decapitado, Sobrevivido, Divorciado',
		2521
	),
	(
		10088,
		false,
		'Sobreviveu, Decapitado, Morreu, Divorciado, Divorciado, Decapitado',
		2521
	),
	(10089, true, 'Delaware', 2522),
	(10090, false, 'Maine', 2522),
	(10091, false, 'Rhode Island', 2522),
	(10092, false, 'Virgínia', 2522),
	(10093, false, '11 de setembro', 2523),
	(10094, true, 'Batalha de Antietam', 2523);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10095, false, 'dia D', 2523),
	(10096, false, 'Pearl Harbor', 2523),
	(10097, false, 'Constituição USS', 2524),
	(10098, false, 'USS Carolina do Norte', 2524),
	(10099, false, 'USS Indianápolis', 2524),
	(10100, true, 'USS Pueblo', 2524),
	(10101, true, 'californiano', 2525),
	(10102, false, 'Carpathia', 2525),
	(10103, false, 'Comércio', 2525),
	(10104, false, 'cristol', 2525);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10105, true, '1814', 2526),
	(10106, false, '1854', 2526),
	(10107, false, '1905', 2526),
	(10108, false, '1932', 2526),
	(10109, false, '1814', 2527),
	(10110, false, '1834', 2527),
	(10111, true, '1905', 2527),
	(10112, false, '1925', 2527),
	(10113, false, '210 DC', 2528),
	(10114, false, '235 aC', 2528);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10115, true, '235 DC', 2528),
	(10116, false, '242 DC', 2528),
	(10117, true, 'Arquipélago das Bahamas', 2529),
	(10118, false, 'Flórida', 2529),
	(10119, false, 'Istmo do Panamá', 2529),
	(10120, false, 'Nicarágua', 2529),
	(10121, false, ' 1º de julho de 1973', 2530),
	(10122, false, ' 25 de novembro de 2002', 2530),
	(10123, false, '26 de julho de 1908', 2530),
	(10124, true, '4 de novembro de 1952', 2530);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10125, false, '1841', 2531),
	(10126, false, '1900', 2531),
	(10127, true, '1997', 2531),
	(10128, false, '1999', 2531),
	(10129, false, '1º de setembro de 1939', 2532),
	(10130, false, '22 de junho de 1941', 2532),
	(10131, true, '8 de dezembro de 1941', 2532),
	(10132, false, 'de junho de 1944', 2532),
	(10133, false, '16 de dezembro de 1944', 2533),
	(10134, true, '25 de janeiro de 1945', 2533);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10135, false, '6 de agosto de 1945', 2533),
	(10136, false, '7 de dezembro de 1941', 2533),
	(10137, false, '1850', 2534),
	(10138, false, '1859', 2534),
	(10139, false, '1860', 2534),
	(10140, true, '1869', 2534),
	(10141, false, 'Cinco', 2535),
	(10142, true, 'Duas vezes', 2535),
	(10143, false, 'Três vezes', 2535),
	(10144, false, 'Uma vez', 2535);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10145, false, '50', 2536),
	(10146, false, '54', 2536),
	(10147, true, '55', 2536),
	(10148, false, '60', 2536),
	(10149, false, '1971', 2537),
	(10150, false, '1981', 2537),
	(10151, false, '1986', 2537),
	(10152, true, '1997', 2537),
	(
		10153,
		false,
		'Batalha da Grã-Bretanha (1940)',
		2538
	),
	(
		10154,
		false,
		'Invasão da Normandia (1944)',
		2538
	);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10155, true, 'Invasão da Polônia (1939)', 2538),
	(10156, false, 'Invasão da Rússia (1942)', 2538),
	(10157, false, '100', 2539),
	(10158, false, '1000', 2539),
	(10159, false, '50', 2539),
	(10160, true, '500', 2539),
	(10161, false, 'Ferdinand Cohen-cego', 2540),
	(10162, true, 'Gavrilo Princip', 2540),
	(10163, false, 'Nedeljko Čabrinović', 2540),
	(10164, false, 'Oskar Potiorek', 2540);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10165, false, 'Papa Estêvão V', 2541),
	(10166, true, 'Papa Leão III', 2541),
	(10167, false, 'Papa Urbano IV', 2541),
	(10168, false, 'Papa Valentim', 2541),
	(10169, true, 'Aristóteles', 2542),
	(10170, false, 'Platão', 2542),
	(10171, false, 'Rei Filipe', 2542),
	(10172, false, 'Sócrates', 2542),
	(10173, false, 'Aleskandar Petrovic', 2543),
	(10174, true, 'Josip Broz Tito', 2543);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10175, false, 'Karadjordje Petrovic', 2543),
	(10176, false, 'Milos Obilic', 2543),
	(10177, false, 'Américo Vespúcio', 2544),
	(10178, false, 'Cristóvão Colombo', 2544),
	(10179, false, 'Fernão de Magalhães', 2544),
	(10180, true, 'Leif Erikson', 2544),
	(10181, false, ' James Monroe', 2545),
	(10182, false, 'George Washington', 2545),
	(10183, false, 'John Adams', 2545),
	(10184, true, 'Martin Van Buren', 2545);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10185, false, 'galba', 2546),
	(10186, false, 'Otho', 2546),
	(10187, true, 'Vespasiano', 2546),
	(10188, false, 'Vitélio', 2546),
	(10189, false, 'Abraham Lincoln', 2547),
	(10190, true, 'Franklin Roosevelt', 2547),
	(10191, false, 'George Washington', 2547),
	(10192, false, 'Theodore Roosevelt', 2547),
	(10193, false, 'Qi (齊)', 2548),
	(10194, false, 'Qin (秦)', 2548);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10195, true, 'Zhai (翟)', 2548),
	(10196, false, 'Zhao (趙)', 2548),
	(10197, false, '1 a 3 por cento', 2549),
	(10198, true, '3 a 6 por cento', 2549),
	(10199, false, '6 a 10 por cento', 2549),
	(10200, false, 'menos de 1 por cento', 2549),
	(10201, false, 'Alana', 2550),
	(10202, true, 'Ariadne', 2550),
	(10203, false, 'Ariel', 2550),
	(10204, false, 'Atena', 2550);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10205, false, 'bragi', 2551),
	(10206, true, 'Nidhogg', 2551),
	(10207, false, 'Odin', 2551),
	(10208, false, 'Ymir', 2551),
	(10209, false, 'egípcio', 2552),
	(10210, false, 'grego', 2552),
	(10211, false, 'hindu', 2552),
	(10212, true, 'nórdico', 2552),
	(10213, false, 'careca', 2553),
	(10214, false, 'Frigg', 2553);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10215, true, 'Odin', 2553),
	(10216, false, 'Thor', 2553),
	(10217, true, 'Jens', 2554),
	(10218, false, 'Loki', 2554),
	(10219, false, 'Snotra', 2554),
	(10220, false, 'Tyr', 2554),
	(10221, false, 'Castelo', 2555),
	(10222, false, 'Montanha', 2555),
	(10223, false, 'têmpora', 2555),
	(10224, true, 'Árvore', 2555);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10225, false, 'Cardápio', 2556),
	(10226, false, 'Meret', 2556),
	(10227, false, 'mudo', 2556),
	(10228, true, 'mín.', 2556),
	(10229, false, 'Chipre', 2557),
	(10230, true, 'Creta', 2557),
	(10231, false, 'Sardenha', 2557),
	(10232, false, 'Sicília', 2557),
	(10233, false, 'Coragem', 2558),
	(10234, false, 'Força', 2558);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10235, false, 'Honra', 2558),
	(10236, true, 'Vitória', 2558),
	(10237, false, 'grego e chinês', 2559),
	(10238, true, 'grego e romano', 2559),
	(10239, false, 'grego, romano e nórdico', 2559),
	(10240, false, 'romano e espanhol', 2559),
	(10241, false, 'Afrodite', 2560),
	(10242, false, 'Atena', 2560),
	(10243, true, 'Hera', 2560),
	(10244, false, 'Héstia', 2560);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10245, false, 'Apolo', 2561),
	(10246, false, 'Deméter', 2561),
	(10247, true, 'Dionísio', 2561),
	(10248, false, 'Hefesto', 2561),
	(10249, false, 'Ares', 2562),
	(10250, false, 'Juno', 2562),
	(10251, false, 'Júpiter', 2562),
	(10252, true, 'Marte', 2562),
	(10253, true, 'Centauro', 2563),
	(10254, false, 'Górgona', 2563);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10255, false, 'Minotauro', 2563),
	(10256, false, 'Pégaso', 2563),
	(10257, false, 'Dédalo', 2564),
	(10258, false, 'Hércules', 2564),
	(10259, true, 'Orfeu', 2564),
	(10260, false, 'Perseu', 2564),
	(10261, true, 'Apolo', 2565),
	(10262, false, 'Atena', 2565),
	(10263, false, 'Deméter', 2565),
	(10264, false, 'Zeus', 2565);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10265, true, 'Harpias', 2566),
	(10266, false, 'lilith', 2566),
	(10267, false, 'Ninfa', 2566),
	(10268, false, 'Sereias', 2566),
	(10269, false, 'Apolo', 2567),
	(10270, false, 'Hermes', 2567),
	(10271, false, 'Poseidon', 2567),
	(10272, true, 'Zeus', 2567),
	(10273, false, 'Apolo', 2568),
	(10274, false, 'Ares', 2568);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10275, true, 'Atena', 2568),
	(10276, false, 'Ártemis', 2568),
	(10277, false, 'Agricultura', 2569),
	(10278, true, 'Casado', 2569),
	(10279, false, 'Guerra', 2569),
	(10280, false, 'Mar', 2569),
	(10281, true, 'Aranha', 2570),
	(10282, false, 'Crocodilo', 2570),
	(10283, false, 'Cão selvagem', 2570),
	(10284, false, 'Macaco', 2570);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10285, true, 'Um cavalo', 2571),
	(10286, false, 'Um dragão', 2571),
	(10287, false, 'Um leão', 2571),
	(10288, false, 'Um tigre', 2571),
	(10289, false, 'Apolo', 2572),
	(10290, false, 'Ares', 2572),
	(10291, true, 'Poseidon', 2572),
	(10292, false, 'Zeus', 2572),
	(10293, true, 'Jano', 2573),
	(10294, false, 'Juno', 2573);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10295, false, 'Marte', 2573),
	(10296, false, 'vulcano', 2573),
	(10297, false, 'Lachesis', 2574),
	(10298, true, 'Narciso', 2574),
	(10299, false, 'pano', 2574),
	(10300, false, 'Átropos', 2574),
	(10301, false, 'Hades', 2575),
	(10302, false, 'Moro', 2575),
	(10303, false, 'tártaro', 2575),
	(10304, true, 'Tânatos', 2575);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10305, false, 'Artagato', 2576),
	(10306, false, 'Dyntos', 2576),
	(10307, true, 'Hefesto', 2576),
	(10308, false, 'vulcano', 2576),
	(10309, false, 'Ake', 2577),
	(10310, false, 'Asger', 2577),
	(10311, false, 'asmund', 2577),
	(10312, true, 'Perguntar', 2577),
	(10313, false, 'Apolo', 2578),
	(10314, false, 'Júpiter', 2578);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10315, false, 'Mercúrio', 2578),
	(10316, true, 'vulcano', 2578),
	(10317, true, '''Oro', 2579),
	(10318, false, 'hina', 2579),
	(10319, false, 'Kohara', 2579),
	(10320, false, 'Maui', 2579),
	(10321, false, 'Kabocha', 2580),
	(10322, false, 'Nasu', 2580),
	(10323, true, 'Pepinos', 2580),
	(10324, false, 'sobá', 2580);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10325, false, 'Cavalo', 2581),
	(10326, true, 'Touro', 2581),
	(10327, false, 'Vaca', 2581),
	(10328, false, 'Águia', 2581),
	(10329, false, 'Al Gore', 2582),
	(10330, false, 'Barack Obama', 2582),
	(10331, true, 'George W. Bush', 2582),
	(10332, false, 'John Kerry', 2582),
	(10333, false, 'Bahrein', 2583),
	(10334, true, 'Catar', 2583);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10335, false, 'Estados Unidos da América', 2583),
	(10336, false, 'Rússia', 2583),
	(
		10337,
		true,
		' Concentração de poder e autoridade em uma organização central.',
		2584
	),
	(
		10338,
		false,
		'A área cinzenta no espectro da esquerda e da direita política.',
		2584
	),
	(
		10339,
		false,
		'Em conformidade com uma única agenda política comum.',
		2584
	),
	(
		10340,
		false,
		'Permanecendo politicamente neutro.',
		2584
	),
	(10341, true, 'A', 2585),
	(10342, false, 'B', 2585),
	(10343, false, 'D', 2585),
	(10344, false, 'x', 2585);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10345, false, 'James Francis', 2586),
	(10346, false, 'Robert Wimbledon', 2586),
	(10347, true, 'Senhor Buckethead', 2586),
	(10348, false, 'Sir Crumpetsby', 2586),
	(10349, false, 'James A. Garfield', 2587),
	(10350, false, 'Warren G Harding', 2587),
	(10351, true, 'William Henry Harrison', 2587),
	(10352, false, 'Zachary Taylor', 2587),
	(10353, false, 'Nação Pawnee de Oklahoma', 2588),
	(10354, false, 'Standing Rock Tribo Sioux', 2588);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10355, false, 'Tribo Kiowa de Oklahoma', 2588),
	(10356, true, 'Tribo Yomba Shoshone', 2588),
	(10357, true, 'O príncipe', 2589),
	(10358, false, 'O Rapto de Lucrécia', 2589),
	(10359, false, 'Trabalhos de amor perdidos', 2589),
	(10360, false, 'vontade de poder', 2589),
	(10361, false, 'Daniel Inouye', 2590),
	(10362, false, 'Joe Biden', 2590),
	(10363, true, 'Robert Byrd', 2590),
	(10364, false, 'Strom Thurmond', 2590);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10365, false, 'Bernie Sanders', 2591),
	(10366, true, 'Donald Trump', 2591),
	(10367, false, 'Marco Rubio', 2591),
	(10368, false, 'Ted Cruz', 2591),
	(10369, false, 'Piano', 2592),
	(10370, true, 'Saxofone', 2592),
	(10371, false, 'trompa de barítono', 2592),
	(10372, false, 'Violino', 2592),
	(10373, false, 'Fiji', 2593),
	(10374, false, 'Kiribati', 2593);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10375, false, 'Palau', 2593),
	(10376, true, 'Tonga', 2593),
	(10377, false, '260', 2594),
	(10378, false, '415', 2594),
	(10379, true, '435', 2594),
	(10380, false, '50', 2594),
	(10381, false, 'Barack Obama', 2595),
	(10382, false, 'Bill Clinton', 2595),
	(10383, true, 'Donald Trump', 2595),
	(10384, false, 'George Bush', 2595);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10385, false, '1988', 2596),
	(10386, true, '2000', 2596),
	(10387, false, '2008', 2596),
	(10388, false, '2012', 2596),
	(10389, false, ' República de Taipé', 2597),
	(10390, false, 'República de Taiwan', 2597),
	(10391, true, 'Taipei Chinês', 2597),
	(10392, false, 'Taiwan chinês', 2597),
	(10393, false, '1969', 2598),
	(10394, false, '1973', 2598);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10395, true, '1974', 2598),
	(10396, false, '1977', 2598),
	(10397, true, 'Chile', 2599),
	(10398, false, 'Etiópia', 2599),
	(10399, false, 'Indonésia', 2599),
	(10400, false, 'Nicarágua', 2599),
	(10401, false, '0', 2600),
	(10402, false, '1', 2600),
	(10403, false, '2', 2600),
	(10404, true, '3', 2600);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10405, false, '1971', 2601),
	(10406, true, '1972', 2601),
	(10407, false, '1973', 2601),
	(10408, false, '1974', 2601),
	(10409, false, 'Donald Jr.', 2602),
	(10410, false, 'Eric', 2602),
	(10411, false, 'Ivanka', 2602),
	(10412, true, 'Júlio', 2602),
	(10413, false, 'a coruja', 2603),
	(10414, false, 'O campeão', 2603);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10415, false, 'O Oraculo', 2603),
	(10416, true, 'o peixe-rei', 2603),
	(10417, true, 'André Jackson', 2604),
	(10418, false, 'Franklin Roosevelt', 2604),
	(10419, false, 'John F. Kennedy', 2604),
	(10420, false, 'Ronald Reagan', 2604),
	(10421, false, 'William Lincoln Clinton', 2605),
	(10422, false, 'William Roosevelt Clinton', 2605),
	(10423, true, 'Willian Jefferson Clinton', 2605),
	(10424, false, 'Willian Truman Clinton', 2605);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10425, false, 'Clement Attlee', 2606),
	(10426, true, 'Neville Chamberlain', 2606),
	(10427, false, 'Stanley Baldwin', 2606),
	(10428, false, 'Winston Churchill', 2606),
	(10429, false, 'David Cameron', 2607),
	(10430, false, 'Ed Miliband', 2607),
	(10431, true, 'Jeremy Corbyn', 2607),
	(10432, false, 'Teresa May', 2607),
	(10433, false, 'Bill Clinton', 2608),
	(10434, false, 'Jimmy Carter', 2608);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10435, false, 'Richard Nixon', 2608),
	(10436, true, 'Ronald Reagan', 2608),
	(10437, false, 'Abraham Lincoln', 2609),
	(10438, true, 'George Washington', 2609),
	(10439, false, 'Richard Nixon', 2609),
	(10440, false, 'Thomas Jefferson', 2609),
	(10441, false, 'Boris Yeltsin', 2610),
	(10442, false, 'Leonid Brezhnev', 2610),
	(10443, false, 'Mikhail Gorbachev', 2610),
	(10444, true, 'Nikita Khrushchev', 2610);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (
		10445,
		true,
		'Interruptor de ignição com defeito',
		2611
	),
	(
		10446,
		false,
		'Pastilhas de freio com defeito',
		2611
	),
	(
		10447,
		false,
		'Pedal do acelerador com defeito',
		2611
	),
	(
		10448,
		false,
		'Quebrando linhas de combustível',
		2611
	),
	(10449, true, '1972', 2612),
	(10450, false, '1973', 2612),
	(10451, false, '1975', 2612),
	(10452, false, '1982', 2612),
	(10453, true, '15 graus', 2613),
	(10454, false, '30 graus', 2613);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10455, false, '45 graus', 2613),
	(10456, false, '90 graus', 2613),
	(10457, false, 'Audi A3', 2614),
	(10458, true, 'Audi A8', 2614),
	(10459, false, 'Audi S3', 2614),
	(10460, false, 'Audi TT', 2614),
	(10461, false, 'chevrolet volt', 2615),
	(10462, false, 'honda fit', 2615),
	(10463, false, 'Peugeot 308 R Híbrido', 2615),
	(10464, true, 'Toyota Prius', 2615);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10465, false, 'Bentley', 2616),
	(10466, false, 'bugatti', 2616),
	(10467, true, 'Opel', 2616),
	(10468, false, 'Porsche', 2616),
	(10469, false, 'E39', 2617),
	(10470, true, 'E46', 2617),
	(10471, false, 'E85', 2617),
	(10472, false, 'F10', 2617),
	(10473, false, 'inspirar', 2618),
	(10474, true, 'Kelisa', 2618);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10475, false, 'Perdana', 2618),
	(10476, false, 'Saga', 2618),
	(10477, true, '1UZ-FE', 2619),
	(10478, false, '2JZ-GTE', 2619),
	(10479, false, '5M-GE', 2619),
	(10480, false, '7M-GTE', 2619),
	(10481, false, 'MultiAir', 2620),
	(10482, true, 'VANOS', 2620),
	(10483, false, 'VVEL', 2620),
	(10484, false, 'VVT-iw', 2620);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10485, false, '2.190', 2621),
	(10486, false, '2.578', 2621),
	(10487, true, '3.000', 2621),
	(10488, false, '3.200', 2621),
	(10489, false, 'Ferrari', 2622),
	(10490, false, 'Ford', 2622),
	(10491, false, 'Renault', 2622),
	(10492, true, 'Volvo', 2622),
	(10493, true, 'LB&SCR A1X', 2623),
	(10494, false, 'LB&SCR D1', 2623);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10495, false, 'LB&SCR E2', 2623),
	(10496, false, 'LB&SCR J1', 2623),
	(10497, false, 'Chrysler', 2624),
	(10498, false, 'Fiat', 2624),
	(10499, true, 'Ford', 2624),
	(10500, false, 'General Motors', 2624),
	(10501, false, 'Bastão', 2625),
	(10502, false, 'Cavalo', 2625),
	(10503, false, 'Cobra', 2625),
	(10504, true, 'Touro', 2625);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10505, false, '346', 2626),
	(10506, true, '364', 2626),
	(10507, false, '376', 2626),
	(10508, false, '402', 2626),
	(10509, true, '346', 2627),
	(10510, false, '350', 2627),
	(10511, false, '355', 2627),
	(10512, false, '360', 2627),
	(10513, false, '346', 2628),
	(10514, false, '364', 2628);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10515, false, '376', 2628),
	(10516, true, '427', 2628),
	(10517, false, 'Alemanha', 2629),
	(10518, true, 'Itália', 2629),
	(10519, false, 'Romênia', 2629),
	(10520, false, 'Rússia', 2629),
	(10521, false, 'Diesel', 2630),
	(10522, true, 'Eletricidade', 2630),
	(10523, false, 'Gasolina', 2630),
	(10524, false, 'Nuclear', 2630);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10525, false, 'abdômen', 2631),
	(10526, false, 'Molas de folhas', 2631),
	(10527, true, 'Pistões', 2631),
	(10528, false, 'radiadores', 2631),
	(10529, false, 'honda', 2632),
	(10530, false, 'Kawasaki', 2632),
	(10531, true, 'Toyota', 2632),
	(10532, false, 'Yamaha', 2632),
	(10533, false, 'Ford', 2633),
	(10534, false, 'honda', 2633);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10535, true, 'Toyota', 2633),
	(10536, false, 'volkswagen', 2633),
	(10537, false, 'GPWS', 2634),
	(10538, false, 'OCAS', 2634),
	(10539, false, 'TAWS', 2634),
	(10540, true, 'TCAS', 2634),
	(10541, false, 'Bom ano', 2635),
	(10542, false, 'Bridgestone', 2635),
	(10543, false, 'Michelin', 2635),
	(10544, true, 'pirelli', 2635);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10545, true, 'Bom ano', 2636),
	(10546, false, 'Bridgestone', 2636),
	(10547, false, 'Michelin', 2636),
	(10548, false, 'pirelli', 2636),
	(10549, false, 'Classe 43', 2637),
	(10550, false, 'Dardo', 2637),
	(10551, false, 'pendolino', 2637),
	(10552, true, 'velocista', 2637),
	(10553, false, 'Bugatti Veyron Super Sport', 2638),
	(10554, false, 'Hennessy Venom GT', 2638);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10555, true, 'Koenigsegg Agera RS', 2638),
	(10556, false, 'Pagani Huayra BC', 2638),
	(10557, false, 'honda', 2639),
	(10558, false, 'hyundai', 2639),
	(10559, true, 'nissan', 2639),
	(10560, false, 'subaru', 2639),
	(10561, false, 'China', 2640),
	(10562, false, 'Itália', 2640),
	(10563, true, 'Polônia', 2640),
	(10564, false, 'Suécia', 2640);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10565, true, 'Alfa Romeo', 2641),
	(10566, false, 'Bentley', 2641),
	(10567, false, 'Mercedes Benz', 2641),
	(10568, false, 'União Automática', 2641),
	(
		10569,
		false,
		'Estados em que a Audi realiza mais vendas',
		2642
	),
	(
		10570,
		true,
		'Fabricantes de automóveis anteriormente independentes',
		2642
	),
	(
		10571,
		false,
		'Países em que a Audi faz mais vendas',
		2642
	),
	(
		10572,
		false,
		'Principais cidades vitais para a Audi',
		2642
	),
	(10573, false, '918', 2643),
	(10574, true, 'Aventador', 2643);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10575, false, 'Huayra', 2643),
	(10576, false, 'Quíron', 2643),
	(10577, false, 'Cavalo', 2644),
	(10578, false, 'Cobra', 2644),
	(10579, true, 'Escorpião', 2644),
	(10580, false, 'Touro', 2644),
	(10581, false, '288 GTO', 2645),
	(10582, false, 'Enzo Ferrari', 2645),
	(10583, false, 'F40', 2645),
	(10584, true, 'Testarossa', 2645);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10585, false, 'Airbus A330-200', 2646),
	(10586, false, 'Airbus A350-1000', 2646),
	(10587, true, 'Boeing 747-8', 2646),
	(10588, false, 'Boeing 787-10', 2646),
	(10589, false, 'Chevrolet Camaro', 2647),
	(10590, false, 'Holden Monaro', 2647),
	(10591, true, 'Soldado Isuzu', 2647),
	(10592, false, 'Suzuki Swift', 2647),
	(10593, true, 'BYD', 2648),
	(10594, false, 'Dragão', 2648);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10595, false, 'GAZ', 2648),
	(10596, false, 'silencioso', 2648),
	(10597, false, 'Coreia do Sul', 2649),
	(10598, false, 'Estados Unidos', 2649),
	(10599, false, 'Tcheca', 2649),
	(10600, true, 'Áustria', 2649),
	(10601, false, 'bugatti', 2650),
	(10602, true, 'Koenigsegg', 2650),
	(10603, false, 'Lamborghini', 2650),
	(10604, false, 'McLaren', 2650);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10605, true, 'honda', 2651),
	(10606, false, 'Kawasaki', 2651),
	(10607, false, 'Suzuki', 2651),
	(10608, false, 'Yamaha', 2651),
	(10609, false, 'bugatti', 2652),
	(10610, false, 'Ferrari', 2652),
	(10611, true, 'Lamborghini', 2652),
	(10612, false, 'Pagani', 2652),
	(10613, true, 'Combustão', 2653),
	(10614, false, 'Lubrificação', 2653);
INSERT INTO public.respostas (id, correta, resposta, questao_id)
VALUES (10615, false, 'Reduzir a corrosão', 2653),
	(10616, false, 'Resfriamento', 2653),
	(198, false, 'Café Terraço à noite', 50);
-- Inserindo na tabela 'jogos'
INSERT INTO jogos(id, pontuacao, jogador_id, questionario_id)
VALUES (1, 100, 2, 1),
	(2, 200, 2, 2),
	(3, 50, 3, 3),
	(4, 150, 4, 4);


CREATE SEQUENCE jogos_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
select setval('jogos_seq', (select max(id) from jogos));

CREATE SEQUENCE questionarios_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
select setval('questionarios_seq', (select max(id) from questionarios));

CREATE SEQUENCE questoes_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
select setval('questoes_seq', (select max(id) from questoes));

CREATE SEQUENCE respostas_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
select setval('respostas_seq', (select max(id) from respostas));

CREATE SEQUENCE usuarios_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
select setval('usuarios_seq', (select max(id) from usuarios ));