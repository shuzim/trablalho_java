package model;

import java.util.ArrayList;
import java.util.List;

public class Carrinho {
    // Lista de itens no carrinho
    private List<Item> itens;

    // Construtor para inicializar a lista de itens
    public Carrinho() {
        this.itens = new ArrayList<>();
    }

    // Método para adicionar um item ao carrinho
    public void adicionarItem(Item item) {
        itens.add(item);
    }

    // Método para listar todos os itens no carrinho
    public List<Item> listarItens() {
        return itens;
    }

    // Classe interna para representar um item
    public static class Item {
        private String nome;
        private String descricao;
        private double preco;

        // Construtor para inicializar um item
        public Item(String nome, String descricao, double preco) {
            this.nome = nome;
            this.descricao = descricao;
            this.preco = preco;
        }

        // Getters e Setters
        public String getNome() {
            return nome;
        }

        public void setNome(String nome) {
            this.nome = nome;
        }

        public String getDescricao() {
            return descricao;
        }

        public void setDescricao(String descricao) {
            this.descricao = descricao;
        }

        public double getPreco() {
            return preco;
        }

        public void setPreco(double preco) {
            this.preco = preco;
        }

        @Override
        public String toString() {
            return "Item{" +
                    "nome='" + nome + '\'' +
                    ", descricao='" + descricao + '\'' +
                    ", preco=" + preco +
                    '}';
        }
    }

    // Exemplo de uso
    public static void main(String[] args) {
        Carrinho carrinho = new Carrinho();

        // Adicionando itens ao carrinho
        carrinho.adicionarItem(new Item("Café", "Café arábico", 15.99));
        carrinho.adicionarItem(new Item("Chá", "Chá verde", 10.50));

        // Listando os itens no carrinho
        List<Item> itensNoCarrinho = carrinho.listarItens();
        for (Item item : itensNoCarrinho) {
            System.out.println(item);
        }
    }
}