import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/servlet")
public class Servlet extends HttpServlet {
    /*Answer to post method*/
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String task = req.getParameter("task");
        Todo todo = new Todo(0, task);
        TodoJDBC.getInstance().create(todo);
        resp.sendRedirect("index.jsp");
    }
    /*Answer to delete method*/
    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = req.getParameter("id") != null ? Integer.parseInt(req.getParameter("id")) : 0;

        TodoJDBC.getInstance().delete(id);

    }
}
