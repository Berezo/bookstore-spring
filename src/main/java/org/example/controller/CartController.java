package org.example.controller;

import org.example.entity.Book;
import org.example.model.CartInfo;
import org.example.model.CartLineInfo;
import org.example.services.BookService;
import org.example.services.OrderService;
import org.example.services.UserService;
import org.example.utils.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@Transactional
public class CartController {
    private OrderService orderService;
    private BookService bookService;
    private UserService userService;

    @Autowired
    public void setBookDAO(BookService bookService) { this.bookService = bookService; }

    @Autowired
    public void setOrderDAO(OrderService orderService) { this.orderService = orderService; }

    @Autowired
    public void setUserService(UserService userService) { this.userService = userService; }

    @InitBinder
    public void myInitBinder(WebDataBinder dataBinder) {
        Object target = dataBinder.getTarget();
        if (target == null) {
            return;
        }
        System.out.println("Target=" + target);

        // Case update quantity in cart
        // (@ModelAttribute("cartForm") @Validated CartInfo cartForm)
        if (target.getClass() == CartInfo.class) {

        }
    }

    @GetMapping("/cart")
    public String shoppingCartHandler(HttpServletRequest request, Model model) {
        String currentUserName = SecurityContextHolder.getContext().getAuthentication().getName();

        CartInfo cartInfo = Utils.getCartInSession(request, userService.getUser(currentUserName));

        model.addAttribute("cart", cartInfo);
        return "cart/details";
    }

    @PostMapping("/cart/add")
    public String shoppingCartHandler(@ModelAttribute("cart") CartInfo cart,
                                      HttpServletRequest request,
                                      Model model) {

        String currentUserName = SecurityContextHolder.getContext().getAuthentication().getName();

        CartInfo cartInfo = Utils.getCartInSession(request, userService.getUser(currentUserName));

        List<CartLineInfo> linesUpdate = cart.getCartLines();

        for (CartLineInfo lineUpdate : linesUpdate) {
            int bookId = lineUpdate.getProductInfo().getId();
            Book book = bookService.getBook(bookId);
            int quantityDiffrence = cartInfo.checkProductQuantity(lineUpdate.getProductInfo().getId(), lineUpdate.getQuantity());
            if (quantityDiffrence < 0){
                if (book.getQuantity() >= -quantityDiffrence){
                    book.setQuantity(book.getQuantity() + quantityDiffrence);
                    cartInfo.updateProduct(lineUpdate.getProductInfo().getId(), lineUpdate.getQuantity());
                }
            }else{
                book.setQuantity(book.getQuantity() + quantityDiffrence);
                cartInfo.updateProduct(lineUpdate.getProductInfo().getId(), lineUpdate.getQuantity());
            }
        }

        return "redirect:/cart";
    }

    @GetMapping("/cart/confirm")
    public String shoppingCartConfirmationReview(HttpServletRequest request, Model model) {
        String currentUserName = SecurityContextHolder.getContext().getAuthentication().getName();

        CartInfo cartInfo = Utils.getCartInSession(request, userService.getUser(currentUserName));

        if (cartInfo == null || cartInfo.isEmpty()) {

            return "redirect:/cart";
        } else if (!cartInfo.isValidCustomer()) {

            return "redirect:/user";
        }
        model.addAttribute("cart", cartInfo);

        return "/cart/confirm";
    }

    @PostMapping("/cart/confirm")
    public String shoppingCartConfirmationSave(HttpServletRequest request, Model model) {
        String currentUserName = SecurityContextHolder.getContext().getAuthentication().getName();

        CartInfo cartInfo = Utils.getCartInSession(request, userService.getUser(currentUserName));

        if (cartInfo.isEmpty()) {

            return "redirect:/cart";
        } else if (!cartInfo.isValidCustomer()) {

            return "redirect:/user";
        }
        try {
            orderService.saveOrder(cartInfo);
        } catch (Exception e) {
            return "/cart/confirm";
        }

        // Remove Cart from Session.
        Utils.removeCartInSession(request);

        // Store last cart.
        Utils.storeLastOrderedCartInSession(request, cartInfo);

        return "redirect:/cart/finalize";
    }

    @GetMapping("/cart/finalize")
    public String shoppingCartFinalize(HttpServletRequest request, Model model) {
        CartInfo lastOrderedCart = Utils.getLastOrderedCartInSession(request);
        if (lastOrderedCart == null) {
            return "redirect:/cart";
        }
        model.addAttribute("lastOrderedCart", lastOrderedCart);
        return "/cart/finalize";
    }
}
