package br.ufu.gsi015.service;

import java.util.ArrayList;
import java.util.Optional;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import br.ufu.gsi015.controller.exceptions.CustomNotFoundException;
import br.ufu.gsi015.controller.exceptions.DatabaseException;
import br.ufu.gsi015.controller.exceptions.ServiceException;
import br.ufu.gsi015.model.Questionario;
import br.ufu.gsi015.repository.QuestionarioRepository;

@Service
public class QuestionarioService {
    private final QuestionarioRepository questionarioRepository;

    public QuestionarioService(QuestionarioRepository questionarioRepository) {
        this.questionarioRepository = questionarioRepository;
    }

    public Iterable<Questionario> getAllQuestionarios() {
        try {
            Iterable<Questionario> questionarios = questionarioRepository.findAll();
            return questionarios != null ? questionarios : new ArrayList<>();
        } catch (DataAccessException e) {

            throw new DatabaseException("Error accessing the database");
        } catch (Exception e) {
            throw new ServiceException("An unexpected error occurred");
        }
    }

    public Questionario saveQuestionario(Questionario questionario) {
        return questionarioRepository.save(questionario);
    }

    /*
     * public void deleteQuestionario(Long id) {
     * questionarioRepository.deleteById(id);
     * }
     */

    public String deleteQuestionario(Long id) {
        Optional<Questionario> existingQuestionario = getQuestionarioById(id);
        if (existingQuestionario.isPresent()) {
            Questionario q = existingQuestionario.get();
            questionarioRepository.delete(q);
            return "OK";
        }
        throw new CustomNotFoundException("User not found");
    }

    public Optional<Questionario> getQuestionarioById(Long id) {
        return questionarioRepository.findById(id);
    }

    public Questionario updateQuestionario(Questionario questionario) {
        return questionarioRepository.save(questionario);
    }
}
