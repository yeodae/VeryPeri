<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<link href="../css/footer.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
<meta charset="UTF-8">
<title>Cart page</title>
<%@ include file="../Product/sexyheader.jsp" %>
<style>

@font-face {
   font-family: "a타이틀고딕1";
   src: url("../../../font/a타이틀고딕1.ttf") format("truetype");
 }
 
*{
 	font-family: a타이틀고딕1;    	
 }
 
#headerMargin{
	margin-bottom: 100px;
}

#title {
	width: 1500px;
	margin-bottom: 50px;
	margin: 0px auto;
	margin-top: 100px;
	font-size: 4em;
	text-align: center;
	font-weight: bold;
}

.table {
	
	margin: 0px auto;
	border-collapse: collapse;
	width: 1500px;
	margin-top: 100px;
	margin-bottom: 30px;
}
.table >th{
	text-align: center;
}
.table > th, td {
	text-align: center;
	height: 100px;
}
 .table td{
 	padding: 20px;
	border-bottom: 1px solid black;
	border-bottom-color: #e3e3e3;
 }
.table td {
	padding: 20px;
	border-bottom: 1px solid black;
	border-bottom-color: #e3e3e3;
}

#body {
	width: 1500px;
}

#container {
	width: 100%;
	display: flex;
	flex-direction: column;
}
.ch_deletebutton{
	width: 1500px;
	margin: 0px auto;
	margin-bottom: 30px;
	text-align: right;
}
.border-bottom{
	border-bottom: 1px solid #e3e3e3;
	width: 1500px;
	margin: 0px auto;
}
.payment{
	margin: 0px auto;
	width: 1500px;
	text-align: center;
	font-size: 2em;
	border-bottom: 1px solid #e3e3e3;
	margin-bottom: 30px;
}
.red{
	color: red;
}

/* 헤더 아이콘 띄워져서 주석처리 - 여대현 
span {
	margin-left: 111px;
} */
.baybutton{
	width: 1500px;
	text-align: right;
	margin: 0px auto;
	color: #4b4b4bda;
	font-size: 0.8em;
}
.a{
	width: 15%
}
.b{
	width: 45%
}
.c{
	width: 10%;
}
.d{
	width: 10%
}
.e{
	width: 10%
}
#addr{
width: 1500px;
margin: 0px auto;
margin-top: 40px;
display: flex;
}
#inputaddr{
	width: 940px;
	margin-right: 50px;
	margin-bottom: 100px;
	
}
#inputhd{
	border-bottom: 3px solid black;
}
#point{
	margin-top :10px;
	widows: 700px;
}
h3{
	width : 700px;
	display: inline-block;
}
i{
	margin-right: 7px;
}
.adr{
	widows: 960px;
}
.adr th{
	width : 300px;
	text-align: left;
}
.adr > th, td{
	height: 20px;
	padding: 0px;
}
.nameinput{
	width: 100%;
}
.addrinput2{
width: 100%;
}
.adr input{ 
	height: 40px;
	text-align: left;
	margin: 10px 0px;
	border-width: 0 0 1px;	
}
.adr td{
	text-align: left;
	margin: 10px;
}
select{
	margin-right: 20px;
	height: 42px;
	width: 83px;
	border-width: 0px 0px 1px;
	outline: none;
}
#viewpoint{
	border:  1px solid #e3e3e3; 
	width: 410px;
	height: 88px;
	margin: 8px 0px 20px 0px;
	padding: 57px 50px 80px 50px;
}
#pointhd{
	line-height: 45px;
	font-size: 1.1em;
	font-weight: 700;
}
.pontbottombor{
	margin-top : 50px;
	border-bottom: 3px solid black;
}
.pointable th{
	font-size: 1em;
	width: 150px;
	text-align: left;
}
.pointable td{
	font-size: 1.5em;
	font-weight: bold;
}
td{
	height: 200px;
}

#baybutton{
	width: 1500px;
	margin: 30px auto;
	text-align: center;
}
#baybutton > button{
	width: 350px;
	height: 70px;
	font-size: 1.1em;
	border-radius: 100px;
	background-color: #7C81BB;
	color: #fff;
	border: 0px;
}
input {
  outline: none;
}
.select2{
margin-left :20px;
text-align: center;
	width: 114px;
}

.pImg{
	max-width: 240px;
	max-height: 240px;
}
td input{
	text-align: center;
	border : none;
	width: 20px;
	height: 20px;
}
.c i{
	border: 1px solid black;
	border-radius: 50%;
	padding: 5px;
}
.table button{
	background-color: #fff;
	border-radius: 25px;
	width: 63px;
	height: 25px;
}
#headerd{
	margin-bottom: 80px;
	width: 1500px;
}
.sexyIcon {
padding-right: 0xp;
}
.button11{
   background: none;
    border: none;
    padding: 0;
    font-family: inherit;
    font-size: inherit;
    color: inherit;
    cursor: pointer;
}
#editbutt{
	padding: 23px 126px;
	font-size: 1.3em;
	color: #fff;
}
</style>
</head>
<body>
<div id="headerMargin"> </div>
	<div id="app">
		<div id="container">
		
			<div id="title">Cart</div>
			<div class="body">
				<table class="table">
					<tr>
						<th>이미지</th>
						<th colspan="2">상품정보</th>
						<th>수량</th>
						<th>제거</th>
						<th>주문금액</th>						
					</tr>
					<tr v-for="(item, index) in list">						
						<td class="a"><button class="button11" @click="productDetail(item)"><img :src="item.path" class="pImg"></button></td>
						<td class="b">{{item.pName}}</td>					
						<td class="c">
							
						</td>
						<td class="c">
						 <a href="#none" @click="decreaseCnt(item)"> <i class="fa-solid fa-minus"></i> </a>
							  <input :value="item.cnt" @input="updateItemCnt(item)" readonly>							
							 <a href="#none" @click="increaseCnt(item)"> <i class="fa-solid fa-plus"></i> </a>
							 <br><button style="margin-top:20px;" @click="fnCartChange(item)"><a href="javascript:;">수정</a></button>
						</td>
						<td class="c"><button @click ="fnRemoveCart(item.pNo)"><a href="javascript:;">삭제</a></button></td>
						<td class="e">{{calculateTotal(item) | numberWithCommas}}원</td>
						
					</tr>
				</table>

				<div class="ch_deletebutton">
					<span>₩ 금액 {{ calculateTotalPrice() | numberWithCommas }}원</span>
					<span v-if="delivery == 0">₩ 배송 {{ delivery}}원</span>
					<span v-else>₩ 배송 {{ delivery | numberWithCommas }}원</span>
					<span class="red">₩ 합 {{ calculateTotalPrice()  + delivery | numberWithCommas }} </span>
				</div>
			
				<div>
					<div class="payment"></div>
					<div class="baybutton">상품의 옵션 및 수량 변경은 상품상세 또는 장바구니에서 가능합니다.</div>
				</div>
					
				<div id="baybutton">
					<button @click="fnPay"><a id="editbutt" href="javascript:;">결제하기</a></button> 
				</div>
		</div>	
	</div>
</div>
</div>
<div style="margin-top: 100px;">   <%@ include file="../page/footer.jsp" %> </div>
</body>
</body>
</html>
<script>
// 필터 정의
	Vue.filter('numberWithCommas', function (value) {
	    if (!value) return '';
	    return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');});

	var app = new Vue({
		el : '#app',
		data : {
			list : [],
			uId : "${sessionId}",
			totalPrice : 0,
			delivery : 0,
		},
		methods : {
			fnGetList : function(){
	            var self = this;
	            var nparmap = {uId : self.uId};            
	            $.ajax({
	                url : "searchCart.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) { 	                	
	                	if(data.list.length == 0){
	                		location.href = "/basket.do";
	                	}else{
	                		self.list = data.list; //사용자
	                	}
	                }
	            }); 
	        }, calculateTotal: function (item) {
                return item.price * item.cnt;
            },
	        // 상품 전체 금액 합산 메서드
       		 calculateTotalPrice: function () {
       		    var self = this;
       		    var total = 0;
       		    var membershipDelivery = 0; // 해당 조건을 만족하는 상품의 배송비
       		    var regularDelivery = 0; // 일반 상품들의 배송비

       		    self.list.forEach(function (item) {
       		        total += self.calculateTotal(item);

       		        if (item.category == 'MEM' && item.membership == 'N') {
       		            membershipDelivery = 0;
       		        }
       		        else if(total < 50000){
       		        	regularDelivery = 3000;
       		        }
       		        
       		        else{
       		        	regularDelivery = 0;
       		        }
       		        
       		    });

       		    self.delivery = membershipDelivery + regularDelivery;
       		    self.totalPrice = total + self.delivery;

       		    return total;
                 
        	},decreaseCnt: function (item) {
                if (item.cnt > 1) {
                    item.cnt--;
                    this.calculateTotalPrice();
                }
            }, increaseCnt: function (item) {
            	var self = this;
            	if(item.cnt < item.pLimit){
            		 item.cnt++;
            		 this.calculateTotalPrice();
            	}else{
            		alert("해당상품의 최대구매수량은 "+item.pLimit+"개 입니다.");
            		item.cnt = item.pLimit;
            	}
                
                
                
            }, fnRemoveCart : function(pNo){
                var self = this;
	            var nparmap = {uId : self.uId, pNo : pNo};            
	            $.ajax({
	                url : "removeCart.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) { 
	                	alert("해당 제품이 장바구니에서 제외되었습니다.");
	                	self.fnGetList();
	                }
	            }); 
            }, fnPay : function(item){
                var self = this;
        		var currentDate = new Date();

            	var year = currentDate.getFullYear();
            	var month = currentDate.getMonth() + 1; // 월은 0부터 시작하므로 1을 더함
            	var day = currentDate.getDate();
            	var hours = currentDate.getHours();
            	var minutes = currentDate.getMinutes();
            	var seconds = currentDate.getSeconds();

            	var currentDateString = year + "-" + month + "-" + day + " " + hours + ":" + minutes + ":" + seconds;
            	
            	for(var i=0; i<self.list.length; i++){
            		if(self.list[i].membership == "Y"){
            			if(currentDateString <= self.list[i].mExpDate || currentDateString >= self.list[i].mRegDate){
                    		alert(self.list[i].pName+"\n해당 상품은 멤버쉽 구독이 필요한 상품입니다. \n해당 아티스트의 멤버쉽을 구독해주세요.");                    	
                				if(self.list[i].kitYn == "Y"){
                                	alert(self.list[i].pName+"\n키트 구매는 구독한 아티스트 당 1개만 구입 가능합니다.");
                                	return;
                			}
            			}            			                    	
            		}
            		else if(self.list[i].stock == 0){
            			alert(self.list[i].pName + "\n해당상품은 구매할 수 없습니다.\n*사유 : SOLD OUT");            			
            		}
            		else{
            			$.pageChange("/payment/cartPayment.do", {totalPrice : self.totalPrice});
            			return;            			
            		}
            	}
	           //    $.pageChange("/payment/cartPayment.do", {totalPrice : self.totalPrice}); 
           
            }, fnCartChange : function(item){
        	   var self = this;
               var nparmap = {pNo : item.pNo, uId : self.uId, quantity : item.cnt};            
               $.ajax({
                   url : "/cart/cartPageChangeCnt.dox",
                   dataType:"json",	
                   type : "POST", 
                   data : nparmap,
                   success : function(data) {
	                	alert("해당 제품의 수량이 변경되었습니다.");
	                	self.fnGetList();
                 	  }
               }); 
           },updateItemCnt: function (item) {
           	if (parseInt(event.target.value) > 1){
                item.cnt = parseInt(event.target.value);
                this.calculateTotalPrice();
           	}      
       	 },    
         productDetail : function(item){
             var self = this;
             $.pageChange("/product/productView.do", {pNo : item.pNo});
          }
		},
		created : function() {
			var self = this;
			self.fnGetList();
		}
	});
</script>