package org.example.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Timestamp;

@Entity
@Table(name = "zamowienia")
public class Order implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "data")
    private Timestamp orderDate;

    @Column(name = "kwota")
    private double amount;

    @Column(name = "status")
    private String status;

    @ManyToOne(cascade = {CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH})
    @JoinColumn(name="username")
    private User user;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Timestamp getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Timestamp orderDate) {
        this.orderDate = orderDate;
    }


    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getStatus() { return status; }

    public void setStatus(String status) { this.status = status; }

    public User getUser() { return user; }

    public void setUser(User user) { this.user = user; }

    @Override
    public String toString() {
        return "\nDane podstawowe" +
                "\n - Data zamowienia: " + orderDate +
                "\n - Kwota zamowienia: " + amount + " zl" +
                "\n - Status zamowienia: " + status;
    }

}
