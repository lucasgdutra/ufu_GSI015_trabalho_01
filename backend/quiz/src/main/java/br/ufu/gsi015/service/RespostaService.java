package br.ufu.gsi015.service;

import br.ufu.gsi015.controller.exceptions.CustomNotFoundException;
import br.ufu.gsi015.controller.exceptions.DatabaseException;
import br.ufu.gsi015.controller.exceptions.ServiceException;
import br.ufu.gsi015.model.Resposta;

import br.ufu.gsi015.repository.RespostaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class RespostaService {
    private final RespostaRepository respostaRepository;

    public RespostaService(RespostaRepository respostaRepository) {
        this.respostaRepository = respostaRepository;
    }

    public Iterable<Resposta> getAllRespostas() {
        try {
            List<Resposta> respostas = (List<Resposta>) respostaRepository.findAll();
            return respostas != null ? respostas : new ArrayList<>();

        } catch (DataAccessException e) {
            throw new DatabaseException("Error accessing the database");
        } catch (Exception e) {
            throw new ServiceException("An unexpected error occurred");
        }
    }

    public Optional<Resposta> getRespostaById(Long id) {
        return respostaRepository.findById(id);
    }

    public Resposta saveResposta(Resposta resposta) {
        return respostaRepository.save(resposta);
    }

    /*
     * public void deleteResposta(Long id) {
     * respostaRepository.deleteById(id);
     * }
     */

    public String deleteResposta(Long id) {
        Optional<Resposta> existingResposta = getRespostaById(id);
        if (existingResposta.isPresent()) {
            Resposta r = existingResposta.get();
            respostaRepository.delete(r);
            return "OK";
        }
        throw new CustomNotFoundException("User not found");
    }

    public Iterable<Resposta> getRespostasByQuestaoId(Long questaoId) {
        return respostaRepository.findRespostasByQuestaoId(questaoId);
    }

}
