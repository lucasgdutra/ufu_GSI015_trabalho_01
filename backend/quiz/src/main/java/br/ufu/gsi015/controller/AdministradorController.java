package br.ufu.gsi015.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import br.ufu.gsi015.model.Administrador;
import br.ufu.gsi015.service.AdministradorService;

import jakarta.validation.Valid;

@RestController
@RequestMapping("/api/administrators")
public class AdministradorController {
    private final AdministradorService service;

    public AdministradorController(AdministradorService service) {
        this.service = service;
    }

    @GetMapping
    public ResponseEntity<Iterable<Administrador>> allAdministrators() {
        return new ResponseEntity<>(service.getAllAdministradores(), HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Administrador> oneAdministrator(@PathVariable Long id) {
        return new ResponseEntity<>(service.getAdministradorById(id), HttpStatus.OK);
    }

    @PostMapping
    public ResponseEntity<Administrador> newAdministrator(@Valid @RequestBody Administrador newEntity) {
        return new ResponseEntity<>(service.createAdministrador(newEntity), HttpStatus.CREATED);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Administrador> updateAdministrator(@Valid @PathVariable Long id,
            @RequestBody Administrador newEntity) {
        return new ResponseEntity<>(service.updateAdministrador(id, newEntity), HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<String> deleteAdministrador(@Valid @PathVariable Long id) {
        return new ResponseEntity<String>(service.deleteAdministrador(id), HttpStatus.OK);
    }
}
