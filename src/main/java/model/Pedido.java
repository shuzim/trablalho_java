package model;

import java.math.BigDecimal;
import java.util.List;

public class Pedido {
    private BigDecimal total;
    private List<PedidoItem> itens;
    private int id;  // Adicione o campo id

    public int getId() {
        return id;
    }
    public BigDecimal getTotal() {
        return total;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
    }

    public List<PedidoItem> getItens() {
        return itens;
    }

    public void setItens(List<PedidoItem> itens) {
        this.itens = itens;
    }

    public void setId(int id) {
        this.id = id;
    }
}
