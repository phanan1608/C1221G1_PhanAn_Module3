package repository;

import model.Customer;

import java.util.List;

public interface ICustomerRepository extends ICrudRepository<Customer> {
    Customer findCustomerById(int id);

    List<Customer> searchByName(String keyword);
}
