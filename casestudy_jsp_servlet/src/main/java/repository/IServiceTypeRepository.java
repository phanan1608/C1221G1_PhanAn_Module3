package repository;

import model.CustomerType;
import model.ServiceType;

import java.util.List;

public interface IServiceTypeRepository {
    List<ServiceType> getList();

}
