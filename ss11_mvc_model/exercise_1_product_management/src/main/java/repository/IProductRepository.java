package repository;

import model.Product;

import java.util.List;

public interface IProductRepository extends ICrudRepository<Product> {
    List<Product> getSearchList(String search_input);
}
