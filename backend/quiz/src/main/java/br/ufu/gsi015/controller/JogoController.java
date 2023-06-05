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

import br.ufu.gsi015.model.Jogo;
import br.ufu.gsi015.service.JogoService;

@RestController
@RequestMapping("/api/jogos")
public class JogoController {
    private final JogoService jogoService;

    JogoController(JogoService jogoService) {
        this.jogoService = jogoService;
    }

    @GetMapping
    ResponseEntity<Iterable<Jogo>> allJogos() {
        return new ResponseEntity<>(jogoService.getAllJogos(), HttpStatus.OK);
    }

    @GetMapping("/{id}")
    ResponseEntity<Jogo> oneJogo(@PathVariable("id") Long id) {
        Jogo jogo = jogoService.getJogoById(id);
        return new ResponseEntity<>(jogo, HttpStatus.OK);
    }

    @GetMapping("/ranking")
    ResponseEntity<Iterable<Jogo>> ranking() {
        return new ResponseEntity<>(jogoService.getRankedGames(), HttpStatus.OK);
    }

    @PostMapping
    public ResponseEntity<Jogo> newJogo(@RequestBody Jogo jogo) {
        return new ResponseEntity<>(jogoService.createJogo(jogo), HttpStatus.CREATED);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Jogo> updateJogo(@RequestBody Jogo jogo, @PathVariable("id") Long id) {
        return new ResponseEntity<>(jogoService.updateJogo(jogo, id), HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<String> deleteJogo(@PathVariable Long id) {
        return new ResponseEntity<String>(jogoService.deleteJogo(id), HttpStatus.OK);
    }

}
