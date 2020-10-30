import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class BookJDBC {
    // create singleton
    private static BookJDBC instance = new BookJDBC();

    public static BookJDBC getInstance() {
        return instance;
    }

    private BookJDBC() {}

    private Connection getConnection()
    {
        Context initialContext;
        Connection connection = null;
        try
        {
            initialContext = new InitialContext();
            Context envCtx = (Context)initialContext.lookup("java:comp/env");
            DataSource ds = (DataSource)envCtx.lookup("jdbc/db");
            connection = ds.getConnection();
        }
        catch (NamingException | SQLException e)
        {
            e.printStackTrace();
        }
        return connection;
    }

    public Book create(Book book ) {
        String sql = "INSERT INTO book ( isbn,name,author,count,deleted) VALUES ( ?,?,?,?,0)";
        try {
            Connection connection = getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, book.getIsbn());
            ps.setString(2, book.getName());
            ps.setString(3, book.getAuthor());
            ps.setInt(4, book.getCount());
            ps.executeUpdate();
            ps.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return book;
    }

    public void delete(int isbn) {
        System.out.println("Delete:"+isbn);
        String sql = "UPDATE book SET deleted=1 WHERE isbn = ?";
        try {
            Connection connection = getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, isbn);
            ps.executeUpdate();
            ps.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
