<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Location</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f8ff;
        }

        .container {
            width: 60%;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
        }

        h1 {
            text-align: center;
            color: #ff6347;
        }

        label {
            font-weight: bold;
        }

        input[type="text"], input[type="number"], textarea, select {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #ff6347;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #ff4500;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .back-button {
            text-decoration: none;
            color: #ff6347;
            font-weight: bold;
        }

        .back-button:hover {
            color: #ff4500;
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>Update Location</h1>
        
        <form action="updateLocation" method="post">
            <!-- Hidden field to pass the location ID -->
            <input type="hidden" name="locationId" value="${location.locationId}">

            <div class="form-group">
                <label for="title">Title:</label>
                <input type="text" id="title" name="title" value="${location.title}" required>
            </div>

            <div class="form-group">
                <label for="category">Category:</label>
                <input type="text" id="category" name="category" value="${location.category}" required>
            </div>

            <div class="form-group">
                <label for="description">Description:</label>
                <textarea id="description" name="description" required>${location.description}</textarea>
            </div>

            <div class="form-group">
                <label for="timings">Timings:</label>
                <input type="text" id="timings" name="timings" value="${location.timings}" required>
            </div>

            <div class="form-group">
                <label for="contactNumber">Contact Number:</label>
                <input type="text" id="contactNumber" name="contactNumber" value="${location.contactNumber}" required>
            </div>

            <div class="form-group">
                <label for="address">Address:</label>
                <input type="text" id="address" name="address" value="${location.address}" required>
            </div>

            <div class="form-group">
                <label for="cityId">City:</label>
                <select id="cityId" name="cityId" required>
                    <c:forEach items="${cities}" var="city">
                        <option value="${city.cityId}" ${city.cityId == location.cityId ? 'selected' : ''}>${city.cityName}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group">
                <label for="areaId">Area:</label>
                <select id="areaId" name="areaId" required>
                    <c:forEach items="${areas}" var="area">
                        <option value="${area.areaId}" ${area.areaId == location.areaId ? 'selected' : ''}>${area.areaName}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group">
                <label for="latitude">Latitude:</label>
                <input type="number" step="any" id="latitude" name="latitude" value="${location.latitude}" required>
            </div>

            <div class="form-group">
                <label for="longitude">Longitude:</label>
                <input type="number" step="any" id="longitude" name="longitude" value="${location.longitude}" required>
            </div>

            <div class="form-group">
                <label for="foodType">Food Type:</label>
                <input type="text" id="foodType" name="foodType" value="${location.foodType}" required>
            </div>

            <input type="submit" value="Update Location">
        </form>

        <p><a href="listlocation" class="back-button">Back to Locations List</a></p>
    </div>

</body>
</html>
