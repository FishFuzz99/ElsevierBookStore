package com.ElsevierResources.controllers;

import Models.Book;
import Models.JDBCOperator;
import Models.User;
import Models.UserDto;
import com.ElsevierResources.services.UserService;
import com.ElsevierResources.validation.EmailExistsException;
import org.springframework.http.HttpRequest;
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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.HashMap;
import java.util.Map;

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

    @RequestMapping(value="registration", method = RequestMethod.GET)
    public String viewRegistration()
    {
        return "registration";
    }


    @RequestMapping(value="front", method = RequestMethod.GET)
    public String viewFront(HttpServletRequest request)
    {
        Book book = new Book();

        book.setImage("../../images/book2.jpg");
        book.setTitle("Book Test Title");
        book.setAuthor("Testing Author");
        book.setPrice(25.54f);
        book.setDescription("This is a test description");

        Map<String, Object> map = new HashMap<>();
        map.put("book1", book);
        ModelAndView mav = new ModelAndView("someView", map);
        mav.addAllObjects(map);

        request.setAttribute("bookMap", map);

        return "front";
    }

    @RequestMapping(value="signOn", method=RequestMethod.GET)
    public String viewSignOn () {return "signOn";}

    @RequestMapping(value="shoppingCart", method=RequestMethod.GET)
    public String viewShoppingCart () {return "shoppingCart";}

    @RequestMapping(value="checkout", method=RequestMethod.GET)
    public String viewCheckout () {return "checkout";}

    @RequestMapping(value="login", method=RequestMethod.POST)
    public String loginTest(HttpServletRequest request)
    {
        HttpSession session = request.getSession();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");
        if (!(email.isEmpty() || email.equals("")))
        {
            User user = jdbcOperator.findUserByEmail(email);
            if (user == null || (user.getFirstName().equals("") || user.getEmail().equals("")) || user.getEmail().isEmpty() || user.getFirstName().isEmpty() )
            {
                // failed to log in
            }
            else
            {
                user.setPassword("");
                session.setAttribute("user", user);
            }
        }
        return "front";
    }

    @RequestMapping(value = "/user/registration", method = RequestMethod.GET)
        public String showRegistrationForm(HttpServletRequest request, Model model) {

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

        ModelAndView mv = new ModelAndView();
        return mv;
        // rest of the implementation
    }
    private User createUserAccount(UserDto accountDto, BindingResult result) {
        User registered = null;
        UserService service = new UserService(jdbcOperator);
        try {
            registered = service.registerNewUserAccount(accountDto);
        } catch (EmailExistsException e) {
            return null;
        }
        return registered;
    }


}
