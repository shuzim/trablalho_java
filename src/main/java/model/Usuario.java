package model;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class Usuario {
    String nome;
    String itenscarrinho;

    public Usuario(String nome, String itenscarrinho) {
        this.nome =  nome;
        this.itenscarrinho = itenscarrinho;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getItenscarrinho() {
        return itenscarrinho;
    }

    public void setItenscarrinho(String itenscarrinho) {
        this.itenscarrinho = itenscarrinho;
    }
}
