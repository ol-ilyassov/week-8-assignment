import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ServletStudent")
public class ServletStudent extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String action = req.getParameter("action");
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String surname = req.getParameter("surname");
        String login = req.getParameter("login");
        String password = req.getParameter("password");
        Student student = new Student(id, name, surname, login, password);

        String responseText = "";

        if (action.equals("add")) {
            int number  = StudentJDBC.getInstance().checkForID(student);
            if (number == 0) {
                StudentJDBC.getInstance().create(student);
                responseText = "SUCCESS: Student account created.";
            } else {
                responseText = "ERROR: Student with same ID is exist.";
            }
        } else if (action.equals("update")) {
            StudentJDBC.getInstance().update(student);
            responseText = "SUCCESS: Student information Updated.";
        }
        req.setAttribute("response", responseText);
        req.getRequestDispatcher("studentsList.jsp").forward(req, resp);
    }
    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = req.getParameter("id") != null ? Integer.parseInt(req.getParameter("id")) : 0;

        StudentJDBC.getInstance().delete(id);

        String responseText = "";
    }
}
