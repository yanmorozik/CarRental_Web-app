<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Новости</title>
</head>
<body>
<div>
    <h2>Новости <br> Только для залогинившихся пользователей.</h2>
<%--    <a href="/">Главная</a>--%>
<%--    <sec:authorize access="hasAuthority('ROLE_ADMIN')">--%>
<%--        <a href="/admin">управление</a>--%>
<%--    </sec:authorize>--%>
</div>
</body>
</html>