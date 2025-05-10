<%@ page session="true" %>
<%
    String usuario = (String) session.getAttribute("usuario");
%>
<!DOCTYPE html>
<html>
<head><title>Painel</title></head>
<body>
    <h2>Bem-vindo, <%= usuario %>!</h2>
    <a href="LogoutServlet">Sair</a>
</body>
</html>