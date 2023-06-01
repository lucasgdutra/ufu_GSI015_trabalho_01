package br.ufu.gsi015.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
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

import br.ufu.gsi015.controller.exceptions.CustomInternalErrorException;
import br.ufu.gsi015.controller.exceptions.CustomNotFoundException;
import br.ufu.gsi015.model.Resposta;
import br.ufu.gsi015.service.RespostaService;
import jakarta.validation.Valid;

@RestController
@RequestMapping("/api/respostas")
public class RespostaController {
    private final RespostaService service;

    @Autowired
    RespostaController(RespostaService service) {
        this.service = service;
    }

    @GetMapping("/{id}")
    ResponseEntity<Resposta> oneResposta(@PathVariable("id") Long id) {
        try {
            Optional<Resposta> resposta = service.getRespostaById(id);
            if (resposta.isPresent()) {
                return new ResponseEntity<>(resposta.get(), HttpStatus.OK);
            }
            throw new CustomNotFoundException("Resposta nao encontrada");
        } catch (Exception e) {
            throw new CustomInternalErrorException(e.getMessage());
        }
    }

    @GetMapping("/{id}")
    ResponseEntity<Boolean> boolResposta(@PathVariable("id") Long id){
        try {
            Optional<Resposta> resposta = service.getRespostaById(id);
            if (resposta.isPresent()) {
                boolean correta = resposta.get().getCorreta();
                return new ResponseEntity<>(correta, HttpStatus.OK);
            }else{
                return new ResponseEntity<Boolean>(false,HttpStatus.OK);
            }
        } catch (Exception e) {
            throw new CustomInternalErrorException(e.getMessage());
        }
    }

    @GetMapping("/questao/{questaoId}")
    ResponseEntity<Iterable<Resposta>> allRespostasByQuestaoId(@PathVariable("questaoId") Long questaoId) {
        try {
            return new ResponseEntity<>(service.getRespostasByQuestaoId(questaoId), HttpStatus.OK);
        } catch (Exception e) {
            throw new CustomInternalErrorException(e.getMessage());
        }
    }

    @GetMapping
    ResponseEntity<Iterable<Resposta>> allRespostas() {
        try {
            return new ResponseEntity<>(service.getAllRespostas(), HttpStatus.OK);
        } catch (Exception e) {
            throw new CustomInternalErrorException(e.getMessage());
        }
    }

    @PostMapping
    public ResponseEntity<Resposta> newResposta(@RequestBody Resposta resposta) {
        return new ResponseEntity<>(service.saveResposta(resposta), HttpStatus.CREATED);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Resposta> replaceResposta(@RequestBody Resposta resposta, @PathVariable("id") Long id) {
        Optional<Resposta> respostaAtual = service.getRespostaById(id);
        if (respostaAtual.isPresent()) {
            resposta.setCorreta(
                    resposta.getCorreta() == null ? respostaAtual.get().getCorreta() : resposta.getCorreta());
            resposta.setResposta(
                    resposta.getResposta() == null ? respostaAtual.get().getResposta() : resposta.getResposta());
            return new ResponseEntity<>(service.saveResposta(respostaAtual.get()), HttpStatus.OK);
        }
        throw new CustomNotFoundException("Resposta nao encontrada");
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<String> deleteResposta(@Valid @PathVariable Long id){
        return new ResponseEntity<String>(service.deleteResposta(id),HttpStatus.OK);
    }

}
