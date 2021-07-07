package org.example.model;

import org.example.entity.User;

public class CustomerInfo {

    private String username;
    private String name;
    private String surname;
    private String address;
    private String email;
    private String phone;

    private boolean valid;

    public CustomerInfo() {

    }

    public CustomerInfo(User user) {
        this.username = user.getUsername();
        this.name = user.getName();
        this.surname = user.getSurname();
        this.address = user.getAddress();
        this.email = user.getEmail();
        this.phone = user.getPhone();
        this.valid = user.getEnabled();
    }

    public String getUsername() { return username; }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() { return surname; }

    public void setSurname(String surname) { this.surname = surname; }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public boolean isValid() {
        return valid;
    }

    public void setValid(boolean valid) {
        this.valid = valid;
    }

}
