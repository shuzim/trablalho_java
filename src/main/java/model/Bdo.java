package model;

public class Bdo {
    private String titulo;
    private String descricao;
    private String preco;
    private String img;

    public Bdo(String titulo, String descricao, String preco, String img) {
        this.titulo = titulo;
        this.descricao = descricao;
        this.preco = preco;
        this.img = img;
    }

    public Bdo() {

    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getPreco() {
        return preco;
    }

    public void setPreco(String preco) {
        this.preco = preco;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }
}
