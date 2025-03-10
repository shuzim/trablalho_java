package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Bdo;

@WebServlet("/cadastroItem")
public class CadastroItemServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String titulo = request.getParameter("titulo");
        String imagem = request.getParameter("imagem");
        String descricao = request.getParameter("descricao");
        String preco = request.getParameter("preco");

        Bdo novoItem = new Bdo(titulo, descricao, preco, imagem);

        boolean inserido = Consulta.inserirCliente(novoItem);

        if (inserido) {
            response.sendRedirect("/trabalho_java");
        } else {
            response.sendRedirect("erro.html");
        }
    }
}