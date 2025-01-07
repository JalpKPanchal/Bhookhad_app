<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Password</title>

    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f0f4f8;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .update-container {
            background-color: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        label {
            font-size: 14px;
            color: #555;
            display: block;
            margin-bottom: 8px;
        }

        input[type="email"],
        input[type="password"],
        input[type="text"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            box-sizing: border-box;
            transition: all 0.3s ease;
        }

        input:focus {
            border-color: #3498db;
            box-shadow: 0 0 8px rgba(52, 152, 219, 0.3);
            outline: none;
        }

        button[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #3498db;
            border: none;
            border-radius: 5px;
            color: white;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button[type="submit"]:hover {
            background-color: #2980b9;
        }

        .error {
            color: red;
            text-align: center;
            margin-bottom: 10px;
        }

    </style>
</head>
<body>

    <div class="update-container">
        <h2>Update Password</h2>
        
       
        <c:if test="${not empty error}">
            <div class="error">${error}</div>
        </c:if>
<form action="updatePassword" method="post">
    <label for="email">Email:</label>
    <input type="email" id="email" name="email" value="${email}" required readonly> <!-- Pre-fill email and make it readonly -->

    <label for="otp">OTP:</label>
    <input type="text" id="otp" name="otp" required>

    <label for="newPassword">New Password:</label>
    <input type="password" id="newPassword" name="newPassword" required>

    <button type="submit">Update Password</button>
</form>


</body>
</html>