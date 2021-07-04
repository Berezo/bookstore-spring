package org.example.dao;

import org.example.entity.Book;
import org.example.entity.Order;
import org.example.entity.OrderDetail;
import org.example.model.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Repository
public class OrderDAOImpl implements OrderDAO {
    private SessionFactory sessionFactory;
    private BookDAO bookDAO;
    private UserDAO userDAO;

    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) { this.sessionFactory = sessionFactory; }

    @Autowired
    public void setBookDAO(BookDAO bookDAO) {
        this.bookDAO = bookDAO;
    }

    @Autowired
    public void setUserDAO(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    @Override
    public int getMaxOrderDetailNum() {
        Session session = sessionFactory.getCurrentSession();

        String sql = "Select max(o.id) from " + OrderDetail.class.getName() + " o ";
        Query<Integer> query = session.createQuery(sql, Integer.class);

        Integer value = (Integer) query.getSingleResult();
        if (value == null) {
            return 0;
        }
        return value;
    }

//    @Transactional(rollbackFor = Exception.class)
//    @Override
//    public void saveOrder(CartInfo cartInfo) {
//        System.out.println("Przed session!");
//        Session session = this.sessionFactory.getCurrentSession();
//
//        Order order = new Order();
//
//        order.setOrderDate(new Date());
//        order.setAmount(cartInfo.getAmountTotal());
//        order.setStatus("zlozono");
//
//        CustomerInfo customerInfo = cartInfo.getCustomerInfo();
//        order.setUser(userDAO.getUser(customerInfo.getUsername()));
//
//        session.persist(order);
//        int orderId = order.getId();
//        System.out.println("Po Order!");
//        List<CartLineInfo> lines = cartInfo.getCartLines();
//        System.out.println(lines.size());
//        int orderDetailId = this.getMaxOrderDetailNum();
//        List<Book> books = this.bookDAO.getBooks();
//
//        for (CartLineInfo line : lines) {
//            System.out.println("Pętla!");
//            orderDetailId += 1;
//            OrderDetail detail = new OrderDetail();
//            System.out.println("Nowy OrderDetail!");
//            detail.setId(orderDetailId);
//            detail.setOrder(order);
//            detail.setAmount(line.getAmount());
//            detail.setPrice(line.getProductInfo().getPrice());
//            detail.setQuantity(line.getQuantity());
//            System.out.println("Przed Book!");
//            int bookId = line.getProductInfo().getId();
//            Book book = books.get(bookId);
//            detail.setBook(book);
//            System.out.println("Po Book!" + detail.getId());
//            session.persist(detail);
//            System.out.println("Po OrderDetail!");
//        }
//
//        // Order Number!
//        cartInfo.setOrderNum(orderId);
//        System.out.println("Order Number!");
//        // Flush
//        session.flush();
//    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void saveOrder(CartInfo cartInfo) {
        Session session = this.sessionFactory.getCurrentSession();

        Order order = new Order();
        order.setOrderDate(new Timestamp(System.currentTimeMillis()));
        order.setAmount(cartInfo.getAmountTotal());
        order.setStatus("zlozono");
        CustomerInfo customerInfo = cartInfo.getCustomerInfo();
        order.setUser(userDAO.getUser(customerInfo.getUsername()));

        session.persist(order);

        int orderId = order.getId();
        List<CartLineInfo> lines = cartInfo.getCartLines();
        int orderDetailId = this.getMaxOrderDetailNum();
        List<Book> books = this.bookDAO.getBooks();

        for (CartLineInfo line : lines) {
            orderDetailId += 1;
            OrderDetail detail = new OrderDetail();

            detail.setId(orderDetailId);
            detail.setOrder(order);
            detail.setAmount(line.getAmount());
            detail.setPrice(line.getProductInfo().getPrice());
            detail.setQuantity(line.getQuantity());

            int bookId = line.getProductInfo().getId();
            Book book = books.get(bookId);
            detail.setBook(book);

            session.persist(detail);
        }

        // Order Number!
        cartInfo.setOrderNum(orderId);

        // Flush
        session.flush();
    }

    @Override
    @Transactional
    public void sendOrder(Order order){
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(order);
    }

    @Override
    @Transactional
    public Order getOrder(int orderId) {
        Session session = sessionFactory.getCurrentSession();
        return session.get(Order.class, orderId);
    }

    @Override
    public OrderInfo getOrderInfo(int orderId) {
        Order order = this.getOrder(orderId);
        if (order == null) {
            return null;
        }

        return new OrderInfo(order.getId(), order.getOrderDate(), order.getAmount(), order.getUser(), order.getStatus());
    }

    @Override
    @Transactional
    public List<OrderInfo> listOrderInfo() {
        Session session = this.sessionFactory.getCurrentSession();
        Query<Order> query = session.createQuery(" from Order", Order.class);
        List<Order> orders = query.getResultList();
        List<OrderInfo> orderInfos = new ArrayList<>();
        for(Order order: orders){
            orderInfos.add(new OrderInfo(order.getId(), order.getOrderDate(), order.getAmount(), order.getUser(), order.getStatus()));
        }
        return orderInfos;
    }

    @Override
    @Transactional
    public List<OrderInfo> listOrderInfoForUser(String username) {
        Session session = this.sessionFactory.getCurrentSession();
        Query<Order> query = session.createQuery("SELECT ord FROM Order ord WHERE ord.user.username = :username", Order.class);
        query.setParameter("username", username);
        List<Order> orders = query.getResultList();
        List<OrderInfo> orderInfos = new ArrayList<>();
        for(Order order: orders){
            orderInfos.add(new OrderInfo(order.getId(), order.getOrderDate(), order.getAmount(), order.getUser(), order.getStatus()));
        }
        return orderInfos;
    }

    @Override
    @Transactional
    public List<OrderDetail> listOrderDetail(int orderId){
        Session session = this.sessionFactory.getCurrentSession();
        Query<OrderDetail> query = session.createQuery("SELECT ord FROM OrderDetail ord WHERE ord.order.id = :orderId", OrderDetail.class);
        query.setParameter("orderId", orderId);
        List<OrderDetail> orderDetails = query.getResultList();
        return orderDetails;
    }

    @Override
    @Transactional
    public List<OrderDetailInfo> listOrderDetailInfo(int orderId) {
        List<OrderDetail> orderDetails = this.listOrderDetail(orderId);
        List<OrderDetailInfo> orderDetailsInfos = new ArrayList<>();
        for(OrderDetail orderDetail: orderDetails){
            orderDetailsInfos.add(new OrderDetailInfo(orderDetail.getId(), orderDetail.getBook().getId(), orderDetail.getBook().getName(), orderDetail.getQuantity(), orderDetail.getPrice(), orderDetail.getAmount()));
        }
        return orderDetailsInfos;
    }
}
