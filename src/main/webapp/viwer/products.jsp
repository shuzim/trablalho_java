<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="controller.Consulta" %>
<%@ page import="model.Bdo" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gerenciamento de Café</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #FFFCF2;
        }
        .container {
            width: 60%;
            margin: auto;
        }
        .card {
            background: white;
            padding: 15px;
            margin-top: 10px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .btn {
            background-color: #D88A34;
            color: white;
            border: none;
            padding: 8px 12px;
            cursor: pointer;
            border-radius: 5px;
        }
        .btn-delete {
            background: none;
            border: none;
            color: red;
            cursor: pointer;
            font-size: 16px;
        }
        img {
            width: 300px;
            height: 300px;
            object-fit: cover;
        }
        .title {
           font-weight: bold;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Gerenciamento de Café</h2>
    <p>Adicione ou remova itens do cardápio</p>

    <div class="card">
        <h3>Adicionar Novo Item</h3>
        <form action="cadastroItem" method="POST">
            <label>Título</label><br>
            <input type="text" name="titulo" style="width: 100%;"><br>

            <label>URL da Imagem</label><br>
            <input type="text" name="imagem" style="width: 100%;"><br>

            <label>Descrição</label><br>
            <textarea name="descricao" style="width: 100%;"></textarea><br>

            <label>Preço (R$)</label><br>
            <input type="text" name="preco"><br><br>

            <button type="submit" class="btn">+ Adicionar Item</button>
        </form>
    </div>

    <div class="card">
        <h3>Itens do Cardápio</h3>
    <%
        List<Bdo> produtos = Consulta.getClientes();
        if (produtos.isEmpty()) {
    %>
    <p>Nenhum produto encontrado.</p>
    <%
    } else {
    %>

    <% for (Bdo produto : produtos) { %>
        <div class="card">
            <img src="<%= produto.getImg() %>">
            <p class="title"><%= produto.getTitulo() %></p>
            <p><%= produto.getDescricao() %></p>
            <p><strong>R$ <%= produto.getPreco() %></strong></p>
            <button class="btn-delete">🗑</button>
        </div>
    <% } %>
    <% } %>
    </div>
</div>
</body>
</html>