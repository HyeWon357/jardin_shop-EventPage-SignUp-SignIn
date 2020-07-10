<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

	function ok_ch() {
		var injeung = document.getElementById("injeung").value;
		$.ajax({
			type: 'post',
			url: './authTest/${dice}/'+injeung, //controller 주소
			success: function(ok) {
				console.log(ok);
				if(ok == 0){
					
					//틀린거 
					alert('틀린 인증번호입니다. 다시 인증해주세요');
					history.back();
					
				} else if(ok == 1){
					document.getElementById("Go").submit();
				}
			},
			error: function(error) {
				console.log(error)
			}
		});
	}
</script>

</head>
<body>
	<table border="1" width="300" height="300" align="center">
		<center>
			<span style="color: green; font-weight: bold;">입력한 이메일로 받은
				인증번호를 입력하세요. (인증번호가 맞아야 다음 단계로 넘어가실 수 있습니다.)</span> <br> <br> <br>
			<br>


			<div style="text-align: center;">
				<tr>
					<td>
						<center>
							<form action="join2" method="post" id="Go">
								<!--  받아온 인증코드를 컨트롤러로 넘겨서 일치하는지 확인-->
								<center>
									<br>
									<div>
										인증번호 입력 : <input type="text" name="injeung" placeholder="  인증번호를 입력하세요. " id="injeung">
									</div>

									<br> <br>
									<button type="button" onclick="ok_ch()">인증번호 전송</button>
			</div>
			</td>
			</tr>
		</center>
	</table>
	</form>
	</center>

</body>
</html>