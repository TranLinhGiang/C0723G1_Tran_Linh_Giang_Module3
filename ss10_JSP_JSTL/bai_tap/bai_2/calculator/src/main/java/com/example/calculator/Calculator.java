package com.example.calculator;

public class Calculator {
    public static double calculate(double firstOperand, double secondOperand, char operator ){
        switch (operator){
            case 1:
                return firstOperand + secondOperand;
            case 2:
                return firstOperand - secondOperand;
            case 3:
                return firstOperand * secondOperand;
            case 4:
                if(secondOperand != 0)
                    return firstOperand / secondOperand;
                else
                    throw new RuntimeException("Can't divide by zero");
            default:
                throw new RuntimeException("Invalid operation");
        }
    }
}
