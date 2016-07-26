package Models;

import java.sql.*;

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
            connection = DriverManager.getConnection(DB_URL, "root", "password");


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

    public Book getBook(int id)
    {
        Book book = new Book();
        try {
            preparedStatement = connection.prepareStatement("SELECT * FROM booktest WHERE id = ?");
            preparedStatement.setString(1, String.valueOf(id));
            ResultSet rs = preparedStatement.executeQuery();
            if (rs != null)
            {
                rs.next();
                book.title = rs.getString("title");
                book.author = rs.getString("author");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return book;
    }



    public Book insertBook(Book book) {

        try {
            preparedStatement = connection.prepareStatement("INSERT INTO books(title, author,description,price,IBSN,publisher,format,datePublished,edition,numberOfPages,genre) VALUES (?,?,?,?,?,?,?,?,?,?,?)");
            preparedStatement.setString(1,book.getTitle());
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
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return book;
    }

    public Book updateBook(Book book) {

        try {
            preparedStatement = connection.prepareStatement("UPDATE books SET title=?, author=?,description=?,price=?,IBSN=?,publisher=?,format=?,datePublished=?,edition=?,numberOfPages=?,genre=? WHERE bookID =?");
            preparedStatement.setString(1,book.getTitle());
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
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return book;
    }

    public void deleteBook(Book book){
        try {
            preparedStatement = connection.prepareStatement("DELETE FROM books WHERE bookID=?");
            preparedStatement.setInt(1,book.getID());
            preparedStatement.executeUpdate();

        }catch (SQLException e) {
        e.printStackTrace();
        }
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
