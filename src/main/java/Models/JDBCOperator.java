package Models;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

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
