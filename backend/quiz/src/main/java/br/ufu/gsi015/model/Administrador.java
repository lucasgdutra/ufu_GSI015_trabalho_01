package br.ufu.gsi015.model;

import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString(callSuper = true)
@Entity
@DiscriminatorValue("Administrador")
public class Administrador extends Usuario {

}
