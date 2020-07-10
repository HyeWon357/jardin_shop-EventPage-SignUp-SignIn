<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/admin_main.css">
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
		<h1>진행중인 이벤트</h1>
		<div id="main_list">
			<div id="main_user_list">
				<div>
					<table border="1">
						<tr>
							<th width="50px">NO.</th>
							<th>진행중인 이벤트</th>
							<th>조회수</th>
						</tr>

						<c:forEach var="dto" items="${admin_eventlist}">
							<tr>
								<td width="50px">${dto.bId}</td>
								<td><a href="admin_eventcontent?bId=${dto.bId}">
										<div class="img">
											<img src="../uploadFile/${dto.bFile}" , width="600px;"
												, height="200px;">
										</div>
										<div class="txt">
											<div class="subject">${dto.bTitle }</div>
											<div class="day">${dto.bDate}</div>
											&nbsp; ~ &nbsp;
											<div class="day">${dto.bDate2}</div>
										</div>
								</a></td>
								<td width="50px">${dto.bHit}</td>
							</tr>
						</c:forEach>
					</table>
					<div class="detail_btn">
						<a href="../admin/admin_eventwrite">글쓰기</a>
					</div>

					<!-- 페이징이동1 -->
					<div class="btnAreaList">
						<div class="allPageMoving1">

							<c:if test="${pagingDto2.prev}">
								<a
									href="admin_eventlist${pagingDto2.makeQuery(pagingDto2.startPage - 1)}"
									class="next"><img src="../images/btn/btn_next1.gif"
									alt="뒤페이지로" /> 이전</a>
							</c:if>

							<c:forEach begin="${pagingDto2.startPage}"
								end="${pagingDto2.endPage}" var="idx">
								<a href="admin_eventlist${pagingDto2.makeQuery(idx)}">${idx}</a>
							</c:forEach>

							<c:if test="${pagingDto2.next && pagingDto2.endPage > 0}">
								<a
									href="admin_eventlist${pagingDto2.makeQuery(pagingDto2.endPage + 1)}"><img
									src="../images/btn/btn_pre1.gif" alt="앞페이지로" />다음</a>
							</c:if>

						</div>
					</div>
					<!-- //페이징이동1 -->

				</div>
			</div>
		</div>
	</section>
</body>
</html>