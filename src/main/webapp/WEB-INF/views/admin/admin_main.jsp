<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/admin_main.css">
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
				<p>
					LMS <span>STARTUP</span> Type
				</p>
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
		<h2><em></em>회원/강사</h2>
		<div  id="student" class="user">
			<a>학생 관리<span id="s_icon" class="icon_minus"></span></a>
			<div id="stu_list">
				<ul>
					<li><a href="#"><img src="../images/icon_title_left.png">학생 등록</a></li>
					<li><a href="#"><img src="../images/icon_title_left.png">학생 리스트(탈퇴)</a></li>
					<li><a href="#"><img src="../images/icon_title_left.png">학생등급 관리</a></li>
					<li><a href="#"><img src="../images/icon_title_left.png">학생등급 분류/해택</a></li>
					<li><a href="#"><img src="../images/icon_title_left.png">회원 상담 관리</a></li>
				</ul>
			</div>
		</div>
		<div  id="teacher" class="user">
			<a>강사 관리<span id="t_icon" class="icon_minus2"></span></a>
			<div id="tes_list">
				<ul>
					<li><a href="#"><img src="../images/icon_title_left.png">강사 등록</a></li>
					<li><a href="#"><img src="../images/icon_title_left.png">강사 리스트</a></li>
					<li><a href="#"><img src="../images/icon_title_left.png">강사 리스트(사용중지)</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<section>
		<h1>회원관리</h1>
		<div id="main_list">
			<div id="main_user_list">
				<div>
					<table border="1">
						<tr>
							<th>회원 아이디</th>
							<th>이름</th>
							<th>이메일</th>
							<th>주소</th>
							<th>휴대전화</th>
							<th>생년월일</th>
							<th>가입일</th>
						</tr>
						<c:forEach items="${admin_main}" var="dto" varStatus="status">
							<tr>
								<td class="table_left">${dto.j_id}</td>
								<td class="table_left">${dto.j_name }</td>
								<td class="table_left">${dto.j_email}@${dto.j_email2}</td>
								<td>${dto.j_add}&nbsp;${dto.j_add2}</td>
								<td>${dto. j_phone}&nbsp;-&nbsp;${dto.j_phone2}
									&nbsp;-&nbsp; ${dto.j_phone2}</td>
								<td>${dto.j_birth}.${dto.j_birth2}.${dto.j_birth3}</td>
								<td>${dto.j_day}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</section>

</body>
</html>