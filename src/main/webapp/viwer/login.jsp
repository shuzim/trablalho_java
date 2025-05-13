<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<body>
    <h2>Login</h2>
    <form method="post" action="login"> <!-- Rota do LoginServlet -->
        <input type="text" name="username" placeholder="Usuário" required />
        <br><br>
        <input type="password" name="password" placeholder="Senha" required />
        <br><br>
        <input type="submit" value="Entrar" />
    </form>

    <p style="color:red">${error}</p> <!-- mensagem de erro -->
</body>
</html>
