<%-- 
    Document   : view_comics
    Created on : Apr 2, 2025, 11:00:53?PM
    Author     : zalim
--%>

<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>My Comic Collection</title>
    <link rel="stylesheet" href="styles/main.css">
</head>
<body>
    <h1>Your Comic Want List</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Issue</th>
            <th>Publisher</th>
            <th>Release Year</th>
        </tr>
        <%
            int userId = 1;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/comicdb", "root", "password");
                String sql = "SELECT id, comic_title, comic_issue, publisher, release_year FROM comic_want_list WHERE user_id = ?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setInt(1, userId);
                ResultSet rs = stmt.executeQuery();

                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getInt("id") + "</td>");
                    out.println("<td>" + rs.getString("comic_title") + "</td>");
                    out.println("<td>" + rs.getString("comic_issue") + "</td>");
                    out.println("<td>" + rs.getString("publisher") + "</td>");
                    out.println("<td>" + rs.getInt("release_year") + "</td>");
                    out.println("</tr>");
                }

                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<tr><td colspan='5'>Error loading comics.</td></tr>");
            }
        %>
    </table>
</body>
</html>
