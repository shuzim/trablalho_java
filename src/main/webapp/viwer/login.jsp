<!DOCTYPE html>
<html>
<head><title>Login</title></head>
<body>
    <h2>Login</h2>
    <form method="post" action="LoginServlet">
        <input type="text" name="usuario" placeholder="Usuário" required />
        <input type="password" name="senha" placeholder="Senha" required />
        <input type="submit" value="Entrar" />

    </form>
    <p style="color:red">${erro}</p>
</body>
</html>