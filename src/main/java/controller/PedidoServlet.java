package controller;

import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Pedido;
import model.PedidoItem;

import java.io.BufferedReader;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.List;
import java.math.BigDecimal;

@WebServlet(urlPatterns = "/salvarPedido")
public class PedidoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Pegando o parâmetro carrinho e decodificando
        String carrinho = request.getParameter("carrinho");
        String decodedCarrinho = URLDecoder.decode(carrinho, StandardCharsets.UTF_8);

        System.out.println("JSON decodificado: " + decodedCarrinho); // Log para verificar o JSON decodificado

        Gson gson = new Gson();
        PedidoItem[] itensArray;

        try {
            // Converte diretamente o JSON para um array de PedidoItem
            itensArray = gson.fromJson(decodedCarrinho, PedidoItem[].class);
        } catch (JsonSyntaxException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("Erro: JSON mal formatado!");
            System.out.println("Erro ao converter JSON: " + e.getMessage());
            return;
        }

        // Converter array para lista
        List<PedidoItem> itens = Arrays.asList(itensArray);

        // Calcular o total do pedido
        BigDecimal total = itens.stream()
                .map(item -> item.getPreco().multiply(BigDecimal.valueOf(item.getQuantidade())))
                .reduce(BigDecimal.ZERO, BigDecimal::add);

        // Criar objeto Pedido
        Pedido pedido = new Pedido();
        pedido.setItens(itens);
        pedido.setTotal(total);

        // Inserir pedido no banco
        boolean sucesso = Consulta.inserirPedido(pedido);

        if (sucesso) {
            response.setStatus(HttpServletResponse.SC_OK);
            response.getWriter().write("Pedido salvo com sucesso!");
        } else {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Erro ao salvar pedido.");
        }
    }
}
