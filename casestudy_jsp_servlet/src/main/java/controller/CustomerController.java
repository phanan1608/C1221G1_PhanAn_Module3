package controller;

import model.Customer;
import model.CustomerType;
import repository.ICustomerTypeRepository;
import repository.impl.CustomerTypRepositoryImpl;
import service.ICustomerService;
import service.ICustomerTypeService;
import service.impl.CustomerServiceImpl;
import service.impl.CustomerTypeServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

@WebServlet(name = "CustomerController", urlPatterns = "/customer")
public class CustomerController extends HttpServlet {
    ICustomerService customerService = new CustomerServiceImpl();
    ICustomerTypeService customerTypeService = new CustomerTypeServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createCustomer(request, response);
                break;
            case "delete":
                removeCustomer(request, response);
                break;
            case "edit":
                updateCustomer(request,response);
//            default:
//                showCustomerList(request, response);
        }
    }

    private void updateCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String customerCode= request.getParameter("code");
        Integer customerTypeId = Integer.valueOf(request.getParameter("customer_type_id"));
        String customerName = request.getParameter("name");
        String customerBirthday = request.getParameter("birthday");
        Integer customerGender = Integer.valueOf(request.getParameter("gender"));
        String customerIdCard = request.getParameter("id_card");
        String customerPhone = request.getParameter("phone");
        String customerEmail = request.getParameter("email");
        String customerAddress = request.getParameter("address");
        Customer customerUpdate = new Customer(id,customerCode, customerTypeId, customerName, customerBirthday, customerGender,
                customerIdCard, customerPhone, customerEmail, customerAddress);
        System.out.println(customerUpdate);
        customerService.update(customerUpdate);
        try {
            response.sendRedirect("/customer");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void removeCustomer(HttpServletRequest request, HttpServletResponse response) {
        int idDelete = Integer.parseInt(request.getParameter("id"));
        customerService.remove(idDelete);
        try {
            response.sendRedirect("/customer");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createCustomer(HttpServletRequest request, HttpServletResponse response) {
        List<CustomerType> customerTypeList = customerTypeService.getList();
        request.setAttribute("customer_type", customerTypeList);
        Integer id = null;
        String customerCode = request.getParameter("code");
        Integer customerTypeId = Integer.valueOf(request.getParameter("customer_type_id"));
        String customerName = request.getParameter("name");
        String customerBirthday = request.getParameter("birthday");
        Integer customerGender = Integer.valueOf(request.getParameter("gender"));
        String customerIdCard = request.getParameter("id_card");
        String customerPhone = request.getParameter("phone");
        String customerEmail = request.getParameter("email");
        String customerAddress = request.getParameter("address");
        Customer customer = new Customer(id, customerCode,customerTypeId, customerName, customerBirthday, customerGender,
                customerIdCard, customerPhone, customerEmail, customerAddress);
        Map<String, String> map = customerService.addCustomer(customer);
        if (map.isEmpty()){
            try {
                response.sendRedirect("/customer");
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            request.setAttribute("error",map);
            request.setAttribute("customer",customer);
            try {
                request.getRequestDispatcher("view/customer/create.jsp").forward(request,response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "edit":
                showUpdateForm(request, response);
                break;
            case "search":
                searchByName(request,response);
                break;
            default:
                showCustomerList(request, response);
        }
    }

    private void searchByName(HttpServletRequest request, HttpServletResponse response) {
        String keyword = request.getParameter("keyword");
        List<Customer> searchList =  customerService.searchByName(keyword);
        request.setAttribute("customers", searchList);
        List<CustomerType> customerTypeList = customerTypeService.getList();
        request.setAttribute("customer_type",customerTypeList);
        try {
            request.getRequestDispatcher("view/customer/list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        List<CustomerType> customerTypeList = customerTypeService.getList();
        request.setAttribute("customer_type", customerTypeList);
        try {
            request.getRequestDispatcher("view/customer/create.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showCustomerList(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customerList = customerService.getList();
        request.setAttribute("customers", customerList);
        List<CustomerType> customerTypeList = customerTypeService.getList();
        request.setAttribute("customer_type",customerTypeList);
        try {
            request.getRequestDispatcher("view/customer/list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showUpdateForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customerUpdate = customerService.findCustomerById(id);
        request.setAttribute("customer_update",customerUpdate);
        List<CustomerType> customerTypeList = customerTypeService.getList();
        request.setAttribute("customer_type",customerTypeList);
        try {
            request.getRequestDispatcher("view/customer/update.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
