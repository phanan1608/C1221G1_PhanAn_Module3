package service;

import model.Customer;
import model.Employee;

import java.util.List;

public interface IEmployeeService extends ICrudServices<Employee> {
    Employee findEmployeeById(int id);

    List<Employee> searchByName(String keyword);
}
