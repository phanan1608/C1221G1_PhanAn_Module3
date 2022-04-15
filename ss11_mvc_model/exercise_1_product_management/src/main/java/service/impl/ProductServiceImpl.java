package service.impl;

import model.Product;
import repository.IProductRepository;
import repository.impl.ProductRepositoryImpl;
import service.IProductService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductServiceImpl implements IProductService {
    private IProductRepository iProductRepository = new ProductRepositoryImpl();


    @Override
    public List<Product> getListProduct() {
        List<Product> productList = iProductRepository.getList();
        return productList;
    }

    @Override
    public Map<String, String> save(Product product) {
        Map<String, String> map = new HashMap<>();
        if (product.getNameProduct().equals("")) {
            map.put("nameProduct", "Cannot be blank");
        } else if (product.getNameProduct().matches("^(/w+)+$")) {
            map.put("nameProdut", "Invalid Name Product");
        }
        if (product.getDescription().equals("")) {
            map.put("description", "Cannot be blank");
        }
        if (map.isEmpty()) {
            iProductRepository.save(product);
        }
        return map;
    }

    @Override
    public Product findProductById(int id) {
        Product product = iProductRepository.findById(id);
        return product;
    }

    @Override
    public void remove(int id) {
        iProductRepository.remove(id);

    }

    @Override
    public void update(int id, Product product) {
        iProductRepository.update(id,product);
    }

    @Override
    public List<Product> getSearchList(String search_input) {
        System.out.println("service");
        List<Product> searchList = iProductRepository.getSearchList(search_input);
        return searchList;
    }


}
