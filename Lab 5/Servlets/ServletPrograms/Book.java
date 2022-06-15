/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ServletPrograms;

/**
 *
 * @author Kirthana Balasubramanian
 */
public class Book {
    String author;
    String title;
    double price;
    String publisher;
    int stock;

    public Book(String author, String title, double price, String publisher, int stock) {
        this.author = author;
        this.title = title;
        this.price = price;
        this.publisher = publisher;
        this.stock = stock;
    }
    
    
}
