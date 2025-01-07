<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Search Offers</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f7f6;
            margin: 0;
            padding: 0;
        }
        h1 {
            color: #333;
            font-size: 32px;
            margin-top: 20px;
            text-align: center;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        form {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }
        label {
            display: none;
        }
        input[type="text"] {
            width: 50%;
            padding: 10px;
            font-size: 16px;
            border: 2px solid #ddd;
            border-radius: 25px;
            outline: none;
            transition: all 0.3s ease;
        }
        input[type="text"]:focus {
            border-color: #28a745;
            box-shadow: 0 0 8px rgba(40, 167, 69, 0.5);
        }
        button {
            margin-left: 10px;
            background-color: #28a745;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 25px;
            cursor: pointer;
            font-size: 16px;
            transition: all 0.3s ease;
        }
        button:hover {
            background-color: #218838;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #f4f4f4;
        }
        th {
            background-color: #28a745;
            color: white;
        }
        td {
            color: #333;
        }
        tr:hover {
            background-color: #f9f9f9;
        }
        .actions {
            display: flex;
            gap: 10px;
        }
        .actions button {
            background-color: #007bff;
            color: white;
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        .actions button:hover {
            background-color: #0056b3;
        }
        .delete-button {
            background-color: #dc3545;
        }
        .delete-button:hover {
            background-color: #c82333;
        }
        .search-feedback {
            color: #28a745;
            text-align: center;
            font-size: 18px;
            margin-bottom: 20px;
            display: none;
        }
        .no-results {
            color: #dc3545;
            text-align: center;
            font-size: 18px;
            margin-bottom: 20px;
            display: none;
        }
    </style>
</head>
<body>
    <h1>Search and Manage Offers</h1>

    <div class="container">
        <!-- Search Form -->
        <form id="searchForm" action="/searchOffer" method="POST"> 
            <input type="text" id="offerTitle" name="title" placeholder="Search for offers..." required autocomplete="off">
            <button type="submit">Search</button>
        </form>

        <!-- User Feedback for Search Results -->
        <div class="search-feedback" id="searchFeedback">Results found. Scroll down to view.</div>
        <div class="no-results" id="noResults">No offers found for your search. Try again!</div>

        <!-- Search Results Table -->
        <table id="offersTable">
            <thead>
                <tr>
                    <th>Offer No.</th>
                    <th>Offer Title</th>
                    <th>Offer Description</th>
                    <th>Location</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="offer" items="${offers}">
                    <tr>
                        <td>${offer.offerId}</td>
                        <td>${offer.title}</td>
                        <td>${offer.description}</td>
                        <td>${offer.locationTitle}</td>
                        <td><a href="rating?offerId=${offer.offerId}">Rate us</a></td>

                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <a href="addother">Add New Offer</a>
    </div>

    <script>
        document.getElementById('searchForm').addEventListener('submit', function(event) {
            const searchField = document.getElementById('offerTitle');
            if (searchField.value.trim() === '') {
                event.preventDefault();
                alert('Please enter an offer title to search.');
            }
        });

        // Show feedback if offers are found
        const results = document.querySelectorAll('#offersTable tbody tr');
        if (results.length > 0) {
            document.getElementById('searchFeedback').style.display = 'block';
        } else {
            document.getElementById('noResults').style.display = 'block';
        }
    </script>
</body>
</html>
