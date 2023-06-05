package br.ufu.gsi015.service;

import br.ufu.gsi015.controller.exceptions.CustomInternalErrorException;
import br.ufu.gsi015.controller.exceptions.CustomNotFoundException;
import br.ufu.gsi015.model.Questao;
import br.ufu.gsi015.model.Resposta;
import br.ufu.gsi015.repository.QuestaoRepository;

import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class QuestaoService {
    private final QuestaoRepository questaoRepository;

    public QuestaoService(QuestaoRepository questaoRepository) {
        try {
            this.questaoRepository = questaoRepository;
        } catch (Exception e) {
            throw new CustomInternalErrorException(e.getMessage());
        }
    }

    public List<Questao> getAllQuestoes() {
        try {
            return (List<Questao>) questaoRepository.findAll();
        } catch (Exception e) {
            throw new CustomInternalErrorException(e.getMessage());
        }
    }

    public Questao getQuestaoById(Long id) {
        try {
            Optional<Questao> questao = questaoRepository.findById(id);
            if (questao.isPresent()) {
                return questao.get();
            }
            throw new CustomNotFoundException("Questao nao encontrada");
        } catch (Exception e) {
            throw new CustomInternalErrorException(e.getMessage());
        }
    }

    public Iterable<Resposta> getRespostasByQuestaoId(Long id) {
        try {
            return getQuestaoById(id).getRespostas();
        } catch (Exception e) {
            throw new CustomInternalErrorException(e.getMessage());
        }
    }

    public Questao saveQuestao(Questao questao) {
        try {
            return questaoRepository.save(questao);
        } catch (Exception e) {
            throw new CustomInternalErrorException(e.getMessage());
        }
    }

    public Questao updateQuestao(Questao questao, Long id) {
        try {
            Questao questaoAtual = getQuestaoById(id);
            if (questao.getPergunta() != null) {
                questaoAtual.setPergunta(questao.getPergunta());
            }

            if (questao.getPontuacao() != null) {
                questaoAtual.setPontuacao(questao.getPontuacao());
            }
            if (questao.getQuestionario() != null) {
                questaoAtual.setQuestionario(questao.getQuestionario());
            }
            if (questao.getRespostas() != null) {
                questaoAtual.setRespostas(questao.getRespostas());
            }

            return questaoRepository.save(questaoAtual);
        } catch (Exception e) {
            throw new CustomInternalErrorException(e.getMessage());
        }
    }

    public String deleteQuestao(Long id) {
        try {
            Questao existingQuestion = getQuestaoById(id);
            questaoRepository.delete(existingQuestion);
            return "OK";
        } catch (Exception e) {
            throw new CustomInternalErrorException(e.getMessage());
        }
    }

}
