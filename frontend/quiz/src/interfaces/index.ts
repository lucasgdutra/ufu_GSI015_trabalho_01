interface Resposta {
  id?: number;
  resposta: string;
}

interface Questao {
  id?: number;
  pergunta: string;
  pontuacao: number;
  respostas?: Resposta[];
}

interface Questionario {
  id?: number;
  titulo: string;
  questoes: Questao[];
}

interface Jogador {
  id?: number;
  name: string;
  email: string;
  pontuacao?: number;
}

interface Jogo {
  id?: number;
  jogador: Jogador;
  questionario: Questionario;
  pontuacao?: number;
}

interface Administrador {
  id?: number;
  name: string;
  email: string;
}

interface Usuario {
  id?: number;
  name: string;
  email: string;
}