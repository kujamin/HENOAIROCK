<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="CP" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="${CP}/resources/js/jquery-3.7.0.js"></script>
<script src="${CP}/resources/js/util.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/intro.css">
<link rel="stylesheet" type="text/css" href="/resources/css/intro2.css">
<link rel="shortcut icon" href="<c:url value='/resources/favicon.ico'/>" type="image/x-icon"/>
<link rel="icon" href="<c:url value='/resources/favicon.ico'/>" type="image/x-icon"/>
<title>HeNoAIRock</title>
</head>

<body>
<div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
  <header class="mb-auto">
    <div>
      <h2>HENOAIROCK</h2>
      <nav class="nav nav-masthead justify-content-center float-md-end">
        <a class="nav-link active" aria-current="page" href="/">Home</a>
        <a class="nav-link" href="/member/login">Login</a>
        <a class="nav-link" href="/setting/setting_service">Service</a>
      </nav>
    </div>
  </header>
</div>

	<video id="background-video" autoplay loop muted>
        <source src="/resources/video/intro_video_list.mp4" type="video/mp4">
    </video>

<div class="container">
</div>
</body>
</html>