package org.example.dao;

import org.example.entity.Book;
import org.example.entity.Order;
import org.example.entity.OrderDetail;
import org.example.entity.User;
import org.example.model.*;
import org.example.services.EmailService;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Repository
public class OrderDAOImpl implements OrderDAO {
    private SessionFactory sessionFactory;
    private BookDAO bookDAO;
    private UserDAO userDAO;
    private EmailService emailService;

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

    @Autowired
    public void setEmailService(EmailService emailService) { this.emailService = emailService; }

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
//        Session session = this.sessionFactory.getCurrentSession();
//
//        Order order = new Order();
//        order.setOrderDate(new Timestamp(System.currentTimeMillis()));
//        order.setAmount(cartInfo.getAmountTotal());
//        order.setStatus("zlozono");
//        CustomerInfo customerInfo = cartInfo.getCustomerInfo();
//        order.setUser(userDAO.getUser(customerInfo.getUsername()));
//
//        session.persist(order);
//
//        int orderId = order.getId();
//        List<CartLineInfo> lines = cartInfo.getCartLines();
//        int orderDetailId = this.getMaxOrderDetailNum();
//        List<Book> books = this.bookDAO.getBooks();
//
//        for (CartLineInfo line : lines) {
//            orderDetailId += 1;
//            OrderDetail detail = new OrderDetail();
//
//            detail.setId(orderDetailId);
//            detail.setOrder(order);
//            detail.setAmount(line.getAmount());
//            detail.setPrice(line.getProductInfo().getPrice());
//            detail.setQuantity(line.getQuantity());
//
//            int bookId = line.getProductInfo().getId();
//            Book book = books.get(bookId);
//            detail.setBook(book);
//
//            session.persist(detail);
//        }
//
//        // Order Number!
//        cartInfo.setOrderNum(orderId);
//
//        // Flush
//        session.flush();
//    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void saveOrder(CartInfo cartInfo) {
        Session session = this.sessionFactory.getCurrentSession();

        Order order = new Order();
        order.setOrderDate(new Timestamp(System.currentTimeMillis()));
        order.setAmount(BigDecimal.valueOf(cartInfo.getAmountTotal()).setScale(2, RoundingMode.HALF_UP).doubleValue());
        order.setStatus("zlozono");
        CustomerInfo customerInfo = cartInfo.getCustomerInfo();
        User user = userDAO.getUser(customerInfo.getUsername());
        order.setUser(user);

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
            detail.setAmount(BigDecimal.valueOf(line.getAmount()).setScale(2, RoundingMode.HALF_UP).doubleValue());
            detail.setPrice(BigDecimal.valueOf(line.getProductInfo().getPrice()).setScale(2, RoundingMode.HALF_UP).doubleValue());
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

        String body = "Zamowienie o numerze " + order.getId() + " zostalo przyjete. Prosimy o uregulowanie platnosci na numer konta 27 1140 4691 7613 7196 0217 8345" + order.toString() + "\nDane osobowe: " + user.toString() + "\nSzczegoly zamowienia:";
        List<OrderDetailInfo> orderDetailInfos = listOrderDetailInfo(order.getId());
        for(OrderDetailInfo orderInfo: orderDetailInfos){
            body += orderInfo.toString();
        }
        emailService.sendMail(user.getEmail(),"Bookstore order payment",body);
    }

//    @Override
//    @Transactional
//    public void sendOrder(Order order){
//        Session session = sessionFactory.getCurrentSession();
//        User user = userDAO.getUser(order.getUser().getUsername());
//        System.out.println("\n" + user.getUsername() + "\n");
//        System.out.println("\n" + user.getEmail() + "\n");
//        System.out.println("\n" + order + "\n");
//        emailService.sendMail(user.getEmail(),"Bookstore order",order.toString());
//        session.saveOrUpdate(order);
//    }

    @Override
    @Transactional
    public void sendOrder(Order order){
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(order);
//        System.out.println("\n" + user.getUsername() + "\n");
//        System.out.println("\n" + user.getEmail() + "\n");
//        System.out.println("\n" + order + "\n");
//        "\nDane osobowe: " + user.toString() +
//                "\nSzczegóły zamówienia:";

        User user = userDAO.getUser(order.getUser().getUsername());
        String body = "Zamowienie o numerze " + order.getId() + " zostalo wyslane." + order.toString() + "\nDane osobowe: " + user.toString() + "\nSzczegoly zamowienia:";
        List<OrderDetailInfo> orderDetailInfos = listOrderDetailInfo(order.getId());
        for(OrderDetailInfo orderInfo: orderDetailInfos){
            body += orderInfo.toString();
        }
        emailService.sendMail(user.getEmail(),"Bookstore order",body);
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
