package service;

import model.Customer;
import model.Employee;

import java.util.List;
import java.util.Map;

public interface IEmployeeService extends ICrudServices<Employee> {
    Employee findEmployeeById(int id);

    List<Employee> searchByName(String keyword);

    Map<String, String> addEmployee(Employee employee);

    List<Employee> searchManyField(String nameKeyword, String emailKeyword, String positionKeyword);

    Map<String, String> updateEmployee(Employee employeeUpdate);
}
