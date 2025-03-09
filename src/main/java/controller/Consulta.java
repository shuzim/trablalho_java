    package controller;

    import model.Bdo;

    import java.sql.*;

    public class Consulta {
        private static final String URL = "jdbc:postgresql://localhost:5432/trabalho_java";  // URL do banco
        private static final String USER = "postgres";    // Usuário do banco
        private static final String PASSWORD = "123";


        // Conexão com o banco de dados
        public static void getClientes() {

            try (
        Connection connection = DriverManager.getConnection(URL, USER, PASSWORD)) {
            // Criando a consulta SQL
            String sql = "SELECT * FROM clientes";  // Exemplo de consulta

            // Executando a consulta
            try (Statement stmt = connection.createStatement();
                 ResultSet rs = stmt.executeQuery(sql)) {

                // Processando os resultados
                while (rs.next()) {
                    String titulo = rs.getString("titulo");            // Supondo que 'id' seja uma coluna na tabela
                    String descricao = rs.getString("descricao");  // Supondo que 'nome' seja uma coluna
                    String preco = rs.getString("preco"); // Supondo que 'email' seja uma coluna
                    String img = rs.getString("img");

                    Bdo bdo = new Bdo(titulo, descricao, preco, img);
                }
            }

        } catch (
        SQLException e) {
            System.out.println("Erro de conexão com o banco de dados: " + e.getMessage());
        }
        }
    }
