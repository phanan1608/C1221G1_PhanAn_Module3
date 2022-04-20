package service.impl;

import model.RentType;
import model.ServiceType;
import repository.IRentTypeRepository;
import repository.IServiceTypeRepository;
import repository.impl.RentTypeRepositoryImpl;
import repository.impl.ServiceTypeRepositoryImpl;
import service.IRentTypeService;
import service.IServiceTypeService;

import java.util.List;

public class RentTypeServiceImpl implements IRentTypeService {
    IRentTypeRepository rentTypeRepository = new RentTypeRepositoryImpl();

    @Override
    public List<RentType> getList() {
        return rentTypeRepository.getList();
    }
}
