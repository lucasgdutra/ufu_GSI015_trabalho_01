package br.ufu.gsi015.model;

import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;

@Entity
@Table(name = "questoes")
public class Questao {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @NotBlank(message = "A pergunta não pode ser vazio")
    private String pergunta;

    @NotBlank(message = "A pontuacao não pode ser vazio")
    @Min(value = 0, message = "Pontuacao deve ser maior ou igual a zero")
    private Integer pontuacao;

    @OneToMany(mappedBy = "questao", cascade = CascadeType.ALL)
    private List<Resposta> respostas;

    @ManyToOne
    @JoinColumn(name = "questionario_id")
    @JsonIgnore
    private Questionario questionario;

    protected Questao() {
        this.respostas = new ArrayList<>();
    }

    Questao(String pergunta, Integer pontuacao) {
        this.pergunta = pergunta;
        this.pontuacao = pontuacao;
        this.respostas = new ArrayList<>();
    }

    Questao(Long id, String pergunta, Integer pontuacao) {
        this.id = id;
        this.pergunta = pergunta;
        this.pontuacao = pontuacao;
        this.respostas = new ArrayList<>();
    }

    public Long getId() {
        return id;
    }

    public String getPergunta() {
        return pergunta;
    }

    public void setPergunta(String texto) {
        this.pergunta = texto;
    }

    public Integer getPontuacao() {
        return pontuacao;
    }

    public void setPontuacao(Integer pontuacao) {
        this.pontuacao = pontuacao;
    }

    public List<Resposta> getRespostas() {
        return respostas;
    }

    public void addResposta(Resposta resposta) {
        if (!this.respostas.contains(resposta)) {
            this.respostas.add(resposta);
            resposta.setQuestao(this);
        }
    }

    public void removeResposta(Resposta resposta) {
        if (this.respostas.contains(resposta)) {
            this.respostas.remove(resposta);
            resposta.setQuestao(null);
        }
    }

    public Questionario getQuestionario() {
        return questionario;
    }

    public void setQuestionario(Questionario questionario) {
        if (this.questionario != questionario) {
            this.questionario = questionario;
            questionario.addQuestao(this);
        }
    }

}
