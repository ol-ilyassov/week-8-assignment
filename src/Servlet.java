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
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String action = req.getParameter("action");
        int isbn = Integer.parseInt(req.getParameter("isbn"));
        String name = req.getParameter("name");
        String author = req.getParameter("author");
        int count = Integer.parseInt(req.getParameter("count"));
        String responseText = "";
        Book book = new Book(isbn,name,author,count);
        if (action.equals("add")) {
            int number = BookJDBC.getInstance().checkForISBN(book);
            if(number == 0) {
                BookJDBC.getInstance().create(book);
                responseText = "SUCCESS: Book was created";
            }else {
                responseText = "ERROR: Book with the same ISBN is exist";
            }
        } else if (action.equals("update")){
            BookJDBC.getInstance().update(isbn,name,author,count);
            responseText = "SUCCESS: Book details was updated!";
        }
        req.setAttribute("response",responseText);
        req.getRequestDispatcher("index.jsp").forward(req,resp);


    }
    /*Answer to delete method*/
    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int isbn = req.getParameter("isbn") != null ? Integer.parseInt(req.getParameter("isbn")) : 0;
        BookJDBC.getInstance().delete(isbn);

    }
}
