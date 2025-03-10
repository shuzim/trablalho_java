package controller;

import model.Bdo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Consulta {
    private static final String URL = "jdbc:postgresql://192.168.20.21:5432/coffee";
    private static final String USER = "postgres";
    private static final String PASSWORD = "root";

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
}