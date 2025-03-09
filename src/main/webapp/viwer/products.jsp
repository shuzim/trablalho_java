<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gerenciamento de Café</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        h1, h2 {
            color: #333;
        }
        form {
            margin-bottom: 20px;
        }
        input, textarea {
            display: block;
            margin-bottom: 10px;
            width: 100%;
            max-width: 300px;
            padding: 8px;
        }
        ul {
            list-style-type: none;
            padding: 0;
        }
        li {
            background: #f9f9f9;
            margin-bottom: 10px;
            padding: 10px;
            border: 1px solid #ddd;
        }
    </style>
</head>
<body>
<h1>Gerenciamento de Café</h1>
<h2>Adicionar Novo Item</h2>
<form onsubmit="alert('Item adicionado!'); return false;">
    <label for="title">Título:</label>
    <input type="text" id="title" name="title" required>

    <label for="imageUrl">URL da Imagem:</label>
    <input type="text" id="imageUrl" name="imageUrl" required>

    <label for="description">Descrição:</label>
    <textarea id="description" name="description" required></textarea>

    <label for="price">Preço (R$):</label>
    <input type="text" id="price" name="price" required>

    <button type="submit">+ Adicionar Item</button>
</form>

<h2>Itens do Cardápio</h2>
<ul>
    <li>
        <strong>Café Espresso</strong><br>
        Café puro e forte, preparado na hora<br>
        R$ 5,90
    </li>
    <li>
        <strong>Cappuccino</strong><br>
        Café com leite vaporizado e espuma cremosa<br>
        R$ 8,90
    </li>
</ul>
</body>
</html>