<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
 
    <!-- 부가적인 테마 --> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>
<body>
	<div id="info">
		<select id="lang">
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
		</select> <input type="text" id="custName" name="custName" placeholder="닉네임를 입력해주세요">
		<button onclick="doCheck()">채팅시작</button>
	</div>
	   <div id = "chat" style = "width:400px; height: 600px; border:1px solid; background-color : gray"></div>
	   <div id="send-box">
   		 <input type = "text" id = "chatStr" onkeypress="checkEnter()" style = "height : 30px; width : 340px" placeholder="내용을 입력하세요" autofocus>
    	 <button class = "btn btn-primary" onclick="sendMessage()">전송</button>
    	 <button class = "btn btn-primary" onclick="goExit()">나가기</button>
	   </div>
	<script>
		var ws;
		var nickname;		
		function doCheck(){	
			if(document.getElementById("custName").value==""){
				alert('닉네임를 입력해주세요');	
				document.getElementById('custName').focus();
			}else{
				startChatting();
			}
			
		}
		function startChatting() {
			nickname = document.getElementById("custName").value;
			ws = new WebSocket("ws://localhost/ws");
			ws.onopen = function() {
				ws.send(nickname +'님이 입장하셨습니다');
				ws.onmessage =   function onMessage(evt) {
					  data = evt.data;
					  chat = document.getElementById("chat");
					  chat.innerHTML = chat.innerHTML + "<br>" + data;
			    }
				document.querySelector('#info').style.display = 'none';
				document.querySelector('#chat').style.display = '';
				document.querySelector('#send-box').style.display = '';
			}
		}
		function checkEnter() {
			if (event.keyCode == 13) {
				sendMessage();
			}
		}
		function sendMessage() {
			var msg ='';
			nickname = document.getElementById("custName").value;
			msg= nickname +' : '+document.querySelector('#chatStr').value;
			ws.send(msg);
			document.querySelector('#chatStr').value='';
			ws.onmessage =   function onMessage(evt) {
		        console.log(evt.data);
		        console.log(evt);
				  data = evt.data;
				  chat = document.getElementById("chat");
				  chat.innerHTML = chat.innerHTML + "<br>" + data;
		    }
		}
	
		window.addEventListener('load', function() {
			document.querySelector('#chat').style.display = 'none';
			document.querySelector('#send-box').style.display = 'none';

		})
		function goExit(){
			nickname = document.getElementById("custName").value;
			ws.send(nickname +'님이 퇴장하셨습니다');
			ws.onmessage =   function onMessage(evt) {
				  data = evt.data;
				  chat = document.getElementById("chat");
				  chat.innerHTML = chat.innerHTML + "<br>" + data;
		    }
			ws.close();
			document.querySelector('#info').style.display = '';
			document.querySelector('#chat').style.display = 'none';
			document.querySelector('#send-box').style.display = 'none';
		}
		var source= document.querySelector('#lang').value;
		var target='';
		var text='ko';
		$.ajax({
			var url = '/papago?source=' + source + "&target=" + target
			+ "&targetText=" + text;
			success:function(res){
				
			}
		})
	</script>

</body>
</html>