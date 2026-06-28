package com.madhuri.designpatterns.factory;

public class Main {

    public static void main(String[] args) {

        DocumentFactory factory = new DocumentFactory();

        Document document = factory.createDocument("PDF");

        document.open();

    }
}