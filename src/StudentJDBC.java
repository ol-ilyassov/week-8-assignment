import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class StudentJDBC {
    private static StudentJDBC instance = new StudentJDBC();
    public static StudentJDBC getInstance() {
        return instance;
    }
    private StudentJDBC() {}
    private Connection getConnection() {
        Context initialContext;
        Connection connection = null;
        try {
            initialContext = new InitialContext();
            Context envCtx = (Context)initialContext.lookup("java:comp/env");
            DataSource ds = (DataSource)envCtx.lookup("jdbc/db");
            connection = ds.getConnection();
        }
        catch (NamingException | SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public int checkForID(Student student) {
        int counter = 0;
        String sql = "SELECT name FROM student WHERE id = ?";
        try {
            Connection connection = getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, student.getId());
            ResultSet rs = ps.executeQuery();
            while ( rs.next() ) {
                counter++;
            }
            ps.close();
            rs.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return counter;
    }

    public Student create(Student student) {
        String sql = "INSERT INTO student(id,name,surname,login,password,deleted) VALUES (?,?,?,?,?,0)";
        try {
            Connection connection = getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, student.getId());
            ps.setString(2, student.getName());
            ps.setString(3, student.getSurname());
            ps.setString(4, student.getLogin());
            ps.setString(5, student.getPassword());
            ps.executeUpdate();
            ps.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return student;
    }

    public void update(Student student) {
        String sql = "UPDATE student SET name = ?, surname = ?, login = ?, password = ? WHERE id = ?";
        try {
            Connection connection = getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, student.getName());
            ps.setString(2, student.getSurname());
            ps.setString(3, student.getLogin());
            ps.setString(4, student.getPassword());
            ps.setInt(5, student.getId());
            ps.executeUpdate();
            ps.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void delete(int id) {
        String sql = "UPDATE student SET deleted = 1 WHERE id = ?";
        try {
            Connection connection = getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
            ps.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
