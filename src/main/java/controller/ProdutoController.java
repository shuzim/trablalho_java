package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Bdo;
import service.ProdutoService;
import com.google.gson.Gson;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/api/produtos")
public class ProdutoController extends HttpServlet {
    private ProdutoService produtoService = new ProdutoService();
    private Gson gson = new Gson();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Obter lista de produtos do banco de dados
            List<Bdo> produtos = produtoService.listarTodosProdutos();

            // Configurar resposta
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.setStatus(HttpServletResponse.SC_OK);

            // Converter para JSON e enviar resposta
            String produtosJson = gson.toJson(produtos);
            PrintWriter out = response.getWriter();
            out.print(produtosJson);
            out.flush();
        } catch (Exception e) {
            // Tratamento de erro
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().print("{\"error\":\"Erro ao buscar produtos\"}");
            e.printStackTrace();
        }
    }
}