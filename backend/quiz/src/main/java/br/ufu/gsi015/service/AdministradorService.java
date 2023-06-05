package br.ufu.gsi015.service;

import br.ufu.gsi015.controller.exceptions.CustomConflictException;
import br.ufu.gsi015.controller.exceptions.CustomInternalErrorException;
import br.ufu.gsi015.controller.exceptions.CustomNotFoundException;
import br.ufu.gsi015.model.Administrador;
import br.ufu.gsi015.repository.AdministradorRepository;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class AdministradorService {
    private final AdministradorRepository repository;

    public AdministradorService(AdministradorRepository repository) {
        try {
            this.repository = repository;
        } catch (Exception e) {
            throw new CustomInternalErrorException(e.getMessage());
        }
    }

    public Administrador getAdministradorById(Long id) {
        try {
            Optional<Administrador> existingAdmin = repository.findById(id);
            if (existingAdmin.isPresent()) {
                return existingAdmin.get();
            }
            throw new CustomNotFoundException("Admin not found");
        } catch (Exception e) {
            throw new CustomInternalErrorException(e.getMessage());
        }
    }

    public Iterable<Administrador> getAllAdministradores() {
        try {
            return repository.findAll();
        } catch (Exception e) {
            throw new CustomInternalErrorException(e.getMessage());
        }
    }

    public Administrador createAdministrador(Administrador newEntity) {
        try {
            Optional<Administrador> existingAdmin = repository.findByName(newEntity.getName());
            if (existingAdmin.isPresent()) {
                throw new CustomConflictException("Admin already exists");
            }
            return repository.save(newEntity);
        } catch (Exception e) {
            throw new CustomInternalErrorException(e.getMessage());
        }
    }

    public Administrador updateAdministrador(Long id, Administrador newEntity) {
        try {
            Administrador existingUser = getAdministradorById(id);
            if (newEntity.getName() != null) {
                existingUser.setName(newEntity.getName());
            }
            if (newEntity.getEmail() != null) {
                existingUser.setEmail(newEntity.getEmail());
            }

            return repository.save(existingUser);

        } catch (Exception e) {
            throw new CustomInternalErrorException(e.getMessage());
        }
    }

    public String deleteAdministrador(Long id) {
        try {
            Administrador existingUser = getAdministradorById(id);
            repository.delete(existingUser);
            return "OK";
        } catch (Exception e) {
            throw new CustomInternalErrorException(e.getMessage());
        }
    }
}
