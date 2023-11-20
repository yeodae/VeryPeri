<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<link href="../css/login.css" rel="stylesheet" type="text/css">
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
 font-family: "a타이틀고딕1";
        src: url("../../../font/a타이틀고딕1.ttf") format("truetype");
    }
    
    *{
       font-family: a타이틀고딕1;
    }
	table{
		border : 1px solid black;
		border-collapse: collapse;
		text-align : center;
	}
	th, td {
		border : 1px solid black;
		padding : 5px 10px;
	}
	.login-box{
	height : 560px;
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
#smile{
	font-size: 70px;
	margin-left : 220px;
}
</style>

</head>
<body>
<div id="app">
	<div class="container">		
		<h2 class="h2">Find ID</h2>
		<div class="login-box">
			<div class="login-box2">
			<i class="fa-regular fa-face-smile" id="smile"></i>
			<h3>아이디 찾기가 완료 되었습니다.</h3>
				<div class="idpw">	
					<div><label>아이디 <span>{{list.uId}}</span></label></div>
					<div><label>이름   <span>{{list.uName}}</span></label></div>
					<div><label>이메일   <span>{{list.uEmail}}</span></label></div>
				</div>
				<div class="login">
					<div><button @click="fnBack">LOGIN</button></div>					
				</div>
				<div class="join">
					<button @click="fnSearch">Find PW</button>
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
		list : [],
		uName : "",
		uPhone : "${map.uPhone}"
	},// data
	methods : {
		fnGetList : function(){
			var self = this;
			var param = {uPhone : self.uPhone};
			$.ajax({
                url : "../user.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) { 
                	self.list = data.findId;
                	console.log(self.list);
                	console.log(self.uPhone);
                }
            }); 
		},
		fnBack : function(){
			location.href = 'login.do';
		},
		fnSearch : function(){
			location.href = 'findPw.do';
		}
		
	}, // methods
	created : function() {
		var self = this;
		self.fnGetList();
		console.log(self.uPhone);
	}// created
});
</script>