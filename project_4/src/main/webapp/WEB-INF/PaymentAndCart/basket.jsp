<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
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
.idpw{
	width : 300px;
	margin : 0px auto;
	padding-left : 100px;	
	padding-bottom : 50px;
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
#sad{
	font-size: 70px;
	margin-left : 200px;
	margin-bottom : 30px;
}

</style>
</head>
<body>
<div id="app">
	<div class="container">		
		<h2 class="h2">Cart</h2>
		<div class="login-box">
			<div class="login-box2">
			<i id="sad" class="fa-regular fa-face-sad-tear"></i>
			<h3>앗! 장바구니가 비어 있어요!</h3>	
			<br>
				<div class="login">
					<div><button @click="goToMain">쇼핑 계속하기</button></div>
				</div>
				<br>
			</div>
		</div>
	</div>
</div>
<div style="margin-top: 100px;">   <%@ include file="../page/footer.jsp" %> </div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		user : {
			uId : "",
			uName : "",
			uEmail : ""
		},
		uId : "${map.uId}",
		list : []
	},// data
	methods : {
		fnGetList : function(){
	   		var self = this;
			var nparmap = {uId : self.uId};
            $.ajax({
                url : "/user2.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
               		self.user = data.findPw;
                }
            });
	   	},
	   	goToMain : function(){
	   		var self = this;
	   		$.pageChange("/home.do", {uId : ""});
	   	}
	}, // methods
	created : function() {
		var self = this;
		self.fnGetList();
		
	}// created
});
</script>