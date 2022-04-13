package controller;

import model.Customer;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = "/customer-servlet")
public class CustomerServlet extends HttpServlet {
    List<Customer> customerList = new ArrayList<>();

    @Override
    public void init() throws ServletException {
        customerList.add(new Customer("An", "16/08/1997",1 ,"DN", 9.5 ,"https://cdn.chanhtuoi.com/uploads/2022/01/hinh-avatar-nam-deo-kinh.jpg"));
        customerList.add(new Customer("Nghia", "26/01/1997",0 ,"DN", 6.5,"https://i.pinimg.com/originals/47/e0/01/47e001f1be26293d7f8826c5b262d9df.jpg"));
        customerList.add(new Customer("Hoang", "05/05/1997", 0,"DN", 4.8,"https://hinhnen123.com/wp-content/uploads/2021/06/anh-avatar-cute-dep-nhat-5.jpg"));
        customerList.add(new Customer("Luatt", "18/12/2003",1 ,"DN",8.0 ,"https://anhsang.edu.vn/wp-content/uploads/anh-tho-chibi-7.jpg"));
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("customer_list",customerList);
        request.getRequestDispatcher("display.jsp").forward(request,response);
    }
}
