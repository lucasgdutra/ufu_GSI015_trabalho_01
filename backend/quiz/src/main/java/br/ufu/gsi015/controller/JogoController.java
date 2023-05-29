package br.ufu.gsi015.controller;

import java.util.Optional;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.ufu.gsi015.controller.exceptions.CustomInternalErrorException;
import br.ufu.gsi015.controller.exceptions.CustomNotFoundException;
import br.ufu.gsi015.model.Jogo;
import br.ufu.gsi015.service.JogoService;

@RestController
@RequestMapping("/api/jogos")
public class JogoController {
    private final JogoService jogoService;

    JogoController(JogoService jogoService) {
        this.jogoService = jogoService;
    }

    @GetMapping("/{id}")
    ResponseEntity<Jogo> oneJogo(@PathVariable("id") Long id) {
        try {
            Optional<Jogo> jogo = jogoService.getJogoById(id);
            if (jogo.isPresent()) {
                return new ResponseEntity<>(jogo.get(), HttpStatus.OK);
            }
            throw new CustomNotFoundException("Jogo nao encontrado");
        } catch (Exception e) {
            throw new CustomInternalErrorException(e.getMessage());
        }
    }

    @GetMapping
    ResponseEntity<Iterable<Jogo>> allJogos() {
        try {
            return new ResponseEntity<>(jogoService.getAllJogos(), HttpStatus.OK);
        } catch (Exception e) {
            throw new CustomInternalErrorException(e.getMessage());
        }
    }

    @PostMapping
    public ResponseEntity<Jogo> newJogo(@RequestBody Jogo jogo) {
        return new ResponseEntity<>(jogoService.saveJogo(jogo), HttpStatus.CREATED);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Jogo> replaceJogo(@RequestBody Jogo jogo, @PathVariable("id") Long id) {
        return new ResponseEntity<>(jogoService.updateJogo(jogo, id), HttpStatus.OK);
    }
}
