package service.impl;

import model.Employee;
import repository.IEmployeeRepository;
import repository.impl.EmployeeRepositoryImpl;
import service.IEmployeeService;

import java.util.List;

public class EmployeeServiceImpl implements IEmployeeService {
    IEmployeeRepository employeeRepository = new EmployeeRepositoryImpl();
    @Override
    public List<Employee> getList() {
        return employeeRepository.getList();
    }

    @Override
    public void add(Employee employee) {
    employeeRepository.add(employee);
    }

    @Override
    public void remove(int idDelete) {
    employeeRepository.remove(idDelete);
    }

    @Override
    public void update(Employee employee) {
        employeeRepository.update(employee);
    }

    @Override
    public Employee findEmployeeById(int id) {
        return employeeRepository.findEmployeeById(id);
    }

    @Override
    public List<Employee> searchByName(String keyword) {
        return employeeRepository.searchByName(keyword);
    }
}
