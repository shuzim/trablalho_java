package service;

import model.Bdo;
import repository.ProdutoRepository;
import java.util.List;

public class ProdutoService {
    private ProdutoRepository repository = new ProdutoRepository();

    public List<Bdo> listarTodosProdutos() {
        return repository.listarTodos();
    }
}