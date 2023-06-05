package br.ufu.gsi015.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
        return new ResponseEntity<>(jogadorService.getAllJogadores(), HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Jogador> onePlayer(@PathVariable Long id) {
        return new ResponseEntity<>(jogadorService.getJogadorById(id), HttpStatus.OK);
    }

    @GetMapping("/ranking")
    public ResponseEntity<Iterable<Jogador>> ranking() {
        return new ResponseEntity<>(jogadorService.getRanking(), HttpStatus.OK);
    }

    @PostMapping
    public ResponseEntity<Jogador> newPlayer(@Valid @RequestBody Jogador newEntity) {
        Jogador createdUser = jogadorService.createJogador(newEntity);
        return new ResponseEntity<>(createdUser, HttpStatus.OK);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Jogador> updatePlayer(@Valid @PathVariable Long id, @RequestBody Jogador newEntity) {
        Jogador updatedUser = jogadorService.updateJogador(id, newEntity);
        return new ResponseEntity<>(updatedUser, HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<String> deleteJogador(@Valid @PathVariable Long id) {
        return new ResponseEntity<String>(jogadorService.deleteJogador(id), HttpStatus.OK);
    }
}
