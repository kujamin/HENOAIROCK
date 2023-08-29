<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    // Assuming you have a mechanism to retrieve user information
    String userImageUrl = "https://cdn.class101.net/images/42c9cf0f-97aa-4a07-8833-8ee146daa2a0/1920xauto.webp"; // Replace with the actual image URL
    String username = "JohnDoe"; // Replace with the actual username

    boolean userLoggedIn = session.getAttribute("userLoggedIn") != null && (Boolean) session.getAttribute("userLoggedIn");

%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HeNoAIRock</title>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700&display=swap">
    <link href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&display=swap" rel="stylesheet">
    <link rel="shortcut icon" href="<c:url value='/resources/favicon.ico'/>" type="image/x-icon"/>
    <link rel="icon" href="<c:url value='/resources/favicon.ico'/>" type="image/x-icon"/>
    <style>
@font-face {
    font-family: 'Cafe24SsurroundAir';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'TheJamsil5Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/TheJamsil5Bold.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}
body {
  margin: 0;
  padding: 0;
  display: flex;
}

.sidebar {
  width: 232px;
  position: fixed;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  top: 0;
  left: 0;
  height: 100%;
  background-color: #343a40;
  padding-top: 20px;
  transition: width 0.3s ease-in-out;
  z-index: 2;
  background-image: linear-gradient(180deg, #0d101a 10%, #1a1515 100%);
  box-shadow: 0 0 10px rgba(0, 0, 0, 1);
}

.user-profile {
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 10px;
  background-color: #000000;
  width: 100%;
}

.user-profile img {
  width: 50px;
  height: 50px;
  border-radius: 10px;
  margin-bottom: 5px;
}

.user-profile span {
  color: #f8f9fa;
  font-size: 14px;
}

.content {
  padding: 20px;
  margin-left: 250px;
  transition: margin-left 0.3s ease-in-out;
}

.sidebar ul {
  list-style: none;
  padding: 0;
}

.sidebar li {
  margin-bottom: 10px;
}

.sidebar a {
  font-size: 14px;
  color: #f8f9fa;
  text-decoration: none;
  padding: 8px 10px;
  display: block;
  transition: background-color 0.2s ease;
}

.sidebar a:hover {
  background-color: white;
  color: #000;
}

.sidebar .material-icons {
  font-size: 16px;
  vertical-align: middle;
  margin-right: 8px;
}

.logout-button {
  padding: 8px 16px;
  background-color: #dc3545;
  color: #fff;
  border: none;
  border-radius: 5px;
  transition: background-color 0.2s ease;
  cursor: pointer;
  text-decoration: none;
}

.logout-button:hover {
  background-color: #c82333;
}

.content-expanded {
  margin-left: 60px;
}

.menu-items {
  margin-top: 0px;
  padding-left: 0;
    font-family: 'Cafe24SsurroundAir';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

.menu-items li {
  margin-bottom: 10px;
}

.menu-items a {
  padding: 10px;
  display: block;
  transition: background-color 0.2s ease;
}

.sidebar-content-wrapper {
  display: flex;
  transition: margin-left 0.3s ease-in-out;
  font-family: 'Cafe24SsurroundAir';
  src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff');
  font-weight: bold;
  font-style: normal;
}

.menu-items .separator {
  border: 0;
  border-top: 1px solid rgba(255, 255, 255, .15);
}

.sidebar-brand {
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 20px 15px;
  color: #f8f9fa;
  text-decoration: none;
  font-weight: bold;
}

.sidebar .sidebar-heading {
  text-align: left;
  padding: 0 1rem;
  font-weight: 800;
  font-size: .65rem;
  color: #ffffff9e;
  font-family: 'Nunito', sans-serif;
}

.logout {
  font-family: 'Nunito', sans-serif;
}

.sidebar-brand {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  padding: 20px 15px;
  color: #f8f9fa;
  text-decoration: none;
  font-weight: bold;
}

.logo-emoji {
  font-size: 24px;
  margin-right: 10px;
}

.sidebar-brand div:nth-child(2) {
  font-size: 18px;
  font-family: 'Nunito', sans-serif;
}

@media (max-width: 768px) {
  .sidebar {
    width: 150px;
  }
  
.content {
  margin-left: 130px;
  }

.menu-items a {
  text-align: center;
  padding: 5px 10px;
  }
  
.sidebar .material-icons {
  display: block;
  margin: 0 auto 5px;
  text-align: center;
  }

.menu-items li {
    font-family: 'Cafe24SsurroundAir';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff');
    font-weight: normal;
    font-style: normal;
  margin-bottom: 10px;
  }
  
.sidebar-brand {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  padding: 20px 15px;
  color: #f8f9fa;
  text-decoration: none;
  font-weight: bold;
  }

.logo-emoji {
  font-size: 24px;
  margin-bottom: 5px;
  }
}

body::-webkit-scrollbar {
  width: 12px;
}

body::-webkit-scrollbar-thumb {
  background-color: #555;
  border-radius: 5px;
}

body::-webkit-scrollbar-thumb:hover {
  background-color: #888;
}

body::-webkit-scrollbar-track {
  background-color: white;
  border-radius: 5px;
  box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.2);
}
</style>
</head>

<body class="body2">
<div class="sidebar-content-wrapper">
<div class="sidebar">


<ul class="menu-items">

<li>
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/main">
        <div>
            <span class="logo-emoji"><img src="/resources/images/logo_white.png" width=32px height=32px /></span> <!-- Replace with the emoji you want to use -->
        </div>
        <div>HENOAIROCK&nbsp</div>
        
    </a>
    </li>
    <li class="separator"></li>
                    <div class="sidebar-heading">
                CHAT
            </div>
    <li><a href="/main"><i class="material-icons">music_note</i> 감정분석</a></li>
    <li class="separator"></li>
                    <div class="sidebar-heading">
                MAIN
            </div>
    <li><a href="/mypage"><i class="material-icons">person</i> 마이페이지</a></li>
    <li></li>
    <li><a href="/music/music_rank"><i class="material-icons">&#xE01D;</i> 음악 순위</a></li>
    <li></li>
    <li><a href="/post"><i class="material-icons">forum</i> 게시판</a></li>
    <li class="separator"></li>
                <div class="sidebar-heading">
                SETTING
            </div>
    <li><a href="/setting"><i class="material-icons">&#xE8B8;</i> 설정</a></li>


</ul>

    <!-- User profile section -->
<div class="user-profile" id="userProfileSection">
    <% if (userLoggedIn) { %>
        <img src="<%= userImageUrl %>" alt="User Profile Image">
        <span>${sessionScope.user.userId}</span>
        <a class="nav-link separator logout" data-toggle="modal" data-target="#logoutModal" style="cursor: pointer;">Logout
        <i class="material-icons">logout</i>
        </a>
    <% } else { %>
        <a class="nav-link" href="/member/login">Login
        <i class="material-icons">login</i>
        </a>
    <% } %>
</div>
</div>
    <div class="content">
    
  </div>
</div>

<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="logoutModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-top" role="document">
        <div class="modal-content">
            <div class="modal-header bg-secondary text-white">
                <h5 class="modal-title" id="logoutModalLabel" style="font-family: Arial, sans-serif; font-size: 18px;">로그아웃 확인</h5>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p class="lead" style="font-size: 16px;">로그아웃 하시겠습니까?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal" style="font-size: 14px;">취소</button>
                <a class="btn btn-danger" href="/member/logout" style="font-size: 14px;">로그아웃</a>
            </div>
        </div>
    </div>
</div>

<script src="/resources/js/jquery-3.7.0.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
</body>

</html>