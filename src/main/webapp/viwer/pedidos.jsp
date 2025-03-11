<%@ page import="java.util.List" %>
<%@ page import="model.Bdo" %>
<%@ page import="controller.Consulta" %>
<%@ page import="model.Pedido" %>
<%@ page import="model.PedidoItem" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pedidos - Detalhes</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        h1 {
            color: #781704;
        }
        .pedido-container {
            background-color: #FFFCF2;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .pedido {
            margin: 20px 0;
            padding: 15px;
            background-color: #fff;
            border: 1px solid #bdc3c7;
            border-radius: 4px;
        }
        .item {
            margin: 10px 0;
            padding: 10px;
            background-color: #fff;
            border: 1px solid #bdc3c7;
            border-radius: 4px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .actions button {
            margin: 5px;
            padding: 8px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .accept {
            background-color: #27ae60;
            color: white;
        }
        .reject {
            background-color: #e74c3c;
            color: white;
        }
    </style>
</head>
<body>
    <div class="pedido-container">
        <h1>Detalhes dos Pedidos</h1>
        <%
            // Obtém todos os pedidos
            List<Pedido> pedidos = Consulta.getTodosPedidos();

            if (pedidos != null && !pedidos.isEmpty()) {
                for (Pedido pedido : pedidos) {
                    List<PedidoItem> itens = pedido.getItens(); // Obtém os itens do pedido
        %>
            <div class="pedido">
                <h2>Pedido #<%= pedido.getId() %></h2>
                <ul>
                    <%
                        // Exibe os itens de cada pedido
                        for (PedidoItem item : itens) {
                    %>
                        <li class="item">
                            <span><%= item.getProdutoNome() %> - <%= item.getQuantidade() %>x</span>
                        </li>
                    <%
                        }
                    %>
                </ul>
            </div>
        <%
                }
            } else {
        %>
            <p>Nenhum pedido encontrado.</p>
        <% } %>
    </div>
</body>
</html>
