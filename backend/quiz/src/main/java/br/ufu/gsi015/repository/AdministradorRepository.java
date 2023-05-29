package br.ufu.gsi015.repository;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import br.ufu.gsi015.model.Administrador;

public interface AdministradorRepository extends CrudRepository<Administrador, Long> {
    Optional<Administrador> findByEmail(String email);
}
