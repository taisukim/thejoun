<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="util.CommonUtil" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<script>
	$(function() {
		$(".title").click(function() {
			location.href='view.do?image_board_no='+$(this).data("image_board_no");
		});
		
		$('#allChk').click(function(){  
			var checked = $('#allChk').is(':checked');
		
			if(checked) {
				$("input[name='no']").each(function() {
					$(this).prop('checked',true);
				});
			} else {
				$("input[name='no']").each(function() {
					$(this).prop('checked',false);
				});
			}
		});
	});
	
	function goDelete() {//체크박스 삭제처리
		if (confirm("삭제하시겠습니까?")) {
			$("#frm").submit();
		}
	}
</script>
</head>
<body> 
<div id="wrap">
	<!-- canvas -->
	<div id="canvas">
		<!-- S T A R T :: headerArea-->
		<%@ include file="/WEB-INF/view/admin/include/top.jsp" %>
		<!-- E N D :: headerArea--> 
		
		<!-- S T A R T :: containerArea-->
		<div id="container">
			<div id="content">
				<div class="con_tit">
					<h2>게시물 관리 - 자유 갤러리[목록]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="blist">
							<p><span><strong>총 ${totCount }개</strong>  |  ${imageBoardVo.page }/${totPage }페이지</span></p>
							<form name="frm" id="frm" action="boardDeleteAjax.do" method="post">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 자유갤러리 관리목록입니다.">
								<colgroup>
									<col class="w3" />
									<col class="w4" />
									<col class="" />
									<col class="w10" />
									<col class="w5" />
									<col class="w6" />
									<col class="w6" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first"><input type="checkbox" name="allChk" id="allChk"/></th>
										<th scope="col">번호</th>
										<th scope="col">제목</th> 
										<th scope="col">작성자</th> 
										<th scope="col">작성일</th> 
										<th scope="col">조회수</th>
										<th scope="col" class="last">상태</th>
									</tr>
								</thead>
								<tbody>
								<c:if test="${empty list }">
		                            <tr>
		                                <td class="first" colspan="7">등록된 글이 없습니다.</td>
		                            </tr>
								</c:if>
		                        <c:if test="${!empty list }">
		                        <c:forEach var="vo" items="${list }" varStatus="status">
		                            <tr>
		                            	<td class="first"><input type="checkbox" name="no" id="no" value="${vo.image_board_no }"/></td>
		                                <td>${(totCount-status.index) - ((imageBoardVo.page-1)*10) }</td>
		                                <td class="title" data-image_board_no="${vo.image_board_no }" style="cursor: pointer;">
		                                    ${vo.title }
		                                </td>
		                                <td class="writer">
		                                    ${vo.nickname }
		                                </td>
		                                <td class="date">${vo.regdate }</td>
		                                <td>${vo.readcount }</td>
		                                <td class="last">
										<c:if test="${vo.state == 1}">
										신고
										</c:if>
										<c:if test="${vo.state == 0}">
										정상
										</c:if>
										</td>
		                            </tr>
		                        </c:forEach>
		                        </c:if>
								</tbody>
							</table>
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="#" onclick="goDelete()"><strong>삭제</strong> </a>
								</div>
								<div class="btnRight">
									<a class="wbtn" href="write.do"><strong>등록</strong> </a>
								</div>
							</div>
							<!--//btn-->
							
							<div class='page'>
							${pageArea }
							</div>
							
							<!-- //페이징 처리 -->
							<div class="bbsSearch">
								<form method="get" name="searchForm" id="searchForm" action="">
									<div class="search">
										<select id="stype" name="searchType" class="dSelect"
											title="검색분류 선택">
											<option value="">전체</option>
											<option value="title">제목</option>
											<option value="content">내용</option>
											<option value="nickname">닉네임</option>
										</select> <input type="text" id="sval1" name="searchWord" value="" title="검색어 입력"> 
										<input type="image" src="<%=request.getContextPath()%>/images/admin/btn_search.gif" class="sbtn" alt="검색" />
									</div>
								</form>
							</div>
							<!-- //search --> 
						</div>
						<!-- //blist -->
					</div>
					<!-- //bbs --> 
					<!-- 내용 : e -->
				</div>
				<!--//con -->
			</div>
			<!--//content -->
		</div>
		<!--//container --> 
		<!-- E N D :: containerArea-->
	</div>
	<!--//canvas -->
</div>
<!--//wrap -->

</body>
</html>