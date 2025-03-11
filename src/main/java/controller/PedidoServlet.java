package controller;


import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import jakarta.servlet.Servlet;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.BufferedReader;
import java.io.IOException;

@WebServlet(urlPatterns = "/salvarPedido")  // Mapeamento da URL
public class PedidoServlet extends HttpServlet {

    // Método que lida com requisições POST
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws  IOException {
        // A lógica do processamento do pedido
        String carrinho = request.getParameter("carrinho"); // Aqui você pega o valor do campo carrinho
        // Exemplo de processamento do pedido:
        response.getWriter().write("Pedido salvo com sucesso! Carrinho: " + carrinho);
    }
}
