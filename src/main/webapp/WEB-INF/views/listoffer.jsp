<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BHOOKAD - List of Offers</title>

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
            max-width: 1000px;
            background-color: white;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            border-radius: 12px;
        }

        table {
            width: 100%;
             max-width: 100%;
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

    <!-- Fun Cartoon-like Heading -->
    <div class="heading">BHOOKAD</div>

    <!-- Navigation Bar -->
    <div class="navbar">
        <a href="home">Home</a>
        <a href="addcity">ADD CITY</a>
        <a href="addarea">ADD AREA</a>
        <a href="addlocation">ADD LOCATION</a>
         <a href="addother">ADD OFFER</a>
    </div>

    <!-- Main Content Section -->
    <div class="main">
        <h1>List of Offers</h1>
        <div class="content">
            <!-- Table to display the list of offers -->
            <table>
                <thead>
                    <tr>
                        <th>Offer ID</th>
                        <th>Title</th>
                        <th>Description</th>
                        <th>Active</th>
                        <th>Start Date</th>
                        <th>End Date</th>
                        <th>Location Name</th>
                        <th>Food Type</th>
                        <th>Banner</th>
                         <th>Actions</th>
                         
                    </tr>
                </thead>
                <tbody>
                    <!-- Using JSTL to iterate through the list of offers -->
                  <c:forEach items="${listoffer}" var="offer">
                        <tr>
                             <td>${offer.offerId}</td>
                            <td>${offer.title}</td>
                            <td>${offer.description}</td>
                            <td>${offer.active}</td>
                            <td>${offer.startDate}</td>
                            <td>${offer.endDate}</td>
                            <td>${offer.locationTitle}</td>
                           <td>${offer.foodType}</td>
                            <td>
                           
                            	<img src="${offer.offerPicPath}" height="100px" width="100px"/>
                            </td>
                            
                             <td>
                <a href="updateOffer?id=${offer.offerId}" style="color: #ff6347; text-decoration: none;">Update</a> |
				<a href="deleteOffer?id=${offer.offerId}" onclick="return confirm('Are you sure you want to delete this offer?');">Delete</a>|
				<a href="rating">Rate us</a>
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