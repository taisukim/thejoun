<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동영상 갤러리</title>
<link rel="stylesheet" href="/thejoun/css/reset.css" />
<link rel="stylesheet" href="/thejoun/css/common.css" />
<link rel="stylesheet" href="/thejoun/css/contents.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script src="/thejoun/js/common.js"></script>
<script src="https://malsup.github.io/jquery.form.js"></script>
<script type="text/javascript"src="/thejoun/smarteditor/js/HuskyEZCreator.js"></script>
<script>
	var oEditors;
	$(function() {
		oEditors = setEditor("content");
	});

	function goSave() {
		if ($("#title").val == '') {
			alert('제목을 입력하세요');
			$("#title").focus();
			return;

		}
		oEditors.getById['content'].exec("UPDATE_CONTENTS_FIELD", []);
		var data = $("#frm").serialize();
		$("#frm").submit();
	}

	$(function() {
		$("#frm").ajaxForm({
			success : function(res) {
				alert('정상적으로 수정되었습니다.');
				location.href = 'view.do?board_no=${data.video_board_no}';
			},
			error : function(error) {
				console.log(error);
			}
		});
	});
</script>
</head>
<body>
	<div class="wrap">
		<%@ include file="/WEB-INF/view/include/header.jsp"%>
		<div class="sub">
			<div class="size">
				<h3 class="sub_title">동영상 갤러리</h3>

				<div class="bbs">
					<form method="post" name="frm" id="frm" action="update.do"
						enctype="multipart/form-data">
						<input type="hidden" name="video_board_no" value="${data.video_board_no }">
						<input type="hidden" name="${vo.userno }">
						<table class="board_edit">
							<tbody>
								<tr>
									<th>제목</th>
									<td><input type="text" name="title" id="title"
										class="wid100" value="${data.title }" /></td>
								</tr>
								<tr>
									<th>유튜브 주소 ID</th>
									<td>
										<div>
											<input type="text" name="url" id="mv_the_origin_url"
												style="width: 200px"  value="${data.url}"/>
										</div>
										<p class="mt_10">* 유튜브 주소를 입력해주세요</p>

									</td>
								</tr>
								<tr>
									<th>영상소개</th>
									<td><textarea name="content" id="content"
											style="width: 100%;">${data.content }</textarea></td>
								</tr>
								<tr>
									<th>첨부파일</th>
									<td><input type="checkbox" name="delCheck" value="1">기존파일삭제(${data.filename_org })<br>
										<input type="file" name="file"></td>
								</tr>
							</tbody>
						</table>
						<div class="btn1Set" style="text-align: right;">
							<a class="btn1" href="javascript:goSave();">저장 </a>
						</div>
					</form>
				</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/view/include/footer.jsp"%>
	</div>
</body>
</html>