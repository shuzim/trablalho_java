package model;

import com.google.gson.annotations.SerializedName;
import java.math.BigDecimal;

public class PedidoItem {

    @SerializedName("nome")  // Mapeia "nome" do JSON para produtoNome
    private String produtoNome;

    @SerializedName("descricao")
    private String descricao;

    @SerializedName("preco")
    private BigDecimal preco;

    @SerializedName("img")
    private String imgUrl;

    private int quantidade = 1; // Definir um valor padrão

    public String getProdutoNome() {
        return produtoNome;
    }

    public void setProdutoNome(String produtoNome) {
        this.produtoNome = produtoNome;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public BigDecimal getPreco() {
        return preco;
    }

    public void setPreco(BigDecimal preco) {
        this.preco = preco;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }
}
