package org.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.example.entity.Authority;
import org.example.entity.User;
import org.example.services.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class RegistrationController {
    private final UserService userService;

    @Autowired
    public RegistrationController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping(value = {"/register", "/adminregister"})
    public String registerForm(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

    private String validate(User user) {
        if (userService.getUser(user.getUsername()) != null) {
            return "Użytkownik o takiej nazwie istnieje";
        } else if (user.getUsername().isEmpty() || user.getPassword().isEmpty()) {
            return "Wypełnij wszystkie pola";
        }
        return "";
    }

    @PostMapping("/register")
    public String saveUser(@ModelAttribute("user") User user, Model model) {
        String validator = validate(user);
        if (!validator.isEmpty()) {
            model.addAttribute("validator", validator);
            return "register";
        }
        user.getAuthorities().add(new Authority(user, "ROLE_USER"));
        userService.saveUser(user);
        return "redirect:/login";
    }

    @PostMapping("/adminregister")
    public String saveAdmin(@ModelAttribute("user") User user, Model model) {
        String validator = validate(user);
        if (!validator.isEmpty()) {
            model.addAttribute("validator", validator);
            return "adminregister";
        }
        user.getAuthorities().add(new Authority(user, "ROLE_USER"));
        user.getAuthorities().add(new Authority(user, "ROLE_ADMIN"));
        userService.saveUser(user);
        return "redirect:/login";
    }

    @RequestMapping("/success")
    public String loginPageRedirect(HttpServletRequest request, HttpServletResponse response, Authentication authResult) throws IOException, ServletException {

        String role =  authResult.getAuthorities().toString();
        System.out.println("ROLEEEE "+ role);
        if(role.contains("ROLE_ADMIN")){
            return "redirect:/admin";
        }
        else if(role.contains("ROLE_USER")) {
            return "redirect:/user";
        }
        return "redirect:/";
    }

    @RequestMapping(value="/logout", method = RequestMethod.GET)
    public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null){
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/login?logout";
    }

    @GetMapping("/user")
    public String user(){ return "user"; }

    @GetMapping("/admin")
    public String admin(){ return "admin"; }

    @GetMapping("/user/edit")
    public String personalDataForm(@RequestParam("username") String username, Model model) {
        model.addAttribute("user", userService.getUser(username));
        return "personal";
    }

    @PostMapping("/user/edit")
    public String savePersonalData(@ModelAttribute("user") User user, Model model) {
        userService.updateUser(user);
        return "redirect:/user";
    }
}
