import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ProductDiscountCalculatorServlet",urlPatterns = "/display-discount")
public class ProductDiscountCalculatorServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String product_description = request.getParameter("product_description");
        Double list_price = Double.parseDouble(request.getParameter("list_price"));
        Double discount_percent = Double.parseDouble(request.getParameter("discount_percent"));

        Double discount_amount = list_price*discount_percent*0.01;
        Double discount_price = list_price - discount_amount;

        request.setAttribute("product_description", product_description);
        request.setAttribute("discount_amount", discount_amount);
        request.setAttribute("discount_price", discount_price);

        request.getRequestDispatcher("/display-discount.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}
