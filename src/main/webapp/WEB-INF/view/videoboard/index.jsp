<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<link rel="stylesheet" href="/thejoun/css/reset.css" />
<link rel="stylesheet" href="/thejoun/css/common.css" />
<link rel="stylesheet" href="/thejoun/css/contents.css"/>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script src="/thejoun/js/common.js"></script>
<script src="/thejoun/js/main.js"></script>

</head>
<body>

	<div class="wrap">
		<%@ include file="/WEB-INF/view/include/header.jsp"%>

		<div class="container">
			<div class="size">
				<div class="section">
					<img src="/project/img/section1_1.png">
				</div>
				<div class="section">
					<img src="/project/img/section1_2.png">
				</div>
				<div class="section">
					<img src="/project/img/section1_3.png">
				</div>
				<div class="section">
					<img src="/project/img/section1_4.png">
				</div>
				<div class="section">
					<img src="/project/img/section1_5.png">
				</div>
				<div class="section">
					<img src="/project/img/section1_6.png">
				</div>
			</div>
		</div>
		<div class="info">
			<div class="btn1Set" style="text-align: right;">

				<a class="btn1" href="write.do">글작성 </a>

			</div>
			${pageArea }

			<!-- 페이지처리 -->
			<div class="bbsSearch">
				<form method="get" name="searchForm" id="searchForm" action="">
					<span class="srchSelect"> <select id="stype"
						name="searchType" class="dSelect" title="검색분류 선택">
							<option value="">전체</option>
							<option value="title">제목</option>
							<option value="content">내용</option>
							<option value="nickname">닉네임</option>
					</select> <span class="searchWord"> <input type="text" id="sval"
							name="searchWord" value="" title="검색어 입력"> <input
							type="button" id="" value="검색" title="검색">
					</span>
				</form>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/view/include/footer.jsp"%>
	</div>
</body>
</html>