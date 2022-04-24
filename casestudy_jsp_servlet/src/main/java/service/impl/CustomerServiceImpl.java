package service.impl;

import common.Validate;
import model.Customer;
import repository.ICustomerRepository;
import repository.impl.CustomerRepositoryImpl;
import service.ICrudServices;
import service.ICustomerService;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.OffsetDateTime;
import java.time.Period;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.time.format.ResolverStyle;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

public class CustomerServiceImpl implements ICustomerService {
    ICustomerRepository customerRepository = new CustomerRepositoryImpl();
    @Override
    public List<Customer> getList() {
        return customerRepository.getList();
    }

    @Override
    public void add(Customer customer) {
        System.out.println("service");
        customerRepository.add(customer);
    }

    @Override
    public void remove(int idDelete) {
        customerRepository.remove(idDelete);
    }

    @Override
    public void update(Customer customer) {
        customerRepository.update(customer);
    }

    @Override
    public Customer findCustomerById(int id) {
        return customerRepository.findCustomerById(id);
    }

    @Override
    public List<Customer> searchByName(String keyword) {
        return customerRepository.searchByName(keyword);
    }

    @Override
    public Map<String, String> addCustomer(Customer customer) {

        Map<String,String> map = new HashMap<>();
//        regex Code Customer
        if (customer.getCustomerCode().equals("")){
            map.put("code","Code customer cannot be empty");
        } else if (!customer.getCustomerCode().matches(Validate.CUSTOMER_CODE_REGEX)){
            map.put("code","Code customer must be in this format: KH-XXXX (X:0-9)");
        }
//        regex Phone
        if (customer.getCustomerPhone().equals("")){
            map.put("phone","Phone number cannot be empty");
        } else if (!customer.getCustomerPhone().matches(Validate.TELEPHONE_NUMBER_REGEX)){
            map.put("phone", "Phone number must be in this format: begin with [090 or 091 or (84)+90 or (84)+91)] and 7 number from 0 to 9");
        }
//        regex IdCard
        if (customer.getCustomerIdCard().equals("")){
            map.put("id_card","Id Card cannot be empty");
        } else if (!customer.getCustomerIdCard().matches(Validate.ID_CARD_REGEX)){
            map.put("id_card","ID Card must be in this format: have 9 or 12 number");
        }
//        regex Email
        if (customer.getCustomerEmail().equals("")){
            map.put("email","Email cannot be empty");
        } else if(!customer.getCustomerEmail().matches(Validate.EMAIL_ADDRESS_REGEX)){
            map.put("email","Email must be in this format: username@domain");
        }

//        regex Birthday
        if (!customer.getCustomerBirthday().matches(Validate.DATE_TIME_REGEX)) {
            map.put("birthday", "INVALID DATE FORMAT");
        } else {
            SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
            Date birthdayDate = null;
            Date current = new Date();
            try {
                birthdayDate = fmt.parse(customer.getCustomerBirthday());
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

        

        if (map.isEmpty()){
            customerRepository.add(customer);
        }
        return map;
    }
}
