package br.ufu.gsi015.repository;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import br.ufu.gsi015.model.Usuario;

public interface UsuarioRepository extends CrudRepository<Usuario, Long>{
    Optional<Usuario> findByEmail(String email);
}
