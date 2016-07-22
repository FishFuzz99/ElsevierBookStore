package com.ElsevierResources.controllers;

import Models.Book;
import Models.JDBCOperator;
import Models.User;
import Models.UserDto;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.validation.Constraint;
import javax.validation.Payload;
import javax.validation.Valid;


import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;
import java.util.ArrayList;
import java.util.List;

import static java.lang.annotation.ElementType.ANNOTATION_TYPE;
import static java.lang.annotation.ElementType.FIELD;
import static java.lang.annotation.ElementType.TYPE;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

/**
 * Created by GRAY1 on 7/18/2016.
 */
@Controller
public class HomeController {

    JDBCOperator jdbcOperator = new JDBCOperator();

    @RequestMapping(value="account", method = RequestMethod.GET)
    public ModelAndView getAccountData()
    {
        ModelAndView mv = new ModelAndView("account");


        return mv;
    }

    @RequestMapping(value="home", method = RequestMethod.GET)
    public String viewHome()
    {
        return "home";
    }

    @RequestMapping(value="front", method = RequestMethod.GET)
    public String viewFront()
    {
        return "front";
    }

    @RequestMapping(value = "/user/registration", method = RequestMethod.GET)
    public String showRegistrationForm(WebRequest request, Model model) {
        UserDto userDto = new UserDto();
        model.addAttribute("user", userDto);
        return "registration";
    }

    @RequestMapping(value = "book", method = RequestMethod.GET, params = {"id"})
    public ModelAndView getBookData(@RequestParam("id") int id)
    {
        Book book = jdbcOperator.getBook(id); // replace this with database query that gets the information
        ModelAndView mv = new ModelAndView("book");
        mv.addObject("book", book);
        mv.addObject("testing", "testing");
        return mv;

    }

    @RequestMapping(value = "/user/registration", method = RequestMethod.POST)
    public ModelAndView registerUserAccount
            (@ModelAttribute("user") @Valid UserDto accountDto,
             BindingResult result, WebRequest request, Errors errors) {
        User registered = new User();
        if (!result.hasErrors()) {
            registered = createUserAccount(accountDto, result);
        }
        if (registered == null) {
            result.rejectValue("email", "message.regError");
        }
        // rest of the implementation
    }
    private User createUserAccount(UserDto accountDto, BindingResult result) {
        User registered = null;
        try {
            registered = service.registerNewUserAccount(accountDto);
        } catch (EmailExistsException e) {
            return null;
        }
        return registered;
    }


}
