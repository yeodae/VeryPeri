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
		height : 460px;
	}
</style>
</style>
</head>
<body>
<div id="app">
	<div class="container">		
		<h2 class="h2">Find ID</h2>
		<div class="login-box">
			<div class="login-box2">
			<h3 class="stadyInfo">아이디찾기</h3>
				<div class="idpw">						
				    <div><label>이름  <span><input type="text" name="uName" v-model = "uName" placeholder="사용자이름">
					    </span></label>
				    </div>
				    <div><label>핸드폰번호  <span><input type="text" name="uPhone"  v-model = "uPhone" placeholder="핸드폰번호">
					    </span></label>
				    </div>	
				</div>
				
				
				<div class="login"><button @click="fnSearch" >확인</button></div>
				<div class="join">
					<button @click="fnBack">취소</button>
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
		uPhone : ""
	},// data
	methods : {
		fnGetList : function(){
			var self = this;
			var param = {};
			$.ajax({
                url : "/findId.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) { 
                	self.list = data.user;
                	console.log(self.list);
                }
            }); 
		},
		fnSearch : function(){
			var self = this;
			var param = {uName : self.uName, uPhone : self.uPhone};
			$.ajax({
                url : "/findId.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) {
                	console.log(data.user);
                	if(data.user != undefined){
                		alert("아이디 찾기 성공")
                		$.pageChange("findIdView.do", {uPhone : self.uPhone});
                  		
                	} else {
                		alert("존재하는 정보가 없습니다.");
                	}
                }
            }); 
		},
		fnBack : function(){
			location.href = 'login.do';
		}
		
	}, // methods
	created : function() {
		var self = this;
		self.fnGetList();
	}// created
});
</script>