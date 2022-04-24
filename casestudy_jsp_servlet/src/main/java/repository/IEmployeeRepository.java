package repository;

import model.Customer;
import model.Employee;
import service.ICrudServices;

import java.util.List;

public interface IEmployeeRepository extends ICrudRepository<Employee> {
    Employee findEmployeeById(int id);

    List<Employee> searchByName(String keyword);

    List<Employee> searchManyField(String nameKeyword, String emailKeyword, String positionKeyword);
}
