<html>
    <body>
        <%
            java.util.Date date = new java.util.Date();
            int hours = date.getHours();
            String greeting = (hours < 12) ? "Good morning" : "Good afternoon";
            out.println(greeting + ", John, Welcome to COMP367");
        %>
    </body>
</html>
