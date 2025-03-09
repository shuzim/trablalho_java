package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Usuario;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class UsuarioServelant extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<String> carrinho= new ArrayList<>();


        String nome = request.getParameter("nome");
        String itenscarrinho = request.getParameter("carrinho");// provalmente n é esse nome

        Usuario user= new Usuario(nome, itenscarrinho);

        //adicionar itens no carrinho
        carrinho.add(user.getItenscarrinho());





    }


}
