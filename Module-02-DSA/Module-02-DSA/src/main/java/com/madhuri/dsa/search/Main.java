package com.madhuri.dsa.search;

public class Main {

    public static void main(String[] args) {

        Product[] products = {

                new Product(101, "Laptop", "Electronics"),
                new Product(102, "Phone", "Electronics"),
                new Product(103, "Shoes", "Fashion"),
                new Product(104, "Book", "Education"),
                new Product(105, "Watch", "Accessories")

        };

        Product linear = LinearSearch.search(products, 104);

        if (linear != null) {
            System.out.println("Linear Search Result:");
            System.out.println("ID: " + linear.productId);
            System.out.println("Name: " + linear.productName);
            System.out.println("Category: " + linear.category);
        }

        System.out.println();

        Product binary = BinarySearch.search(products, 104);

        if (binary != null) {
            System.out.println("Binary Search Result:");
            System.out.println("ID: " + binary.productId);
            System.out.println("Name: " + binary.productName);
            System.out.println("Category: " + binary.category);
        }

    }

}