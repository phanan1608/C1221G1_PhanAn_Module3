package service;

import model.Service;

import java.util.Map;

public interface IServiceService extends ICrudServices<Service> {
    Map<String, String> addService(Service service);
}
