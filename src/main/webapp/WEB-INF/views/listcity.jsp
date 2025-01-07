<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BHOOKAD - List of Cities</title>

    <!-- Google Fonts for cartoon-like handwriting -->
    <link href="https://fonts.googleapis.com/css2?family=Comic+Neue:wght@700&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: "Lilita One", sans-serif;
            font-weight: 400;
            margin: 0;
            padding: 0;
            background-color: #f0f8ff; 
            color: #333;
        }

        .navbar {
            background-color: #ff6347; 
            overflow: hidden;
            text-align: center;
            border-bottom: 4px solid #ffcccb; 
        }

        .navbar a {
            float: left;
            display: block;
            color: white;
            text-align: center;
            padding: 16px 20px;
            text-decoration: none;
            font-size: 18px;
            transition: 0.3s;
        }

        .navbar a:hover {
            background-color: #ffa07a; 
            color: white;
        }

        .navbar a.active {
            background-color: #ff4500; 
            color: white;
        }

        .heading {
            font-family: 'Comic Neue', cursive;
            font-size: 90px;
            color: #ff4500; 
            text-align: center;
            margin-top: 50px;
            letter-spacing: 3px;
            text-shadow: 3px 3px 5px rgba(0, 0, 0, 0.2);
        }

        .main {
            text-align: center;
            padding: 50px;
        }

        h1 {
            color: #333;
        }

        .content {
            margin: 20px auto;
            padding: 20px;
            max-width: 800px;
            background-color: white;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            border-radius: 12px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #ff6347;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .footer {
            background-color: #ff6347;
            color: white;
            text-align: center;
            padding: 10px;
            position: fixed;
            width: 100%;
            bottom: 0;
        }
    </style>
</head>
<body>

    <div class="heading">BHOOKAD</div>

    <!-- Navigation Bar -->
    <div class="navbar">
        <a href="home">Home</a>
        <a href="addcity">ADD CITY</a>
        <a href="addarea">ADD AREA</a>
        <a href="addlocation" class="active">ADD LOCATION</a>
       <a href="addother">ADD OFFER</a>
    </div>

    <!-- Main Content Section -->
    <div class="main">
        <h1>List of Cities</h1>
        <div class="content">
            <!-- Table to display the list of cities -->
            <table>
                <thead>
                    <tr>
                        <th>City ID</th>
                        <th>City Name</th>
                         <th>Actions</th> 
                    </tr>
                </thead>
                <tbody>
                    <!-- Using JSTL to iterate through the list of cities -->
                    <c:forEach items="${cities}" var="city">
    <tr>
        <td>${city.cityId}</td>
        <td>${city.cityName}</td>
        <td>
            <a href="updateCity?id=${city.cityId}" style="color: #ff6347; text-decoration: none;">Update</a> |
            <form action="/deleteCity" method="POST" style="display:inline;">
                <input type="hidden" name="id" value="${city.cityId}">
                <button type="submit" onclick="return confirm('Are you sure you want to delete this city?');">Delete</button>
            </form>
        </td>
    </tr>
</c:forEach>

                </tbody>
            </table>
        </div>
    </div>

    <!-- Footer Section -->
    <div class="footer">
        &copy; 2024 Bhookad | All Rights Reserved
    </div>

</body>
</html>