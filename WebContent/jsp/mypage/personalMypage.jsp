<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/jsp/include/head.jsp" />
<script>
	
function updatePersonalProfile(){
		
		var re = /^[a-zA-Z0-9]{4,12}$/;
		var re2 =/^.*(?=.{8,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
		var re3 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var re5 = /^\d{2,3}\d{3,4}\d{4}$/;
		
		if($('input[name=name]').val()==""){
			alert("이름을 입력해주세요");
			$('input[name=name]').focus();
			return false;
		}
		
		if($('input[name=password]').val()==""){
			alert('비밀번호를 확인해주세요');
			$('input[name=password]').focus();
			return false;
		}else if(!check(re2,$('input[name=password]').val(),"비밀번호는 공백없이 4-20자")){
			$('input[name=password]').focus();
			return false;
		}
		
		if($('input[name=phone]').val()==""){
			alert("전화번호를 입력하세요!");
			$('input[name=phone]').focus(); 
			return false;
		}else if(!check(re5,$('input[name=phone]').val(),"올바른 전화번호가 아닙니다")){
			return false;
		}
		
		if ($('input[name=email]').val() == "") {
			alert("이메일을 입력하세요!");
			$('input[name=email]').focus(); 
			return false;
		}else if(!check(re3,$('input[name=email]').val(),"올바른 이메일형식이 아닙니다")){
			$('input[name=email]').focus(); 
			return false;
		}
		return true;
	}
</script>
</head>
<body>
<div class="popup_cover"></div>
<div class="popup_wrap">
	<div class="popup mCustomScrollbar" data-mcs-theme="dark-thin">
		<div class="popup_inner">
			<section class="store_name">
				도미노피자
			</section>
			<section class="content_wrap">
				<div class="content_header">
					<p>주문상태</p>
					<p class="status">주문완료</p>
				</div>
				<div class="content mb5">
					<p class="left_txt">
						주문시간
					</p>
					<p class="right_txt">2018.11.21 11:22</p>
				</div>
			</section>
			<section class="content_wrap">
				<div class="content_header">
					<p>주문내역</p>
				</div>
				<div class="content">
					<p class="left_txt">
						불고기피자x1
					</p>
					<p class="right_txt">500원</p>
				</div>
				<div class="content">
					<p class="left_txt">
						불고기피자x1
					</p>
					<p class="right_txt">500원</p>
				</div>
				<div class="content">
					<p class="left_txt">
						불고기피자x1
					</p>
					<p class="right_txt">500원</p>
				</div>
				<div class="content">
					<p class="left_txt">
						불고기피자x1
					</p>
					<p class="right_txt">500원</p>
				</div>
				<div class="content">
					<p class="left_txt">
						불고기피자x1
					</p>
					<p class="right_txt">500원</p>
				</div>
				<div class="content sum">
					<p class="left_txt">상품합계</p>
					<p class="right_txt">1500원</p>
				</div>
				<div class="content payment">
					<p class="left_txt">결제금액</p>
					<p class="right_txt">1500원</p>
				</div>
			</section>
			<section class="content_wrap">
				<div class="content_header">
					<p>주문자 정보</p>
				</div>
				<div class="content">
					<p class="left_txt">
						연락처
					</p>
					<p class="right_txt">01011112222</p>
				</div>
				<div class="content addr">
					<p class="left_txt">
						주소
					</p>
					<p class="right_txt">
						경기도 구리시 갈매동 갈매중앙로 111<br>111동 1111호
					</p>
				</div>
				<div class="content addr">
					<p class="left_txt">
						요청사항
					</p>
					<p class="right_txt">
						(없음)
					</p>
				</div>
			</section>
		</div>
	</div>
	<div class="popup_close_btn">
		<button type="button" class="close_btn"></button>
	</div>
</div>
<header>
	<%-- <jsp:include page="/include/header.jsp" > --%>
	<%@include file="/jsp/include/header.jsp"%>
</header>
<div class="myPage_page page_shadow">
	<div class="page_inner">
		<section class="item_wrap">
			<div class="left">
				<div class="item m2_item">
					<div class="item_header">
						<h4 class="tit">회원정보</h4>
						<button type="button"></button>
					</div>
					<p class="contxt">
						<span>'나'의 회원</span> 정보입니다.<br>회원유형과 가입일은 수정이 불가능합니다.
					</p>
					<div class="item_content basic_content on">
						<div class="info_wrap">
							<div class="info">
								<p class="tit">회원유형</p>
								<p class="txt">${personal.type}</p>
							</div>
							<div class="info">
								<p class="tit">가입날짜</p>
								<p class="txt">${personal.regDate}</p>
							</div>
						</div>
					</div>
				</div>
				<div class="item profile_item">
					<div class="item_header">
						<h4 class="tit">프로필</h4>
						<button type="button"></button>
					</div>
					<p class="contxt">
						<span>'나'를 표현하는 프로필</span> 정보입니다.<br> 수정 화면에서 비밀번호를 변경하세요.
					</p>
					<div class="item_content basic_content on">
						<div class="pic">
							<img src="/MOMOGO/img/default.png" alt="">
						</div>
						<div class="info_wrap">
							<div class="info">
								<p class="tit">아이디</p>
								<p class="txt">${ personalVO.id }</p>
							</div>
							<div class="info">
								<p class="tit">이름</p>
								<p class="txt">${ personalVO.name }</p>
							</div>
							<div class="info">
								<p class="tit">비밀번호</p>
								<p class="txt">${ personalVO.pass }</p>
							</div>
							<div class="info">
								<p class="tit">전화번호</p>
								<p class="txt">${ personalVO.phone }</p>
							</div>
							<div class="info">
								<p class="tit">이메일주소</p>
								<p class="txt">${ personalVO.email }</p>
							</div>
						</div>
						<button class="basic_btn modify_btn" type="button">수정</button>
					</div>
					<div class="item_content modify_content">
						<div class="pic">
							<img src="/MOMOGO/img/default.png" alt="">
						</div>
						<div class="info_wrap">
							<form method="post" action="<%= request.getContextPath() %>/update/personalProfileUpdate.do" onsubmit="return updatePersonalProfile()">
								<input type="hidden" name="id" value="${ personalVO.id }">
								<div class="info">
									<p class="tit">아이디</p>
									<p class="txt">${ personalVO.id }</p>
								</div>
								<div class="info">
									<p class="tit">이름</p>
									<input type="text" id="name" name="name" value="${ personalVO.name }">
								</div>
								<div class="info">
									<p class="tit">비밀번호</p>
									<input id="password" type="password" name="password"
										value="${ personalVO.pass }">
								</div>
								<div class="info">
									<p class="tit">전화번호</p>
									<input type="text" id="phone" name="phone" value="${ personalVO.phone }">
								</div>
								<div class="info mail">
									<p class="tit">이메일주소</p>
									<input type="text" id="email" name="emailId" value="${ personalVO.email }">
								</div>
								<div class="btn_wrap">
									<button type="reset" class="basic_btn cancel_btn">취소</button>
									<button type="submit" class="basic_btn complete_btn">완료</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="right">
				<div class="item order_item">
					<div class="item_header">
						<h4 class="tit">주문내역</h4>
						<button type="button"></button>
					</div>
					<p class="contxt">
						<span>'최근주문'한  주문내역</span> 정보입니다.<br> 3개월이 지난 주문 내역은 삭제됩니다.
					</p>
					<c:forEach items="${ requestScope.orderList }" var="order">
						<div class="item_content">
							<div class="content_header">
								<p class="date">${ order.regDate }</p>
								<p class="status">${ (order.status eq 'onCall')? '접수대기중' : '배달완료' }</p>
							</div>
							<div class="content">
								<div class="img">
									<img src="/MOMOGO/img/item01.jpg" alt="">
								</div>
								<div class="order_info">
									<p class="store_name">${ order.storeName }</p>
									<p class="food_name">
										${ order.menu } 
									</p>
								</div>
							</div>
						</div>
					</c:forEach>
					
				</div>
			</div>
		</section>
	</div>
</div>
<footer>
	<%@include file="/jsp/include/footer.jsp"%>
</footer>
</body>
</html>