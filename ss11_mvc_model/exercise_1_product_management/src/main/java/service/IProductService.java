package service;

import model.Product;

import java.util.List;
import java.util.Map;

public interface IProductService {
    List<Product> getListProduct();

    Map<String, String> save(Product product);

    Product findProductById(int id);

    void remove(int id);

    void update(int id, Product product);

    List<Product> getSearchList(String search_input);
}
