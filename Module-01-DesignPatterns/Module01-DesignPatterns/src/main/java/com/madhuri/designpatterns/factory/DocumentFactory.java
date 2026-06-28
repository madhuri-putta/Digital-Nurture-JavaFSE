package com.madhuri.designpatterns.factory;

public class DocumentFactory {

    public Document createDocument(String type) {

        if (type.equalsIgnoreCase("WORD")) {
            return new WordDocument();
        } else if (type.equalsIgnoreCase("PDF")) {
            return new PdfDocument();
        } else if (type.equalsIgnoreCase("EXCEL")) {
            return new ExcelDocument();
        }

        return null;
    }
}