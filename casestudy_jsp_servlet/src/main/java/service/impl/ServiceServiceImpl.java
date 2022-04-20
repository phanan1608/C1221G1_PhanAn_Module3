package service.impl;

import model.Service;
import repository.IServiceRepository;
import repository.impl.ServiceRepositoryImpl;
import service.IServiceService;

import java.util.List;

public class ServiceServiceImpl implements IServiceService {
    IServiceRepository serviceRepository = new ServiceRepositoryImpl();
    @Override
    public List<Service> getList() {
        return serviceRepository.getList();
    }

    @Override
    public void add(Service service) {
        serviceRepository.add(service);
    }

    @Override
    public void remove(int idDelete) {

    }

    @Override
    public void update(Service service) {

    }
}
