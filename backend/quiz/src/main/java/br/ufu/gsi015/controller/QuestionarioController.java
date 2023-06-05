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

import br.ufu.gsi015.model.Questao;
import br.ufu.gsi015.model.Questionario;
import br.ufu.gsi015.service.QuestionarioService;
import jakarta.validation.Valid;

@RestController
@RequestMapping("/api/questionarios")
public class QuestionarioController {
    private final QuestionarioService questionarioService;

    QuestionarioController(QuestionarioService questionarioService) {
        this.questionarioService = questionarioService;
    }

    @GetMapping
    public ResponseEntity<Iterable<Questionario>> allQuestionarios() {
        return new ResponseEntity<>(questionarioService.getAllQuestionarios(), HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Questionario> oneQuestionario(@PathVariable("id") Long id) {
        return new ResponseEntity<>(questionarioService.getQuestionarioById(id), HttpStatus.OK);
    }

    @GetMapping("/{id}/questoes")
    public ResponseEntity<Iterable<Questao>> allQuestoes(@PathVariable("id") Long id) {
        return new ResponseEntity<>(questionarioService.getQuestoesByQuestionarioId(id), HttpStatus.OK);
    }

    @PostMapping
    public ResponseEntity<Questionario> createQuestionario(@RequestBody Questionario questionario) {
        return new ResponseEntity<>(questionarioService.createQuestionario(questionario), HttpStatus.CREATED);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Questionario> replaceQuestionario(@RequestBody Questionario questionario,
            @PathVariable("id") Long id) {
        return new ResponseEntity<>(questionarioService.updateQuestionario(questionario, id), HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<String> deleteQuestionario(@Valid @PathVariable Long id) {
        return new ResponseEntity<String>(questionarioService.deleteQuestionario(id), HttpStatus.OK);
    }

}
