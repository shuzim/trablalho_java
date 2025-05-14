package repository;

import controller.Consulta;
import model.Bdo;
import java.util.List;

public class ProdutoRepository {

    public List<Bdo> listarTodos() {
        return Consulta.getClientes();
    }
}