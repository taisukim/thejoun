<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="util.CommonUtil" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>THEJOUN(๋์กฐ์)</title>
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<link rel="stylesheet" href="/thejoun/css/common.css" />
<link rel="stylesheet" href="/thejoun/css/reset.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script src="/thejoun/js/common.js"></script>
<script src="/thejoun/js/main.js"></script>
<script>
	$(function() {
		$(".board_tr").click(function() {
			location.href='view.do?board_no='+$(this).data("board_no");
		});
	});
</script>
</head>
<style>

/*web font load*/

@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');

/*@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');*/

.visual .swiper {
    height:256px;
}
.swiper-wrapper > div{
	height: 256px;   
    position: relative;
    display: flex;
	
}
.swiper-button-next:after{
	color:blanchedalmond; 
}
.swiper-button-prev:after {
	color:blanchedalmond; 
}
</style>
<body>
	<%@ include file="/WEB-INF/view/include/header.jsp"%>
	<!-- MENU -->
	<div class="wrap">
		<div class="visual">
			<div class="swiper mySwiper">
				<div class="swiper-wrapper">
					<div class="swiper-slide"
						style="background-image: url('/thejoun/img/visual1.png');"></div>
					<div class="swiper-slide"
						style="background-image: url('/thejoun/img/visual2.png');"></div>
					<div class="swiper-slide"
						style="background-image: url('/thejoun/img/visual3.png');"></div>
				</div>
				<div class="swiper-button-next"></div>
				<div class="swiper-button-prev"></div>
			</div>
		</div>
	</div>
	<div class="info">
		<div class="content">
			<div class="board_area">
				<div class="board_title on ">์์?๊ฒ์ํ</div>
				<div class="board_title">๊ณ?๋ฏผ๊ฒ์ํ</div>
				<div class="board_content" id="board_notice">
					<ul>
				<c:forEach var="vo" items="${list }" varStatus="status">
						<li>${vo.title }<span>${vo.nickname }</span></li>
				</c:forEach>
					</ul>
				</div>
				<div class="board_content" id="board_data">
					<ul>
				<c:forEach var="vo" items="${concernlist }" varStatus="status">
						<li>${vo.title }<span>${vo.nickname }</span></li>
				</c:forEach>
					</ul>
				</div>
			</div>
		</div>
		<div class="content">
			<div class="board_area">
				<div class="board_title on1 ">๊ณต์ง์ฌํญ</div>
				<div class="board_content" id="board_notice1">
					<ul>
				<c:forEach var="vo" items="${list }" varStatus="status">
						<li>${vo.title }<span>${vo.nickname }</span></li>
				</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/view/include/footer.jsp"%>
</body>
</html>