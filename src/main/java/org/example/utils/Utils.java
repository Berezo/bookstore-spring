package org.example.utils;

import org.example.entity.User;
import org.example.model.CartInfo;
import org.example.model.CustomerInfo;

import javax.servlet.http.HttpServletRequest;


public class Utils {

    // Products in the cart, stored in Session.


    public static CartInfo getCartInSession(HttpServletRequest request, User user) {

        CartInfo cartInfo = (CartInfo) request.getSession().getAttribute("cart");

        if (cartInfo == null) {
            cartInfo = new CartInfo();
            cartInfo.setCustomerInfo(new CustomerInfo(user));

            request.getSession().setAttribute("cart", cartInfo);
        }

        return cartInfo;
    }

    public static void removeCartInSession(HttpServletRequest request) {
        request.getSession().removeAttribute("cart");
    }

    public static void storeLastOrderedCartInSession(HttpServletRequest request, CartInfo cartInfo) {
        request.getSession().setAttribute("lastOrderedCart", cartInfo);
    }

    public static CartInfo getLastOrderedCartInSession(HttpServletRequest request) {
        return (CartInfo) request.getSession().getAttribute("lastOrderedCart");
    }

}