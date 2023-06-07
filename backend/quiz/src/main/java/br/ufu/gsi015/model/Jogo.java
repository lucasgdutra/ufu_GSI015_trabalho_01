package br.ufu.gsi015.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;

@Entity
@Table(name = "jogos")
public class Jogo {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "jogos_seq")
    @SequenceGenerator(name = "jogos_seq", sequenceName = "jogos_seq", allocationSize = 1)
    private Long id;

    @NotNull(message = "jogador não pode ser vazio")
    @ManyToOne
    @JoinColumn(name = "jogador_id")
    private Jogador jogador;

    @NotNull(message = "questionario não pode ser vazio")
    @ManyToOne
    @JoinColumn(name = "questionario_id")
    private Questionario questionario;

    private Integer pontuacao;

    public Jogo() {
    }

    public Jogo(Jogador jogador, Questionario questionario) {
        this.jogador = jogador;
        this.questionario = questionario;
        this.pontuacao = 0;
    }

    public Jogo(Long id, Jogador jogador, Questionario questionario) {
        this.id = id;
        this.jogador = jogador;
        this.questionario = questionario;
        this.pontuacao = 0;
    }

    public Long getId() {
        return id;
    }

    public Jogador getJogador() {
        return jogador;
    }

    public Questionario getQuestionario() {
        return questionario;
    }

    public Integer getPontuacao() {
        return pontuacao;
    }

    public void setJogador(Jogador jogador) {
        this.jogador = jogador;
    }

    public void setQuestionario(Questionario questionario) {
        this.questionario = questionario;
    }

    public void setPontuacao(Integer pontuacao) {
        this.pontuacao = pontuacao;
    }

    public void addPontuacao(Integer pontuacao) {
        this.pontuacao += pontuacao;
    }

}
