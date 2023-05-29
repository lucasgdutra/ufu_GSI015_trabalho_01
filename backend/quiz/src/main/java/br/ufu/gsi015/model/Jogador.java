package br.ufu.gsi015.model;

import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;

@Entity
@DiscriminatorValue("Jogador")
public class Jogador extends Usuario {

    private Long pontuacao;

    public Jogador() {
        super();
        this.pontuacao = 0L;
    }

    public Jogador(@NotBlank String nome, @Email String email, Long pontuacao) {
        super(nome, email);
        if (pontuacao == null) {
            this.pontuacao = 0L;
        } else {
            this.pontuacao = pontuacao;
        }
    }

    public Jogador(Long id, @NotBlank String nome, @Email String email, Long pontuacao) {
        super(id, nome, email);
        if (pontuacao == null) {
            this.pontuacao = 0L;
        } else {
            this.pontuacao = pontuacao;
        }
    }

    public Long getPontuacao() {
        return pontuacao;
    }

    public void setPontuacao(Long pontuacao) {
        this.pontuacao = pontuacao;
    }
}
