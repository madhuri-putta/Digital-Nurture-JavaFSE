package com.madhuri.dsa.recursion;

public class Main {

    public static void main(String[] args) {

        double currentValue = 10000;
        double growthRate = 0.10;
        int years = 5;

        double futureValue = FinancialForecast.predictFutureValue(currentValue, growthRate, years);

        System.out.printf("Predicted Future Value: %.2f%n", futureValue);

    }

}