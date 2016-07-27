package com.ElsevierResources.controllers;

import Models.*;
import com.ElsevierResources.services.UserService;
import com.ElsevierResources.validation.EmailExistsException;
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
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

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
    public ModelAndView viewFront(HttpServletRequest request)
    {
        Book book = new Book();

        book.setImage("/images/harry-potter1.jpg");
        book.setTitle("Book Test Title");
        book.setAuthor("Testing Author");
        book.setPrice(25.54f);
        book.setDescription("This is a test description");

        List<Book> booksList = new ArrayList<Book>();
        booksList.add(book);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("front");
        mav.addObject("list", booksList);

        return mav;
    }

    @RequestMapping(value="search", method = RequestMethod.GET)
    public ModelAndView search(HttpServletRequest request)
    {
        String category = request.getParameter("category");
        String query = request.getParameter("query");



        ModelAndView mv = new ModelAndView("front");

        if (category.isEmpty()
                || category.equals("")
                || query.isEmpty()
                || query.equals(""))
        {
            String error = "Please select a category and enter a search query.";
            mv.addObject("error", error);
            return mv;
        }

        int levenshteinDistance = (query.length() / 5) + 1;


        List<Book> books = jdbcOperator.searchBooks(category, query, levenshteinDistance);
        mv.addObject("list", books);
        return mv;
    }




    @RequestMapping(value="signOn", method=RequestMethod.GET)
    public String viewSignOn () {return "signOn";}

    @RequestMapping(value="shoppingCart", method=RequestMethod.GET)
    public String viewShoppingCart () {return "shoppingCart";}

    @RequestMapping(value="checkout", method=RequestMethod.GET)
    public String viewCheckout () {return "checkout";}

    @RequestMapping(value="checkout", method=RequestMethod.POST)
    public String checkTest(HttpServletRequest request){
        String billFirstName = request.getParameter("firstName1");
        String billSurname = request.getParameter("surname1");
        String billStreetAddress = request.getParameter("StBillAddress");
        String billStreetAddress2 = request.getParameter("StBillAddress2");
        String billCityAddress = request.getParameter("CityBillAddress");
        String billStateAddress = request.getParameter("StateBillAddress");
        String billEmail = request.getParameter("email1");
        String billPhone = request.getParameter("phone1");
        String shipFirstName = request.getParameter("firstName");
        String shipSurname = request.getParameter("surname");
        String shipStreetAddress = request.getParameter("StShipAddress");
        String shipStreetAddress2 = request.getParameter("StShipAddress2");
        String shipCityAddress = request.getParameter("CityShipAddress");
        String shipStateAddress = request.getParameter("StateShipAddress");
        String shipEmail = request.getParameter("email");
        String shipPhone = request.getParameter("phone");
        String cardType = request.getParameter("card");
        String cardNumber = request.getParameter("number");
        String expDate = request.getParameter("expdate");
        String zipcode = request.getParameter("ZipCodeShipAddress");

        jdbcOperator.placeOrder("2016-07-29","100.75",null,shipStreetAddress,shipCityAddress,zipcode,shipStateAddress);



        System.out.println(billFirstName);
        return "orderConfirmation";
    }


    @RequestMapping(value="login", method=RequestMethod.POST)
    public ModelAndView login(HttpServletRequest request)
    {
        HttpSession session = request.getSession();
        ModelAndView mv = new ModelAndView();
        mv.setViewName("front");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");
        if (!(email.isEmpty() || email.equals("")))
        {
            User user = jdbcOperator.findUserByEmail(email);
            if (user == null
                    || user.getFirstName() == null
                    || user.getEmail() == null
                    || user.getFirstName().equals("")
                    || user.getEmail().equals("")
                    || user.getEmail().isEmpty()
                    || user.getFirstName().isEmpty()
                    || !user.getPassword().equals(password))
            {
                mv.setViewName("signOn");
                String error = "No user with that email and password exists.";
                mv.addObject("error", error);
            }
            else
            {
                user.setPassword("");
                session.setAttribute("user", user);
            }
        }
        return mv;
    }

    @RequestMapping(value = "/user/registration", method = RequestMethod.GET)
    public String showRegistrationForm(WebRequest request, Model model) {
        UserDto userDto = new UserDto();
        model.addAttribute("user", userDto);
        return "registration";
    }

    @RequestMapping(value="test", method=RequestMethod.GET)
    public ModelAndView getOrderData(){
        ModelAndView model = new ModelAndView("account");
        List<Order> orders=jdbcOperator.getOrderHistory();
        model.addObject("orders",orders);
        System.out.println(orders);

        return model;
    }

    @RequestMapping(value = "book", method = RequestMethod.GET, params = {"id"})
    public ModelAndView getBookData(@RequestParam("id") int id)
    {
        Book book = jdbcOperator.getBook(id); // replace this with database query that gets the information
        ModelAndView mv = new ModelAndView("book");
        mv.addObject("book", book);
        return mv;



    }

    @RequestMapping(value = "registerUserAccount", method = RequestMethod.POST)
    public ModelAndView registerUserAccount(@ModelAttribute("user") UserDto accountDto,
             BindingResult result, HttpServletRequest request, Errors errors) {
        User registered = new User();
        if (!result.hasErrors()) {
            registered = createUserAccount(accountDto, result);
        }
        if (registered == null) {
            result.rejectValue("email", "message.regError");
        }
        HttpSession session = request.getSession();
        registered.setPassword("");
        session.setAttribute("user", registered);

        ModelAndView mv = new ModelAndView("front");
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
