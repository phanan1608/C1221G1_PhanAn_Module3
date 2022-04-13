import model.Calculator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", urlPatterns = "/calculator-servlet")
public class CalculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float first_operand = Float.parseFloat(request.getParameter("first_operand"));
        float second_operand = Float.parseFloat(request.getParameter("second_operand"));
        char operator = request.getParameter("operator").charAt(0);
        String message = "";

        Float result = 0.0f;

        try {
            result= Calculator.calculate(first_operand, second_operand, operator);
        } catch (ArithmeticException e){
            message = "Can't divide by zero";
        }
        catch (Exception e) {
            message = "Can't operation";
        }
        request.setAttribute("first_operand",first_operand);
        request.setAttribute("second_operand",second_operand);
        request.setAttribute("operator",operator);
        request.setAttribute("result",result);
        request.setAttribute("message",message);
        request.getRequestDispatcher("result.jsp").forward(request,response);

    }
}
