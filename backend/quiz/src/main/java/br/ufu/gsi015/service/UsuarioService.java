package br.ufu.gsi015.service;

import br.ufu.gsi015.controller.exceptions.CustomInternalErrorException;
import br.ufu.gsi015.controller.exceptions.CustomNotFoundException;
import br.ufu.gsi015.model.Usuario;
import br.ufu.gsi015.repository.UsuarioRepository;

import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class UsuarioService {
    private final UsuarioRepository usuarioRepository;

    public UsuarioService(UsuarioRepository usuarioRepository) {
        try {
            this.usuarioRepository = usuarioRepository;
        } catch (Exception e) {
            throw new CustomInternalErrorException(e.getMessage());
        }
    }

    public Usuario getUsuarioById(Long id) {
        try {
            Optional<Usuario> existing = usuarioRepository.findById(id);
            if (existing.isPresent()) {
                return existing.get();
            }
            throw new CustomNotFoundException("Usuario nao encontrado");
        } catch (Exception e) {
            throw new CustomInternalErrorException(e.getMessage());
        }
    }

    public Iterable<Usuario> getAllUsuarios() {
        try {
            return usuarioRepository.findAll();
        } catch (Exception e) {
            throw new CustomInternalErrorException(e.getMessage());
        }
    }

}
