<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Area</title>
</head>
<body>

    <h1>Update Area</h1>

    <form action="updatearea" method="post">
        <input type="hidden" name="areaId" value="${area.areaId}">
        
        <label for="areaName">Area Name:</label>
        <input type="text" id="areaName" name="areaName" value="${area.areaName}" required><br><br>

        <label for="cityId">City:</label>
        <select id="cityId" name="cityId">
            <c:forEach var="city" items="${cities}">
                <option value="${city.cityId}" ${city.cityId == area.cityId ? 'selected' : ''}>${city.cityName}</option>
            </c:forEach>
        </select><br><br>

        <button type="submit">Update Area</button>
    </form>

</body>
</html>
