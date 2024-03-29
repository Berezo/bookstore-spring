package org.example.model;

import org.example.entity.User;

import java.util.Date;
import java.util.List;

public class OrderInfo {

    private int id;
    private Date orderDate;
    private double amount;
    private String status;

    private String customerName;
    private String customerSurname;
    private String customerAddress;
    private String customerEmail;
    private String customerPhone;

    private List<OrderDetailInfo> details;

    public OrderInfo() {

    }

    // Using for Hibernate Query.
    public OrderInfo(int id, Date orderDate, //
                     double amount, User user, String status) {
        this.id = id;
        this.orderDate = orderDate;
        this.amount = amount;
        this.status = status;

        this.customerName = user.getName();
        this.customerSurname = user.getSurname();
        this.customerAddress = user.getAddress();
        this.customerEmail = user.getEmail();
        this.customerPhone = user.getPhone();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) { this.id = id; }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
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

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerSurname() { return customerSurname; }

    public void setCustomerSurname(String customerSurname) { this.customerSurname = customerSurname; }

    public String getCustomerAddress() {
        return customerAddress;
    }

    public void setCustomerAddress(String customerAddress) {
        this.customerAddress = customerAddress;
    }

    public String getCustomerEmail() {
        return customerEmail;
    }

    public void setCustomerEmail(String customerEmail) {
        this.customerEmail = customerEmail;
    }

    public String getCustomerPhone() {
        return customerPhone;
    }

    public void setCustomerPhone(String customerPhone) {
        this.customerPhone = customerPhone;
    }

    public List<OrderDetailInfo> getDetails() {
        return details;
    }

    public void setDetails(List<OrderDetailInfo> details) {
        this.details = details;
    }

}