package br.ufu.gsi015.service;

import java.util.ArrayList;
import java.util.Optional;

import org.springframework.stereotype.Service;

import br.ufu.gsi015.controller.exceptions.CustomInternalErrorException;
import br.ufu.gsi015.controller.exceptions.CustomNotFoundException;
import br.ufu.gsi015.model.Questao;
import br.ufu.gsi015.model.Questionario;
import br.ufu.gsi015.repository.QuestionarioRepository;

@Service
public class QuestionarioService {
    private final QuestionarioRepository questionarioRepository;

    public QuestionarioService(QuestionarioRepository questionarioRepository) {
        this.questionarioRepository = questionarioRepository;
    }

    public Questionario getQuestionarioById(Long id) {
        try {
            Optional<Questionario> existing = questionarioRepository.findById(id);
            if (existing.isPresent()) {
                return existing.get();
            }
            throw new CustomNotFoundException("Questionario nao encontrado");
        } catch (Exception e) {
            throw new CustomInternalErrorException(e.getMessage());
        }
    }

    public Iterable<Questao> getQuestoesByQuestionarioId(Long id) {
        try {
            Questionario existing = getQuestionarioById(id);
            return existing.getQuestoes();
        } catch (Exception e) {
            throw new CustomInternalErrorException(e.getMessage());
        }
    }

    public Iterable<Questionario> getAllQuestionarios() {
        try {
            Iterable<Questionario> questionarios = questionarioRepository.findAll();
            return questionarios != null ? questionarios : new ArrayList<>();
        } catch (Exception e) {
            throw new CustomInternalErrorException(e.getMessage());
        }
    }

    public Questionario createQuestionario(Questionario questionario) {
        try {
            return questionarioRepository.save(questionario);
        } catch (Exception e) {
            throw new CustomInternalErrorException(e.getMessage());
        }
    }

    public Questionario updateQuestionario(Questionario questionario, Long id) {
        try {
            Questionario existing = getQuestionarioById(id);
            if (questionario.getTitulo() != null)
                existing.setTitulo(questionario.getTitulo());
            if (questionario.getQuestoes() != null)
                existing.setQuestoes(questionario.getQuestoes());
            return questionarioRepository.save(existing);
        } catch (Exception e) {
            throw new CustomInternalErrorException(e.getMessage());
        }
    }

    public String deleteQuestionario(Long id) {
        try {
            Questionario existing = getQuestionarioById(id);
            questionarioRepository.delete(existing);
            return "OK";
        } catch (Exception e) {
            throw new CustomInternalErrorException(e.getMessage());
        }
    }

}
