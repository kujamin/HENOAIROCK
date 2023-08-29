<%@page import="com.heno.airock.dto.MusicVO"%>
<%@page import="com.heno.airock.cmn.StringUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/sidebar.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/resources/css/Mypage.css">
<!-- <link rel="stylesheet" type="text/css" href="/resources/css/music_rank.css"> -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<script src="${CP}/resources/js/jquery-3.7.0.js"></script>
<script src="${CP}/resources/js/util.js"></script>
<title>Insert title here</title>
</head>


<body class="body2">

    <!-- 제목 및 닉네임 사진 변경  -->
    <div id="musicList" class="mw">
 		<div class="meta_info">
	    	<img class="meta_info_img" alt=""
	        	src="https://images.unsplash.com/photo-1528301721190-186c3bd85418?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1469&q=80">
	    <div class="meta_info_text absolute p-16">
   		    <h2 style="text-align: left;">&lt;마이페이지&gt;</h2>

    		<!-- 리스트 등록 버튼 추가 -->	
 			<a href="/mypage/list_reg" class="btn-basic btn-edit" onclick="handleListAddClick()" style="font-family: 'Cafe24SsurroundAir';text-decoration: none;">리스트 등록</a>
 			
        <!-- 노래 모음 -->
 		<div class="additional-content">
            <button class="fs" style="border: none;">
                <img class="horizen_mmimg" src="https://api1.indj.club/api/v3/channel/image/profile/profile_51532_340788244122.jpg" alt="이미지">
                <div id="meta_info" class="ell">
                    <p class="meta_info_title ell">${outVO3.name} 님의 플레이 리스트입니다</p>
                    <br/>
                </div>
            </button>
        </div>  

   </div>
 </div>
        <div class="tab_menu">
            <ul class="tab_list">
            
                <li class="is_on"><a href="#tab1" class="tab_btn">좋아요</a></li>
                <li><a href="#tab2" class="tab_btn">앨범아트</a></li>
            </ul>
        </div>
        
        
			<div id="tab1" class="cont_area cont_active">
				<div class="music_list p-16">
					<c:choose>
						<%-- 조회 데이터가 있는 경우--%>
						<c:when test="${not empty list }">
							<c:forEach var="vo" items="${list}">
								<article class="horizen_station cursor">
									<button class="fs music" id="music" name="music">
										<img class="horizen_img station" src="${vo.albumPath }"
											alt="이미지" style="width: 80px;">
										<div id="meta_info" class="ell">
											<p class="meta_info_title ell">${vo.title}</p>
											<span class="meta_info_desc ell">${vo.artist }</span>
										</div>
									</button>
									<input type="hidden" value="${vo.musicId }" id="musicId"
										name="musicId">
								</article>
							</c:forEach>
						</c:when>
						<%-- 조회 데이터가 없는 경우--%>
						<c:otherwise>
							<tr>
								<td class="text-center col-sm-12  col-md-12  col-lg-12"
									colspan="99">검색결과가 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</div>
			</div>

			<div id="tab2" class="cont_area">
				<div class="music_list p-16">
					<c:choose>
						<%-- 조회 데이터가 있는 경우--%>
						<c:when test="${not empty list2 }">
							<c:forEach var="vo" items="${list2}">
								<article class="horizen_station cursor">
									<button class="fs myListSeq" id="myListSeq2" name="myListSeq">
										<img class="horizen_img station" src="${vo.albumImg }"
											alt="이미지" style="width: 80px;">
										<div id="meta_info" class="ell">
											<p class="meta_info_title ell">${vo.title}</p>
										</div>
									</button>
									<input type="hidden" value="${vo.myListSeq}" id="myListSeq"
										name="myListSeq">
								</article>
							</c:forEach>
						</c:when>
						<%-- 조회 데이터가 없는 경우--%>
						<c:otherwise>
							<tr>
								<td class="text-center col-sm-12  col-md-12  col-lg-12"
									colspan="99">검색결과가 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</div>
			</div>


		</div>
		<script>
			const tabList = document.querySelectorAll('.tab_menu .tab_list li');
			const contents = document.querySelectorAll('.cont_area');
			// 초기에 첫 번째 탭 내용을 활성화
			contents[0].classList.add('cont_active');
			for (var i = 0; i < tabList.length; i++) {
				tabList[i].querySelector('.tab_btn').addEventListener(
						'click',
						function(e) {
							e.preventDefault();
							for (var j = 0; j < tabList.length; j++) {
								tabList[j].classList.remove('is_on');
								contents[j].classList.remove('cont_active');
							}
							this.parentNode.classList.add('is_on');
							const activeContId = this.getAttribute('href');
							document.querySelector(activeContId).classList
									.add('cont_active');
						});
			}

			$(".music")
					.on(
							"click",
							function(e) {
								let musicId = $(this).siblings(
										"input[type='hidden']").val();
								console.log('musicId:' + musicId);
								// 팝업 창 열기
								let popupUrl = "music/music_detail/?musicId="
										+ musicId;
								let popupName = "MusicDetailPopup";
								let popupOptions = "width=800,height=600,resizable=yes,scrollbars=yes";
								window.open(popupUrl, popupName, popupOptions);
							});
			let isButtonEnabled = true;

			$(".myListSeq")
					.on(
							"click",
							function(e) {
								if (isButtonEnabled) {

									let myListSeq = $(this).siblings(
											"input[type='hidden']").val();
									console.log('myListSeq:' + myListSeq);
									// 팝업 창 열기
									let popupUrl = "http://localhost:8080/mypage/list_detail/?myListSeq="
											+ myListSeq;
									let popupName = "ListDetailPopup";
									let popupOptions = "width=1400,height=600,resizable=yes,scrollbars=yes";
									window.open(popupUrl, popupName,
											popupOptions);

								}
							});

			// 페이지 로드 시 기본적으로 button_class를 숨김
			document.addEventListener("DOMContentLoaded", function() {
				hideButtons();
			});

			// tab1을 클릭하면 button_class를 숨김
			document.querySelector('a[href="#tab1"]').addEventListener("click",
					function() {
						hideButtons();
					});

			// tab2를 클릭하면 button_class를 보이게 함
			document.querySelector('a[href="#tab2"]').addEventListener("click",
					function() {
						showButtons();
					});

			// button_class를 숨기는 함수
			function hideButtons() {
				var buttons = document.querySelectorAll(".button_class");
				buttons.forEach(function(button) {
					button.style.display = "none";
				});
			}

			// button_class를 보이게 하는 함수
			function showButtons() {
				var buttons = document.querySelectorAll(".button_class");
				buttons.forEach(function(button) {
					button.style.display = "block";
				});
			}
		</script>
</body>
</html>