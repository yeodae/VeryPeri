<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="../css/login.css" rel="stylesheet" type="text/css">
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 font-family: "a타이틀고딕1";
        src: url("../../../font/a타이틀고딕1.ttf") format("truetype");
    }
    
    *{
       font-family: a타이틀고딕1;
    }
    a{
    	text-decoration: none;
    	color:black;
    }
</style>
</head>
<body>
<div id="app">
	<div class="container">		
		<h2 class="h2"><a href="../home.do">Login</a></h2>
		<div class="login-box">
			<div class="login-box2">
				<div class="idpw">	
					<div><label>ID  <span><input v-model="uId" @keyup.enter="fnLogin"></span></label></div>
					<div><label>PASSWORD  <span><input type="password" v-model="uPw" @keyup.enter="fnLogin"></span></label></div>
				</div>
				<div class="login">
					<button @click="fnLogin">LOGIN</button>
				</div>
				<div class="join">
					<button @click="fnJoin">JOIN US</button>
				</div>
				<div class="bottomArea">
					<div class="findArea">
						<a href="findId.do">아이디 찾기</a>
						<a href="nonOrder.do">비회원 주문조회</a>
						<a href="findPw.do">비밀번호 찾기</a>
					</div>
					<div><span>소속사 페이지</span></div>					
				</div>
				<div class="imgboxArea">
					<a href="https://www.smtown.com/"><img src="../img/SM.png"></a>
					<a href="http://www.starship-ent.com/"><img src="../img/star.png"></a>						
					<A href="https://hybecorp.com/kor/main"><img src="../img/HIBE.png"></a>
					<a href="https://www.aomgofficial.com/"><img src="../img/AOMG.jpg"></a>
					<a href="https://www.jype.com/"><img src="../img/JYP.jpg"></a>					
					<a href="https://kozofficial.com/"><img src="../img/KOZ.png"></a>												
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
		uId : "",
		uPw : ""
	},// data
	methods : {
		fnLogin : function(){
			var self = this;
			var param = {uId : self.uId, uPw : self.uPw};
			$.ajax({
                url : "/login.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) { 
                	console.log(data);
                	if(data.success){
                		if(self.uId === "admin"){
                			alert(self.uId+"님 환영합니다!");
                		 	$.pageChange("/staff/login.do", {uId : self.uId}); 
                		}else{
	                		alert(data.message);
	                	 	$.pageChange("../home.do", {uId : self.uId}); 
                		}
                	} else {
                		alert(data.message);
                		console.log(data.uId);
                	}
                	
                }
            }); 
		},
		fnJoin : function(){
			location.href='join.do';
		}
	}, // methods
	created : function() {
		var self = this;
	//	self.fnGetList();
	}// created
});
</script>