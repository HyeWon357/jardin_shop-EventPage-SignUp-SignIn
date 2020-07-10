<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>JARDIN SHOP</title>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="JARDIN SHOP" />
<meta name="keywords" content="JARDIN SHOP" />
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scaleable=no" />
<link rel="stylesheet" type="text/css" href="../css/reset.css?v=Y" />
<link rel="stylesheet" type="text/css" href="../css/layout.css?v=Y" />
<link rel="stylesheet" type="text/css" href="../css/content.css?v=Y" />
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/top_navi.js"></script>
<script type="text/javascript" src="../js/left_navi.js"></script>
<script type="text/javascript" src="../js/main.js"></script>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript" src="../js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="../js/idangerous.swiper-2.1.min.js"></script>
<script type="text/javascript" src="../js/jquery.anchor.js"></script>
<!--[if lt IE 9]>
<script type="text/javascript" src="../js/html5.js"></script>
<script type="text/javascript" src="../js/respond.min.js"></script>
<![endif]-->
<script type="text/javascript">
	$(document).ready(function() {

	});
</script>
</head>
<body>



	<!--익스레이어팝업-->
	<div id="ieUser" style="display: none">
		<div class="iewrap">
			<p class="img">
				<img src="../images/ico/ico_alert.gif" alt="알림" />
			</p>
			<p class="txt">
				IE버전이 낮아 홈페이지 이용에 불편함이 있으므로 <strong>IE9이상이나 다른 브라우저</strong>를 이용해
				주세요.
			</p>
			<ul>
				<li><a
					href="http://windows.microsoft.com/ko-kr/internet-explorer/download-ie"
					target="_blank"><img src="../images/ico/ico_ie.gif"
						alt="IE 최신브라우저 다운"></a></li>
				<li><a href="https://www.google.com/intl/ko/chrome/browser"
					target="_blank"><img src="../images/ico/ico_chrome.gif"
						alt="IE 최신브라우저 다운"></a></li>
				<li><a href="http://www.mozilla.org/ko/firefox/new"
					target="_blank"><img src="../images/ico/ico_mozila.gif"
						alt="MOZILA 최신브라우저 다운"></a></li>
				<li><a href="http://www.apple.com/safari" target="_blank"><img
						src="../images/ico/ico_safari.gif" alt="SAFARI 최신브라우저 다운"></a></li>
				<li><a href="http://www.opera.com/ko/o/ie-simple"
					target="_blank"><img src="../images/ico/ico_opera.gif"
						alt="OPERA 최신브라우저 다운"></a></li>
			</ul>
			<p class="btn" onclick="msiehide();">
				<img src="../images/ico/ico_close.gif" alt="닫기" />
			</p>
		</div>
	</div>
	<!--//익스레이어팝업-->
	<!--IE 6,7,8 사용자에게 브라우저 업데이터 설명 Div 관련 스크립트-->
	<script type="text/javascript">
		var settimediv = 200000; //지속시간(1000= 1초)
		var msietimer;

		$(document).ready(function() {
			msiecheck();
		});

		var msiecheck = function() {
			var browser = navigator.userAgent.toLowerCase();
			if (browser.indexOf('msie 6') != -1
					|| browser.indexOf('msie 7') != -1
					|| browser.indexOf('msie 8') != -1) {
				msieshow();
			} else {
				msiehide();
			}
		}

		var msieshow = function() {
			$("#ieUser").show();
			msietimer = setTimeout("msiehide()", settimediv);
		}

		var msiehide = function() {
			$("#ieUser").hide();
			clearTimeout(msietimer);
		}
	</script>
	
	<script>
	
	var r_listnum = ${event_content.bId};
	
	$(function() { //jQuery가 자동실행 구문
		getreplyList();
		
	});
	
	//리스트 가져오기 ajax
	function getreplyList() { //클릭해서 replyList호출 or 타자 구문열리자마자 replyList호출
		
		$.ajax({ //ajax 호출
			
			type: 'get',
			url: "./reply_list", //맵핑이름 입력
			dataType:"json",
			data: {}, //jsp -> controller로 보낼 데이터가 있으면 기입
			contentType: "application/json; charset=utf-8", //한글처리
			
			scuccess: function(data) {
				var html = "";
				var Rlist = data.length; //list 갯수를 확인.
				$("#Rlist").html(Rlist);
				
				if(data.length > 0) {
					
					for(var i=0; i<data.length; i++) {
						html += "<li class='name'>" + data[i].r_num + data[i].r_id + "<span>" + data[i].r_date + "</span></li>";
						html += "<li class='txt'>" + data[i].r_comment + "</li>";
						html += "<li class='btn' id='reply_modify'><a href='#' class='rebtn'>" + 수정 + "</a><a href='#' class='rebtn'>" + 삭제 + "</a></li>";
					}
				}else {
					html += "<li class='txt'> 등록된 댓글이 없습니다. </li>";
				}
				
				$('#REPLYLIST').html(html);
			},
			error: function(request, status, error) {
				alert("실패" + error);
			}
		});
	}
		
	//답변 쓰기
	function reply_write(r_num) {
		
		$.ajax({
			type: "post",
			url: "./reply_write",
			data: $("#replyForm").serialize(),
			success: function (data) {
				alert("댓글 달기 완료");
				
				if(data == "success") {
					getreplyList();
					$("#r_comment").val("");
				}
			},
			error: function(request, status, error) {
				alert("실패 : " + error);
			}
		});
	}
	</script>

	<div id="allwrap">
		<div id="wrap">

	<div id="allwrap">
		<div id="wrap">

			<div id="header">

				<div id="snbBox">
					<h1>
						<a href="../main/main"><img src="../images/txt/logo.gif" alt="JARDIN SHOP" /></a>
					</h1>
					<div id="quickmenu">
						<div id="mnaviOpen">
							<img src="../images/btn/btn_mnavi.gif" width="33" height="31"
								alt="메뉴열기" />
						</div>
						<div id="mnaviClose">
							<img src="../images/btn/btn_mnavi_close.gif" width="44"
								height="43" alt="메뉴닫기" />
						</div>
						<ul>
							<li><a href="../event/event_list">EVENT</a></li>
							<li><a href="../cus/notice_list">CUSTOMER</a></li>
							<li><a href="#">COMMUNITY</a></li>
						</ul>
					</div>
					<div id="snb">
						<ul>
						<c:choose>
						
							<c:when test="${sessionScope.j_name == null}">
							<li><a href="../Signin/login">LOGIN</a></li>
							<li><a href="../Signup/join1">SIGN UP</a></li>
							</c:when>
							
						<c:otherwise>
							<c:if test="${msg =='success'}">
								<li><h2>${sessionScope.j_name}님</h2></li>
							</c:if>
							<li><a href="../Signin/logout">LOGOUT</a></li>
							<li><a href="#" onclick="login_check()">MY PAGE</a></li>
							<li><a href="#">CART</a></li>
						</c:otherwise>

						</c:choose>
						</ul>
						
						<div id="search">
							<input type="text" class="searchType" /> <input type="image"
								src="../images/btn/btn_main_search.gif" width="23" height="20"
								alt="검색하기" />
						</div>
					</div>
				</div>
			</div>

			<!-- GNB -->
			<div id="gnb">

				<div id="top">
					<ul>
						<li class="brand t1"><a href="#" id="topNavi1">JARDIN’s
								BRAND</a>
							<ul id="topSubm1">
								<li><a href="#">클래스</a></li>
								<li><a href="#">홈스타일 카페모리</a></li>
								<li><a href="#">드립커피백</a></li>
								<li><a href="#">카페리얼 커피</a></li>
								<li><a href="#">오리지널커피백</a></li>
								<li><a href="#">카페리얼 음료</a></li>
								<li><a href="#">마일드커피백</a></li>
								<li><a href="#">워터커피</a></li>
								<li><a href="#">카페포드</a></li>
								<li><a href="#">모히또파티</a></li>
								<li><a href="#">테이크아웃 카페모리</a></li>
								<li><a href="#">포타제</a></li>
							</ul></li>
						<li class="t2"><a href="#" id="topNavi2">원두</a>
							<ul id="topSubm2">
								<li><a href="#">클래스</a></li>
								<li><a href="#">로스터리샵</a></li>
								<li><a href="#">커피휘엘</a></li>
								<li><a href="#">산지별 생두</a></li>
							</ul></li>
						<li class="t1"><a href="#" id="topNavi3">원두커피백</a>
							<ul id="topSubm3">
								<li><a href="#">드립커피 로스트</a></li>
								<li><a href="#">오리지널커피백</a></li>
								<li><a href="#">마일드커피백</a></li>
							</ul></li>
						<li class="t2"><a href="#" id="topNavi4">인스턴트</a>
							<ul id="topSubm4">
								<li><a href="#">까페모리</a></li>
								<li><a href="#">홈스타일카페모리</a></li>
								<li><a href="#">포타제</a></li>
							</ul></li>
						<li class="t1"><a href="#" id="topNavi5">음료</a>
							<ul id="topSubm5">
								<li><a href="#">까페리얼</a></li>
								<li><a href="#">워터커피</a></li>
								<li><a href="#">모히또</a></li>
							</ul></li>
						<li class="t2"><a href="#" id="topNavi6">커피용품</a>
							<ul id="topSubm6">
								<li><a href="#">종이컵</a></li>
								<li><a href="#">커피필터</a></li>
								<li><a href="#">머신 등</a></li>
							</ul></li>
						<li class="t1"><a href="#" id="topNavi7">선물세트</a></li>
						<li class="t2"><a href="#" id="topNavi8">대량구매</a></li>
					</ul>
				</div>

				<script type="text/javascript">
					initTopMenu();
				</script>
			</div>
			<!-- //GNB -->

			<!-- container -->
			<div id="container">

				<div id="location">
					<ol>
						<li><a href="#">HOME</a></li>
						<li><a href="../event/event_list">EVENT</a></li>
						<li class="last">진행중 이벤트</li>
					</ol>
				</div>

				<div id="outbox">
					<div id="left">
						<div id="title2">
							EVENT<span>이벤트</span>
						</div>
						<ul>
							<li><a href="../event/event_list" id="leftNavi1">진행중 이벤트</a></li>
							<li><a href="#" id="leftNavi2">종료된 이벤트</a></li>
							<li class="last"><a href="#" id="leftNavi3">당첨자 발표</span></a></li>
						</ul>
					</div>
					<script type="text/javascript">
						initSubmenu(1, 0);
					</script>


					<!-- contents -->
					<div id="contents">
						<div id="mypage">
							<h2>
								<strong>진행중 이벤트</strong><span>쟈뎅샵의 특별한 혜택이 가득한 이벤트에 참여해
									보세요.</span>
							</h2>

							<div class="viewDivMt">
								<div class="viewHead">
									<div class="subject">
										<ul>
											<li>${event_content.bTitle}</li>
										</ul>
									</div>
									<div class="day">
										<p class="txt">
											이벤트 기간<span>${event_content.bDate} &nbsp; ~
												${event_content.bDate2}</span>
										</p>
									</div>
								</div>

								<div class="viewContents">
									<img src="../uploadFile/${event_content.bFile2}">
								</div>
							</div>
							
<!-- 							이전다음글 -->
							<div class="pnDiv web">
								<table summary="이전다음글을 선택하여 보실 수 있습니다." class="preNext"
									border="1" cellspacing="0">
									<caption>이전다음글</caption>
									<colgroup>
										<col width="100px" />
										<col width="*" />
										<col width="100px" />
									</colgroup>
									<tbody>
										
										<c:if test="${event_nextcontent.bId == null}">
										<tr>
											<th class="next">NEXT</th>
											<td>다음 글이 없습니다.</td>
											<td>&nbsp;</td>
										</tr>
										</c:if>
										
										<c:if test="${event_nextcontent.bId != null}">
										<tr>
											<th class="next">NEXT</th>
											<td><a href="event_content?bId=${event_nextcontent.bId}">${event_nextcontent.bTitle}</a></td>
											<td>&nbsp;</td>
										</tr>
										</c:if>
										
										<c:if test="${event_prevcontent.bId == null}">
										<tr>
											<th class="pre">PREV</th>
											<td>이전 글이 없습니다.</td>
											<td>&nbsp;</td>
										</tr>
										</c:if>
										
										<c:if test="${event_prevcontent.bId != null}">
										<tr>
											<th class="pre">PREV</th>
											<td><a href="event_content?bId=${event_prevcontent.bId}">${event_prevcontent.bTitle}</a></td>
											<td>&nbsp;</td>
										</tr>
										</c:if>
										
									</tbody>
								</table>
							</div>
<!-- 							//이전다음글 -->
						
							<!-- Btn Area -->
							<div class="btnArea">
								<div class="bRight">
									<ul>
										<li><a href="../event/event_list" class="sbtnMini mw">목록</a></li>
									</ul>
								</div>
							</div>
							<!-- //Btn Area -->
							
							
							
							<!-- 댓글-->
							<form name="replyForm" id="replyForm" method="post">
								<div class="replyWrite">
									<ul>
										<li class="in">
											<p class="password"> 비밀번호&nbsp;&nbsp;<input type="password" class="replynum" name="r_pw" />
											</p>
											<textarea class="replyType" name="r_comment" placeholder="댓글을 입력해주세요."></textarea>
											<input type="hidden" name="r_listnum" value="${event_content.bId}">
											
										</li>
										<li class="btn"><a href="#" class="replyBtn" onclick="reply_write()">등록</a></li>
									</ul>
									<p class="ntic">※ 비밀번호를 입력하시면 댓글이 비밀글로 등록 됩니다.</p>
								</div>


								<div class="replyBox">
									<ul>
<!-- 										<li class="name">아이디<span>날짜</span></li> -->
<!-- 										<li class="txt">댓글</li> -->
<!-- 										<li class="btn"><a href="#" class="rebtn" -->
<!-- 											id="reply_modify">수정</a> <a href="#" class="rebtn">삭제</a></li> -->
										<li id="REPLYLIST"></li>
									</ul>


									<!-- 수정 Form -->
									<ul id="replymodify">
										<li class="name">아이디<span>날짜</span></li>
										<li class="txt"><textarea class="replyType"
												name="r_comment"></textarea></li>
										<li class="btn"><a href="#" class="rebtn" id="modifyok">수정</a> <a
											href="#" class="rebtn">삭제</a></li>
									</ul>
								</div>
							</form>
							<!-- //댓글 -->
							
							<!-- 댓글 수정 Form jquery -->
							<script type="text/javascript">
								$(document).ready(function() {
									$("#replymodify").hide();

									$("#reply_modify").click(function() {
										$("#replymodify").show();

									});
									
									$("#modifyok").click(function () {
										$("#replymodify").hide();
									})
								});
								
							</script>
							
						</div>
					</div>
					<!-- //contents -->

				</div>
			</div>
			<!-- //container -->


			<div id="footerWrap">
				<div id="footer">
					<div id="fnb">
						<ul>
							<li class="left"><a href="#">개인정보취급방침</a></li>
							<li><a href="#">이용약관</a></li>
							<li class="left"><a href="#">이메일무단수집거부</a></li>
							<li><a href="#">고객센터</a></li>
							<li class="left brand"><a href="#">쟈뎅 브랜드 사이트</a></li>
						</ul>
					</div>

					<div id="finfo">
						<div id="flogo">
							<img src="../images/txt/flogo.gif"
								alt="JARDIN THE COFFEE CREATOR, SINCE 1984" />
						</div>
						<address>
							<ul>
								<li>㈜쟈뎅</li>
								<li>대표자 윤영노</li>
								<li class="tnone">주소 서울시 강남구 논현동 4-21번지 영 빌딩</li>
								<li class="webnone">소비자상담실 02)546-3881</li>
								<li>사업자등록번호 211-81-24727</li>
								<li class="tnone">통신판매신고 제 강남 – 1160호</li>
								<li class="copy">COPYRIGHT © 2014 JARDIN <span>ALL
										RIGHTS RESERVED.</span></li>
							</ul>
						</address>

						<div id="inicis">
							<img src="../images/ico/ico_inicis.png" alt="이니시스 결제시스템" />
						</div>
					</div>
				</div>
			</div>



		</div>
	</div>
</body>
</html>