package org.example.dao;

import org.example.entity.Order;
import org.example.entity.OrderDetail;
import org.example.model.CartInfo;
import org.example.model.OrderDetailInfo;
import org.example.model.OrderInfo;

import java.util.List;

public interface OrderDAO {
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
