<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/admin_main.css">
<link rel="stylesheet" type="text/css" href="../css/admin_header.css">
<link rel="stylesheet" type="text/css" href="../css/admin_notice_view.css">
<link rel="stylesheet" type="text/css" href="../css/content.css?v=Y" />
<style type="text/css">
#menu>ul>li>a {
	text-decoration: none;
	color: #FFF;
}
</style>
</head>
<body>
	<header>
		<div>
			<div id="top">
				<a href="../admin/admin_main"><p>
						LMS <span>STARTUP</span> Type
					</p></a>
				<ul>
					<li>관리자</li>
					<li><img src="../images/logout.png"></li>
					<li><select>
							<option>한국어</option>
							<option>영어</option>
							<option>중국어(간체)</option>
							<option>일본어</option>
					</select></li>
					<li><select>
							<option>LMS매뉴얼</option>
							<option>나의 홈페이지</option>
							<option>아이티맵</option>
					</select></li>
				</ul>
			</div>
			<div id="menu">
				<ul>
					<li><a href="../admin/admin_main"><span></span>회원</a></li>
					<li><span></span>공지사항</li>
					<li><a href="../admin/admin_eventlist"><span></span>이벤트</a></li>
					<li><span></span>상품/결제(신청)</li>
					<li><span></span>수업/스케줄</li>
					<li><span></span>프로모션</li>
					<li><span></span>홈페이지</li>
				</ul>
			</div>
		</div>
	</header>
	<nav>
		<h2>
			<em></em>회원/강사
		</h2>
		<div id="student" class="user">
			<a>학생 관리<span>-</span></a>
			<div>
				<ul>
					<li><a><img src="../images/icon_title_left.png">학생
							등록</a></li>
					<li><a><img src="../images/icon_title_left.png">학생
							리스트(탈퇴)</a></li>
					<li><a><img src="../images/icon_title_left.png">학생등급
							관리</a></li>
					<li><a><img src="../images/icon_title_left.png">학생등급
							분류/해택</a></li>
					<li><a><img src="../images/icon_title_left.png">회원
							상담 관리</a></li>
				</ul>
			</div>
		</div>
		<div id="teacher" class="user">
			<a>강사 관리<span>-</span></a>
			<div>
				<ul>
					<li><a><img src="../images/icon_title_left.png">강사
							등록</a></li>
					<li><a><img src="../images/icon_title_left.png">강사
							리스트</a></li>
					<li><a><img src="../images/icon_title_left.png">강사
							리스트(사용중지)</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<section>
		<h1>진행중 이벤트</h1>
		<div>
			<div>
				<h2>
					${admin_eventcontent.bTitle}
					<span>${admin_eventcontent.bDate} &nbsp; ~ &nbsp; ${admin_eventcontent.bDate2}</span>
				</h2>
			</div>

			<div>
				<div><img src="../uploadFile/${admin_eventcontent.bFile2 }"></div>
			</div>

			<div></div>
			
			<br>
			<br>

			<!-- 댓글-->
			<div class="replyWrite">
				<ul>
					<li class="name">jjabcde <span>[2014-03-04&nbsp;&nbsp;15:01:59]</span></li>
					<br><br>
					<li class="txt">대박!!! 이거 저한테 완전 필요한 이벤트였어요!!</li>
				</ul>
			</div>
			<!-- //댓글 -->


			<div class="detail_btn">
				<a href="#">수정</a>
				<a href="../admin/admin_eventlist">목록</a>
			</div>
		</div>
	</section>
</body>
</html>