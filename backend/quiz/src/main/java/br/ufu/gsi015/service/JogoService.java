package br.ufu.gsi015.service;

import br.ufu.gsi015.controller.exceptions.CustomNotFoundException;
import br.ufu.gsi015.model.Jogo;
import br.ufu.gsi015.repository.JogoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class JogoService {
    private final JogoRepository jogoRepository;

    public JogoService(JogoRepository jogoRepository) {
        this.jogoRepository = jogoRepository;
    }

    public Iterable<Jogo> getAllJogos() {
        return jogoRepository.findAll();
    }

    public Jogo saveJogo(Jogo jogo) {
        return jogoRepository.save(jogo);
    }

    public Jogo updateJogo(Jogo jogo, Long id) {
        Optional<Jogo> jogoOptional = jogoRepository.findById(id);
        if (jogoOptional.isPresent()) {
            Jogo jogoAtual = jogoOptional.get();
            jogoAtual.setJogador(jogo.getJogador() == null ? jogoAtual.getJogador() : jogo.getJogador());
            jogoAtual.setPontuacao(jogo.getPontuacao() == null ? jogoAtual.getPontuacao() : jogo.getPontuacao());
            jogoAtual.setQuestionario(
                    jogo.getQuestionario() == null ? jogoAtual.getQuestionario() : jogo.getQuestionario());
            return jogoRepository.save(jogoAtual);
        }
        throw new CustomNotFoundException("Jogo nao encontrado");
    }

    /*
     * public void deleteJogo(Long id) {
     * jogoRepository.deleteById(id);
     * }
     */

    public String deleteJogo(Long id) {
        Optional<Jogo> existingUser = getJogoById(id);
        if (existingUser.isPresent()) {
            Jogo user = existingUser.get();
            jogoRepository.delete(user);
            return "OK";
        }
        throw new CustomNotFoundException("User not found");
    }

    public Optional<Jogo> getJogoById(Long id) {
        return jogoRepository.findById(id);
    }

    public Jogo updateJogo(Jogo jogo) {
        return jogoRepository.save(jogo);
    }

    public List<Jogo> getRankedGames() {
        return jogoRepository.findAllByOrderByPontuacaoDesc();
    }

}
