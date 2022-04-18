package service.impl;

import model.CustomerType;
import repository.ICustomerTypeRepository;
import repository.impl.CustomerTypRepositoryImpl;
import service.ICustomerTypeService;

import java.util.List;

public class CustomerTypeServiceImpl implements ICustomerTypeService {
    ICustomerTypeRepository customerTypeRepository = new CustomerTypRepositoryImpl();
    @Override
    public List<CustomerType> getList() {
        return customerTypeRepository.getList();
    }
}
