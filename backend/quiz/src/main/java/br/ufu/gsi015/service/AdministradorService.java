package br.ufu.gsi015.service;

import br.ufu.gsi015.controller.exceptions.CustomConflictException;
import br.ufu.gsi015.controller.exceptions.CustomNotFoundException;
import br.ufu.gsi015.model.Administrador;
import br.ufu.gsi015.repository.AdministradorRepository;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class AdministradorService {
    private final AdministradorRepository repository;

    public AdministradorService(AdministradorRepository repository) {
        this.repository = repository;
    }

    public Optional<Administrador> getAdministradorById(Long id) {
        return repository.findById(id);
    }

    public Iterable<Administrador> getAllAdministradores() {
        return repository.findAll();
    }

    public Optional<Administrador> getAdministradorByEmail(String email) {
        return repository.findByEmail(email);
    }

    public Administrador saveAdministrador(Administrador newEntity) {
        Optional<Administrador> existingUser = getAdministradorByEmail(newEntity.getEmail());
        if (existingUser.isPresent()) {
            throw new CustomConflictException("User with this email already exists");
        }
        return repository.save(newEntity);
    }

    public Administrador updateAdministrador(Long id, Administrador newEntity) {
        Optional<Administrador> existingUser = getAdministradorById(id);
        if (existingUser.isPresent()) {
            Administrador updatedUser = existingUser.get();
            updatedUser.setName(newEntity.getName() != null ? newEntity.getName() : updatedUser.getName());
            updatedUser.setEmail(newEntity.getEmail() != null ? newEntity.getEmail() : updatedUser.getEmail());
            return repository.save(updatedUser);
        }
        throw new CustomNotFoundException("User not found");
    }

    public String deleteAdministrador(Long id){
        Optional<Administrador> existingUser = getAdministradorById(id);
        if (existingUser.isPresent()) {
            Administrador user = existingUser.get();
            repository.delete(user);
            return "OK";
        }
        throw new CustomNotFoundException("User not found");
    }
}
