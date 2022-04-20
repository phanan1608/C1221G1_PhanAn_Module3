package controller;

import model.RentType;
import model.Service;
import model.ServiceType;
import service.IRentTypeService;
import service.IServiceService;
import service.IServiceTypeService;
import service.impl.RentTypeServiceImpl;
import service.impl.ServiceServiceImpl;
import service.impl.ServiceTypeServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ServiceController", urlPatterns = "/service")
public class ServiceController extends HttpServlet {
    IServiceService serviceService = new ServiceServiceImpl();
    IServiceTypeService serviceTypeService = new ServiceTypeServiceImpl();
    IRentTypeService rentTypeService = new RentTypeServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createService(request, response);
                break;
            default:
                showCreateForm(request, response);
        }
    }

    private void createService(HttpServletRequest request, HttpServletResponse response) {
        Integer serviceId = null;
        String serviceName = request.getParameter("name");
        Integer serviceArea = Integer.valueOf(request.getParameter("area"));
        Double serviceCost = Double.valueOf(request.getParameter("cost"));
        Integer serviceMaxPeople = Integer.valueOf(request.getParameter("max_people"));
        Integer rentTypeId = Integer.valueOf(request.getParameter("rent_type"));
        Integer serviceTypeId = Integer.valueOf(request.getParameter("service_type"));
        String standardRoom = request.getParameter("standard_room");
        String otherConvenience = request.getParameter("convenience");
        Double poolArea = Double.valueOf(request.getParameter("pool_area"));
        Integer numberOfFloor = Integer.valueOf(request.getParameter("number_of_floor"));
        Service serviceAdd = new Service(serviceId,serviceName,serviceArea,serviceCost,serviceMaxPeople,
                rentTypeId,serviceTypeId,standardRoom,otherConvenience,poolArea,numberOfFloor);
        serviceService.add(serviceAdd);
        try {
            response.sendRedirect("/service");
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        List<ServiceType> serviceTypeList = serviceTypeService.getList();
        request.setAttribute("service_type", serviceTypeList);
        List<RentType> rentTypeList = rentTypeService.getList();
        request.setAttribute("rent_type", rentTypeList);

        try {
            request.getRequestDispatcher("view/service-page/create.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
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
                showListService(request,response);
        }
    }

    private void showListService(HttpServletRequest request, HttpServletResponse response) {
        List<Service> services = serviceService.getList();
        request.setAttribute("services",services);
        List<ServiceType> serviceTypeList = serviceTypeService.getList();
        request.setAttribute("service_type", serviceTypeList);
        List<RentType> rentTypeList = rentTypeService.getList();
        request.setAttribute("rent_type", rentTypeList);
        try {
            request.getRequestDispatcher("view/service-page/list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
