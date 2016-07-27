package Models;

import java.sql.*;
import java.util.*;
import java.util.Date;

/**
 * Created by GRAY1 on 7/20/2016.
 */
public class JDBCOperator {

    public Connection connection;
    public PreparedStatement preparedStatement;



    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost/test_database";

    public JDBCOperator()
    {
        try {
            Class.forName(JDBC_DRIVER);
            connection = DriverManager.getConnection(DB_URL, "root", "Madcata8");


        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException es)
        {
            es.printStackTrace();
        }


    }

    public void  placeOrder(String orderDate, String total,String shipmentDate,String street,String city,String zipcode,String state){
        try {
            preparedStatement = connection.prepareStatement("INSERT INTO orders(orderDate,total,shipmentDate,street,city,zipcode,state) VALUES(?,?,?,?,?,?,?)");
            preparedStatement.setString(1,orderDate);
            preparedStatement.setString(2,total);
            preparedStatement.setString(3,shipmentDate);
            preparedStatement.setString(4,street);
            preparedStatement.setString(5,city);
            preparedStatement.setString(6,zipcode);
            preparedStatement.setString(7,state);

            preparedStatement.execute();

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public List<Order> getOrderHistory(){
        List<Order> orderList = new ArrayList<Order>();

        try {
            preparedStatement = connection.prepareStatement("SELECT * FROM orders");
            ResultSet orders = preparedStatement.executeQuery();
            while(orders.next()){
                Order order = new Order();
                order.setOrderID(orders.getInt("orderID"));
                order.setOrderDate(orders.getString("orderDate"));
                order.setPrice(orders.getString("total"));
                order.setTitle(orders.getString("state"));
                orderList.add(order);

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderList;
    }
    public List<Book> getWishlist(){
        List<Book> wishlist = new ArrayList<Book>();

        try {
            preparedStatement = connection.prepareStatement("SELECT * FROM books");
            ResultSet books = preparedStatement.executeQuery();
            while(books.next()){
                Book book = new Book();
                book.setTitle(books.getString("title"));
                //book.setPrice(wishlist.getInt("price"));
                book.setDescription(books.getString("description"));
                wishlist.add(book);

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return wishlist;
    }

    public Book getBook(int id)
    {
        Book book = new Book();
        try {
            preparedStatement = connection.prepareStatement("SELECT * FROM booktest WHERE id = ?");
            preparedStatement.setString(1, String.valueOf(id));
            ResultSet rs = preparedStatement.executeQuery();
            if ((rs != null) && rs.next()) {
                book.title = rs.getString("title");
                book.author = rs.getString("author");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return book;
    }

    public User saveUser(User user)
    {
        try
        {
            if (user.getCity() != null
                    && user.getStreet() != null
                    && !user.getCity().isEmpty()
                    && !user.getCity().equals("")
                    && !user.getStreet().isEmpty()
                    && !user.getStreet().equals(""))
            {
                preparedStatement = connection.prepareStatement("INSERT INTO users(firstName, lastName, email, password, street, city, state, zipCode) VALUES(?, ?, ?, ?, ?, ?, ?, ?)");
                preparedStatement.setString(5, user.getStreet());
                preparedStatement.setString(6, user.getCity());
                preparedStatement.setString(7, user.getState());
                preparedStatement.setString(8, user.getZipCode());
            }
            else
            {
                preparedStatement = connection.prepareStatement("INSERT INTO users(firstName, lastName, email, password) VALUES(?, ?, ?, ?)");
            }
            preparedStatement.setString(1, user.getFirstName());
            preparedStatement.setString(2, user.getLastName());
            preparedStatement.setString(3, user.getEmail());
            preparedStatement.setString(4, user.getPassword());

            preparedStatement.execute();


        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return user;
    }

    public List<Book> searchBooks(String category, String query, int levenshteinDistance)
    {
        List<Book> books = new ArrayList<>();
        try
        {
            switch (category)
            {
                case "title":
                    preparedStatement = connection.prepareStatement("SELECT * FROM books WHERE levenshtein(title, ?) <= ?");
                    break;
                case "author":
                    preparedStatement = connection.prepareStatement("SELECT * FROM books WHERE levenshtein(author, ?) <= ?");
                    break;
                case "isbn":
                    preparedStatement = connection.prepareStatement("SELECT * FROM books WHERE levenshtein(isbn, ?) <= ?");
                    break;
                case "genre":
                    preparedStatement = connection.prepareStatement("SELECT * FROM books WHERE levenshtein(genre, ?) <= ?");
                    break;
            }


            preparedStatement.setString(1, query);
            preparedStatement.setInt(2, levenshteinDistance);

            ResultSet rs = preparedStatement.executeQuery();

            Book book;

            while(rs != null && rs.next())
            {
                book = new Book();
                int ID = rs.getInt("bookID");
                String title = rs.getString("title");
                String author = rs.getString("author");
                String description = rs.getString("description");
                Date datePublished = rs.getDate("datePublished");
                float price = rs.getFloat("price");
                String ISBN = rs.getString("ISBN");
                String edition = rs.getString("edition");
                int numberOfPages = rs.getInt("numberOfPages");
                String format = rs.getString("format");
                String genre = rs.getString("genre");
                String imageURL = rs.getString("imageURL");

                if (author != null && !author.isEmpty() && !author.equals(""))
                {
                    book.setAuthor(author);
                }

                if (title != null && !title.isEmpty() && !title.equals(""))
                {
                    book.setTitle(title);
                }

                if (genre != null && !genre.isEmpty() && !genre.equals(""))
                {
                    book.setGenre(genre);
                }


                book.setNumberOfPages(numberOfPages);
                book.setPrice(price);
                book.setID(ID);

                if (datePublished != null)
                {
                    book.setDatePublished(datePublished);
                }

                if (edition != null && !edition.isEmpty() && !edition.equals(""))
                {
                    book.setEdition(edition);
                }

                if (ISBN != null && !ISBN.isEmpty() && !ISBN.equals(""))
                {
                    book.setISBN(ISBN);
                }

                if (imageURL != null && !imageURL.isEmpty() && !imageURL.equals(""))
                {
                    book.setImage(imageURL);
                }

                if (format != null && !format.isEmpty() && !format.equals(""))
                {
                    book.setFormat(format);
                }

                if (description != null && !description.isEmpty() && !description.equals(""))
                {
                    book.setDescription(description);
                }

                books.add(book);
            }

        }
        catch (Exception e)
        {
            e.printStackTrace();
        }

        return books;
    }

    public User findUserByEmail(String email)
    {
        User user = null;
        try
        {
            preparedStatement = connection.prepareStatement("SELECT * FROM users WHERE email LIKE ?");
            preparedStatement.setString(1, email);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs != null && rs.next())
            {
                user = new User();
                user.setID(rs.getInt("userId"));
                user.setFirstName(rs.getString("firstName"));
                user.setLastName(rs.getString("lastName"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                if (!(rs.getString("city")).isEmpty())
                {
                    user.setCity("city");
                }
                if (!(rs.getString("state")).isEmpty())
                {
                    user.setCity("state");
                }
                if (!(rs.getString("zipCode")).isEmpty())
                {
                    user.setCity("zipCode");
                }
                if (!(rs.getString("street")).isEmpty())
                {
                    user.setCity("street");
                }
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }

        return user;
    }

}
