package br.ufu.gsi015.model;

import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;

@Entity
@DiscriminatorValue("Administrador")
public class Administrador extends Usuario {

    Administrador() {
        super();
    }

    public Administrador(@NotBlank String name, @Email String email) {
        super(name, email);
    }

    public Administrador(Long id, @NotBlank String name, @Email String email) {
        super(id, name, email);
    }

}
