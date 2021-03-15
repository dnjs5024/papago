<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style>
.calendar{
   float:  right;
   	width: 30%;
	height: 150px;
	font-size: 2rem;
	text-align: center;
	line-height: 50px;
  
}
.box {
	width: 30%;
	height: 150px;
	font-size: 2rem;
	text-align: center;
	line-height: 50px;
	float: left;
}

textarea {
	width: 100%;
	height: 200px;
	padding: 10px;
	box-sizing: border-box;
	border: solid 2px #1E90FF;
	border-radius: 5px;
	font-size: 16px;
	resize: vertical;
}
</style>
</head>
<body>
<img src="/resources/main/assets/img/12.png">

	<div class="box">
			
	<select id="trlSource">
		<option value="ko">한국어</option>
		<option value="ja">일본어</option>
		<option value="zh-cn">중국어 간체</option>
		<option value="zh-tw">중국어 번체</option>
		<option value="hi">힌디어</option>
		<option value="en">영어</option>
		<option value="es">스페인어</option>
		<option value="fr">프랑스어</option>
		<option value="de">독일어</option>
		<option value="pt">포르투갈어</option>
		<option value="vi">베트남어</option>
		<option value="value">인도네시아어</option>
		<option value="fa">페르시아어</option>
		<option value="ar">아랍어</option>
		<option value="mm">미얀마어</option>
		<option value="th">태국어</option>
		<option value="ru">러시아어</option>
		<option value="it">이탈리아어</option>
	</select> 
		<textarea placeholder="번역할 내용을 입력하세요." id="trlText" name="trlText"
			rows="1"></textarea>
			<button onclick="doTranslate()">번역</button>
	</div>
	<div class="box">
			<select id="trlTarget">
		<option value="ko">한국어</option>
		<option value="ja">일본어</option>
		<option value="zh-cn">중국어 간체</option>
		<option value="zh-tw">중국어 번체</option>
		<option value="hi">힌디어</option>
		<option value="en">영어</option>
		<option value="es">스페인어</option>
		<option value="fr">프랑스어</option>
		<option value="de">독일어</option>
		<option value="pt">포르투갈어</option>
		<option value="vi">베트남어</option>
		<option value="value">인도네시아어</option>
		<option value="fa">페르시아어</option>
		<option value="ar">아랍어</option>
		<option value="mm">미얀마어</option>
		<option value="th">태국어</option>
		<option value="ru">러시아어</option>
		<option value="it">이탈리아어</option>
	</select>
		<textarea id="translateText" name="translateText" rows="1"></textarea>

	</div>
	
	
	<script>
		function doTranslate() {
			var source = document.querySelector('#trlSource').value;
			var target = document.querySelector('#trlTarget').value;
			var text = document.querySelector('#trlText').value;
			var url = '/papago?source=' + source + "&target=" + target
					+ "&targetText=" + text;
			console.log(source);
			console.log(target);
			console.log(text);
			console.log(url);
			$.ajax({
				url : url,
				success : function(res){
					document.getElementById("translateText").innerHTML=res;
				}
							
			})
	
		}
		
	</script>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<a href="/views/ws/global-chat"><button>채팅하기</button></a>
</body>
</html>
