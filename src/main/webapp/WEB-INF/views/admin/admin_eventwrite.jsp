<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/admin_main.css">
<link href="../css/admin_input.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../css/admin_header.css">
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
				<a href="admin_main.html"><p>
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
		<h1>이벤트 작성</h1>
		<div class="container">
			<form action="eventwrite" name="input_bu" id="input_bu" method="post" enctype="multipart/form-data">
				<div class="input_set">
					<div class="input_1">
						<label class="input_label">작성자</label>
						<div class="just_cont">
							<input type="text" id="txt_wr" name="bName" maxlength="20"
								placeholder="작성자를 입력해주세요." value="관리자" readonly="readonly" />
							<div class="txt_wr_cnt">
								<span id="test">20자</span>
							</div>
						</div>
					</div>

					<br>
					<br>
					
					<div class="input_1">
						<label class="input_label">이벤트 제목</label>
						<div class="just_cont">
							<textarea id="txt_wr" name="bTitle" maxlength="100"
								placeholder="제목을 입력해주세요."></textarea>
							<div class="txt_wr_cnt">
								<span id="test">100자</span>
							</div>
						</div>
					</div>
					
					<br>
					<br>
					
					<div class="input_1">
						<label class="input_label">이벤트 시작일</label>
							<input type="date" name="bDate" width="200px">
						<div class="just_cont">
						</div>
					</div>
					
					<br>
					<br>
					
					<div class="input_1">
						<label class="input_label">이벤트 종료일</label>
							<input type="date" name="bDate2" width="200px">
						<div class="just_cont">
						</div>
					</div>

					<br>
					<br>
					
					<div class="input_1">
						<label class="input_label">리스트 첨부파일</label>
						<div class="just_cont">
							<input type="file" name="bFile">
						</div>
					</div>

					<br>
					<br>
					
					<div class="input_1">
						<label class="input_label">내용 첨부파일</label>
						<div class="just_cont">
							<input type="file" name="bFile2">
						</div>
						<ul class="file_noti listst">
							<li>최대 5장 등록 (PNG, JPEG, JPG, GIF 포맷)</li>
						</ul>
					</div>
				</div>
			</form>
		</div>

		<div class="bttn_set">
			<button type="button" onclick="cancel_ch()">취소</button>
			<button type="button" onclick="ok_ch()">확인</button>
		</div>

		<script type="text/javascript">
			function cancel_ch() {

				if (confirm("글 작성을 취소하시겠습니까?") == true) {
					location.href = "admin_eventlist"; //get방식

				} else {
					return false;
				}
			}
			
			function ok_ch() {
					input_bu.submit();
			}
		</script>

		</div>
	</section>
</body>
</html>