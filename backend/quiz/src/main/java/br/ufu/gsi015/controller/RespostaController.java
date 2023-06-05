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

import br.ufu.gsi015.model.Resposta;
import br.ufu.gsi015.service.RespostaService;
import jakarta.validation.Valid;

@RestController
@RequestMapping("/api/respostas")
public class RespostaController {
    private final RespostaService service;

    RespostaController(RespostaService service) {
        this.service = service;
    }

    @GetMapping("/{id}")
    ResponseEntity<Resposta> oneResposta(@PathVariable("id") Long id) {
        return new ResponseEntity<>(service.getRespostaById(id), HttpStatus.OK);
    }

    @GetMapping("/{id}/correta")
    ResponseEntity<Boolean> boolResposta(@PathVariable("id") Long id) {
        return new ResponseEntity<>(service.getRespostaIsCorrectById(id), HttpStatus.OK);
    }

    @PostMapping
    public ResponseEntity<Resposta> createResposta(@RequestBody Resposta resposta) {
        return new ResponseEntity<>(service.createResposta(resposta), HttpStatus.CREATED);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Resposta> replaceResposta(@RequestBody Resposta resposta, @PathVariable("id") Long id) {
        return new ResponseEntity<>(service.updateResposta(resposta, id), HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<String> deleteResposta(@Valid @PathVariable Long id) {
        return new ResponseEntity<String>(service.deleteResposta(id), HttpStatus.OK);
    }

}
