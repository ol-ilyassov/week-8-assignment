import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ServletBorrowedBook")
public class ServletBorrowedBook extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int isbn = Integer.parseInt(request.getParameter("bookIsbn"));
        int count = Integer.parseInt(request.getParameter("count"));
        String returnDate = request.getParameter("returnDate");

        String responseText = "";

        int cond1 = BookJDBC.getInstance().getCount(isbn);
        if (count > cond1) {
            responseText = "ERROR: Not Enough Books in Library";
        } else {
            StudentJDBC.getInstance().addBookToStudent(id, isbn, count, returnDate);
            BookJDBC.getInstance().setCount(isbn,cond1 - count);
            responseText = "SUCCESS: Book(s) is(are) given.";
        }

        request.setAttribute("response", responseText);
        request.getRequestDispatcher("studentBooks.jsp?id="+id).forward(request, response);
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = request.getParameter("id") != null ? Integer.parseInt(request.getParameter("id")) : 0;
        int isbn = Integer.parseInt(request.getParameter("isbn"));
        int count = Integer.parseInt(request.getParameter("count"));

        int temp = BookJDBC.getInstance().getCount(isbn);
        BookJDBC.getInstance().setCount(isbn, count + temp);
        BookJDBC.getInstance().deleteBorrowedBook(id);
    }
}
