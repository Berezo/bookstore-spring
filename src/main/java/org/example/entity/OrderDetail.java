package org.example.entity;

import javax.persistence.*;

@Entity
@Table(name = "szczegoly_zamowienia")
public class OrderDetail{

    @Id
    @Column(name = "id", nullable = false)
    private int id;

    @ManyToOne(cascade = {CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH})
    @JoinColumn(name = "zamowienie_id", nullable = false)
    private Order order;

    @ManyToOne(cascade = {CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH})
    @JoinColumn(name = "ksiazka_id", nullable = false)
    private Book book;

    @Column(name = "ilosc", nullable = false)
    private int quantity;

    @Column(name = "cena", nullable = false)
    private double price;

    @Column(name = "kwota", nullable = false)
    private double amount;

    public int getId() { return id; }

    public void setId(int id) { this.id = id; }

    public Order getOrder() { return order; }

    public void setOrder(Order order) { this.order = order; }

    public Book getBook() { return book; }

    public void setBook(Book book) { this.book = book; }

    public int getQuantity() { return quantity; }

    public void setQuantity(int quantity) { this.quantity = quantity; }

    public double getPrice() { return price; }

    public void setPrice(double price) { this.price = price; }

    public double getAmount() { return amount; }

    public void setAmount(double amount) { this.amount = amount; }

}