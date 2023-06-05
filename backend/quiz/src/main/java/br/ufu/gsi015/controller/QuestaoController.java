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
import br.ufu.gsi015.model.Resposta;
import br.ufu.gsi015.service.QuestaoService;
import jakarta.validation.Valid;

@RestController
@RequestMapping("/api/questoes")
public class QuestaoController {
    private final QuestaoService questaoService;

    QuestaoController(QuestaoService questaoService) {
        this.questaoService = questaoService;
    }

    @GetMapping("/{id}")
    ResponseEntity<Questao> oneQuestao(@PathVariable("id") Long id) {
        return new ResponseEntity<>(questaoService.getQuestaoById(id), HttpStatus.OK);
    }

    @GetMapping("/{id}/respostas")
    ResponseEntity<Iterable<Resposta>> getRespostas(@PathVariable("id") Long id) {
        return new ResponseEntity<>(questaoService.getRespostasByQuestaoId(id), HttpStatus.OK);
    }

    @PostMapping
    ResponseEntity<Questao> newQuestao(@Valid @RequestBody Questao questao) {
        return new ResponseEntity<>(questaoService.saveQuestao(questao), HttpStatus.CREATED);
    }

    @PutMapping("/{id}")
    ResponseEntity<Questao> updateQuestao(@RequestBody Questao questao, @PathVariable("id") Long id) {
        return new ResponseEntity<>(questaoService.updateQuestao(questao, id), HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<String> deleteQuestao(@Valid @PathVariable Long id) {
        return new ResponseEntity<String>(questaoService.deleteQuestao(id), HttpStatus.OK);
    }

}
