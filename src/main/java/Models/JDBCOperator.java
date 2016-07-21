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
            connection = DriverManager.getConnection(DB_URL, "root", "74Challenger");


        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException es)
        {
            es.printStackTrace();
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
                book.authors = new ArrayList<String>();
                book.authors.add(rs.getString("author"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return book;
    }


}
