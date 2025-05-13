<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<body>
    <div class="container">
    <h2>Login</h2>
    <form method="post" action="login"> <!-- Rota do LoginServlet -->
        <input type="text" name="username" placeholder="Usuário" required />
        <br><br>
        <input type="password" name="password" placeholder="Senha" required />
        <br><br>
        <input type="submit" value="Entrar" />
</div>
    <p style="color:red">${error}</p> <!-- mensagem de erro -->



 <style>
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4e8dc;
            background-image: url('../images/coffee-pattern.png'); /* opcional */
            background-size: cover;
            background-position: center;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .container h2 {
            margin-bottom: 20px;
            color: #5e3b2c;
            font-size: 28px;
        }

        form {
            background-color: #fffaf5;
            border: 1px solid #d3c0b0;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
            width: 300px;
            text-align: center;
        }

        input[type="text"],
        input[type="password"] {
            width: 90%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #cbb5a3;
            border-radius: 5px;
            background-color: #fff7f0;
            font-size: 14px;
        }

        input[type="submit"] {
            width: 95%;
            padding: 10px;
            background-color: #a9744f;
            border: none;
            color: white;
            font-weight: bold;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #8b5e3c;
        }

        p {
            margin-top: 10px;
            color: #a94442;
            font-size: 14px;
        }
    </style>
    </form>


</body>
</html>
