
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BHOOKAD - Add City</title>

    <!-- Link to Google Fonts for cartoon-like handwriting -->
    <link href="https://fonts.googleapis.com/css2?family=Comic+Neue:wght@700&display=swap" rel="stylesheet">

    <style>
        /* General styles */
        body {
            font-family: "Lilita One", sans-serif;
            font-weight: 400;
            font-style: normal;
            margin: 0;
            padding: 0;
            background-color: #f0f8ff; /* Light blue background for a playful feel */
            color: #333;
        }

        /* Style for the navigation bar */
        .navbar {
            background-color: #ff6347; /* Tomato red */
            overflow: hidden;
            text-align: center;
            border-bottom: 4px solid #ffcccb; /* Light red border */
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
            background-color: #ffa07a; /* Light salmon hover effect */
            color: white;
        }

        .navbar a.active {
            background-color: #ff4500; /* Orange Red for active links */
            color: white;
        }

        /* Fun cartoon heading style */
        .heading {
            font-family: 'Comic Neue', cursive;
            font-size: 90px;
            color: #ff4500; /* Orange Red */
            text-align: center;
            margin-top: 50px;
            letter-spacing: 3px;
            text-shadow: 3px 3px 5px rgba(0, 0, 0, 0.2);
        }

        /* Main content area */
        .main {
            text-align: center;
            padding: 50px;
        }

        h1 {
            color: #333;
        }

        /* Content box with playful shadow effect */
        .content {
            margin: 20px auto;
            padding: 20px;
            max-width: 800px;
            background-color: white;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            border-radius: 12px;
        }

        /* Form styles */
        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        label {
            font-size: 18px;
            margin-bottom: 10px;
            color: #333;
        }

        input[type="text"], select {
            padding: 10px;
            margin: 10px 0;
            font-size: 16px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        input[type="submit"] {
            padding: 10px;
            margin: 10px 0;
            font-size: 16px;
            border-radius: 6px;
            border: 1px solid #ccc;
			 background-color: #ff6347;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s;
              background-color: #ff4500;
        }

        input[type="submit"]:hover {
            background-color: #ff4500; /* Darker shade on hover */
        }

        /* Footer styles */
        .footer {
            background-color: #ff6347;
            color: white;
            text-align: center;
            padding: 10px;
            position: fixed;
            width: 100%;
            bottom: 0;
        }
        .view
		{
			padding: 10px;
            margin: 10px 0;
            font-size: 16px;
            border-radius: 6px;
            border: 1px solid #ccc;
			 background-color: #ff6347;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s;
              background-color: #ff4500;
              align-items:left;
		}
    </style>
</head>
<body>

    <!-- Fun Cartoon-like Heading -->
    <div class="heading">BHOOKAD</div>

    <!-- Navigation Bar -->
    <div class="navbar">
        <a href="home">Home</a>
        <a href="addcity" class="active">ADD CITY</a>
        <a href="addarea">ADD AREA</a>
        <a href="addlocation">ADD LOCATION</a>
   <a href="addother">ADD OFFER</a>
    </div>

    <!-- Main Content Section -->
    <div class="main">
        <h1>Add a New Area</h1>
        <div class="content">
            <!-- Form for Adding City -->
            <form action="savearea" method="post">
                <label for="areaName">Area Name:</label>
                <input type="text" id="areaName" name="areaName" placeholder="Enter area name">
                
                <label for="cityName">City Name:</label>
                <select id="cityName" name="cityId" placeholder="">
                  <option value="" selected disabled>Select a city</option>
                  <c:forEach items="${cities}" var="c">
                  	<option value="${c.cityId}">${c.cityName}</option>
                  </c:forEach>
                </select>

               <input type="submit" value="Add area"></input>
            </form>
        </div>
         <a href="listarea" class="view"> View list of area</a>
    </div>

    <!-- Footer Section -->
    <div class="footer">
        &copy; 2024 Bhookad | All Rights Reserved
    </div>

</body>
</html>