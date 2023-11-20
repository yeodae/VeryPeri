<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
<title>교환 & 반품 접수</title>
<style>
	body {
	}
	    @font-face {
       font-family: "a타이틀고딕1";
        src: url("../../../font/a타이틀고딕1.ttf") format("truetype");
    }
    
    *{
       font-family: a타이틀고딕1;
    }
</style>
</head>
<body>
<div id="app">

	<div>
		<select v-model="dState">
			<option values="교환접수">교환접수</option>
			<option values="반품접수">반품접수</option>
		</select>
	
	</div>
	<div><textarea rows="10" cols="50" v-model="bReasons" placeholder="교환/반품 사유를 입력해주세요"></textarea></div>
	
	<button @click="fnAdd()">등록</button>
	

</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
			buyNo : "${map.buyNo}",
			dState : "",
			exchange : "",
			bReasons : ""
	},
	methods : {
		fnAdd : function(){
            var self = this;
            if(self.dState == '교환접수'){
            	self.exchange = 'C';
            }else{
            	self.exchange = 'R';
            }
            var nparmap = {buyNo : self.buyNo, dState : self.dState, exchange : self.exchange, bReasons : self.bReasons};
            $.ajax({
                url : "/mypag/mypageOrderchange.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	alert(self.dState + "가 등록되었습니다.");
                	window.close(); // 팝업창 닫기
   	        	  	window.opener.location.reload(); // 부모창 새로고침
                }
            }); 
        }
	}, // methods
	created : function() {
		var self = this;
	}// created
});
</script>