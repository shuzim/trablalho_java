package controller;

import java.io.BufferedReader;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@WebServlet(name = "PedidoServlet", urlPatterns = {"/salvarPedido"})
public class PedidoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        BufferedReader reader = request.getReader();
        String json = reader.readLine();
        JsonObject jsonObject = JsonParser.parseString(json).getAsJsonObject();

        String valorCarrinho = jsonObject.get("carrinho").getAsString();

        response.getWriter().write("Pedido salvo com sucesso!");
    }
}