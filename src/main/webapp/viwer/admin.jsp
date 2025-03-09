<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gerenciamento de Pedidos</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #333;
        }
        .order {
            margin-bottom: 15px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
        .order h3 {
            margin: 0;
            color: #555;
        }
        .order p {
            margin: 5px 0;
            color: #777;
        }
        .actions {
            margin-top: 10px;
        }
        .actions button {
            margin-right: 10px;
            padding: 5px 10px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
        .actions button.accept {
            background-color: #28a745;
            color: #fff;
        }
        .actions button.reject {
            background-color: #dc3545;
            color: #fff;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Gerenciamento de Pedidos</h1>
    <h2>Sistema de Café</h2>

    <div class="order">
        <h3>Pedido #001</h3>
        <p>Café Latte</p>
        <p>Capulcchio</p>
        <div class="actions">
            <button class="accept">Aceitar</button>
            <button class="reject">Recusar</button>
        </div>
    </div>

    <div class="order">
        <h3>Pedido #002</h3>
        <p>Café Latte</p>
        <p>Espresso</p>
        <div class="actions">
            <button class="accept">Aceitar</button>
            <button class="reject">Recusar</button>
        </div>
    </div>

    <div class="order">
        <h3>Pedido #003</h3>
        <p>Espresso</p>
        <p>Capulcchio</p>
        <div class="actions">
            <button class="accept">Aceitar</button>
            <button class="reject">Recusar</button>
        </div>
    </div>
</div>
</body>
</html>