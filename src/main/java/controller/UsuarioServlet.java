package controller;

import model.Bdo;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/listarProdutos") // Mapeie o servlet para um URL
public class UsuarioServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtenha a lista de produtos da classe Consulta
        List<Bdo> produtos = Consulta.getClientes();

        // Armazene a lista como um atributo de requisição
        request.setAttribute("produtos", produtos);

        // Encaminhe a requisição para o index.jsp
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}