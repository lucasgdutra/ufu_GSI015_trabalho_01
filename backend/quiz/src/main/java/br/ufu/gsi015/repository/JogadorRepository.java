package br.ufu.gsi015.repository;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import br.ufu.gsi015.model.Jogador;

public interface JogadorRepository extends CrudRepository<Jogador, Long> {
    Optional<Jogador> findByEmail(String email);
}
