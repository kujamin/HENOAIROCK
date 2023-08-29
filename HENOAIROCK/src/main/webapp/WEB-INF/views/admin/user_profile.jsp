<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/admin/admin_dashboard.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Link to Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- Link to Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <!-- Link to Font Awesome icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5 animate__animated animate__fadeIn">
    <h1 class="text-center mb-4">Admin - User Profile</h1>
    
    <div class="row">
        <div class="col-md-6">
            <div class="user-info-box p-4 bg-light border rounded">
                <h3>User Information</h3>
                <p><i class="fas fa-id-card"></i> <strong>User ID:</strong> ${user.userId}</p>
                <p><i class="fas fa-user"></i> <strong>Name:</strong> ${user.name}</p>
                <p><i class="fas fa-user-ninja"></i> <strong>Nickname:</strong> ${user.nickname}</p>
                <p><i class="far fa-calendar"></i> <strong>Member Since:</strong> ${user.memberDt}</p>
                <p><i class="far fa-calendar-alt"></i> <strong>Birth Date:</strong> ${user.birth}</p>
            </div>
        </div>
        <div class="col-md-6">
            <div class="user-image-box p-4 bg-light border rounded text-center">
                <p><strong>Profile Image:</strong></p>
                <img src="${user.profileImg}" alt="Profile Image" class="img-fluid rounded-circle" style="max-width: 200px; height: auto;" />
            </div>
        </div>
    </div>
    
    <a href="<c:url value='/admin/users'/>" class="btn btn-primary mt-3 animate__animated animate__fadeInUp"><i class="fas fa-arrow-left"></i> Back to User List</a>
</div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <script src="/resources/js/jquery-3.7.0.js"></script>
</body>
</html>
