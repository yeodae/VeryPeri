<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
<title>나는 스테프 버튼</title>
    <style>
     @font-face {
       font-family: "a타이틀고딕1";
        src: url("../../../font/a타이틀고딕1.ttf") format("truetype");
    }
    
    *{
       font-family: a타이틀고딕1;
       }
   
	#app2 {
	  /* width: 200px; */
	  width: 10%;
	  float: left;
	  clear: left;
	  
	}
	
	.leftBut1 > button {
	  background-color: #eddcfd;
	  width: 200px;
	  height: 50px;
	  display: inline;
	  border-radius: 20px;
	  border: none;
	  margin-bottom: 1px;
	}
	
	.leftBut1 > button:hover {
	  background-color: #d7acff;
	  color: white;
	}

    </style>
</head>
<body>
<div id="app2">
	<div class="leftBut1">
	<button @click="fnHome">메인 화면</button>
	<button @click="fnInquiry" v-if="sStatus == 'A' || sStatus == 'C' || sStatus == 'M'">1:1 문의</button>
	<span v-else></span>
	<button @click="fnComplaint" v-if="sStatus == 'C' || sStatus == 'M'">민원 관리</button>
	<span v-else></span>
	<button @click="fnCustomer">고객 관리</button>
	<button @click="fnProduct" v-if="sStatus == 'D' ||  sStatus == 'M'">상품 관리</button>
	<span v-else></span>
	<button @click="fnABoard" v-if="sStatus == 'D' || sStatus == 'M'">공지 관리</button>
	<span v-else></span>
	<button @click="fnEvent" v-if="sStatus == 'D' || sStatus == 'M'">이벤트 관리</button>
	<span v-else></span>
	<button @click="fnStaff" v-if="sStatus == 'C' || sStatus == 'M'">직원 관리</button>
	<span v-else></span>
	<button @click="fnOrder" v-if="sStatus == 'B' || sStatus == 'M'">주문 관리</button>
	<span v-else></span>
	<button @click="fnDelivery" v-if="sStatus == 'B' || sStatus == 'M'">배송 관리</button>
	<span v-else></span>
	<button @click="fnExchange">교환/환불 관리</button>
	</div>
</div>
</html>
<script>
var app2 = new Vue({
	el : '#app2',
	data : {
		list : [],
		sName : "${sName}",
        sNo : "${sNo}",
        sStatus : "${sStatus}"
	},// data
	methods : {
		fnHome : function(){
            location.href = '../staff/home.do';
        },
		fnMain : function() {
			 window.open('../home.do', '_blank');
		},
		fnGBoard : function() {
			window.open('../gboard/main.do', '_blank');
		},
		fnInquiry : function() {
			location.href="../inquiry/list.do";
		},
		fnComplaint : function() {
			location.href="../complain/list.do";
		},
		fnCustomer : function() {
			location.href="../user2/list.do";
		},
		fnProduct : function() {
			location.href="../product/list.do";
		},
		fnABoard : function() {
			location.href="../aboard/list.do";
		},
		fnEvent : function() {
			location.href="../event/list.do";
		},
		fnStaff : function() {
			location.href="../staff/Management.do";
		},
		fnOrder : function() {
			location.href="../order/list.do";
		},
		fnDelivery : function() {
			location.href="../delivery/list.do";
		},
		fnLogout : function() {
			location.href="../staff/login.do";
		},
		fnExchange : function() {
				location.href="../exchange/list.do";
		},
		
	}, // methods
	created : function() {
		var self = this;
		/* self.fnGetList(); */
	}// created
});
</script>