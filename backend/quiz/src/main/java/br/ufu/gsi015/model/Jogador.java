package br.ufu.gsi015.model;

import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString(callSuper = true)
@Entity
@DiscriminatorValue("Jogador")
public class Jogador extends Usuario {
    private Long pontuacao;
}
