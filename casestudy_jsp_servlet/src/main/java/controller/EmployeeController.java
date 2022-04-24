package controller;

import model.Division;
import model.EducationDegree;
import model.Employee;
import model.Position;
import service.IDivisionService;
import service.IEducationDegreeService;
import service.IEmployeeService;
import service.IPositionService;
import service.impl.DivisionServiceImpl;
import service.impl.EducationDegreeServiceImpl;
import service.impl.EmployeeServiceImpl;
import service.impl.PositionServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "EmployeeController", urlPatterns = "/employee")
public class EmployeeController extends HttpServlet {
    IEmployeeService employeeService = new EmployeeServiceImpl();
    IPositionService positionService = new PositionServiceImpl();
    IDivisionService divisionService = new DivisionServiceImpl();
    IEducationDegreeService educationDegreeService = new EducationDegreeServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createEmployee(request, response);
                break;
            case "edit":
                updateEmployee(request, response);
                break;
            case "delete":
                removeEmployee(request, response);
                break;
        }

    }

    private void removeEmployee(HttpServletRequest request, HttpServletResponse response) {
        int employeeId = Integer.parseInt(request.getParameter("id"));
        employeeService.remove(employeeId);
        try {
            response.sendRedirect("/employee");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void updateEmployee(HttpServletRequest request, HttpServletResponse response) {
        List<Position> positionList = positionService.getList();
        List<EducationDegree> educationDegreeList = educationDegreeService.getList();
        List<Division> divisionList = divisionService.getList();
        int employeeId = Integer.parseInt(request.getParameter("id"));
        String employeeName = request.getParameter("name");
        String employeeBirthday = request.getParameter("birthday");
        String employeeIdCard = request.getParameter("id_card");
        Double employeeSalary = null;
        System.out.println(request.getParameter("salary"));
        try {
            employeeSalary = Double.valueOf(request.getParameter("salary"));
            System.out.println(employeeSalary);
        } catch (NumberFormatException e) {
            e.getStackTrace();
        }
        Integer positionId = null;
        try {
            positionId = Integer.valueOf(request.getParameter("position_id"));
        } catch (NumberFormatException e) {
            e.getStackTrace();
        }
        Integer educationDegreeId = null;
        try {
            educationDegreeId = Integer.valueOf(request.getParameter("education_degree_id"));
        } catch (NumberFormatException e) {
            e.getStackTrace();
        }
        Integer divisionId = null;
        try {
            divisionId = Integer.valueOf(request.getParameter("division_id"));
        } catch (NumberFormatException e) {
            e.getStackTrace();
        }
        String employeePhone = request.getParameter("phone");
        String employeeEmail = request.getParameter("email");
        String employeeAddress = request.getParameter("address");
        Employee employeeUpdate = new Employee(employeeId, employeeName, employeeBirthday, employeeIdCard, employeeSalary,
                employeePhone, employeeEmail, employeeAddress, positionId, educationDegreeId, divisionId);
        Map<String,String> map = employeeService.updateEmployee(employeeUpdate);
        if (map.isEmpty()){
            request.setAttribute("notification","Update successfully");
            try {
                response.sendRedirect("/employee");
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            request.setAttribute("employee", employeeUpdate);
            request.setAttribute("error", map);
            request.setAttribute("position", positionList);
            request.setAttribute("education_degree", educationDegreeList);
            request.setAttribute("division", divisionList);
            try {
                request.getRequestDispatcher("view/employee/update.jsp").forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }

        }

    }

    private void createEmployee(HttpServletRequest request, HttpServletResponse response) {
        List<Position> positionList = positionService.getList();
        List<EducationDegree> educationDegreeList = educationDegreeService.getList();
        List<Division> divisionList = divisionService.getList();
        Integer employeeId = null;
        String employeeName = request.getParameter("name");
        String employeeBirthday = request.getParameter("birthday");
        String employeeIdCard = request.getParameter("id_card");
        Double employeeSalary = null;
        try {
            employeeSalary = Double.valueOf(request.getParameter("salary"));
        } catch (NumberFormatException e) {
            e.getStackTrace();
        }
        Integer positionId = null;
        try {
            positionId = Integer.valueOf(request.getParameter("position_id"));
        } catch (NumberFormatException e) {
            e.getStackTrace();
        }
        Integer educationDegreeId = null;
        try {
            educationDegreeId = Integer.valueOf(request.getParameter("education_degree_id"));
        } catch (NumberFormatException e) {
            e.getStackTrace();
        }
        Integer divisionId = null;
        try {
            divisionId = Integer.valueOf(request.getParameter("division_id"));
        } catch (NumberFormatException e) {
            e.getStackTrace();
        }
        String employeePhone = request.getParameter("phone");
        String employeeEmail = request.getParameter("email");
        String employeeAddress = request.getParameter("address");
        Employee employeeAdd = new Employee(employeeId, employeeName, employeeBirthday, employeeIdCard, employeeSalary,
                employeePhone, employeeEmail, employeeAddress, positionId, educationDegreeId, divisionId);
        Map<String, String> map = employeeService.addEmployee(employeeAdd);
        if (map.isEmpty()) {
            try {
                response.sendRedirect("/employee");
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            request.setAttribute("employee", employeeAdd);
            request.setAttribute("error", map);
            request.setAttribute("position", positionList);
            request.setAttribute("education_degree", educationDegreeList);
            request.setAttribute("division", divisionList);
            try {
                request.getRequestDispatcher("view/employee/create.jsp").forward(request, response);
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
                searchByName(request, response);
                break;
            case "search_many_field":
                searchManyField(request,response);
                break;
            default:
                showListEmployee(request, response);
        }
    }

    private void searchManyField(HttpServletRequest request, HttpServletResponse response) {
        String nameKeyword = request.getParameter("name_keyword");
        String emailKeyword = request.getParameter("email_keyword");
        String positionKeyword = request.getParameter("position_keyword");
        List<Employee> searchList = employeeService.searchManyField(nameKeyword,emailKeyword,positionKeyword);
        List<Position> positionList = positionService.getList();
        List<EducationDegree> educationDegreeList = educationDegreeService.getList();
        List<Division> divisionList = divisionService.getList();
        request.setAttribute("employee", searchList);
        request.setAttribute("position", positionList);
        request.setAttribute("education_degree", educationDegreeList);
        request.setAttribute("division", divisionList);
        try {
            request.getRequestDispatcher("view/employee/list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void searchByName(HttpServletRequest request, HttpServletResponse response) {
        String keyword = request.getParameter("keyword");
        List<Employee> searchList = employeeService.searchByName(keyword);
        List<Position> positionList = positionService.getList();
        List<EducationDegree> educationDegreeList = educationDegreeService.getList();
        List<Division> divisionList = divisionService.getList();
        request.setAttribute("employee", searchList);
        request.setAttribute("position", positionList);
        request.setAttribute("education_degree", educationDegreeList);
        request.setAttribute("division", divisionList);
        try {
            request.getRequestDispatcher("view/employee/list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showUpdateForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Employee employee = employeeService.findEmployeeById(id);
        List<Position> positionList = positionService.getList();
        List<EducationDegree> educationDegreeList = educationDegreeService.getList();
        List<Division> divisionList = divisionService.getList();
        request.setAttribute("employee", employee);
        request.setAttribute("position", positionList);
        request.setAttribute("education_degree", educationDegreeList);
        request.setAttribute("division", divisionList);
        try {
            request.getRequestDispatcher("view/employee/update.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        List<Employee> employeeList = employeeService.getList();
        List<Position> positionList = positionService.getList();
        List<EducationDegree> educationDegreeList = educationDegreeService.getList();
        List<Division> divisionList = divisionService.getList();
        request.setAttribute("employeeList", employeeList);
        request.setAttribute("position", positionList);
        request.setAttribute("education_degree", educationDegreeList);
        request.setAttribute("division", divisionList);
        try {
            request.getRequestDispatcher("/view/employee/create.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void showListEmployee(HttpServletRequest request, HttpServletResponse response) {
        List<Employee> employeeList = employeeService.getList();
        List<Position> positionList = positionService.getList();
        List<EducationDegree> educationDegreeList = educationDegreeService.getList();
        List<Division> divisionList = divisionService.getList();
        request.setAttribute("employee", employeeList);
        request.setAttribute("position", positionList);
        request.setAttribute("education_degree", educationDegreeList);
        request.setAttribute("division", divisionList);
        try {
            request.getRequestDispatcher("view/employee/list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
