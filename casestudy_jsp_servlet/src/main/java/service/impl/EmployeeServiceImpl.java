package service.impl;

import common.Validate;
import model.Employee;
import repository.IEmployeeRepository;
import repository.impl.EmployeeRepositoryImpl;
import service.IEmployeeService;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.OffsetDateTime;
import java.time.Period;
import java.time.ZoneOffset;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @Override
    public Map<String, String> addEmployee(Employee employee) {
        Map<String,String> map = new HashMap<>();
        if (employee.getEmployeeName().equals("")){
            map.put("name","Name service cannot be empty");
        }

        if (!employee.getEmployeeBirthday().matches(Validate.DATE_TIME_REGEX)) {
            map.put("birthday", "INVALID DATE FORMAT");
        } else {
            SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
            Date birthdayDate = null;
            Date current = new Date();
            try {
                birthdayDate = fmt.parse(employee.getEmployeeBirthday());
                // KIEM TRA NGAY CO TRONG QUA KHU KHONG
                if (birthdayDate != null && birthdayDate.compareTo(new Date()) > 0) {
                    map.put("birthday", "MUST BE PAST");
                }
                // KIEM TRA TUOI > 18
                OffsetDateTime startOdt = birthdayDate.toInstant().atOffset(ZoneOffset.UTC);
                OffsetDateTime endOdt = current.toInstant().atOffset(ZoneOffset.UTC);
                int years = Period.between(startOdt.toLocalDate(), endOdt.toLocalDate()).getYears();
                System.out.println(years);
                if (years < 18 ) {
                    map.put("birthday", "MUST BE > 18 YEAR OLD");
                } else if (years >100){
                    map.put("birthday", "MUST BE < 100 YEAR OLD");
                }
            } catch (ParseException e) {
                e.printStackTrace();
                map.put("birthday", "INVALID DATE FORMAT");
            }
        }
        //        regex IdCard
        if (employee.getEmployeeIdCard().equals("")){
            map.put("id_card","Id Card cannot be empty");
        } else if (!employee.getEmployeeIdCard().matches(Validate.ID_CARD_REGEX)){
            map.put("id_card","ID Card must be in this format: have 9 or 12 number");
        }
//        regex Salary
        String salary = String.format("%.0f",employee.getEmployeeSalary());
        if (employee.getEmployeeSalary()==null){
            map.put("salary","Salary cannot be empty");
        } else if (!salary.matches(Validate.POSITION_DOUBLE_REGEX)){
            map.put("salary","Salary must be positive");
        }
        //        regex Phone
        if (employee.getEmployeePhone().equals("")){
            map.put("phone","Phone number cannot be empty");
        } else if (!employee.getEmployeePhone().matches(Validate.TELEPHONE_NUMBER_REGEX)){
            map.put("phone", "Phone number must be in this format: begin with [090 or 091 or (84)+90 or (84)+91)] and 7 number from 0 to 9");
        }
        //        regex Email
        if (employee.getEmployeeEmail().equals("")){
            map.put("email","Email cannot be empty");
        } else if(!employee.getEmployeeEmail().matches(Validate.EMAIL_ADDRESS_REGEX)){
            map.put("email","Email must be in this format: username@domain");
        }
//        regex Position
        String position = String.valueOf(employee.getPositionId());
        if (employee.getPositionId()==null){
            map.put("position","Position cannot be empty");
        } else if (!position.matches(Validate.POSITIVE_INTEGERS_REGEX)){
            map.put("position","Position must be positive integer");
        }
//        regex Eduction
        String education = String.valueOf(employee.getEducationDegreeId());
        if (employee.getEducationDegreeId()==null){
            map.put("education","Education cannot be empty");
        } else if (!education.matches(Validate.POSITIVE_INTEGERS_REGEX)){
            map.put("education","Education must be positive integer");
        }
//        regex Division
        String division = String.valueOf(employee.getDivisionId());
        if (employee.getDivisionId()==null){
            map.put("division","Division cannot be empty");
        } else if (!division.matches(Validate.POSITIVE_INTEGERS_REGEX)){
            map.put("division","Division must be positive integer");
        }

        if (map.isEmpty()){
            employeeRepository.add(employee);
        }
        return map;
    }

    @Override
    public List<Employee> searchManyField(String nameKeyword, String emailKeyword, String positionKeyword) {
        return employeeRepository.searchManyField(nameKeyword,emailKeyword,positionKeyword);
    }

    @Override
    public Map<String, String> updateEmployee(Employee employee) {
        Map<String,String> map = new HashMap<>();
        if (employee.getEmployeeName().equals("")){
            map.put("name","Name service cannot be empty");
        }

        if (!employee.getEmployeeBirthday().matches(Validate.DATE_TIME_REGEX)) {
            map.put("birthday", "INVALID DATE FORMAT");
        } else {
            SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
            Date birthdayDate = null;
            Date current = new Date();
            try {
                birthdayDate = fmt.parse(employee.getEmployeeBirthday());
                // KIEM TRA NGAY CO TRONG QUA KHU KHONG
                if (birthdayDate != null && birthdayDate.compareTo(new Date()) > 0) {
                    map.put("birthday", "MUST BE PAST");
                }
                // KIEM TRA TUOI > 18
                OffsetDateTime startOdt = birthdayDate.toInstant().atOffset(ZoneOffset.UTC);
                OffsetDateTime endOdt = current.toInstant().atOffset(ZoneOffset.UTC);
                int years = Period.between(startOdt.toLocalDate(), endOdt.toLocalDate()).getYears();
                System.out.println(years);
                if (years < 18 ) {
                    map.put("birthday", "MUST BE > 18 YEAR OLD");
                } else if (years >100){
                    map.put("birthday", "MUST BE < 100 YEAR OLD");
                }
            } catch (ParseException e) {
                e.printStackTrace();
                map.put("birthday", "INVALID DATE FORMAT");
            }
        }
        //        regex IdCard
        if (employee.getEmployeeIdCard().equals("")){
            map.put("id_card","Id Card cannot be empty");
        } else if (!employee.getEmployeeIdCard().matches(Validate.ID_CARD_REGEX)){
            map.put("id_card","ID Card must be in this format: have 9 or 12 number");
        }
//        regex Salary
        String salary = String.format("%.0f",employee.getEmployeeSalary());
        if (employee.getEmployeeSalary()==null){
            map.put("salary","Salary cannot be empty");
        } else if (!salary.matches(Validate.POSITION_DOUBLE_REGEX)){
            map.put("salary","Salary must be positive");
        }
        //        regex Phone
        if (employee.getEmployeePhone().equals("")){
            map.put("phone","Phone number cannot be empty");
        } else if (!employee.getEmployeePhone().matches(Validate.TELEPHONE_NUMBER_REGEX)){
            map.put("phone", "Phone number must be in this format: begin with [090 or 091 or (84)+90 or (84)+91)] and 7 number from 0 to 9");
        }
        //        regex Email
        if (employee.getEmployeeEmail().equals("")){
            map.put("email","Email cannot be empty");
        } else if(!employee.getEmployeeEmail().matches(Validate.EMAIL_ADDRESS_REGEX)){
            map.put("email","Email must be in this format: username@domain");
        }
//        regex Position
        String position = String.valueOf(employee.getPositionId());
        if (employee.getPositionId()==null){
            map.put("position","Position cannot be empty");
        } else if (!position.matches(Validate.POSITIVE_INTEGERS_REGEX)){
            map.put("position","Position must be positive integer");
        }
//        regex Eduction
        String education = String.valueOf(employee.getEducationDegreeId());
        if (employee.getEducationDegreeId()==null){
            map.put("education","Education cannot be empty");
        } else if (!education.matches(Validate.POSITIVE_INTEGERS_REGEX)){
            map.put("education","Education must be positive integer");
        }
//        regex Division
        String division = String.valueOf(employee.getDivisionId());
        if (employee.getDivisionId()==null){
            map.put("division","Division cannot be empty");
        } else if (!division.matches(Validate.POSITIVE_INTEGERS_REGEX)){
            map.put("division","Division must be positive integer");
        }

        if (map.isEmpty()){
            employeeRepository.update(employee);
        }
        return map;
    }
}
