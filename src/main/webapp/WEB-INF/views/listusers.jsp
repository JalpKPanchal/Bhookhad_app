<%@page import="java.util.List"%>
<%@page import="com.bean.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User List</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 20px;
    }

    h1 {
        color: #333;
    }

    a {
        text-decoration: none;
        color: #007BFF;
    }

    a:hover {
        text-decoration: underline;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    }

    th, td {
        padding: 12px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    th {
        background-color: #007BFF;
        color: white;
    }

    tr:hover {
        background-color: #f1f1f1;
    }

    .button {
        padding: 10px 15px;
        background-color: #28a745;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    .button:hover {
        background-color: #218838;
    }

    .link-button {
        background-color: transparent;
        border: 1px solid #007BFF;
        color: #007BFF;
        padding: 5px 10px;
        border-radius: 5px;
        cursor: pointer;
        text-align: center;
        transition: background-color 0.3s, color 0.3s;
    }

    .link-button:hover {
        background-color: #007BFF;
        color: white;
    }
</style>
</head>
<body>
<h1>List Users</h1>

<%
    List<UserBean> users = (List<UserBean>)request.getAttribute("users");
%>

<a href="Signup" class="button">Add New User</a>

<table>
    <tr>
        <th>User ID</th>
        <th>First Name</th>
        <th>Email</th>
        <th>Action</th>
    </tr>

    <%
    for (UserBean u : users) { 
    %>
    <tr> 
         <td><%=u.getUserId()%></td>
        <td><%=u.getFirstname()%></td>
        <td><%=u.getEmail()%></td>
        <td>
            <a href="deleteuser?userId=<%=u.getUserId()%>" class="link-button">Delete</a> | 
           
            <a href="edituser?userId=<%=u.getUserId()%>" class="link-button">Update</a>
        </td>
    </tr>
    <%
    }
    %>
</table>

<br>


</body>
</html>