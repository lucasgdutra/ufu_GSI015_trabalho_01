package br.ufu.gsi015.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
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
import br.ufu.gsi015.model.Questao;
import br.ufu.gsi015.service.QuestaoService;
import jakarta.validation.Valid;

@RestController
@RequestMapping("/api/questoes")
public class QuestaoController {
    private final QuestaoService questaoService;

    @Autowired
    QuestaoController(QuestaoService questaoService) {
        this.questaoService = questaoService;
    }

    @GetMapping("/{id}")
    ResponseEntity<Questao> oneQuestao(@PathVariable("id") Long id) {
        try {
            Optional<Questao> questao = questaoService.getQuestaoById(id);
            if (questao.isPresent()) {
                return new ResponseEntity<>(questao.get(), HttpStatus.OK);
            }
            throw new CustomNotFoundException("Questao nao encontrada");
        } catch (Exception e) {
            throw new CustomInternalErrorException(e.getMessage());
        }
    }

    @GetMapping
    ResponseEntity<Iterable<Questao>> allQuestoes() {
        try {
            return new ResponseEntity<>(questaoService.getAllQuestoes(), HttpStatus.OK);
        } catch (Exception e) {
            throw new CustomInternalErrorException(e.getMessage());
        }
    }

    @PostMapping
    ResponseEntity<Questao> newQuestao(@Valid @RequestBody Questao questao) {
        try {
            return new ResponseEntity<>(questaoService.saveQuestao(questao), HttpStatus.CREATED);
        } catch (Exception e) {
            throw new CustomInternalErrorException(e.getMessage());
        }
    }

    @PutMapping("/{id}")
    ResponseEntity<Questao> replaceQuestao(@Valid @RequestBody Questao questao, @PathVariable("id") Long id) {
        try {
            Optional<Questao> questaoOptional = questaoService.getQuestaoById(id);
            if (!questaoOptional.isPresent()) {
                throw new CustomNotFoundException("Questao nao encontrada");
            }
            Questao questaoAtual = questaoOptional.get();
            questaoAtual
                    .setPergunta(questao.getPergunta() == null ? questaoAtual.getPergunta() : questao.getPergunta());
            questaoAtual.setPontuacao(
                    questao.getPontuacao() == null ? questaoAtual.getPontuacao() : questao.getPontuacao());

            questaoService.saveQuestao(questaoAtual);
            return new ResponseEntity<>(questaoAtual, HttpStatus.OK);

        } catch (Exception e) {
            throw new CustomInternalErrorException(e.getMessage());
        }
    }
}
