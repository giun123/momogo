<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/jsp/include/head.jsp" />
</head>
<body>
	<div class="noticeForm_page">
		<div class="page_inner">
			<div class="bbs_page_tit">공지사항</div>
			<div class="bbs_write">
				<div class="content">
					<div class="tit">제목</div>
					<input type="text" placeholder="${board.title}">
				</div>
				<div class="content">
					<div class="half">
						<div class="tit">작성자</div>
						<div class="txt">${board.writer}</div>
					</div>
					<div class="half">
						<div class="tit">작성일</div>
						<div class="txt">${ board.regDate }</div>
					</div>
				</div>
				<textarea value="${ board.content }"></textarea>
			</div>
			<div class="bbs_btn_wrap">
				<a href="noticeList.jsp">
					<div class="bbs_btn cancel" id="cancel">취소</div>
				</a>
				<a href="noticeView.jsp">
					<div class="bbs_btn registration" id="registration">등록</div>
				</a>
			</div>
		</div>
	</div>
</body>
</html>