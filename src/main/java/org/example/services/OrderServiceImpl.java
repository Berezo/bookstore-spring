package org.example.services;

import org.example.dao.OrderDAO;
import org.example.entity.Order;
import org.example.entity.OrderDetail;
import org.example.model.CartInfo;
import org.example.model.OrderDetailInfo;
import org.example.model.OrderInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService{
    private OrderDAO orderDAO;

    @Autowired
    public void setOrderDAO(OrderDAO orderDAO) { this.orderDAO = orderDAO; }

    @Override
    public int getMaxOrderDetailNum() {
        return orderDAO.getMaxOrderDetailNum();
    }

    @Override
    public void saveOrder(CartInfo cartInfo) { orderDAO.saveOrder(cartInfo); }

    @Override
    public void sendOrder(Order order) { orderDAO.sendOrder(order); }

    @Override
    public Order getOrder(int orderId) { return orderDAO.getOrder(orderId); }

    @Override
    public OrderInfo getOrderInfo(int orderId) {
        return orderDAO.getOrderInfo(orderId);
    }

    @Override
    public List<OrderInfo> listOrderInfo() {
        return orderDAO.listOrderInfo();
    }

    @Override
    public List<OrderInfo> listOrderInfoForUser(String username) { return orderDAO.listOrderInfoForUser(username); }

    @Override
    public List<OrderDetail> listOrderDetail(int orderId) { return orderDAO.listOrderDetail(orderId); }

    @Override
    public List<OrderDetailInfo> listOrderDetailInfo(int orderId) {
        return orderDAO.listOrderDetailInfo(orderId);
    }



}
