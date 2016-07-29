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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by GRAY1 on 7/18/2016.
 */
@Controller
public class HomeController {

    JDBCOperator jdbcOperator = new JDBCOperator();

    @RequestMapping(value="admin", method=RequestMethod.GET)
    public ModelAndView viewAdmin(){
        ModelAndView mv = new ModelAndView("admin");
        List<Book> books = jdbcOperator.homeBooks();
        mv.addObject("list", books);
        return mv;
    }


    @RequestMapping(value="updatePassword", method=RequestMethod.GET)
    public  String updatePassword(HttpServletRequest request){
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int userId = user.getID();
        System.out.println(userId);
        String password = request.getParameter("password");
        System.out.println(password);
        jdbcOperator.updatePassword(userId,password);
        System.out.println("Password Updated!!!!!");
        return "account";
    }

    @RequestMapping(value="updatePay", method=RequestMethod.GET)
    public  String updatePay(HttpServletRequest request){
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int userId = user.getID();
        System.out.println(userId);
        String cardNumber = request.getParameter("number");
        String cardCVC = request.getParameter("cvc");
        jdbcOperator.updatePayment(userId,cardNumber,cardCVC);
        System.out.println("Payment Updated");
        return "account";
    }


    @RequestMapping(value="updateShipping", method=RequestMethod.GET)
    public  String updateShipping(HttpServletRequest request){
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int userId = user.getID();
        System.out.println(userId);
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("surname");
        String email = request.getParameter("email");
        String street = request.getParameter("StShipAddress");
        String city = request.getParameter("CityShipAddress");
        String state = request.getParameter("StateShipAddress");
        String zipCode = request.getParameter("ZipCode");

        jdbcOperator.updateShipping(userId,firstName,lastName,email,street,city,state,zipCode);
        System.out.println("Information Updated");
        return "account";
    }

    @RequestMapping(value="account", method = RequestMethod.GET)
    public ModelAndView getAccountData(HttpServletRequest request)
    {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        System.out.println("User "+user.getID());
        ModelAndView model = new ModelAndView("account");
        List<Order> orders=jdbcOperator.getOrderHistory(user.getID());
        model.addObject("orders",orders);
        System.out.println(orders);
        List<Book> books=jdbcOperator.getWishlist();
        model.addObject("books",books);
        return model;
    }
    @RequestMapping(value="shoppingCart", method = RequestMethod.GET)
    public ModelAndView getShoppingCart(HttpServletRequest request)
    {
        HttpSession session = request.getSession();
        ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
        ModelAndView model = new ModelAndView("shoppingCart");
        List<Book> shoppingList = cart.getCartItems();

        model.addObject("shoppingList",shoppingList);
        return model;
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

        ModelAndView mv = new ModelAndView("front");

        List<Book> books = jdbcOperator.homeBooks();
        mv.addObject("list", books);
        return mv;
    }

    @RequestMapping(value="search", method = RequestMethod.POST)
    public ModelAndView search(HttpServletRequest request)
    {
        String category = request.getParameter("category");
        String query = request.getParameter("query");


        ModelAndView mv = new ModelAndView("front");
        mv.addObject("category", category);
        mv.addObject("query", query);

        if (category.isEmpty()
                || category.equals("")
                || query.isEmpty()
                || query.equals(""))
        {
            String error = "Please select a category and enter a search query.";
            mv.addObject("error", error);
            return mv;
        }

        int levenshteinDistance = (query.length() / 5) + 3;


        List<Book> books = jdbcOperator.searchBooks(category, query, levenshteinDistance);
        mv.addObject("list", books);
        return mv;
    }




    @RequestMapping(value="signOn", method=RequestMethod.GET)
    public String viewSignOn () {return "signOn";}


    @RequestMapping(value="checkout", method=RequestMethod.GET)
    public String viewCheckout () {
        return "checkout";}

    @RequestMapping(value="checkout", method=RequestMethod.POST)
    public String checkTest(HttpServletRequest request){
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
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
        int userId = user.getID();

        jdbcOperator.placeOrder("2016-07-29","100.75",null,shipStreetAddress,shipCityAddress,zipcode,shipStateAddress,userId);



        System.out.println(billFirstName);
        return "orderConfirmation";
    }


    @RequestMapping(value="login", method=RequestMethod.POST)
    public ModelAndView login(HttpServletRequest request)
    {
        HttpSession session = request.getSession();
        ModelAndView mv = new ModelAndView();
        mv.setViewName("front");

        if (session.getAttribute("user") != null)
        {
            return mv;
        }

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");
        if (email != null
                && !(email.isEmpty() || email.equals("")))
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
                if (user.isAdmin())
                {
                    session.setAttribute("isAdmin", "true");
                }
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

    @RequestMapping(value = "book", method = RequestMethod.GET, params = {"id"})
    public ModelAndView getBookData(@RequestParam("id") int id)
    {
        Book book = jdbcOperator.getBook(id);
        ModelAndView mv = new ModelAndView("book");
        mv.addObject("book", book);
        return mv;



    }

    @RequestMapping(value="addToCart", method = RequestMethod.POST)
    public void addToCart(HttpServletRequest request, HttpServletResponse response)
    {
        int id = Integer.valueOf(request.getParameter("id"));

        HttpSession session = request.getSession();

        ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");



        if (cart == null)
        {
            cart = new ShoppingCart();
            session.setAttribute("cart", cart);
        }

        cart.addToCart(jdbcOperator.getBook(id));
    }

    @RequestMapping(value="addToWishlist", method = RequestMethod.POST)
    public void addToWishlist(HttpServletRequest request, HttpServletResponse response)
    {
        int id = Integer.valueOf(request.getParameter("id"));

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (session.getAttribute("user") == null)
        {
            viewSignOn();
            return;
        }

        jdbcOperator.addToWishlist(id, user.getID());

    }


    @RequestMapping(value = "registerUserAccount", method = RequestMethod.POST)
    public ModelAndView registerUserAccount(@ModelAttribute("user") UserDto accountDto,
             BindingResult result, HttpServletRequest request, Errors errors) {
        User registered = new User();

        HttpSession session = request.getSession();
        ModelAndView mv = new ModelAndView("front");

        if (session.getAttribute("user") != null)
        {
            return mv;
        }

        if (!result.hasErrors()) {
            registered = createUserAccount(accountDto, result);
        }
        if (registered == null) {
            result.rejectValue("email", "message.regError");
        }

        registered.setPassword("");
        session.setAttribute("user", registered);


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

    public Book bookInfo(Book book, HttpServletRequest request) throws ParseException {

        String title = request.getParameter("bookTitle");
        String author = request.getParameter("author");
        String description = request.getParameter("message");
        String price = request.getParameter("price");
        String imageUrl = request.getParameter("imageUrl");
        String ISBN = request.getParameter("isbn");
        String publisher = request.getParameter("publisher");
        String format = request.getParameter("format");
        String datePublished = request.getParameter("publishDate");
        String edition = request.getParameter("edition");
        String numberOfPages = request.getParameter("pages");
        //  String tableOfContents = request.getParameter("tableOfContents");
        String genre = request.getParameter("genre");
        book.setTitle(title);
        book.setAuthor(author);
        book.setDescription(description);
        book.setPrice(Float.valueOf(price));
        book.setImage(imageUrl);
        book.setISBN(ISBN);
        book.setPublisher(publisher);
        book.setFormat(format);
        DateFormat df = new SimpleDateFormat("mm/dd/yyyy");
        Date dateDF = (Date) df.parse(datePublished);
        book.setDatePublished(dateDF);
        book.setEdition(edition);
        book.setNumberOfPages(Integer.valueOf(numberOfPages));
        book.setGenre(genre);
        // book.setTableOfContents(tableOfContents);
        return book;
    }

    @RequestMapping(value = "insert", method = RequestMethod.GET)
        public String insertBookData(HttpServletRequest request) throws ParseException {
                Book book = new Book();
                book = bookInfo(book, request);
                JDBCOperator db = new JDBCOperator();
                db.insertBook(book);

                return "admin";

            }

        @RequestMapping(value = "update", method = RequestMethod.GET)
        public String updateBookData(HttpServletRequest request) throws ParseException, SQLException {
            Book book = new Book();
            book = bookInfo(book, request);
            JDBCOperator db = new JDBCOperator();
            String edit_selection = request.getParameter("edit_selection");
            book.setID(db.getBookByName(edit_selection));
            db.updateBook(book);


            return "admin";
            }

    @RequestMapping(value = "delete", method = RequestMethod.GET)
    public String deleteBookData(HttpServletRequest request) throws ParseException, SQLException {
        Book book = new Book();
        JDBCOperator db = new JDBCOperator();
        String selection = request.getParameter("selection");
        book.setID(db.getBookByName(selection));
        db.deleteBook(book);

        return "admin";



    }

 /*   @RequestMapping(value = "shoppingCart", method = RequestMethod.GET)
    public void insertShopBookData(HttpServletRequest request) throws ParseException {
        Book book = new Book();
        book = bookInfo(book, request);
        JDBCOperator db = new JDBCOperator();
        db.insertBook(book);

    }*/
    }


