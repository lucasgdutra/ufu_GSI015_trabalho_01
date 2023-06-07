interface Resposta {
  id?: number;
  resposta: string;
  correta?: boolean;
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



interface Jogo {
  id?: number;
  jogador: Jogador;
  questionario: Questionario;
  pontuacao?: number;
}

interface Usuario {
  id?: number;
  name: string;
  email?: string;
}

interface Administrador extends Usuario {
}

interface Jogador extends Usuario {
  pontuacao?: number;
}