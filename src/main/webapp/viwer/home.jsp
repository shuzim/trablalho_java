<%@ page session="true" %>
<%
    session.invalidate(); // encerra a sessão do usuário
    String usuario = (String) session.getAttribute("usuario");
%>
<!DOCTYPE html>
<html>
<head><title>Painel</title></head>
<body>
    <h2>Bem-vindo, <%= usuario %>!</h2>
    <a href="LogoutServlet">Sair</a>

     <style>
            body {
                margin: 0;
                padding: 0;
                font-family: 'Segoe UI', sans-serif;
                background-color: #f4e8dc;
                background-image: url('../images/coffee-pattern.png'); /* opcional */
                background-size: cover;
                background-position: center;
                height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .logout-box {
                background-color: #fffaf5;
                border: 1px solid #d3c0b0;
                padding: 40px;
                border-radius: 10px;
                box-shadow: 0 0 15px rgba(0,0,0,0.1);
                text-align: center;
                width: 320px;
            }

            h2 {
                color: #5e3b2c;
                margin-bottom: 20px;
            }

            p {
                color: #6d4b3e;
                font-size: 16px;
                margin-bottom: 25px;
            }

            a {
                text-decoration: none;
                background-color: #a9744f;
                color: white;
                padding: 10px 25px;
                border-radius: 5px;
                font-weight: bold;
                transition: background-color 0.3s ease;
            }

            a:hover {
                background-color: #8b5e3c;
            }
        </style>
</body>
</html>