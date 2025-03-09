package controller;

import model.Bdo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Consulta {
    private static final String URL = "jdbc:postgres://localhost:5432/catalogo";  // URL do banco
    private static final String USER = "postgres";    // Usuário do banco
    private static final String PASSWORD = "iguano";

    // Conexão com o banco de dados
    public static List<Bdo> getClientes() {
        List<Bdo> clientes = new ArrayList<>();

        try {
            // Carregar o driver manualmente
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            System.out.println("Driver do PostgreSQL não encontrado: " + e.getMessage());
            return clientes;
        }

        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD)) {
            // Criando a consulta SQL
            String sql = "SELECT * FROM produtos";  // Exemplo de consulta

            // Executando a consulta
            try (Statement stmt = connection.createStatement();
                 ResultSet rs = stmt.executeQuery(sql)) {

                // Processando os resultados
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
}