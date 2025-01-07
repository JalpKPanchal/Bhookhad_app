<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update City</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f8ff;
            color: #333;
        }
        h1 {
            text-align: center;
            color: #ff6347;
        }
        form {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        label {
            display: block;
            margin-bottom: 8px;
        }
        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            background-color: #ff6347;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }
        button:hover {
            background-color: #ff4500;
        }
        a {
            display: inline-block;
            margin-top: 15px;
            text-align: center;
            color: #ff6347;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <h1>Update City</h1>
    <form action="/updateCity" method="POST">
        <input type="hidden" name="cityId" value="${city.cityId}"> <!-- Hidden field for city ID -->
        <label for="cityName">City Name:</label>
        <input type="text" id="cityName" name="cityName" value="${city.cityName}" required> <!-- Input field for city name -->
        <button type="submit">Update</button> <!-- Submit button -->
    </form>
    <a href="listcity">Back to List</a> <!-- Link to go back to the city list -->
</body>
</html>
