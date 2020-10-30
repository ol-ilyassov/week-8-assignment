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
        int isbn = Integer.parseInt(req.getParameter("isbn"));
        String name = req.getParameter("name");
        String author = req.getParameter("author");
        int count = Integer.parseInt(req.getParameter("count"));

        Book book = new Book(isbn,name,author,count);
        BookJDBC.getInstance().create(book);
        resp.sendRedirect("index.jsp");
    }
    /*Answer to delete method*/
    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int isbn = req.getParameter("isbn") != null ? Integer.parseInt(req.getParameter("isbn")) : 0;

        BookJDBC.getInstance().delete(isbn);

    }
}
