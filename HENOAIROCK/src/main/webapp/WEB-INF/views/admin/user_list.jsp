<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<style>
@font-face {
  font-family: 'Cafe24SsurroundAir';
  src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff');
  font-weight: normal;
  font-style: normal;
}

body {
  font-family: 'Cafe24SsurroundAir';
  src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff');
  font-weight: normal;
  font-style: normal;
}

.btn-primary {
    padding: 5px 20px;
    background-color: #2a2c33;
    color: white;
    border: none;
    border-radius: 25px;
    cursor: pointer;
}
.btn-primary:hover {
  background-color: #757677;
}


</style>
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center mb-4">회원관리</h1>
        
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>User ID</th>
                    <th>Name</th>
                    <th>Nickname</th>
                    <th>Member Since</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <!-- Loop through the list of users and display them -->
                <c:forEach items="${userList}" var="user">
                    <tr>
                        <td>${user.userId}</td>
                        <td>${user.name}</td>
                        <td>${user.nickname}</td>
                        <td>${user.memberDt}</td>
                        <td>
                            <c:choose>
                                <c:when test="${loggedInAdmin != null}">
                                    <a href="<c:url value='/admin/users/${user.userId}'/>" class="btn btn-primary"><i class="fas fa-user"></i> View Profile</a>
                                    <button type="button" class="btn btn-danger" onclick="confirmDelete('${user.userId}')"><i class="fas fa-trash"></i> Delete User</button>
                                </c:when>
                                <c:otherwise>
                                    <button type="button" class="btn btn-primary" disabled><i class="fas fa-user"></i> View Profile</button>
                                    <button type="button" class="btn btn-danger" disabled><i class="fas fa-trash"></i> Delete User</button>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <script src="/resources/js/jquery-3.7.0.js"></script>
    <script>
        function confirmDelete(userId) {
            if (confirm("정말로 이 사용자를 삭제하시겠습니까?")) {
                $.ajax({
                    url: "/admin/users/" + userId + "/delete",
                    type: "POST",
                    success: function(response) {
                        if (response === "success") {
                            alert("삭제가 완료되었습니다.");
                            location.reload(); // 페이지 리로드
                        } else {
                            alert("삭제 실패");
                        }
                    },
                    error: function(xhr, status, error) {
                        console.error(error);
                        alert("삭제 실패");
                    }
                });
            }
        }
    </script>
</body>
</html>
