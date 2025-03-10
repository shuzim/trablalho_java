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
    <a href="viwer/products.jsp">
        <button class="cadastrar"> Cadastrar</button>
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
            <%
                Carrinho cart = new Carrinho();


                cart.adicionarItem(new Carrinho.Item("Café", "Café arábico", 15.99));
                cart.adicionarItem(new Carrinho.Item("Chá", "Chá verde", 10.50));

                List<Carrinho.Item> itens = cart.listarItens();

                if (itens != null && !itens.isEmpty()) {
                    for (Carrinho.Item item : itens) {
            %>
            <div class="cart-item">
                <span><strong><%= item.getNome() %></strong> - <%= item.getDescricao() %> - R$ <%= item.getPreco() %></span>
            </div>
            <%
                }
            } else {
            %>
            <p>Nenhum item no carrinho.</p>
            <%
                }
            %>
            <button class="final-button">Finalizar - R$ 24,70</button>
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
    function adicionarAoCarrinho(titulo, descricao, preco, img) {
        console.log(titulo, descricao, preco, img)
        fetch('/trabalho_java/adicionarCarrinho', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json', // Certifique-se de que o conteúdo é JSON
            },
            body: JSON.stringify({
                titulo: titulo,
                descricao: descricao,
                preco: preco,
                img: img
            })
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Erro na requisição: ' + response.statusText);
                }
                return response.json(); // Espera uma resposta JSON
            })
            .then(data => {
                if (data.success) {
                    alert('Produto adicionado ao carrinho!');
                } else {
                    alert('Erro ao adicionar o produto.');
                }
            })
            .catch(error => {
                console.error('Erro:', error);
                alert('Erro ao adicionar o produto. Verifique o console para mais detalhes.');
            });
    }


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