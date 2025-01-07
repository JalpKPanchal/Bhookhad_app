<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>

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

        .forgot-container {
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

        input[type="email"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            box-sizing: border-box;
            transition: all 0.3s ease;
        }

        input[type="email"]:focus {
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

    <div class="forgot-container">
        <h2>Forgot Password</h2>
        
      
       <c:if test="${not empty message}">
    <div style="color: green; text-align: center; margin-bottom: 10px;">
        ${message}
    </div>
</c:if>

<c:if test="${not empty error}">
    <div style="color: red; text-align: center; margin-bottom: 10px;">
        ${error}
    </div>
</c:if>


        <form action="sendOtp" method="post">
            <label for="email">Enter your Email:</label>
            <input type="email" id="email" name="email" required>
            <button type="submit">Send OTP</button>
        </form>
    </div>

</body>
</html>