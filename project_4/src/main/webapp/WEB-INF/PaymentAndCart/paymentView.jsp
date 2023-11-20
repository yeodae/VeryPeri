<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<link href="../css/footer.css" rel="stylesheet" type="text/css">
<link href="../css/login.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@font-face {
   font-family: "a타이틀고딕1";
   src: url("../../../font/a타이틀고딕1.ttf") format("truetype");
 }
*{
 	font-family: a타이틀고딕1;    	
 }
body {
	background-color:#f0f0f0;
}
.login-box{
	height : 300px;
}
.login button{
	font-weight:500;
	font-size:15px;
}
h3{
	text-align : center;
}
.idpw div{
	border-bottom : 1px solid #d8d9df;
}
.idpw label{
	margin : 5px;
}
.idpw span{
	color : #3d435f; 
}
#smile{
	font-size: 70px;
	margin-left : 200px;
}
.container{
	position : relative;
	top : -100px;
	
}
</style>
</head>
<body>
<div id="app">
	<div class="container">		
		<h2 class="h2">Order Success</h2>
		<div class="login-box">
			<div class="login-box2">
			<i class="fa-regular fa-face-smile" id="smile"></i>
			<h3>주문이 완료되었습니다!</h3>
				<div class="login">
					<div><button @click="goToMain">GO TO MAIN</button></div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		uId : "${sessionId}",
	},// data
	methods : {
	   	goToMain : function(){
	   		var self = this;
               		$.pageChange("../home.do", {uId : self.uId});
        }
	}, // methods
	created : function() {
		
	}// created
});
</script>