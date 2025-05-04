import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddComicServlet")
public class AddComicServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int userId = 1;

        String title = request.getParameter("title");
        String issueNumber = request.getParameter("issue_number");
        String publisher = request.getParameter("publisher");
        String releaseYearStr = request.getParameter("release_year");

        int releaseYear = 0;
        try {
            releaseYear = Integer.parseInt(releaseYearStr);
        } catch (NumberFormatException e) {
            releaseYear = 0;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/comicdb", "root", "password");

            String sql = "INSERT INTO comic_want_list (user_id, comic_title, comic_issue, publisher, release_year) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);
            stmt.setString(2, title);
            stmt.setString(3, issueNumber);
            stmt.setString(4, publisher);
            stmt.setInt(5, releaseYear);

            stmt.executeUpdate();
            conn.close();

            response.sendRedirect("view_comics.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html");
            response.getWriter().println("<h2>Error Adding Comic</h2>");
            response.getWriter().println("<pre>" + e.getMessage() + "</pre>");
            response.getWriter().println("<p>Please check the input data and try again.</p>");
        }
    }
}
