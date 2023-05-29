package br.ufu.gsi015.controller.exceptions;

public class CustomInternalErrorException extends RuntimeException {
    public CustomInternalErrorException(String message) {
        super(message);
    }
}
