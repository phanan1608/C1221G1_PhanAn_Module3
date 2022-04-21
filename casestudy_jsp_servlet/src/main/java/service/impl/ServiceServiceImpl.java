package service.impl;

import common.Validate;
import model.Service;
import repository.IServiceRepository;
import repository.impl.ServiceRepositoryImpl;
import service.IServiceService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @Override
    public Map<String, String> addService(Service service) {
        Map<String, String> map=new HashMap<>();
//        regex Name
        if (service.getServiceName().equals("")){
            map.put("name","Name service cannot be empty");
        }
        //        regex Code Customer
        if (service.getServiceCode().equals("")){
            map.put("code","Code service cannot be empty");
        } else if (!service.getServiceCode().matches(Validate.SERVICE_CODE_REGEX)){
            map.put("code","Code service must be in this format: DV-XXXX (X:0-9)");
        }
//        regex Area
        String area = String.valueOf(service.getServiceArea());
        if (service.getServiceArea()==null){
            map.put("area","Area cannot be empty");
        } else if (!area.matches(Validate.POSITIVE_INTEGERS_REGEX) || area.equals("0")){
            map.put("area","Area must be positive integer");
        }
//        regex Cost
        String cost = String.valueOf(service.getServiceCost());
        if (service.getServiceCost()==null){
            map.put("cost","Cost cannot be empty");
        } else if (!cost.matches(Validate.POSITION_DOUBLE_REGEX)){
            map.put("cost","Cost must be positive");
        }
//        regex Max people
        String maxPeople = String.valueOf(service.getServiceMaxPeople());
        if (service.getServiceMaxPeople()==null){
            map.put("max_people","Max people cannot be empty");
        } else if (!maxPeople.matches(Validate.POSITIVE_INTEGERS_REGEX) || maxPeople.equals("0")){
            map.put("max_people","Max people must be positive integer");
        }
//        regex Rent Type
        if (service.getRentTypeId() == null){
            map.put("rent_type","Name service cannot be empty");
        }

        if (service.getServiceTypeId() == null){
            map.put("service_type","Type service cannot be empty");
        }
        //        regex Pool Area
        String poolArea = String.valueOf(service.getPoolArea());
        if (service.getPoolArea()==null){
            map.put("pool_area","Area cannot be empty");
        } else if (!poolArea.matches(Validate.POSITION_DOUBLE_REGEX)){
            map.put("pool_area","Area must be positive integer");
        }

        String floor = String.valueOf(service.getNumberOfFloor());
        if (service.getNumberOfFloor()==null){
            map.put("number_of_floor","Number Of Floor cannot be empty");
        } else if (!floor.matches(Validate.POSITIVE_INTEGERS_REGEX)){
            map.put("number_of_floor","Number Of Floor must be positive integer");
        }


        if (map.isEmpty()){
            serviceRepository.add(service);
        }
        return map;
    }
}
