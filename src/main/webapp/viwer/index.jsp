<%@ page import="java.util.List" %>
<%@ page import="model.Bdo" %>
<%@ page import="controller.Consulta" %>
<%@ page import="model.Carrinho" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <title>Descubra o Melhor Café</title>
<script>
    function finalizar_pedido() {
        const valor = localStorage.getItem('carrinho');

        fetch('/trabalho_java/salvarPedido', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ carrinho: valor }) // Envia JSON para o backend
        })
        .then(response => response.text())
        .then(data => console.log('Pedido finalizado:', data))
        .catch(error => console.error('Erro ao finalizar:', error));
    }

    function adicionarAoCarrinho(nome, descricao, preco, img) {
        let carrinho = JSON.parse(sessionStorage.getItem('carrinho')) || [];

        carrinho.push({ nome, descricao, preco, img });

        sessionStorage.setItem('carrinho', JSON.stringify(carrinho));

        atualizarCarrinho();
    }

    function removerDoCarrinho(index) {
        let carrinho = JSON.parse(sessionStorage.getItem('carrinho')) || [];

        if (index >= 0 && index < carrinho.length) {
            carrinho.splice(index, 1);
            sessionStorage.setItem('carrinho', JSON.stringify(carrinho));
            atualizarCarrinho();
        }
    }

    function atualizarCarrinho() {
        let carrinho = JSON.parse(sessionStorage.getItem('carrinho')) || [];

        let cartDropdown = document.getElementById('cartDropdown');

        cartDropdown.innerHTML = '';

        if (carrinho.length > 0) {
            carrinho.forEach((item, index) => {

                let cartItem = document.createElement('div');
                cartItem.className = 'cart-item';

                let span = document.createElement('span');

                let strong = document.createElement('strong');
                strong.innerText = item.nome;

                let price = document.createElement('strong');
                price.innerText = item.preco;

                let text = document.createTextNode(` - R$ `);

                span.appendChild(strong);
                span.appendChild(text);
                span.appendChild(price);

                cartItem.appendChild(span);

                let removeButton = document.createElement('button');
                removeButton.innerText = 'Remover';
                removeButton.onclick = function() {
                    removerDoCarrinho(index);
                };
                cartItem.appendChild(removeButton);

                cartDropdown.appendChild(cartItem);
            });

            let total = carrinho.reduce((total, item) => {
                let precoFormatado = item.preco.replace(',', '.');
                return total + parseFloat(precoFormatado);
            }, 0).toFixed(2);

            let finalButton = document.createElement('button');
            finalButton.className = 'final-button';
            finalButton.innerText = `Total: R$ ${total}`;
            cartDropdown.appendChild(finalButton);
        } else {
            cartDropdown.innerHTML = '<p>Nenhum item no carrinho.</p>';
        }
    }

    window.onload = function() {
        atualizarCarrinho();
    };
</script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            margin: 0;
        }

        header {
            background-color: #6f4e37;
            color: white;
            padding: 20px;
            text-align: center;
        }

        .container {
            padding: 0 4rem 2rem 4rem;
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 10px;
        }

        .container-text {
            color: #6f4e37;
            padding: 0 4rem;
        }

        .coffee-item {
            overflow: hidden;
            background-color: white;
            margin-bottom: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .coffee-item h3 {
            margin: 0;
            color: #6f4e37;
            font-weight: bold;
        }

        .coffee-item p {
            margin: 10px 0;
            display: -webkit-box;
            -webkit-line-clamp: 1;
            -webkit-box-orient: vertical;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .price {
            font-weight: bold;
            color: #333;
        }

        .add-button {
            background-color: #6f4e37;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }

        .final-button {
            background-color: #6f4e37;
            color: white;
            border: none;
            width: 100%;
            padding: .5rem 0;
            margin: .5rem 0;
            border-radius: 5px;
            cursor: pointer;
        }

        .add-button:hover {
            background-color: #6f4e50;
            padding: 10px 30px;
            transition: padding .5s;
        }

        .container-price {
            display: flex;
            justify-content: space-between;
        }

        .container-item {
            padding: 1rem;
        }

        footer {
            background-color: #6f4e37;
            color: white;
            text-align: center;
            padding: 10px;
            bottom: 0;
        }

        img {
            width: 100%;
            height: 12rem;
            object-fit: cover
        }

        .menu {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px 4rem;
            background-color: #fff;
            border-bottom: 2px solid #ddd;
        }

        .menu .logo {
            display: flex;
            align-items: center;
            font-size: 18px;
            color: #6f4e37;
            font-weight: bold;
        }

        .cadastrar {
            grid-column: 2;
            right: 0;
            cursor: pointer;

        }

        .menu .logo i {
            margin-right: 8px;
        }

        .menu .cart {
            position: relative;
            font-size: 20px;
            color: #6f4e37;
        }

        .menu .cart .badge {
            position: absolute;
            top: -5px;
            right: -10px;
            background-color: red;
            color: white;
            font-size: 12px;
            border-radius: 50%;
            width: 18px;
            height: 18px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .menu .cart {
            position: relative;
            font-size: 20px;
            color: #6f4e37;
        }

        .menu .cart i {
            cursor: pointer;
        }

        .menu .cart .badge {
            position: absolute;
            top: -5px;
            right: -10px;
            background-color: red;
            color: white;
            font-size: 12px;
            border-radius: 50%;
            width: 18px;
            height: 18px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .cart-dropdown {
            display: none;
            position: absolute;
            right: 0;
            top: 40px;
            background: white;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            border-radius: 5px;
            width: 250px;
            padding: 10px;
            z-index: 1000;
        }

        .cart-item {
            display: flex;
            justify-content: space-between;
            padding: 5px 0;
            border-bottom: 1px solid #ddd;
        }

        .cart-item:last-child {
            border-bottom: none;
        }
    </style>
</head>

<body>
<div class="menu">
    <a href="add">
        <button class="cadastrar"> Cadastrar</button>
        <button onclick="finalizar_pedido()">Finalizar</button>
    </a>

    <div class="logo">
        <i class="fas fa-coffee"></i>
        Café Express
    </div>

    <div class="cart">

        <div onclick="toggleCartDropdown()">
            <i class="fas fa-shopping-cart"></i>
            <span class="badge">3</span>
        </div>

        <div class="cart-dropdown" id="cartDropdown">
            <button class="" onclick="finalizar_pedido()"></button>
        </div>
    </div>
</div>
<header>
    <h1>Descubra o Melhor Café</h1>
    <p>Seleção especial de cafés premium para seu prazer diário</p>
</header>

<h3 class="container-text">Nossos cafés</h3>
<div class="container">

    <%
        List<Bdo> produtos = Consulta.getClientes();
        if (produtos.isEmpty()) {
    %>
    <p>Nenhum produto encontrado.</p>
    <%
    } else {
    %>

    <% for (Bdo produto : produtos) { %>
    <div class="coffee-item">
        <img
                src="<%= produto.getImg() %>"/>
        <div class="container-item">
            <h3><%= produto.getTitulo() %>
            </h3>
            <p><%= produto.getDescricao() %>
            </p>
            <div class="container-price">
                <p class="price">R$ <%= produto.getPreco() %>
                </p>
                <button type="button" class="add-button" onclick="adicionarAoCarrinho('<%= produto.getTitulo() %>', '<%= produto.getDescricao() %>', '<%= produto.getPreco() %>', '<%= produto.getImg() %>')">+ Adicionar</button>
            </div>
        </div>
    </div>
    <% } %>
    <% } %>
</div>

<footer>
    <p>© 2025 Café Express. Todos os direitos reservados.</p>
</footer>
<script>
    document.addEventListener("click", function (event) {
        var dropdown = document.getElementById("cartDropdown");
        var cartIcon = document.querySelector(".cart div");

        if (!dropdown.contains(event.target) && !cartIcon.contains(event.target)) {
            dropdown.style.display = "none";
        }
    });

    function toggleCartDropdown() {
        var dropdown = document.getElementById("cartDropdown");
        if (dropdown.style.display === "block") {
            dropdown.style.display = "none";
        } else {
            dropdown.style.display = "block";
        }
    }

</script>
</body>

</html>