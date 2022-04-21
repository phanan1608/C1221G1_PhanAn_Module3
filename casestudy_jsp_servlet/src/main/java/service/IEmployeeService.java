package service;

import model.Customer;
import model.Employee;

import java.util.List;
import java.util.Map;

public interface IEmployeeService extends ICrudServices<Employee> {
    Employee findEmployeeById(int id);

    List<Employee> searchByName(String keyword);
    Map<String,String> addEmployee(Employee employee);
}
