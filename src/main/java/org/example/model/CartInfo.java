package org.example.model;

import java.util.ArrayList;
import java.util.List;

public class CartInfo {
    private int orderNum;
    private CustomerInfo customerInfo;
    private final List<CartLineInfo> cartLines = new ArrayList<CartLineInfo>();

    public CartInfo() { }

    public int getOrderNum() { return orderNum; }

    public void setOrderNum(int orderNum) { this.orderNum = orderNum; }

    public CustomerInfo getCustomerInfo() { return customerInfo; }

    public void setCustomerInfo(CustomerInfo customerInfo) { this.customerInfo = customerInfo; }

    public List<CartLineInfo> getCartLines() { return this.cartLines; }

    public CartLineInfo findLineById(int id) {
        for (CartLineInfo line : this.cartLines) {
            if (line.getProductInfo().getId() == id) {
                return line;
            }
        }
        return null;
    }

    public void addProduct(ProductInfo productInfo, int quantity) {
        CartLineInfo line = this.findLineById(productInfo.getId());

        if (line == null) {
            line = new CartLineInfo();
            line.setQuantity(0);
            line.setProductInfo(productInfo);
            this.cartLines.add(line);
        }
        int newQuantity = line.getQuantity() + quantity;
        if (newQuantity <= 0) {
            this.cartLines.remove(line);
        } else {
            line.setQuantity(newQuantity);
        }
    }

    public void updateProduct(int id, int quantity) {
        CartLineInfo line = this.findLineById(id);

        if (line != null) {
            if (quantity <= 0) {
                this.cartLines.remove(line);
            } else {
                line.setQuantity(quantity);
            }
        }
    }

    public int checkProductQuantity(int id, int quantity) {
        int quantityDifference = 0;
        CartLineInfo line = this.findLineById(id);
        int quantityLine = line.getQuantity();

        if (line != null) {
            if (quantity <= 0) {
                quantityDifference = quantityLine;
            } else {
                quantityDifference = quantityLine - quantity;
            }
        }
        return quantityDifference;
    }

    public void removeProduct(ProductInfo productInfo) {
        CartLineInfo line = this.findLineById(productInfo.getId());
        if (line != null) {
            this.cartLines.remove(line);
        }
    }

    public boolean isEmpty() {
        return this.cartLines.isEmpty();
    }

    public boolean isValidCustomer() {
        return this.customerInfo != null && this.customerInfo.isValid();
    }

    public int getQuantityTotal() {
        int quantity = 0;
        for (CartLineInfo line : this.cartLines) {
            quantity += line.getQuantity();
        }
        return quantity;
    }

    public double getAmountTotal() {
        double total = 0;
        for (CartLineInfo line : this.cartLines) {
            total += line.getAmount();
        }
        return total;
    }

}