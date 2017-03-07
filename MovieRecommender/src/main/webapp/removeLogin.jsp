<%--
  Created by IntelliJ IDEA.
  User: jon_j
  Date: 02/11/2016
  Time: 19:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Movies Recommender</title>
</head>
<body>
<%
    session.removeAttribute("user");
%>
<script>window.location = "login.jsp";</script>
</body>
</html>
