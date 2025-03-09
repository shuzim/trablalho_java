<%@ page import="java.util.List" %>
<%@ page import="model.Bdo" %>
<%@ page import="controller.Consulta" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lista de Produtos</title>
</head>
<body>
<h1>Lista de Produtos</h1>

<%
    List<Bdo> produtos = Consulta.getClientes();
    if (produtos.isEmpty()) {
%>
<p>Nenhum produto encontrado.</p>
<%
} else {
%>
<table border="1">
    <thead>
    <tr>
        <th>Título</th>
        <th>Descrição</th>
        <th>Preço</th>
        <th>Imagem</th>
    </tr>
    </thead>
    <tbody>
    <% for (Bdo produto : produtos) { %>
    <tr>
        <td><%= produto.getTitulo() %></td>
        <td><%= produto.getDescricao() %></td>
        <td><%= produto.getPreco() %></td>
        <td><img src="<%= produto.getImg() %>" alt="Imagem do Produto" width="100"></td>
    </tr>
    <% } %>
    </tbody>
</table>
<% } %>

</body>
</html>