package br.ufu.gsi015.service;

import br.ufu.gsi015.controller.exceptions.CustomConflictException;
import br.ufu.gsi015.controller.exceptions.CustomInternalErrorException;
import br.ufu.gsi015.controller.exceptions.CustomNotFoundException;
import br.ufu.gsi015.model.Jogador;
import br.ufu.gsi015.repository.JogadorRepository;

import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class JogadorService {
    private final JogadorRepository jogadorRepository;

    public JogadorService(JogadorRepository jogadorRepository) {
        try {
            this.jogadorRepository = jogadorRepository;
        } catch (Exception e) {
            throw new CustomInternalErrorException(e.getMessage());
        }
    }

    public Iterable<Jogador> getAllJogadores() {
        try {
            return jogadorRepository.findAll();
        } catch (Exception e) {
            throw new CustomInternalErrorException(e.getMessage());
        }
    }

    public Jogador getJogadorById(Long id) {
        try {
            Optional<Jogador> jogador = jogadorRepository.findById(id);
            if (jogador.isPresent()) {
                return jogador.get();
            }
            throw new CustomNotFoundException("User not found");
        } catch (Exception e) {
            throw new CustomInternalErrorException(e.getMessage());
        }
    }

    public Jogador createJogador(Jogador newEntity) {
        try {
            Optional<Jogador> jogador = jogadorRepository.findByName(newEntity.getName());
            if (jogador.isPresent()) {
                throw new CustomConflictException("User already exists");
            }
            return jogadorRepository.save(newEntity);
        } catch (Exception e) {
            throw new CustomInternalErrorException(e.getMessage());
        }
    }

    public Jogador updateJogador(Long id, Jogador newEntity) {
        try {
            Jogador existing = getJogadorById(id);
            if (newEntity.getName() != null) {
                existing.setName(newEntity.getName());
            }
            if (newEntity.getEmail() != null) {
                existing.setEmail(newEntity.getEmail());
            }
            if (newEntity.getPontuacao() != null) {
                existing.setPontuacao(newEntity.getPontuacao());
            }
            return jogadorRepository.save(existing);
        } catch (Exception e) {
            throw new CustomInternalErrorException(e.getMessage());
        }
    }

    public String deleteJogador(Long id) {
        try {
            Jogador existing = getJogadorById(id);
            jogadorRepository.delete(existing);
            return "OK";

        } catch (Exception e) {
            throw new CustomInternalErrorException(e.getMessage());
        }
    }

    public Iterable<Jogador> getRanking() {
        try {
            return jogadorRepository.findTop25ByOrderByPontuacaoDesc();
        } catch (Exception e) {
            throw new CustomInternalErrorException(e.getMessage());
        }
    }

}
