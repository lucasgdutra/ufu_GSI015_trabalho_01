package br.ufu.gsi015.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.ufu.gsi015.controller.exceptions.CustomNotFoundException;
import br.ufu.gsi015.model.Jogador;

import br.ufu.gsi015.service.JogadorService;
import jakarta.validation.Valid;

@RestController
@RequestMapping("/api/players")
public class JogadorController {
    private final JogadorService jogadorService;

    JogadorController(JogadorService jogadorService) {
        this.jogadorService = jogadorService;
    }

    @GetMapping
    public ResponseEntity<Iterable<Jogador>> allPlayers() {
        return ResponseEntity.ok(jogadorService.getAllJogadores());
    }

    @GetMapping("/{id}")
    public ResponseEntity<Jogador> onePlayer(@PathVariable Long id) {
        return jogadorService.getJogadorById(id)
                .map(ResponseEntity::ok)
                .orElseThrow(() -> new CustomNotFoundException("User not found"));
    }

    @PostMapping
    public ResponseEntity<Jogador> newPlayer(@Valid @RequestBody Jogador newEntity) {
        Jogador createdUser = jogadorService.createJogador(newEntity);
        return ResponseEntity.status(HttpStatus.CREATED).body(createdUser);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Jogador> updatePlayer(@Valid @PathVariable Long id, @RequestBody Jogador newEntity) {
        Jogador updatedUser = jogadorService.updateJogador(id, newEntity);
        return ResponseEntity.ok(updatedUser);
    }
}
