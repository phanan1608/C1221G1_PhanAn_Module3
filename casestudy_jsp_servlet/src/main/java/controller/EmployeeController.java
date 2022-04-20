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

@WebServlet(name = "EmployeeController",urlPatterns = "/employee")
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
        }

    }

    private void createEmployee(HttpServletRequest request, HttpServletResponse response) {
        Integer employeeId = null;
        String employeeName       = request.getParameter("name")     ;
        String employeeBirthday   = request.getParameter("birthday")          ;
        String employeeIdCard     = request.getParameter("id_card")        ;
        Double employeeSalary     = Double.valueOf(request.getParameter("salary"));
        String employeePhone      = request.getParameter("phone")    ;
        String employeeEmail      = request.getParameter("email")     ;
        String employeeAddress    = request.getParameter("address")       ;
        Integer positionId        = Integer.valueOf(request.getParameter("position_id"));
        Integer educationDegreeId = Integer.valueOf(request.getParameter("education_degree_id"));
        Integer divisionId        = Integer.valueOf(request.getParameter("division_id"));
        Employee employee = new Employee(employeeId,employeeName,employeeBirthday,employeeIdCard,employeeSalary,
                employeePhone,employeeEmail,employeeAddress,positionId,educationDegreeId,divisionId);
        employeeService.add(employee);
        try {
            response.sendRedirect("/employee");
        } catch (IOException e) {
            e.printStackTrace();
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
            default:
                showListEmployee(request,response);
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        List<Employee> employeeList = employeeService.getList();
        List<Position> positionList = positionService.getList();
        List<EducationDegree> educationDegreeList = educationDegreeService.getList();
        List<Division> divisionList = divisionService.getList();
        request.setAttribute("employee",employeeList);
        request.setAttribute("position",positionList);
        request.setAttribute("education_degree",educationDegreeList);
        request.setAttribute("division",divisionList);
        try {
            request.getRequestDispatcher("view/employee/create.jsp").forward(request,response);
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
        request.setAttribute("employee",employeeList);
        request.setAttribute("position",positionList);
        request.setAttribute("education_degree",educationDegreeList);
        request.setAttribute("division",divisionList);
        try {
            request.getRequestDispatcher("view/employee/list.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
