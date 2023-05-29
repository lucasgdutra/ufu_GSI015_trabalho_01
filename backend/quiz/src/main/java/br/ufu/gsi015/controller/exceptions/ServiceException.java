package br.ufu.gsi015.controller.exceptions;

public class ServiceException extends RuntimeException{
    public ServiceException(String message) {
        super(message);
    }
}
