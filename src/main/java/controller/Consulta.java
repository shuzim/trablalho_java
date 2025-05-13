package controller;

import model.Bdo;
import model.Pedido;
import model.PedidoItem;
import model.Usuario;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class Consulta {
    private static final String URL = "jdbc:postgresql://pg-206e7f6f-marcost-138d.h.aivencloud.com:11596/defaultdb";
    private static final String USER = "avnadmin";
    private static final String PASSWORD = "AVNS_AF47f3MnbYH9nz6Beev";


    public static List<Bdo> getClientes() {
        List<Bdo> clientes = new ArrayList<>();

        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            System.out.println("Driver do PostgreSQL não encontrado: " + e.getMessage());
            return clientes;
        }

        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD)) {

            String sql = "SELECT * FROM produtos";


            try (Statement stmt = connection.createStatement();
                 ResultSet rs = stmt.executeQuery(sql)) {


                while (rs.next()) {
                    String titulo = rs.getString("nome");
                    String descricao = rs.getString("descricao");
                    String preco = rs.getString("preco");
                    String img = rs.getString("img");

                    Bdo bdo = new Bdo(titulo, descricao, preco, img);
                    clientes.add(bdo);
                }
            }

        } catch (SQLException e) {
            System.out.println("Erro de conexão com o banco de dados: " + e.getMessage());
        }

        return clientes;
    }
    public static boolean inserirCliente(Bdo cliente) {
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            System.out.println("Driver do PostgreSQL não encontrado: " + e.getMessage());
            return false;
        }

        String sql = "INSERT INTO produtos (nome, descricao, preco, img) VALUES (?, ?, ?, ?)";

        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            // Define os parâmetros da query
            pstmt.setString(1, cliente.getTitulo());
            pstmt.setString(2, cliente.getDescricao());
            pstmt.setString(3, cliente.getPreco());
            pstmt.setString(4, cliente.getImg());

            // Executa a query
            int rowsAffected = pstmt.executeUpdate();

            // Verifica se a inserção foi bem-sucedida
            if (rowsAffected > 0) {
                System.out.println("Cliente inserido com sucesso!");
                return true;
            } else {
                System.out.println("Nenhum cliente foi inserido.");
                return false;
            }

        } catch (SQLException e) {
            System.out.println("Erro de conexão com o banco de dados: " + e.getMessage());
            return false;
        }
    }
    public static boolean inserirPedido(Pedido pedido) {
        String sqlPedido = "INSERT INTO pedidos (total) VALUES (?) RETURNING id";
        String sqlItem = "INSERT INTO pedidos_itens (pedido_id, produto_nome, descricao, preco, quantidade, img_url) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement pstmtPedido = connection.prepareStatement(sqlPedido);
             PreparedStatement pstmtItem = connection.prepareStatement(sqlItem)) {

            connection.setAutoCommit(false); // Inicia a transação

            // Inserindo pedido
            pstmtPedido.setBigDecimal(1, pedido.getTotal());
            ResultSet rs = pstmtPedido.executeQuery();
            if (rs.next()) {
                int pedidoId = rs.getInt(1);

                // Inserindo itens do pedido
                for (PedidoItem item : pedido.getItens()) {
                    pstmtItem.setInt(1, pedidoId);
                    pstmtItem.setString(2, item.getProdutoNome());
                    pstmtItem.setString(3, item.getDescricao());
                    pstmtItem.setBigDecimal(4, item.getPreco());
                    pstmtItem.setInt(5, item.getQuantidade());
                    pstmtItem.setString(6, item.getImgUrl());
                    pstmtItem.executeUpdate();
                }

                connection.commit(); // Confirma a transação
                return true;
            } else {
                connection.rollback(); // Reverte caso o pedido não tenha sido inserido
                return false;
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }



    public static List<Pedido> getTodosPedidos() {
        List<Pedido> pedidos = new ArrayList<>();

        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            System.out.println("Driver do PostgreSQL não encontrado: " + e.getMessage());
            return pedidos;
        }

        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD)) {

            String sql = "SELECT id, total FROM pedidos";  // Ajuste para pegar os pedidos

            try (Statement stmt = connection.createStatement();
                 ResultSet rs = stmt.executeQuery(sql)) {

                while (rs.next()) {
                    Pedido pedido = new Pedido();
                    pedido.setId(rs.getInt("id"));
                    pedido.setTotal(rs.getBigDecimal("total"));

                    // Aqui, você pode buscar os itens para cada pedido, por exemplo:
                    List<PedidoItem> itens = getItensPedidoByPedidoId(pedido.getId());
                    pedido.setItens(itens);

                    pedidos.add(pedido);
                }

            }

        } catch (SQLException e) {
            System.out.println("Erro de conexão com o banco de dados: " + e.getMessage());
        }

        return pedidos;
    }

    public static List<PedidoItem> getItensPedidoByPedidoId(int pedidoId) {
        List<PedidoItem> itens = new ArrayList<>();

        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD)) {
            String sql = "SELECT pi.produto_nome, pi.descricao, pi.preco, pi.quantidade, pi.img_url " +
                    "FROM pedidos_itens pi WHERE pi.pedido_id = ?";

            try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
                pstmt.setInt(1, pedidoId);
                try (ResultSet rs = pstmt.executeQuery()) {
                    while (rs.next()) {
                        PedidoItem item = new PedidoItem();
                        item.setProdutoNome(rs.getString("produto_nome"));
                        item.setDescricao(rs.getString("descricao"));
                        item.setPreco(rs.getBigDecimal("preco"));
                        item.setQuantidade(rs.getInt("quantidade"));
                        item.setImgUrl(rs.getString("img_url"));

                        itens.add(item);
                    }
                }
            }

        } catch (SQLException e) {
            System.out.println("Erro de conexão com o banco de dados: " + e.getMessage());
        }

        return itens;
    }

    //parte do usuario e admin

    public static Usuario getUser(String username) {
        Usuario user = null;

        try {
            Class.forName("org.postgresql.Driver"); // carrega o driver JDBC
            Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);

            String sql = "SELECT * FROM user WHERE user = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                user = new Usuario();
                user.setUsername(rs.getString("usuario"));
                user.setPassword(rs.getString("senha"));
                user.setRole(rs.getString("role"));
            }

            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            System.err.println("Erro ao consultar usuário no banco:");
            e.printStackTrace(); // Para depuração
        }
        return user;
    }

}