package br.ufu.gsi015.service;

import br.ufu.gsi015.controller.exceptions.CustomInternalErrorException;
import br.ufu.gsi015.controller.exceptions.CustomNotFoundException;
import br.ufu.gsi015.model.Jogo;
import br.ufu.gsi015.repository.JogoRepository;

import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class JogoService {
    private final JogoRepository jogoRepository;

    public JogoService(JogoRepository jogoRepository) {
        try {
            this.jogoRepository = jogoRepository;
        } catch (Exception e) {
            throw new CustomInternalErrorException(e.getMessage());
        }
    }

    public Jogo getJogoById(Long id) {
        try {
            Optional<Jogo> existing = jogoRepository.findById(id);
            if (existing.isPresent()) {
                return existing.get();
            }
            throw new CustomNotFoundException("Jogo nao encontrado");
        } catch (Exception e) {
            throw new CustomInternalErrorException(e.getMessage());
        }
    }

    public Iterable<Jogo> getAllJogos() {
        try {
            return jogoRepository.findAll();
        } catch (Exception e) {
            throw new CustomInternalErrorException(e.getMessage());
        }

    }

    public Jogo createJogo(Jogo jogo) {
        try {
            return jogoRepository.save(jogo);
        } catch (Exception e) {
            throw new CustomInternalErrorException(e.getMessage());
        }
    }

    public Jogo updateJogo(Jogo jogo, Long id) {
        try {
            Jogo existing = getJogoById(id);
            if (jogo.getJogador() != null)
                existing.setJogador(jogo.getJogador());
            if (jogo.getPontuacao() != null)
                existing.setPontuacao(jogo.getPontuacao());
            if (jogo.getQuestionario() != null)
                existing.setQuestionario(jogo.getQuestionario());
            return jogoRepository.save(existing);

        } catch (Exception e) {
            throw new CustomInternalErrorException(e.getMessage());
        }
    }

    public String deleteJogo(Long id) {
        try {
            Jogo existing = getJogoById(id);
            jogoRepository.delete(existing);
            return "OK";

        } catch (Exception e) {
            throw new CustomInternalErrorException(e.getMessage());
        }
    }

    public List<Jogo> getRankedGames() {
        return jogoRepository.findAllByOrderByPontuacaoDesc();
    }

}
