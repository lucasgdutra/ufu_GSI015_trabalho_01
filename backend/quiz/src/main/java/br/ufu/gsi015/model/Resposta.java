package br.ufu.gsi015.model;

import com.fasterxml.jackson.annotation.JsonProperty;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

@Entity
@Table(name = "respostas")
public class Resposta {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "questao_id")
    @NotNull(message = "pergunta precisa ter uma questao associada")
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    private Questao questao;

    @NotBlank(message = "resposta nao pode ser nulo")
    @Column(nullable = false)
    private String resposta;

    @NotNull(message = "correta nao pode ser nulo")
    @Column(nullable = false)
    private Boolean correta;

    protected Resposta() {

    }

    Resposta(String resposta, Boolean correta) {
        this.resposta = resposta;
        this.correta = correta;
    }

    Resposta(Long id, String resposta, Boolean correta) {
        this.id = id;
        this.resposta = resposta;
        this.correta = correta;
    }

    public Long getId() {
        return id;
    }

    public String getResposta() {
        return resposta;
    }

    public void setResposta(String resposta) {
        this.resposta = resposta;
    }

    public Boolean getCorreta() {
        return correta;
    }

    public void setCorreta(Boolean correta) {
        this.correta = correta;
    }

    public Questao getQuestao() {
        return questao;
    }

    public void setQuestao(Questao questao) {
        this.questao = questao;
    }
}
