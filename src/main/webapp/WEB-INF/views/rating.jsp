<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Rate Offer</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f7f6;
            display: flex;
            flex-direction: column;
            align-items: center;
            margin: 0;
            padding: 20px;
        }
        h2 {
            color: #333;
            font-size: 32px;
            margin-top: 20px;
            text-align: center;
        }
        .form-container {
            max-width: 600px;
            width: 100%;
            padding: 20px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        label {
            display: block;
            font-size: 18px;
            color: #555;
            margin-top: 10px;
        }
        select, textarea, input[type="submit"] {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            margin-top: 5px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .star-rating {
            display: flex;
            flex-direction: row-reverse;
            justify-content: center;
            margin-top: 20px;
        }
        .star-rating input[type="radio"] {
            display: none;
        }
        .star-rating label {
            font-size: 40px;
            color: #ddd;
            cursor: pointer;
            padding: 5px;
        }
        .star-rating label:hover,
        .star-rating label:hover ~ label,
        .star-rating input[type="radio"]:checked ~ label {
            color: #ffcc36;
        }
        input[type="submit"] {
            background-color: #28a745;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 16px;
            transition: all 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #218838;
        }
        .error-message {
            color: red;
            font-size: 16px;
            text-align: center;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>

<h2>Rate an Offer</h2>

<div class="form-container">
    <!-- Display error message if present -->
    <c:if test="${not empty errorMessage}">
        <div class="error-message">${errorMessage}</div>
    </c:if>

    <form action="submitRating" method="post">
        <!-- Offer Dropdown with Preselection --> 	
        <label for="offerName">Offer Name:</label>
        <select id="offerName" name="offerId" required>
            <option value="" disabled>Select an Offer</option>
            <c:forEach items="${offer}" var="c">
                <option value="${c.offerId}" <c:if test="${param.offerId == c.offerId}">selected</c:if>>${c.title}</option>
            </c:forEach>
        </select>

        <!-- Star Rating Section -->
        <div class="star-rating">
            <input type="radio" id="star5" name="rating" value="5" required>
            <label for="star5" title="5 stars">★</label>

            <input type="radio" id="star4" name="rating" value="4" required>
            <label for="star4" title="4 stars">★</label>

            <input type="radio" id="star3" name="rating" value="3" required>
            <label for="star3" title="3 stars">★</label>

            <input type="radio" id="star2" name="rating" value="2" required>
            <label for="star2" title="2 stars">★</label>

            <input type="radio" id="star1" name="rating" value="1" required>
            <label for="star1" title="1 star">★</label>
        </div>

        <!-- Comments Section -->
        <label for="comments">Comments:</label>
        <textarea name="comments" id="comments" placeholder="Leave your comments here..." required></textarea>

        <!-- Submit Button -->
        <input type="submit" value="Submit Rating">
    </form>
</div>

</body>
</html>