package repository.impl;

import model.Product;
import repository.IProductRepository;

import java.util.ArrayList;
import java.util.List;

public class ProductRepositoryImpl implements IProductRepository {
    private static List<Product> productList = new ArrayList<>();
    static {
        productList.add(new Product(0,"Iphone13",1000.0,"Full box"));
        productList.add(new Product(1,"Iphone14",1200.0,"Full box"));
        productList.add(new Product(2,"Iphone15",1400.0,"Full box"));
        productList.add(new Product(3,"Iphone16",1500.0,"Coming Soon"));
    }


    @Override
    public List<Product> getList() {
        return productList;
    }

    @Override
    public void save(Product product) {
        productList.add(product);
    }

    @Override
    public Product findById(int id) {
        return getList().stream().filter(c -> c.getId() == id).findFirst().orElse(null);
//        Product product =null;
//        try {
//            product=productList.get(id);
//        }catch (IndexOutOfBoundsException e){
//            e.printStackTrace();
//        } finally {
//
//        }
//        return product;
    }

    @Override
    public void remove(int id) {
        productList.remove(id);
    }

    @Override
    public void update(int id, Product product) {
        productList.set(id, product);
    }


    @Override
    public List<Product> getSearchList(String search_input) {
        System.out.println("repo");
        List<Product> searchList = new ArrayList<>();
        for (Product product:productList) {
            if (product.getNameProduct().toLowerCase().equals(search_input.toLowerCase())){
                searchList.add(product);
            }
        }
        return searchList;
    }
}
