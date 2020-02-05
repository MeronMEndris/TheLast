package edu.mum.controller;

import edu.mum.domain.Role;
import edu.mum.domain.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.List;

@Controller
public class HomeController {

    @RequestMapping(value = {"/", "/index"} , method = RequestMethod.GET)
    public String index() {
        String str = "uya";
        return "welcome";
    }

    @RequestMapping(value = {"/login"} , method = RequestMethod.GET)
    public String login() {
        return "login";
    }

    @RequestMapping(value = {"/signup"} , method = RequestMethod.GET)
    public String signUp(@ModelAttribute("userSignup") User user, Model model) {
        List<Role> roles = new ArrayList<>();
        roles.add(Role.ADMIN);
        roles.add(Role.OWNER);
        roles.add(Role.RENTER);
        model.addAttribute("roles", roles);
        return "signup";
    }

}
