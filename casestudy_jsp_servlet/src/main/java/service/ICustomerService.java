package service;

import model.Customer;

import java.util.List;
import java.util.Map;

public interface ICustomerService extends ICrudServices<Customer> {
    Customer findCustomerById(int id);

    List<Customer> searchByName(String keyword);
    Map<String,String> addCustomer(Customer customer);
}
