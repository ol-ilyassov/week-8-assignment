import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.*;

@WebServlet("/logServlet")
public class logServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String input_login = request.getParameter("login").trim();
        String input_password = request.getParameter("password").trim();
        int id = 0;
        String responseText ="";

        boolean flag = false;
        String sql = "SELECT id FROM student WHERE login = ? AND password = ?";
        try {
            Connection connection = getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, input_login);
            ps.setString(2, input_password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                flag = true;
                id = rs.getInt("id");
            }
            ps.close();
            rs.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (flag) {
            responseText = "success";
            session.setAttribute("role", "Student");
            session.setAttribute("userid", id);
        } else {
            sql = "SELECT id FROM librarian WHERE login = ? AND password = ?";
            try {
                Connection connection = getConnection();
                PreparedStatement ps = connection.prepareStatement(sql);
                ps.setString(1, input_login);
                ps.setString(2, input_password);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    flag = true;
                    id = rs.getInt("id");
                }
                ps.close();
                rs.close();
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            if (flag){
                responseText = "success";
                session.setAttribute("role", "Librarian");
                session.setAttribute("userid", id);
            } else
                responseText = "There is no Such User!";
        }
        response.setContentType("text/plain");
        response.getWriter().write(responseText);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("index.jsp");
    }

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
}
