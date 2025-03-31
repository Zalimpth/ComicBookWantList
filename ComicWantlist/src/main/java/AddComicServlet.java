import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddComicServlet")
public class AddComicServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String title = request.getParameter("title");
        int issueNumber = Integer.parseInt(request.getParameter("issue_number"));
        String publisher = request.getParameter("publisher");
        String author = request.getParameter("author");
        String illustrator = request.getParameter("illustrator");
        boolean variantCover = "on".equals(request.getParameter("variant_cover"));
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/comicdb", "root", "password");
            String sql = "INSERT INTO comics (title, issue_number, publisher, author, illustrator, variant_cover) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, title);
            stmt.setInt(2, issueNumber);
            stmt.setString(3, publisher);
            stmt.setString(4, author);
            stmt.setString(5, illustrator);
            stmt.setBoolean(6, variantCover);
            stmt.executeUpdate();
            conn.close();
            response.sendRedirect("dashboard.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}