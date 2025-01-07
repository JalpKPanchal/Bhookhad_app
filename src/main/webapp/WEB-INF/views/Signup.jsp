<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup Form</title>

    <!-- CSS for Styling -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f7f8;
            color: #333;
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            border-radius: 8px;
            background-color: #fff;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 8px;
            color: #333;
        }
        input[type="text"],
        input[type="email"],
        input[type="password"],
        input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            transition: all 0.3s ease;
        }
        input[type="text"]:focus,
        input[type="email"]:focus,
        input[type="password"]:focus,
        input[type="number"]:focus {
            border-color: #4CAF50;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            border: none;
            border-radius: 4px;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        .error {
            color: red;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <h2>Signup Form</h2>
    <form action="displayData" method="post" enctype="multipart/form-data">
        <label for="Firstname">First Name:</label>
        <input type="text" id="Firstname" name="Firstname">

        <label for="Lastname">Last Name:</label>
        <input type="text" id="Lastname" name="Lastname">

        <label for="Gender">Gender:</label>
        <input type="text" id="Gender" name="Gender">

        <label for="Contact">Contact:</label>
        <input type="text" id="Contact" name="Contact">

        <label for="Email">Email:</label>
        <input type="email" id="Email" name="Email">

        <label for="Password">Password:</label>
        <input type="password" id="Password" name="Password">

        <label for="Age">Age:</label>
        <input type="number" id="Age" name="Age" min="1" max="100">
        
         <label for="profilePic">profile Pic:</label>
        <input type="file" id="profilePic" name=" profilePic" min="1" max="100"><br>
        
        

        <input type="submit" value="Sign Up">
    </form>
</body>
</html>