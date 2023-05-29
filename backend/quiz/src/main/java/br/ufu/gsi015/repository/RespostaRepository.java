package br.ufu.gsi015.repository;

import org.springframework.data.repository.CrudRepository;

import br.ufu.gsi015.model.Resposta;

public interface RespostaRepository extends CrudRepository<Resposta, Long> {
    Iterable<Resposta> findRespostasByQuestaoId(Long questaoId);
}
