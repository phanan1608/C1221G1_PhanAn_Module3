package model;

public class Calculator {
    public static Float calculate(float firstOperand, float secondOperand, char operator) throws Exception {
        switch (operator) {
            case '+':
                return firstOperand + secondOperand;
            case '-':
                return firstOperand - secondOperand;
            case '*':
                return firstOperand * secondOperand;
            case '/':
                if (secondOperand == 0.0) {
                    throw new ArithmeticException("Can't divide by zero");
                }
                return firstOperand / secondOperand;
            default:
                throw new Exception("Can't operation");
        }
    }

}
