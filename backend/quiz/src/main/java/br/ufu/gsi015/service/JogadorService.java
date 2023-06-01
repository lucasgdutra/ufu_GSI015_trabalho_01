package br.ufu.gsi015.service;

import br.ufu.gsi015.controller.exceptions.CustomConflictException;
import br.ufu.gsi015.controller.exceptions.CustomNotFoundException;
import br.ufu.gsi015.model.Jogador;
import br.ufu.gsi015.repository.JogadorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class JogadorService {
    private final JogadorRepository jogadorRepository;

    @Autowired
    public JogadorService(JogadorRepository jogadorRepository) {
        this.jogadorRepository = jogadorRepository;
    }

    public Iterable<Jogador> getAllJogadores() {
        return jogadorRepository.findAll();
    }

    public Optional<Jogador> getJogadorById(Long id) {
        return jogadorRepository.findById(id);
    }

    public Optional<Jogador> getJogadorByEmail(String email) {
        return jogadorRepository.findByEmail(email);
    }

    public Jogador createJogador(Jogador newEntity) {
        jogadorRepository.findByEmail(newEntity.getEmail())
                .ifPresent(existingUser -> {
                    throw new CustomConflictException("User with this email already exists");
                });
        return jogadorRepository.save(newEntity);
    }

    public Jogador updateJogador(Long id, Jogador newEntity) {
        return jogadorRepository.findById(id)
                .map(existingUser -> {
                    existingUser.setName(newEntity.getName() != null ? newEntity.getName() : existingUser.getName());
                    existingUser
                            .setEmail(newEntity.getEmail() != null ? newEntity.getEmail() : existingUser.getEmail());
                    existingUser.setPontuacao(
                            newEntity.getPontuacao() != null ? newEntity.getPontuacao() : existingUser.getPontuacao());
                    return jogadorRepository.save(existingUser);
                })
                .orElseThrow(() -> new CustomNotFoundException("User not found"));
    }

    /*public void deleteJogador(Long id) {
        jogadorRepository.deleteById(id);
    }*/

    public String deleteJogador(Long id){
        Optional<Jogador> existingUser = getJogadorById(id);
        if (existingUser.isPresent()) {
            Jogador user = existingUser.get();
            jogadorRepository.delete(user);
            return "OK";
        }
        throw new CustomNotFoundException("User not found");
    }

}
