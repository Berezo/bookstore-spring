package org.example.controller;


import org.example.adapter.TimestampAdapter;
import org.example.entity.Book;
import org.example.entity.Order;
import org.example.entity.OrderDetail;
import org.example.entity.User;
import org.example.model.OrderDetailInfo;
import org.example.model.OrderInfo;
import org.example.services.BookService;
import org.example.services.OrderService;
import org.example.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

@Controller
@RequestMapping("/orders")
public class OrderController {
    private OrderService orderService;
    private UserService userService;
    @XmlJavaTypeAdapter(TimestampAdapter.class)
    private Timestamp orderDate;

    @Autowired
    public void setOrderService(OrderService orderService) { this.orderService = orderService; }

    @Autowired
    public void setUserService(UserService userService) { this.userService = userService; }


    //    @InitBinder
//    public void init(WebDataBinder binder) {
//        binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS"), true));
//    }

    @GetMapping("/list")
    public String list(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))){
            List<OrderInfo> orderInfos = orderService.listOrderInfo();
            model.addAttribute("orderInfos", orderInfos);

        }
        else{
            List<OrderInfo> orderInfos = orderService.listOrderInfoForUser(auth.getName());
            model.addAttribute("orderInfos", orderInfos);
        }
        return "orders/list";
    }

    @GetMapping("/send")
    public String send(@RequestParam("orderId") int orderId, Model model){
        Order order = orderService.getOrder(orderId);
        List<OrderDetailInfo> orderInfos = orderService.listOrderDetailInfo(orderId);
        orderDate = order.getOrderDate();
        model.addAttribute("order", order);
        model.addAttribute("orderInfos",orderInfos);
        model.addAttribute("orderDate", orderDate);
        return "orders/send";
    }

    @PostMapping("/send")
    public String send(@ModelAttribute("order") Order order){
        order.setOrderDate(orderDate);
        order.setStatus("wyslano");
        orderService.sendOrder(order);
        return "redirect:/orders/list";
    }

    @GetMapping("/details")
    public String details(@RequestParam("orderId") int orderId, Model model){
        Order order = orderService.getOrder(orderId);
        List<OrderDetailInfo> orderDetailInfos = orderService.listOrderDetailInfo(orderId);
        model.addAttribute("order", order);
        model.addAttribute("orderDetailInfos",orderDetailInfos);
        return "orders/details";
    }

}
