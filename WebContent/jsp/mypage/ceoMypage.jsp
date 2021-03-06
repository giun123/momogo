<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/jsp/include/head.jsp" />

<!-- ajax는 slimbuild js에는 포함되어 있지 않기 때문에 full js파일 가져옴 -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script>
	$(document).ready(function(){
		/* ceoMenu에서 가격입력시, **원으로 입력했을 때 순수 int로 처리하기 위한 글로벌 변수*/
		window.ceoMenuPrice="";
		
		/* 카테고리 내용 서버로 보내기 */
		$('#menuAddBtn').click(function(){
/* 			console.log($('.category_select').val());
			console.log($('#foodPicAdd').val());
			console.log($('#food_name').val());
			console.log($('#food_price').val());
			console.log($('#food_describe').val()); */
			
			var files = document.getElementById("foodPicAdd").files;
			
			if(checkCeoMenu(files)){
			
				var menuData = new FormData();
				menuData.append('foodPic',files[0]);
				menuData.append('foodPicName',files[0].name);
				menuData.append('cate',$('.category_select').val());
				menuData.append('name',$('#food_name').val());
				menuData.append('price',ceoMenuPrice);
				menuData.append('describe',$('#food_describe').val());
				
				$.ajax({
					url : '${pageContext.request.contextPath}/update/cateMenu.do',
					data : menuData,
					type : 'POST',
					enctype : 'multipart/form-data',
					contentType: false,
					processData: false,
					success : addMenuSuccess,
					error : addMenuFail
				})
			}
		});
	})
	
	function addMenuSuccess(data){
		alert("등록이 완료되었습니다");
		location.href="${pageContext.request.contextPath}/mypage/ceoMypage.do";
	}
	
	function addMenuFail(){
		alert('무슨 일이야');
	}
	
	function checkCeoMenu(files){
		if(files[0]==undefined){
			alert("사진을 추가해주세요");
			return false;
		}
		
		if($('#food_name').val() == "" && $('#food_price').val() == "" && $('#food_describe').val() == ""){
			alert("정보를 정확히 입력해주세요");
			return false;
		}
		
		var wonIndex = $('#food_price').val().indexOf("원");
		var commaIndex = $('#food_price').val().indexOf(",");
		console.log(wonIndex);
		/* 원 잘라냄  */
		if(wonIndex != -1){
			ceoMenuPrice = $('#food_price').val().substring(0,wonIndex);
		}
		if(commaIndex != -1){
			/* comma 지우는 로직 */
			ceoMenuPrice= ceoMenuPrice.replace(/,/g,"");
		}
		
		return true;
	}
	
	function updateCeoProfile(){
		
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
	
	function check(re, what, msg){
		if(re.test(what)){
			return true; 
		}
		alert(msg);
		what ="";
	}
	
	/*음식사진 첨부*/
	$('.menu_add_wrap .food').bind("click" , function () {
	        $('.menu_add_wrap #foodPicAdd').click();
	 });
	 
	  function readURL(input) {
	            if (input.files && input.files[0]) {
	                var reader = new FileReader();

	                reader.onload = function (e) {
	                    $('.menu_add_wrap #foodPic')
	            .attr('src', e.target.result);
	        };

	        reader.readAsDataURL(input.files[0]);
	    }
	}
</script>
</head>
<body>
	<div class="popup_cover"></div>
	<div class="popup_wrap">
		<div class="popup mCustomScrollbar" data-mcs-theme="dark-thin">
			<div class="popup_inner">
				<section class="store_name">도미노피자</section>
				<section class="content_wrap">
					<div class="content_header">
						<p>주문상태</p>
						<p class="status">주문완료</p>
					</div>
					<div class="content mb5">
						<p class="left_txt">주문시간</p>
						<p class="right_txt">2018.11.21 11:22</p>
					</div>
				</section>
				<section class="content_wrap">
					<div class="content_header">
						<p>주문내역</p>
					</div>
					<div class="content">
						<p class="left_txt">불고기피자x1</p>
						<p class="right_txt">500원</p>
					</div>
					<div class="content">
						<p class="left_txt">불고기피자x1</p>
						<p class="right_txt">500원</p>
					</div>
					<div class="content">
						<p class="left_txt">불고기피자x1</p>
						<p class="right_txt">500원</p>
					</div>
					<div class="content">
						<p class="left_txt">불고기피자x1</p>
						<p class="right_txt">500원</p>
					</div>
					<div class="content">
						<p class="left_txt">불고기피자x1</p>
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
						<p class="left_txt">연락처</p>
						<p class="right_txt">01011112222</p>
					</div>
					<div class="content addr">
						<p class="left_txt">주소</p>
						<p class="right_txt">
							경기도 구리시 갈매동 갈매중앙로 111<br>111동 1111호
						</p>
					</div>
					<div class="content addr">
						<p class="left_txt">요청사항</p>
						<p class="right_txt">(없음)</p>
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
					<button type="button" class="add_category_btn">카테고리 추가</button>
					<div class="item menu_add_item">
						<select class="category_select">
							<!-- <option selected>카테고리를 선택하세요</option> -->
							<option selected>맛있는메뉴</option>
						</select>
						<div class="menu_add_wrap">
							<div class="input_content food_info">
	                           <div class="sel_arrow"></div>
	                           <div class="food_input_container">
	                              <label class="food">
	                              	<img id="foodPic" src="/MOMOGO/img/noImage.png" alt="">
	                              	<input id="foodPicAdd" class="food_pic" onchange="readURL(this);" type="file">
	                              </label>
	                              <div class="foodInput_wrap">
	                                 <div class="input_box">
	                                    <input type="text" id="food_name" placeholder="음식명을 입력하세요">
	                                 </div>
	                                 <div class="input_box">
	                                    <input type="text" id="food_price" placeholder="음식가격을 입력하세요">
	                                 </div>
	                                 <div class="input_box">
	                                    <input type="text" id="food_describe" placeholder="음식설명을 입력하세요">
	                                 </div>
	                              </div>
	                           </div>
	                        </div>
	                        <input class="food_btn basic_btn" id="menuAddBtn" type="button" value="완료">
						</div>
					</div>
					<div class="category_delete_wrap">
						<select>
							<option selected>카테고리를 선택하세요</option>
						</select>
						<button type="button"  class="basic_btn" id="deleteCategoryBtn">삭제</button>
					</div>
					<div class="menu_category_wrap">
						<ul class="menu_category">
							<li class="category">
								<p class="menu_tit popular">인기메뉴</p>
								<div class="arrow_bg"></div>
								<ul class="depth_wrap depth_wrap1 on popular1">
									<li>
										<div class="txt_wrap">
											<p class="food_name">피자</p>
											<p class="detail">맛있는피자</p>
											<p class="price">15,000원</p>
										</div>
										<div class="img">
											<button type="button" class="popular_btn">
												★
											</button>
											<button type="button" class="menu_delete_btn">
												x
											</button>
										</div>
									</li>
									<%-- 
									<c:forEach items="${ menuNames }" var="menuName">
										<p class="menu_tit">${ menuName }</p>
										<div class="arrow_bg"></div>
										<ul class="depth_wrap depth_wrap1 on">
											<c:forEach items="${ menuList }" var="pmenu">
												<c:if test="${ pmenu.type eq menuName }">
													<li>
														<div class="txt_wrap">
															<p class="food_name">${ pmenu.menuName }</p>
															<p class="detail">${ pmenu.detail }</p>
															<p class="price">${ pmenu.price }</p>
														</div>
														<div class="img"><img src="${pageContext.request.contextPath }/img/menuImg/${pmenu.menuImage}"></div>
													</li>
												</c:if>	
											</c:forEach>
										</ul>	
									</c:forEach>
									 --%>
								</ul>
							</li>
							<li class="category">
								<div class="category_default on">
									<p class="menu_tit">메뉴1</p>
									<button type="button" class="name_change" id="nameChangeBtn">이름변경</button>
									<div class="arrow_bg"></div>
								</div>
								<div class="category_modify">
									<input type="text" placeholder="변경할 이름을 입력하세요.">
									<button type="button" class="name_confirm" id="nameConfirmBtn">확인</button>
									<div class="arrow_bg"></div>
								</div>
								<ul class="depth_wrap depth_wrap1 on">
									<li>
										<div class="txt_wrap">
											<p class="food_name">피자</p>
											<p class="detail">맛있는피자</p>
											<p class="price">15,000원</p>
										</div>
										<div class="img">
											<button type="button" class="popular_btn">
												★
											</button>
											<button type="button" class="menu_delete_btn">
												x
											</button>
										</div>
									</li>
									<c:forEach items="${ menuList }" var="menu">
										<c:if test="${ 'P' eq pmenu.type }">
											<li>
												<div class="txt_wrap">
													<p class="food_name">${ pmenu.menuName }</p>
													<p class="detail">${ pmenu.detail }</p>
													<p class="price">${ pmenu.price }</p>
												</div>
												<div class="img"></div>
											</li>
										</c:if>
									</c:forEach>
								</ul>
							</li>
							
						</ul>
					</div>
				</div>
				<div class="right">
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
									<p class="txt">${ ceoVO.id }</p>
								</div>
								<div class="info">
									<p class="tit">이름</p>
									<p class="txt">${ ceoVO.name }</p>
								</div>
								<div class="info">
									<p class="tit">비밀번호</p>
									<p class="txt">${ ceoVO.password }</p>
								</div>
								<div class="info">
									<p class="tit">전화번호</p>
									<p class="txt">${ ceoVO.phone }</p>
								</div>
								<div class="info">
									<p class="tit">이메일</p>
									<p class="txt">${ ceoVO.email }</p>
								</div>
							</div>
							<button class="basic_btn modify_btn" type="button">수정</button>
						</div>
						<div class="item_content modify_content">
							<div class="pic">
								<img src="/MOMOGO/img/default.png" alt="">
							</div>
							<div class="info_wrap">
								<form method="post" action="<%= request.getContextPath() %>/update/ceoProfileUpdate.do" onsubmit="return updateCeoProfile()">
									<input type="hidden" name="id" value="${ ceoVO.id }">
									<div class="info">
										<p class="tit">아이디</p>
										<p class="txt">${ ceoVO.id }</p>
									</div>
									<div class="info">
										<p class="tit">이름</p>
										<input type="text" name="name" value="${ ceoVO.name }">
									</div>
									<div class="info">
										<p class="tit">비밀번호</p>
										<input type="password" name="password"
											value="${ ceoVO.password }">
									</div>
									<div class="info">
										<p class="tit">전화번호</p>
										<input type="text" name="phone" value="${ ceoVO.phone}">
									</div>
									<div class="info">
										<p class="tit">이메일</p>
										<input type="email" name="email" value="${ ceoVO.email }">
									</div>
									<div class="btn_wrap">
										<button type="reset" class="basic_btn cancel_btn">취소</button>
										<button type="submit" class="basic_btn complete_btn">완료</button>
									</div>
								</form>
							</div>
						</div>
					</div>
					<div class="item">
						<div class="item_header">
							<h4 class="tit">업체설정</h4>
							<button type="button"></button>
						</div>
						<p class="contxt">
							<span>'가입한 업체'의 상세</span> 정보입니다.<br> 정보를 이력해주시기 바랍니다
						</p>
						<div class="item_content basic_content on">
							<div class="pic">
								<img src="/MOMOGO/img/empty_store_logo.png" alt="">
							</div>
							<div class="info_wrap">
								<div class="info">
									<p class="tit">업체명</p>
									<p class="txt">맛있는 피자</p>
								</div>
								<div class="info">
									<p class="tit">카테고리</p>
									<p class="txt">피자</p>
								</div>
								<div class="info">
									<p class="tit">사업자번호</p>
									<p class="txt">242-56-22201</p>
								</div>
							</div>
							<button class="basic_btn modify_btn" type="button">수정</button>
						</div>
						<div class="item_content modify_content">
							<div class="pic">
								<img src="/MOMOGO/img/empty_store_logo.png" alt="">
							</div>
							<div class="info_wrap">
								<form method="post" action="updateProfile.jsp">
									<input type="hidden" name="id" value="${ ceoVO.id }">
									<div class="info">
										<p class="tit">업체명</p>
										<p class="txt">맛있는 피자</p>
									</div>
									<div class="info">
										<p class="tit">카테고리</p>
										<select>
											<option>피자</option>
											<option>치킨</option>
											<option>패스트푸드</option>
										</select>
									</div>
									<div class="info">
										<p class="tit">사업자번호</p>
										<input type="text" name="" value="242-55-55555">
									</div>
									<div class="btn_wrap">
										<button type="reset" class="basic_btn cancel_btn">취소</button>
										<button type="submit" class="basic_btn complete_btn">완료</button>
									</div>
								</form>
							</div>
						</div>
					</div>
					<div class="item m2_item">
						<div class="item_header">
							<h4 class="tit">배달지역 설정</h4>
							<button type="button"></button>
						</div>
						<p class="contxt">
							<span>'나'의 배달 가능 지역</span> 정보입니다.<br>
						</p>
						<div class="item_content basic_content on">
							<div class="info_wrap">
								<div class="info">
									<p class="tit">주소</p>
									<p class="txt"></p>
								</div>
							</div>
							<button class="basic_btn modify_btn" type="button">수정</button>
						</div>
						<div class="item_content modify_content">
							<div class="info_wrap">
								<form method="post" action="">
									<input type="hidden" name="id" value="${ ceoVO.id }">
									<div class="info">
										<p class="tit">기본주소</p>
										<input type="text" name="basicAddr"
											value="${ ceoVO.basicAddr }">
									</div>
									<div class="info">
										<p class="tit">상세주소</p>
										<input type="text" name="detailAddr"
											value="${ ceoVO.detailAddr }">
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
			</section>
		</div>
	</div>
<footer>
	<%@include file="/jsp/include/footer.jsp"%>
</footer>
</body>
</html>