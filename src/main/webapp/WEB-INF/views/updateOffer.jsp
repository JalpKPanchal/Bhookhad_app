<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BHOOKAD - Update Offer</title>

    <!-- Link to Google Fonts for cartoon-like handwriting -->
    <link href="https://fonts.googleapis.com/css2?family=Comic+Neue:wght@700&display=swap" rel="stylesheet">

    <style>
        /* General styles */
        body {
            font-family: "Lilita One", sans-serif;
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
            max-width: 600px;
            background-color: white;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            border-radius: 12px;
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

        input[type="text"], input[type="date"], select {
            width: 100%;
            padding: 12px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            background-color: #ff6347;
            color: white;
            padding: 15px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #ff4500;
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
        <a href="addoffer">ADD OFFER</a>
    </div>

    <!-- Main Content Section -->
    <div class="main">
        <h1>Update Offer</h1>
        <div class="content">
            <form action="updateoffer" method="post">
                <input type="hidden" name="offerId" value="${offer.offerId}"/> <!-- Hidden field for Offer ID -->

                <label for="title">Title:</label>
                <input type="text" id="title" name="title" value="${offer.title}" required/>

                <label for="description">Description:</label>
                <input type="text" id="description" name="description" value="${offer.description}" required/>

                <label for="active">Active:</label>
                <select id="active" name="active">
                    <option value="1" ${offer.active == '1' ? 'selected' : ''}>Yes</option>
                    <option value="0" ${offer.active == '0' ? 'selected' : ''}>No</option>
                </select>

                <label for="startDate">Start Date:</label>
                <input type="date" id="startDate" name="startDate" value="${offer.startDate}" required/>

                <label for="endDate">End Date:</label>
                <input type="date" id="endDate" name="endDate" value="${offer.endDate}" required/>

             <select id="locationId" name="locationId" required>
    <c:forEach items="${location}" var="loc">
        <option value="${loc.locationId}" ${offer.locationId == loc.locationId ? 'selected' : ''}>
            ${loc.title} <!-- Use title consistently -->
        </option>
    </c:forEach>
</select>



                <label for="foodType">Food Type:</label>
                <input type="text" id="foodType" name="foodType" value="${offer.foodType}" required/>

                <label for="offerPicPath">Offer Picture Path:</label>
                <input type="text" id="offerPicPath" name="offerPicPath" value="${offer.offerPicPath}" />

                <button type="submit">Update Offer</button>
            </form>
        </div>
    </div>

    <!-- Footer Section -->
    <div class="footer">
        &copy; 2024 Bhookad | All Rights Reserved
    </div>

</body>
</html>
