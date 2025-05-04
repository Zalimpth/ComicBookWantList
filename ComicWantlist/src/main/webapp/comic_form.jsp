<%-- 
    Document   : comic_form
    Created on : Apr 2, 2025, 10:59:59 PM
    Author     : zalim
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Comic</title>
    <link rel="stylesheet" href="styles/main.css">
</head>
<body>
    <h1>Add Comic to Your Want List</h1>
        <form action="AddComicServlet" method="post">
            <label for="title">Comic Title:</label>
            <input type="text" name="title" required><br>

            <label for="issue_number">Issue Number:</label>
            <input type="text" name="issue_number"><br>

            <label for="publisher">Publisher:</label>
            <input type="text" name="publisher"><br>

            <label for="release_year">Release Year:</label>
            <input type="number" name="release_year"><br>

            <input type="submit" value="Add Comic">
        </form>
</body>
</html>

