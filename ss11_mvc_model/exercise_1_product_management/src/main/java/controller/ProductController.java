package controller;

import model.Product;
import service.IProductService;
import service.impl.ProductServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ProductController", urlPatterns = {"/product","/"})
public class ProductController extends HttpServlet {
    private IProductService iProductService = new ProductServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        System.out.println(action);
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createProduct(request,response);
                break;
            case "edit":
                updateProduct(request,response);
                break;
            case "delete":
                deleteProduct(request,response);
                break;
            case "search":
                searchProduct(request,response);
                break;
            default:
                showListProduct(request, response);
        }
    }

    private void searchProduct(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("main");
        String search_input = request.getParameter("search_input");
        List<Product> productList = iProductService.getSearchList("Iphone13");
        request.setAttribute("products", productList);
        try {
            request.getRequestDispatcher("search.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = this.iProductService.findProductById(id);
        if (product==null){
            request.getRequestDispatcher("error-404.jsp");
        } else {
            iProductService.remove(id);
            response.sendRedirect("/product");
        }
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String nameProduct = request.getParameter("name_product");
        Double priceProduct = Double.valueOf(request.getParameter("price_product"));
        String description = request.getParameter("description_product");

        Product product = this.iProductService.findProductById(id);
        if (product==null){
            request.getRequestDispatcher("error-404.jsp");
        } else {
            product.setNameProduct(nameProduct);
            product.setPrice(priceProduct);
            product.setDescription(description);
            iProductService.update(id,product);
            try {
                response.sendRedirect("/product");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String nameProduct = request.getParameter("name_product");
        Double priceProduct = Double.valueOf(request.getParameter("price_product"));
        String description = request.getParameter("description_product");
        Integer id = (int)(Math.random()*10000);

        Product product = new Product(id,nameProduct,priceProduct,description);
        Map<String,String> map = iProductService.save(product);
        if (map.isEmpty()){
            response.sendRedirect("/product");
        } else {
            request.setAttribute("error",map);
            request.getRequestDispatcher("create.jsp").forward(request,response);
        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        System.out.println(action);
        switch (action) {
            case "create":
                request.getRequestDispatcher("create.jsp").forward(request, response);
                break;
            case "edit":
                showEditForm(request,response);
                break;
            case "delete":
                showDeleteForm(request,response);
                break;
            case "view":
                showViewForm(request,response);
                break;
            case "search":
                showSearchForm(request,response);
            default:
                showListProduct(request, response);

        }

    }

    private void showSearchForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("search.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = iProductService.findProductById(id);
        System.out.println(product);
        if (product==null){
            System.out.println("err");
            try {
                request.getRequestDispatcher("error-404.jsp").forward(request,response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            request.setAttribute("product", product);
            try {
                request.getRequestDispatcher("edit.jsp").forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void showViewForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = iProductService.findProductById(id);
        if (product==null){
            request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("product", product);
            try {
                request.getRequestDispatcher("edit.jsp").forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = iProductService.findProductById(id);
        if (product==null){
            request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("product", product);
            try {
                request.getRequestDispatcher("delete.jsp").forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

    }

    private void showListProduct(HttpServletRequest request, HttpServletResponse response) {
        List<Product> productList = iProductService. getListProduct();
        request.setAttribute("products", productList);
        try {
            request.getRequestDispatcher("list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
