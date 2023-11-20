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
.login-box{
		height : 460px;
	}
	
</style>
</head>
<body>
<div id="app">
	<div class="container">		
		<h2 class="h2"> Order Check </h2>
		<div class="login-box">
			<div class="login-box2">
			<h3 class="stadyInfo">비회원 주문조회</h3>
				<div class="idpw">						
				    <div><label>주문번호  <span><input type="text" name="nmNo" v-model = "nmNo" placeholder="주문번호">
					    </span></label>
				    </div>
				    <div><label>연락처  <span><input type="text" name="nmPhone"  v-model = "nmPhone" placeholder="연락처">
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
		nmNo : "",
		nmPhone : ""
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
			var param = {nmNo : self.nmNo, nmPhone : self.nmPhone};			
			$.ajax({
                url : "/mypag/NonOrderList.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) {
                	console.log(data.list);
                	if(data.list != undefined){                		
                		$.pageChange("nonOrderView.do", {oNo : self.nmNo});                  		
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