<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Регистрация</title>
    <style>
        @import url(https://fonts.googleapis.com/css?family=Open+Sans:400,700);
        @import url('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.min.css');

        * {
            font-family: 'Open Sans', 'sans-serif', 'FontAwesome';
        }

        body {
            background: rgb(52, 56, 61);
            padding: 80px;
        }

        h1 {
            color: rgb(255, 255, 255);
            margin: 40px auto 0;
            width: 200px;
            text-align: center;
        }

        #wrapper {
            position: absolute;
            width: 320px;
            left: 50%;
            margin-left: -160px;
            top: 40%;
            margin-top: -275px;
        }

        /* === Sign in Form === */
        #signin {
            height: 90px;
            width: 300px;
            border-radius: 8px;
            position: relative;
        }

        #signin::before {
            display: block;
            position: relative;
            height: 2px;
            background: rgb(52, 56, 61);
            content: '';
            top: 44px;
            margin-left: 20px;
            z-index: 1;
        }

        #signin input:first-of-type {
            border-top-right-radius: 8px;
            border-top-left-radius: 8px;
        }

        #signin input:last-of-type {
            border-bottom-right-radius: 8px;
            border-bottom-left-radius: 8px;
        }

        #signin input[type="text"], #signin input[type="password"], #signin button[type="submit"] {
            background: rgb(28, 30, 33);
            box-shadow: inset -100px -100px 0 rgb(28, 30, 33); /*Prevent yellow autofill color*/
            color: rgb(52, 56, 61);
        }

        #signin input[type="text"], #signin input[type="password"] {
            position: relative;
            display: block;
            width: 280px;
            height: 45px;
            border: 0;
            outline: 0;
            top: -2px;
            padding: 0 0 0 20px;
            font-weight: 700;
            color: rgb(245, 241, 241);
        }

        #signin input[type="text"]:focus, #signin input[type="password"]:focus {
            color: rgb(255, 255, 255);
        }

        /*#signin button[type="submit"] {*/
        /*    display: block;*/
        /*    position: absolute;*/
        /*    width: 52px;*/
        /*    height: 52px;*/
        /*    color: rgb(52, 56, 61);*/
        /*    border-radius: 50px;*/
        /*    outline: 0;*/
        /*    z-index: 2;*/
        /*    top: 19px;*/
        /*    right: -24px;*/
        /*    border: 6px solid rgb(52, 56, 61);*/
        /*    font-size: 25px;*/
        /*    text-indent: 0px;*/
        /*    padding-left: 9px;*/
        /*    padding-bottom: 3px;*/
        /*    text-align: center;*/
        /*}*/

        /*#signin button[type="submit"]:hover {*/
        /*    color: rgb(0, 126, 165);*/
        /*    text-shadow: 0 0 10px rgb(0, 126, 165);*/
        /*    cursor: pointer;*/
        /*}*/

        #signin p {
            color: rgb(79, 85, 97);
            padding: 0 20px;
            font-weight: 700;
            font-size: 12px;
            margin: 5px 0 0 0;
        }

        #signin p > a {
            color: rgb(111, 119, 135);
            text-decoration: none;
        }

        #signin p > a:hover {
            border-bottom: 1px solid;
        }
        .gradient-button {
            width: 150px;
            text-decoration: none;
            display: inline-block;
            color: white;
            padding: 20px 30px;
            margin: 10px 10px 10px 55px;
            border-radius: 10px;
            font-family: 'Montserrat', sans-serif;
            text-transform: uppercase;
            letter-spacing: 2px;
            background-image: linear-gradient(to right, #9EEFE1 0%, #4830F0 51%, #9EEFE1 100%);
            background-size: 200% auto;
            box-shadow: 0 0 20px rgba(0, 0, 0, .1);
            transition: .5s;
        }
        .gradient-button:hover {
            background-position: right center;}
        .floating-button {
            text-decoration: none;
            display: inline-block;
            width: 140px;
            height: 45px;
            line-height: 45px;
            border-radius: 45px;
            margin: 10px 72px;
            font-family: 'Montserrat', sans-serif;
            font-size: 11px;
            text-transform: uppercase;
            text-align: center;
            letter-spacing: 3px;
            font-weight: 600;
            color: #524f4e;
            background: white;
            box-shadow: 0 8px 15px rgba(0, 0, 0, .1);
            transition: .3s;
        }
        .floating-button:hover {
            background: #2EE59D;
            box-shadow: 0 15px 20px rgba(46, 229, 157, .4);
            color: white;
            transform: translateY(-7px);
        }
        .pressed-button {
            text-decoration: none;
            display: inline-block;
            padding: 12px 40px;
            margin: 10px 20px 10px 50px;
            border-radius: 30px;
            background-image: linear-gradient(45deg, #6ab1d7 0%, #33d9de 50%, #002878 100%);
            background-position: 100% 0;
            background-size: 200% 200%;
            font-family: 'Montserrat', sans-serif;
            font-size: 24px;
            font-weight: 300;
            color: white;
            box-shadow: 0 16px 32px 0 rgba(0, 40, 120, .35);
            transition: .5s;
        }
        .pressed-button:hover {
            box-shadow: 0 0 0 0 rgba(0, 40, 120, 0);
            background-position: 0 0;
        }
    </style>
</head>

<body>

<%--<div>--%>
<%--    <form:form method="POST" modelAttribute="userForm">--%>
<%--        <h2>Регистрация</h2>--%>
<%--        <div>--%>
<%--            <form:input type="text" path="username" placeholder="Username"--%>
<%--                        autofocus="true"> </form:input>--%>
<%--            <form:errors path="username"> </form:errors>--%>
<%--                ${usernameError}--%>
<%--        </div>--%>
<%--        <div>--%>
<%--            <form:input type="password" path="password" placeholder="Password"></form:input>--%>
<%--        </div>--%>
<%--        <div>--%>
<%--            <form:input type="password" path="passwordConfirm"--%>
<%--                        placeholder="Confirm your password"></form:input>--%>
<%--            <form:errors path="password"></form:errors>--%>
<%--                ${passwordError}--%>
<%--        </div>--%>
<%--        <button type="submit">Зарегистрироваться</button>--%>
<%--    </form:form>--%>
<%--</div>--%>





    <div id="wrapper">
        <form:form id="signin" method="POST" modelAttribute="userForm">
            <br>
            <br>
            <a href="/" class="pressed-button">Main page</a>

            <br>
            <br>
        <h1>Sign In Form</h1>
        <div>
            <form:input type="text" path="username" id="user"
                        placeholder="username"></form:input>
             <form:errors path="username"> </form:errors>
           ${usernameError}
        </div>
        <div>
            <form:input type="password"  name="pass" path="password" placeholder="password"></form:input>
        </div>
        <div>
            <form:input type="password"  name="confimPass" path="passwordConfirm"
                        placeholder="Confirm your password"></form:input>
            <form:errors path="password"> </form:errors>
                ${passwordError}
            <p><input type="submit" class="gradient-button" value="Sing In"></p>
            <button><a href="/login" class="floating-button">Log in</a></button>

<%--            <button  type="submit" class="gradient-button">Sign In</button>--%>

<%--            <h4><a href="/login">Log in</a></h4>--%>
        </div>
    </div>


    </form:form>





<%--<div>--%>
<%--    <div id="wrapper">--%>
<%--        <h1>Sign In Form</h1>--%>
<%--        <form:form id="signin" method="POST" modelAttribute="userForm">--%>
<%--        <div>--%>
<%--            <form:input type="text" path="username" id="user"--%>
<%--                        name="user"--%>
<%--                        placeholder="username"> </form:input>--%>
<%--            <form:errors path="username"> </form:errors>--%>
<%--                ${usernameError}--%>
<%--        </div>--%>
<%--        <div>--%>
<%--            <form:input type="password" id="pass" name="pass" path="password" placeholder="password"> </form:input>--%>
<%--        </div>--%>
<%--        <div>--%>
<%--            <form:input type="password" id="pass" name="confimPass" path="passwordConfirm"--%>
<%--                        placeholder="Confirm your password"> </form:input>--%>
<%--            <form:errors path="password"> </form:errors>--%>
<%--                ${passwordError}--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <button type="submit">&#xf0da;</button>--%>
<%--    </form:form>--%>
<%--</div>--%>
</body>
</html>
