package service.impl;

import model.Customer;
import repository.ICustomerRepository;
import repository.impl.CustomerRepositoryImpl;
import service.ICrudServices;
import service.ICustomerService;

import java.util.List;

public class CustomerServiceImpl implements ICustomerService {
    ICustomerRepository customerRepository = new CustomerRepositoryImpl();
    @Override
    public List<Customer> getList() {
        return customerRepository.getList();
    }

    @Override
    public void add(Customer customer) {
        System.out.println("service");
        customerRepository.add(customer);
    }

    @Override
    public void remove(int idDelete) {
        customerRepository.remove(idDelete);
    }

    @Override
    public void update(Customer customer) {
        customerRepository.update(customer);
    }

    @Override
    public Customer findCustomerById(int id) {
        return customerRepository.findCustomerById(id);
    }
}
