package br.ufu.gsi015.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.ufu.gsi015.controller.exceptions.CustomNotFoundException;
import br.ufu.gsi015.model.Usuario;
import br.ufu.gsi015.service.UsuarioService;

@RestController
@RequestMapping("/api/users")
public class UsuarioController {
    private final UsuarioService service;

    UsuarioController(UsuarioService service) {
        this.service = service;
    }

    @GetMapping("/{id}")
    ResponseEntity<Usuario> oneUser(@PathVariable("id") Long id) {
        return service.getUsuarioById(id)
                .map(ResponseEntity::ok)
                .orElseThrow(() -> new CustomNotFoundException("Usuário não encontrado"));
    }

    @GetMapping
    ResponseEntity<Iterable<Usuario>> allUsers() {
        return ResponseEntity.ok(service.getAllUsuarios());
    }

}
