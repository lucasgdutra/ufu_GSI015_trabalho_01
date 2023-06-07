package br.ufu.gsi015.model;

import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

@Entity
@Table(name = "questionarios")
public class Questionario {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "questionarios_seq")
    @SequenceGenerator(name = "questionarios_seq", sequenceName = "questionarios_seq", allocationSize = 1)
    private Long id;

    @NotBlank(message = "O título não pode ser vazio")
    @Column(nullable = false)
    private String titulo;

    @OneToMany(mappedBy = "questionario")
    @NotNull(message = "O questionário deve ter pelo menos uma questão")
    @JsonIgnore
    private List<Questao> questoes;

    public Questionario() {
        this.questoes = new ArrayList<>();
    }

    public Questionario(String titulo) {
        this.titulo = titulo;
        this.questoes = new ArrayList<>();
    }

    public Questionario(Long id, String titulo) {
        this.id = id;
        this.titulo = titulo;
        this.questoes = new ArrayList<>();
    }

    public Long getId() {
        return id;
    }

    public String getTitulo() {
        return titulo;
    }

    public List<Questao> getQuestoes() {
        return questoes;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public void addQuestao(Questao questao) {
        if (!this.questoes.contains(questao)) {
            this.questoes.add(questao);
            questao.setQuestionario(this);
        }
    }

    public void setQuestoes(List<Questao> questoes) {
        this.questoes = questoes;
    }
}
