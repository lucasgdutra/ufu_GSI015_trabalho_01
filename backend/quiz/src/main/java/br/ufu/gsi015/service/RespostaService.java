package br.ufu.gsi015.service;

import br.ufu.gsi015.controller.exceptions.CustomInternalErrorException;
import br.ufu.gsi015.controller.exceptions.CustomNotFoundException;

import br.ufu.gsi015.model.Resposta;

import br.ufu.gsi015.repository.RespostaRepository;

import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class RespostaService {
    private final RespostaRepository respostaRepository;

    public RespostaService(RespostaRepository respostaRepository) {
        this.respostaRepository = respostaRepository;
    }

    public Resposta getRespostaById(Long id) {
        try {
            Optional<Resposta> existing = respostaRepository.findById(id);
            if (existing.isPresent()) {
                return existing.get();
            }
            throw new CustomNotFoundException("Resposta nao encontrada");
        } catch (Exception e) {
            throw new CustomInternalErrorException(e.getMessage());
        }
    }

    public Boolean getRespostaIsCorrectById(Long id) {
        try {
            Resposta existing = getRespostaById(id);
            return existing.getCorreta();
        } catch (Exception e) {
            throw new CustomInternalErrorException(e.getMessage());
        }
    }

    public Resposta createResposta(Resposta resposta) {
        try {
            return respostaRepository.save(resposta);
        } catch (Exception e) {
            throw new CustomInternalErrorException(e.getMessage());
        }
    }

    public Resposta updateResposta(Resposta resposta, Long id) {
        try {
            Resposta existing = getRespostaById(id);
            if (resposta.getCorreta() != null) {
                existing.setCorreta(resposta.getCorreta());
            }
            if (resposta.getResposta() != null) {
                existing.setResposta(resposta.getResposta());
            }
            if (resposta.getQuestao() != null) {
                existing.setQuestao(resposta.getQuestao());
            }
            return respostaRepository.save(existing);
        } catch (Exception e) {
            throw new CustomInternalErrorException(e.getMessage());
        }
    }

    public String deleteResposta(Long id) {
        try {
            Resposta existing = getRespostaById(id);
            respostaRepository.delete(existing);
            return "OK";
        } catch (Exception e) {
            throw new CustomInternalErrorException(e.getMessage());
        }
    }

}
