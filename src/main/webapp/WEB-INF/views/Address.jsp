<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Address to Latitude/Longitude</title>
</head>
<body>
    <h1>Convert Address to Latitude and Longitude</h1>
    <form action="getLatLong" method="post">
        <label for="address">Enter Address:</label>
        <input type="text" id="address" name="address" required>
        <input type="submit" value="Get Lat/Long">
    </form>
    
</body>
</html>
