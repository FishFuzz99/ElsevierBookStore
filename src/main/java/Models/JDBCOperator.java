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

    public JDBCOperator() {
        try {
            Class.forName(JDBC_DRIVER);
            connection = DriverManager.getConnection(DB_URL, "root", "password");


        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException es) {
            es.printStackTrace();
        }


    }

    public void placeOrder(String orderDate, String total, String shipmentDate, String street, String city, String zipcode, String state, int userId) {
        try {
            preparedStatement = connection.prepareStatement("INSERT INTO orders(orderDate,total,shipmentDate,street,city,zipcode,state) VALUES(?,?,?,?,?,?,?,?)");
            preparedStatement.setString(1, orderDate);
            preparedStatement.setString(2, total);
            preparedStatement.setString(3, shipmentDate);
            preparedStatement.setString(4, street);
            preparedStatement.setString(5, city);
            preparedStatement.setString(6, zipcode);
            preparedStatement.setString(7, state);
            preparedStatement.setInt(8, userId);

            preparedStatement.execute();

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public List<Order> getOrderHistory(int userId) {
        List<Order> orderList = new ArrayList<Order>();

        try {
            preparedStatement = connection.prepareStatement("SELECT * FROM orders WHERE userID = ?");
            preparedStatement.setInt(1, userId);
            ResultSet orders = preparedStatement.executeQuery();
            while (orders.next()) {
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

    public List<Book> getWishlist() {
        List<Book> wishlist = new ArrayList<Book>();

        try {
            preparedStatement = connection.prepareStatement("SELECT * FROM books");
            ResultSet books = preparedStatement.executeQuery();
            while (books.next()) {
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

    public Book getBook(int id) {
        Book book = new Book();
        try {
            preparedStatement = connection.prepareStatement("SELECT * FROM books WHERE bookID = ?");
            preparedStatement.setString(1, String.valueOf(id));
            ResultSet rs = preparedStatement.executeQuery();
            if ((rs != null) && rs.next()) {
                book.title = rs.getString("title");
                book.author = rs.getString("author");
                book.description = rs.getString("description");
                book.price = rs.getFloat("price");
                book.ISBN = rs.getString("ISBN");
                book.publisher = rs.getString("publisher");
                book.datePublished = rs.getDate("datePublished");
                book.edition = rs.getString("edition");
                book.numberOfPages = rs.getInt("numberOfPages");
                book.genre = rs.getString("genre");
                book.image = rs.getString("imageURL");
                book.format = rs.getString("format");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return book;
    }

    public void updatePassword(int userId,String password){
        try {
            preparedStatement = connection.prepareStatement("UPDATE users SET password =? WHERE userID=?");
            preparedStatement.setString(1,password);
            preparedStatement.setInt(2,userId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void updatePayment(int userId,String cardNumber,String cardCVC){
        try {
            preparedStatement = connection.prepareStatement("UPDATE users SET cardNumber =?,CVC = ?  WHERE userID=?");
            preparedStatement.setString(1,cardNumber);
            preparedStatement.setString(2,cardCVC);
            preparedStatement.setInt(3,userId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateShipping(int userId,String firstName,String lastName,String email,String street,String city,String state,String zipCode){
        try {
            preparedStatement = connection.prepareStatement("UPDATE users SET firstName =?,lastName = ?,email = ?, street = ?, city = ?, state = ? , zipCode = ?  WHERE userID=?");
            preparedStatement.setString(1,firstName);
            preparedStatement.setString(2,lastName);
            preparedStatement.setString(3,email);
            preparedStatement.setString(4,street);
            preparedStatement.setString(5,city);
            preparedStatement.setString(6,state);
            preparedStatement.setString(7,zipCode);
            preparedStatement.setInt(8,userId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public Book insertBook(Book book) {

        try {
            preparedStatement = connection.prepareStatement("INSERT INTO books (title, author,description,price,ISBN,publisher,format,datePublished,edition,numberOfPages,genre, imageURL) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)");
            preparedStatement.setString(1, book.getTitle());
            preparedStatement.setString(2, book.getAuthor());
            preparedStatement.setString(3, book.getDescription());
            preparedStatement.setFloat(4, book.getPrice());
            preparedStatement.setString(5, book.getISBN());
            preparedStatement.setString(6, book.getPublisher());
            preparedStatement.setString(7, book.getFormat());
            java.sql.Date sqlDate = new java.sql.Date(book.getDatePublished().getTime());
            preparedStatement.setDate(8, sqlDate);
            preparedStatement.setString(9, book.getEdition());
            preparedStatement.setInt(10, book.getNumberOfPages());
            preparedStatement.setString(11, book.getGenre());
            preparedStatement.setString(12, book.getImage());
            preparedStatement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return book;
    }

    public Book updateBook(Book book) {

        try {
            preparedStatement = connection.prepareStatement("UPDATE books SET title=?, author=?,description=?,price=?,IBSN=?,publisher=?,format=?,datePublished=?,edition=?,numberOfPages=?,genre=?, imageURL=? WHERE bookID =?");
            preparedStatement.setString(1, book.getTitle());
            preparedStatement.setString(2, book.getAuthor());
            preparedStatement.setString(3, book.getDescription());
            preparedStatement.setFloat(4, book.getPrice());
            preparedStatement.setString(5, book.getISBN());
            preparedStatement.setString(6, book.getPublisher());
            preparedStatement.setString(7, book.getFormat());
            java.sql.Date sqlDate = new java.sql.Date(book.getDatePublished().getTime());
            preparedStatement.setDate(8, sqlDate);
            preparedStatement.setString(9, book.getEdition());
            preparedStatement.setInt(10, book.getNumberOfPages());
            preparedStatement.setString(11, book.getGenre());
            preparedStatement.setInt(12, book.getID());
            preparedStatement.setString(13, book.getImage());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return book;
    }

    public void deleteBook(Book book) {
        try {
            preparedStatement = connection.prepareStatement("DELETE FROM books WHERE bookID=?");
            preparedStatement.setInt(1, book.getID());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public User saveUser(User user) {
        try {
            if (user.getCity() != null
                    && user.getStreet() != null
                    && !user.getCity().isEmpty()
                    && !user.getCity().equals("")
                    && !user.getStreet().isEmpty()
                    && !user.getStreet().equals("")) {
                preparedStatement = connection.prepareStatement("INSERT INTO users(firstName, lastName, email, password, street, city, state, zipCode) VALUES(?, ?, ?, ?, ?, ?, ?, ?)");
                preparedStatement.setString(5, user.getStreet());
                preparedStatement.setString(6, user.getCity());
                preparedStatement.setString(7, user.getState());
                preparedStatement.setString(8, user.getZipCode());
            } else {
                preparedStatement = connection.prepareStatement("INSERT INTO users(firstName, lastName, email, password) VALUES(?, ?, ?, ?)");
            }
            preparedStatement.setString(1, user.getFirstName());
            preparedStatement.setString(2, user.getLastName());
            preparedStatement.setString(3, user.getEmail());
            preparedStatement.setString(4, user.getPassword());

            preparedStatement.execute();


        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public List<Book> homeBooks() {
        List<Book> books = new ArrayList<>();

        try {
            preparedStatement = connection.prepareStatement("SELECT * FROM books ORDER BY RAND() LIMIT 10");


            ResultSet rs = preparedStatement.executeQuery();

            Book book;

            while (rs != null && rs.next()) {
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

                if (author != null && !author.isEmpty() && !author.equals("")) {
                    book.setAuthor(author);
                }

                if (title != null && !title.isEmpty() && !title.equals("")) {
                    book.setTitle(title);
                }

                if (genre != null && !genre.isEmpty() && !genre.equals("")) {
                    book.setGenre(genre);
                }


                book.setNumberOfPages(numberOfPages);
                book.setPrice(price);
                book.setID(ID);

                if (datePublished != null) {
                    book.setDatePublished(datePublished);
                }

                if (edition != null && !edition.isEmpty() && !edition.equals("")) {
                    book.setEdition(edition);
                }

                if (ISBN != null && !ISBN.isEmpty() && !ISBN.equals("")) {
                    book.setISBN(ISBN);
                }

                if (imageURL != null && !imageURL.isEmpty() && !imageURL.equals("")) {
                    book.setImage(imageURL);
                }

                if (format != null && !format.isEmpty() && !format.equals("")) {
                    book.setFormat(format);
                }

                if (description != null && !description.isEmpty() && !description.equals("")) {
                    book.setDescription(description);
                }

                books.add(book);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return books;
    }

    public List<Book> searchBooks(String category, String query, int levenshteinDistance) {
        List<Book> books = new ArrayList<>();
        try {
            switch (category) {
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

            while (rs != null && rs.next()) {
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

                if (author != null && !author.isEmpty() && !author.equals("")) {
                    book.setAuthor(author);
                }

                if (title != null && !title.isEmpty() && !title.equals("")) {
                    book.setTitle(title);
                }

                if (genre != null && !genre.isEmpty() && !genre.equals("")) {
                    book.setGenre(genre);
                }


                book.setNumberOfPages(numberOfPages);
                book.setPrice(price);
                book.setID(ID);

                if (datePublished != null) {
                    book.setDatePublished(datePublished);
                }

                if (edition != null && !edition.isEmpty() && !edition.equals("")) {
                    book.setEdition(edition);
                }

                if (ISBN != null && !ISBN.isEmpty() && !ISBN.equals("")) {
                    book.setISBN(ISBN);
                }

                if (imageURL != null && !imageURL.isEmpty() && !imageURL.equals("")) {
                    book.setImage(imageURL);
                }

                if (format != null && !format.isEmpty() && !format.equals("")) {
                    book.setFormat(format);
                }

                if (description != null && !description.isEmpty() && !description.equals("")) {
                    book.setDescription(description);
                }

                books.add(book);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return books;
    }

    public User findUserByEmail(String email) {
        User user = null;
        try {
            preparedStatement = connection.prepareStatement("SELECT * FROM users WHERE email LIKE ?");
            preparedStatement.setString(1, email);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs != null && rs.next()) {
                user = new User();
                user.setID(rs.getInt("userId"));
                user.setFirstName(rs.getString("firstName"));
                user.setLastName(rs.getString("lastName"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setAdmin(rs.getBoolean("isAdmin"));

                String city = rs.getString("city");
                String street = rs.getString("street");
                String zipCode = rs.getString("zipCode");
                String state = rs.getString("state");

                if (city != null)
                {
                    user.setCity(city);
                }
                if (state != null)
                {
                    user.setCity(state);
                }
                if (zipCode != null)
                {
                    user.setCity(zipCode);
                }
                if (street != null)
                {
                    user.setStreet(street);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    public void addToWishlist(int bookID, int userID) {

        try {
            preparedStatement = connection.prepareStatement("INSERT INTO wishlistbooks(bookID, userID) VALUES(?, ?)");

            preparedStatement.setInt(1, bookID);
            preparedStatement.setInt(2, userID);

            preparedStatement.execute();

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
