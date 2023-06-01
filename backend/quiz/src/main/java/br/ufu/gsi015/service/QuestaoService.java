package br.ufu.gsi015.service;

import br.ufu.gsi015.controller.exceptions.CustomNotFoundException;
import br.ufu.gsi015.model.Questao;
import br.ufu.gsi015.repository.QuestaoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class QuestaoService {
    private final QuestaoRepository questaoRepository;

    @Autowired
    public QuestaoService(QuestaoRepository questaoRepository) {
        this.questaoRepository = questaoRepository;
    }

    public Iterable<Questao> getAllQuestoes() {
        return questaoRepository.findAll();
    }

    public Optional<Questao> getQuestaoById(Long id) {
        return questaoRepository.findById(id);
    }

    public Questao saveQuestao(Questao questao) {
        return questaoRepository.save(questao);
    }

    /*public void deleteQuestao(Long id) {
        questaoRepository.deleteById(id);
    }*/

    public String deleteQuestao(Long id){
        Optional<Questao> existingQuestion = getQuestaoById(id);
        if (existingQuestion.isPresent()) {
            Questao question = existingQuestion.get();
            questaoRepository.delete(question);
            return "OK";
        }
        throw new CustomNotFoundException("User not found");
    }

}
