package br.ufu.gsi015.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import br.ufu.gsi015.model.Jogo;

public interface JogoRepository extends CrudRepository<Jogo, Long> {
    List<Jogo> findAllByOrderByPontuacaoDesc();
}
