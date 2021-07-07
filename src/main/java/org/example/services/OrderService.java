package org.example.services;

import org.example.entity.Order;
import org.example.entity.OrderDetail;
import org.example.model.CartInfo;
import org.example.model.OrderDetailInfo;
import org.example.model.OrderInfo;
import org.springframework.stereotype.Service;

import java.util.List;

public interface OrderService {
    int getMaxOrderDetailNum();
    void saveOrder(CartInfo cartInfo);
    void sendOrder(Order order);
    Order getOrder(int orderId);
    OrderInfo getOrderInfo(int orderId);
    List<OrderInfo> listOrderInfo();
    List<OrderInfo> listOrderInfoForUser(String username);
    List<OrderDetail> listOrderDetail(int orderId);
    List<OrderDetailInfo> listOrderDetailInfo(int orderId);
}

