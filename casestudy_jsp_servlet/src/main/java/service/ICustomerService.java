package service;

import model.Customer;

import java.util.List;

public interface ICustomerService extends ICrudServices<Customer> {
    Customer findCustomerById(int id);
}
