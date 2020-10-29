import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/logServlet")
public class logServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String responseText ="";

        String login = request.getParameter("login").trim();
        String password = request.getParameter("password").trim();

  /*     if (valid_login.equals(login) && valid_password.equals(password)){
            responseText = "success";

            session.setMaxInactiveInterval(60);
            session.setAttribute("login", "Student");
            session.setAttribute("name", "John");


        } else {
            responseText = "There is no Such User!";
        }

        response.setContentType("text/plain");
        response.getWriter().write(responseText);*/
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
