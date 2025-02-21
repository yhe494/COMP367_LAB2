<html>
    <body>
        <%
            java.util.Date date = new java.util.Date();
            int hours = date.getHours();
            String greeting = (hours < 12) ? "Good morning" : "Good afternoon";
            out.println(greeting + ", Yanhua, Welcome to COMP367");
        %>
    </body>
</html>
