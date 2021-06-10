<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Новости</title>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            background: #f69a73;
        }

        .decor {
            position: relative;
            max-width: 400px;
            margin: 50px auto 0;
            background: white;
            border-radius: 30px;
        }

        .form-left-decoration, .form-right-decoration {
            content: "";
            position: absolute;
            width: 50px;
            height: 20px;
            background: #f69a73;
            border-radius: 20px;
        }

        .form-left-decoration {
            bottom: 60px;
            left: -30px;
        }

        .form-right-decoration {
            top: 60px;
            right: -30px;
        }

        .form-left-decoration:before, .form-left-decoration:after, .form-right-decoration:before, .form-right-decoration:after {
            content: "";
            position: absolute;
            width: 50px;
            height: 20px;
            border-radius: 30px;
            background: white;
        }

        .form-left-decoration:before {
            top: -20px;
        }

        .form-left-decoration:after {
            top: 20px;
            left: 10px;
        }

        .form-right-decoration:before {
            top: -20px;
            right: 0;
        }

        .form-right-decoration:after {
            top: 20px;
            right: 10px;
        }

        .circle {
            position: absolute;
            bottom: 80px;
            left: -55px;
            width: 20px;
            height: 20px;
            border-radius: 50%;
            background: white;
        }

        .form-inner {
            padding: 50px;
        }

        .form-inner input, .form-inner textarea {
            display: block;
            width: 100%;
            padding: 0 20px;
            margin-bottom: 10px;
            background: #E9EFF6;
            line-height: 40px;
            border-width: 0;
            border-radius: 20px;
            font-family: 'Roboto', sans-serif;
        }

        .form-inner input[type="submit"] {
            margin-top: 30px;
            background: #f69a73;
            border-bottom: 4px solid #d87d56;
            color: white;
            font-size: 14px;
        }

        .form-inner textarea {
            resize: none;
        }

        .form-inner h3 {
            margin-top: 0;
            font-family: 'Roboto', sans-serif;
            font-weight: 500;
            font-size: 24px;
            color: #707981;
        }

        .glow-button {
            text-decoration: none;
            display: inline-block;
            padding: 15px 30px;
            margin: 10px 20px;
            border-radius: 10px;
            box-shadow: 0 0 40px 40px #F137A6 inset, 0 0 0 0 #F137A6;
            font-family: 'Montserrat', sans-serif;
            font-weight: bold;
            letter-spacing: 2px;
            color: white;
            transition: .15s ease-in-out;
        }

        .glow-button:hover {
            box-shadow: 0 0 10px 0 #F137A6 inset, 0 0 10px 4px #F137A6;
            color: #F137A6;
        }

        .closing-button {
            text-decoration: none;
            display: inline-block;
            margin: 10px;
            color: #f10000;
            box-shadow: 0 0 0 2px #ffffff;
            padding: 20px 0;
            width: 150px;
            text-align: center;
            text-transform: uppercase;
            letter-spacing: 3px;
            position: relative;
            overflow: hidden;
        }

        .closing-button span {
            font-family: 'Montserrat', sans-serif;
            position: relative;
            z-index: 5;
        }

        .closing-button:before, .closing-button:after {
            content: "";
            position: absolute;
            top: 0;
            bottom: 0;
            right: 0;
            left: 0;
        }

        .closing-button:before {
            transform: translateX(-100%);
            background: white;
            transition: transform .3s cubic-bezier(.55, .055, .675, .19);
        }

        .closing-button:after {
            background: #413ad5;
            transform: translateX(100%);
            transition: transform .3s cubic-bezier(.16, .73, .58, .62) .3s;
        }

        .closing-button:hover:before, .closing-button:hover:after {
            transform: translateX(0);
        }

        .double-border-button {
            text-decoration: none;
            display: inline-block;
            margin: 10px 20px;
            padding: 10px 30px;
            position: relative;
            border: 2px solid #f1c40f;
            color: #f1c40f;
            font-family: 'Montserrat', sans-serif;
            transition: .4s;
        }

        .double-border-button:after {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            width: 100%;
            height: 100%;
            margin: auto;
            border: 2px solid rgba(0, 0, 0, 0);
            transition: .4s;
        }

        .double-border-button:hover:after {
            border-color: #f1c40f;
            width: calc(100% - 10px);
            height: calc(100% + 10px);
        }

        .shine-button {
            text-decoration: none;
            display: inline-block;
            padding: 10px 30px;
            margin: 10px 20px;
            position: relative;
            overflow: hidden;
            border: 2px solid #fe6637;
            border-radius: 8px;
            font-family: 'Montserrat', sans-serif;
            color: #fe6637;
            transition: .2s ease-in-out;
        }

        .shine-button:before {
            content: "";
            background: linear-gradient(90deg, rgba(255, 255, 255, .1), rgba(255, 255, 255, .5));
            height: 50px;
            width: 50px;
            position: absolute;
            top: -8px;
            left: -75px;
            transform: skewX(-45deg);
        }

        .shine-button:hover {
            background: #fe6637;
            color: #ffffff;
        }

        .shine-button:hover:before {
            left: 150px;
            transition: .5s ease-in-out;
        }

        table {
            font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
            text-align: center;
            border-collapse: collapse;
            border-spacing: 5px;
            background: #E1E3E0;
            border-radius: 20px;
        }
        th {
            font-size: 22px;
            font-weight: 300;
            padding: 12px 10px;
            border-bottom: 2px solid #F56433;
            color: #F56433;
        }
        tbody tr:nth-child(2) {
            border-bottom: 2px solid #f56433;
        }
        td {
            padding: 10px;
            color: #8D8173;
        }
        .shine-button {
            text-decoration: none;
            display: inline-block;
            padding: 10px 30px;
            margin: 10px 20px;
            position: relative;
            overflow: hidden;
            border: 2px solid #fe6637;
            border-radius: 8px;
            font-family: 'Montserrat', sans-serif;
            color: #fe6637;
            transition: .2s ease-in-out;
        }
        .shine-button:before {
            content: "";
            background: linear-gradient(90deg, rgba(255, 255, 255, .1), rgba(255, 255, 255, .5));
            height: 50px;
            width: 50px;
            position: absolute;
            top: -8px;
            left: -75px;
            transform: skewX(-45deg);
        }
        .shine-button:hover {
            background: #fe6637;
            color: #fff;
        }
        .shine-button:hover:before {
            left: 150px;
            transition: .5s ease-in-out;
        }
        #centerLayer {
            width: 300px; /* Ширина слоя в пикселах */
            margin: 0 auto; /* Отступ слева и справа */
            background: #f69a73; /* Цвет фона */
            padding: 10px; /* Поля вокруг текста */
            text-align: left; /* Выравнивание содержимого слоя по левому краю */
        }
    </style>
</head>
<body>
<div id="centerLayer">

    <a href="/" class="glow-button">Main page</a>
    <table>
        <thead >
        <th style="display: none" >ID</th>
        <th>Name</th>
        </thead>
        <c:forEach items="${cars}" var="car">
            <tr>
                <td>${car.name}</td>
            </tr>
        </c:forEach>

    </table>
</div>
</body>
</html>