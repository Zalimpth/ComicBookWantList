<%-- 
    Document   : register
    Created on : Mar 23, 2025, 11:34:01 AM
    Author     : zalim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Comic Book Want List</title>
    <link rel="stylesheet" href="styles/main.css">
</head>
<body>
    <header>
        <h1>Create an Account</h1>
        <nav>
            <ul>
                <li><a href="index.html">Home</a></li>
                <li><a href="login.jsp">Login</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <section>
            <h2>Register</h2>
            <form action="registerServlet" method="post">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>

                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>

                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>

                <button type="submit">Register</button>
            </form>
        </section>
    </main>
</body>
</html>