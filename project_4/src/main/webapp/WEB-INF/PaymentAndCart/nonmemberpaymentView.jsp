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
	height : 560px;
}
.login button{
	font-weight:500;
	font-size:15px;
}
h3{
	text-align : center;
}
/* .idpw div{
	border-bottom : 1px solid #d8d9df;
}
.idpw label{
	margin : 5px;
}
.idpw span{
	color : #3d435f; 
} */
#smile{
	font-size: 70px;
	margin-left : 200px;
}
.container{
	position : relative;
	top : -100px;
}
.notiti{
	font-size : 14px;
	font-weight : bold;
	color : #ccc;
	text-align : center;
	margin-top : 40px;
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
				<div class="idpw">						
					<div><label>주문번호  <span><input :value="list[0] ? list[0].oNo : ''" readonly></span></label></div>					
					<div><label>주문상품  <span><input :value="list[0] ? list[0].pNo : ''" readonly></span></label></div>
					<div><label>결제금액  <span><input :value="list[0] ? list[0].payment : ''" readonly></span></label></div>
					<div><label>주문일자  <span><input :value="list[0] ? list[0].oDate : ''" readonly></span></label></div>
				</div>
				<div class="notiti">주문번호는 비회원 주문조회시 필수이므로<p>캡처나 따로 저장하시는걸 권장드립니다.</p></div>
				
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
		uId : "${map.uId}",
		oNo : "${map.oNo}",
		list : [],
		pNo:"",
		payment:"",
		oDate:"",
		oCount: ""
		
	},// data
	methods : {
		 fnGetList : function(){
             var self = this;
             var nparmap = {oNo : self.oNo};        
             $.ajax({
                 url : "/mypag/nonPaymentkkk.dox",
                 dataType:"json",   
                 type : "POST", 
                 data : nparmap,
                 success: function(data) { 
                	    self.list = data.list;
                	    if (self.list) {
                	        self.pNo = self.list[0].pNo;
                	        self.payment = self.list[0].payment;
                	        self.oDate = self.list[0].oDate;
                	        self.oCount = self.list[0].oCount;
                	    }
                	    console.log("리스트 ==>", self.list);
                	    
                	}

             }); 
        },
	   	goToMain : function(){
	   		var self = this;
               		location.href = "/user/login.do";
        },
        numberWithCommas : function(number) {
            return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        }

	}, // methods
	created : function() {
		 var self = this;
	     self.fnGetList();
	}// created
});
</script>