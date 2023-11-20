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
<script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
<!-- 결제 연동을 위한 포트원 라이브러리 추가 --> 
<script src="https://cdn.iamport.kr/v1/iamport.js"></script> 
<meta charset="UTF-8">
<title>Payment page</title>
<%@ include file="../Product/sexyheader.jsp" %>
<style>

@font-face {
   font-family: "a타이틀고딕1";
   src: url("../../../font/a타이틀고딕1.ttf") format("truetype");
 }

*{
 	font-family: a타이틀고딕1;    	
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

#headerMargin{
	margin-bottom: 100px;
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

/* 헤더 아이콘창 줄이기위해 제거 - 여대
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
	width: 60%
}

.c{
	width: 5%;
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
	max-width: 240;
	max-height: 240px;
}

.poinPos{
   margin-left: 300px;
}


</style>
</head>
<body>
<div id="headerMargin"> </div>

	<div id="app">

		<div id="container">
		
			<div id="title">Order</div>

			<div class="body">
			
				<table class="table">
					<tr>
						<th>이미지</th>
						<th colspan="2">상품정보</th>
						<th>수량</th>
						<th>주문금액</th>						
					</tr>
					<tr v-for="item in list">
						<td class="a"><img :src="item.path" class="pImg"></td>
						<td class="b">{{item.pName}}</td>
						<td class="c"></td>
						<td class="d">{{cnt}}</td>
						<td class="e">{{calculateTotal(item) | numberWithCommas}}원</td>
					</tr>
				</table>
				
				<div class="ch_deletebutton">
					<span>\ 금액 {{ calculateTotalPrice() | numberWithCommas }}원</span>
					<span v-if="delivery == 0">\ 배송 {{ delivery}}원</span>
					<span v-else>\ 배송 {{ delivery | numberWithCommas }}원</span>
					<span >\ 사용포인트 {{usePoint}}</span>
               		<span class="red">\ 합 {{ calculateTotalPrice()  + delivery - usePoint| numberWithCommas }} </span>

				</div>
			
				<div class="payment"></div>
					<div class="baybutton">상품의 옵션 및 수량 변경은 상품상세 또는 장바구니에서 가능합니다.</div>
			</div>
			<div id="addr">
				<div>
				<!-- <div id="inputaddr">
						<div id="inputhd">
						<h3>배송주소록 추가</h3> <span><i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i>필수 입력사항</span>
						<div>** 등록된 배송주소록이 없을 시 배송주소록을 등록해주세요.</div>
						</div>
					<table class="adr" border="0">
						<tr>
							<th><i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i> 주소록 이름 </th>
							<td>
								<input  class="nameinput " type="text" v-model="uDname" @input="validateDname">
								<div class="error-message" v-if="dNameErrorMessage">{{ dNameErrorMessage }}</div>
							</td>
						</tr>
						<tr>
							<th> <i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i> 받는 사람 </th>
							<td>
								<input  class="nameinput " type="text" v-model="recipient" @input="validateName">
								<div class="error-message" v-if="nameErrorMessage">{{ nameErrorMessage }}</div>
							</td>
						</tr>
						<tr style="display:none"><td><input v-model="duNo"/></td></tr>
						<tr>
							<th><i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i> 주소</th>
							<td>
								<br>
								<input class="addrinput2" type="text" placeholder="기본주소"v-model="addr"  @input="validateAddress">
								<div class="error-message" v-if="addrErrorMessage">{{ addrErrorMessage  }}</div>
								<br>
								<input class="addrinput2" type="text" placeholder="나머지 주소 " v-model="addrDetail"  @input="validateAddrDetail">
								<div class="error-message" v-if="addrDetailErrorMessage">{{ addrDetailErrorMessage }}</div>
								<input class="addrinput2" type="text" placeholder="우편번호" v-model="zipNo"  @input="validateZipNo">	
								<div class="error-message" v-if="zipNoErrorMessage">{{ zipNoErrorMessage  }}</div>							
								<button @click="fnSearchAddr">주소 찾기</button>
							</td>
						</tr>
						
						<tr>
							<th> <i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i>휴대전화</th>
							<td>
							<select class="select" v-model="phone1">
									<option value="">선택</option>
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select>
							<input class="numinput" type="text" v-model="phone2" @input="validatePhone"> - <input class="numinput" type="text" v-model="phone3"  @input="validatePhone2">	
							<div class="error-message" v-if="phoneErrorMessage">{{ phoneErrorMessage }}</div>							
							</td>	
						<tr>
							<th>배송메시지</th>
							<td>
								<textarea rows="7" cols="110" v-model="dText" placeholder="배송메시지는 30자 이내로 입력해주세요."></textarea>
							</td>
						</tr>
							<td><button @click="fnAddAddrList">주소록 등록</button></td>	
						</tr>
						
					</table>
				</div> -->
				
				
				<div id="inputaddr">
						<div id="inputhd">
							<h3>배송 정보</h3> 
							<span><i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i>필수 입력사항</span>
						</div>
						
						<table class="adr" border="0">
							
							<tr>
							</tr>
						<tr>
							<th><i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i> 주소록 이름 </th>
							<td>
								<input  class="nameinput " type="text" v-model="user.uDname" @input="validateName">
								<div class="error-message" v-if="nameErrorMessage">{{ dNameErrorMessage }}</div>
							</td>
						</tr>
						<tr>
							<th> <i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;" ></i> 받는 사람 </th>
							<td>
								<input  class="nameinput " type="text" v-model="user.recipient" @input="validateName">
								<div class="error-message" v-if="nameErrorMessage">{{ nameErrorMessage }}</div>
							</td>
						</tr>
						<tr style="display:none"><td><input v-model="user.duNo" readonly/></td></tr>
						<tr>
							<th><i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i> 주소</th>
							<td>
								<br>
								<input class="addrinput2" type="text" placeholder="기본주소"v-model="user.addr"  @input="validateAddress">
								<div class="error-message" v-if="addrErrorMessage">{{ addrErrorMessage  }}</div>
								<br>
								<input class="addrinput2" type="text" placeholder="나머지 주소 " v-model="user.addrDetail"  @input="validateAddrDetail">
								<div class="error-message" v-if="addrDetailErrorMessage">{{ addrDetailErrorMessage }}</div>
								<input class="addrinput2" type="text" placeholder="우편번호" v-model="user.zipNo"  @input="validateZipNo">	
								<div class="error-message" v-if="zipNoErrorMessage">{{ zipNoErrorMessage  }}</div>							
								<button @click="fnSearchAddr">주소 찾기</button>
							</td>
						</tr>
						
						<tr>
							<th> <i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i>휴대전화</th>
							<td>
							<select class="select" v-model="user.phone1">
									<option value="">선택</option>
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select>
							<input class="numinput" type="text" v-model="user.phone2" @input="validatePhone" maxlength="4"> - <input class="numinput" type="text" v-model="user.phone3"  @input="validatePhone2" maxlength="4">	
							<div class="error-message" v-if="phoneErrorMessage">{{ phoneErrorMessage }}</div>							
							</td>					
						</tr>
					</table>
					
				</div>
				<div id="inputaddr">
                  <div id="inputhd">
                     <h3>포인트</h3> 
                  </div>
                  
         <div class="poinPos" style="font-size:14px;color:#ccc; margin-top:30px;">
            <h3>비회원은 포인트사용이 제한됩니다.</h3>
           
           </div>

            </div>
				             </div>
            <div id="point">
            <div id="pointhd">
               할인 쿠폰/적립 혜택
            </div>   
               <div id="viewpoint">
                  <table class="pointable">
                     <tr>
                        <th>
                           적립 예정 금액
                        </th>
                        
                        <td style="font-size:14px;color:#ccc;">
                           비회원은 적립이 제한됩니다. 
                        </td>
                     </tr>
                  </table>
                  <div class="pontbottombor"></div>
               </div>               
               
<div id="note">
<div style="font-weight: bold;">            
[주문 및 배송정보]
</div>

<p>
[국내 일반 배송]
</p>
<p>
· 배송방식 : Very Peri  물류센터 직접배송(CJ대한통운)<br>
· 배송지역 : 전국(일부지역 제외)<br>
· 배송비용 : 3,000원 / 주문금액 50,000원 이상 시 무료배송<br>
· 산간벽지나 도서산간지역은 추가 배송비가 발생할 수 있습니다.  <br>           
· 배송기간 : 결제 후 7~10일 이내 배송 시작될 예정입니다.<br>
</p>               
               
   

<p>
<div>- 상품의 재고상황에 따라 배송기간이 다소 지연될 수도 있습니다.</div>
<div>- 물류센터 사정으로 인해 배송이 지연될 수 있습니다.</div>
<div style="color: red">- 사전예약/주문제작 등 당일 배송이 어려운 상품을 함께 구매하시는 경우 모든
            상품이 배송 가능한 상태가 되는 시점에 주문하신 상품이 함께 배송 됩니다.</div>
<div>- 기본 배송기간 이상 소요되는 상품 또는 품절된 상품은 개별 연락 드리겠습니다.</div>

<div style="color: red">- 복제 가능한 상품의 경우 개봉 후 단순 변심으로 인한 반품이 불가합니다.</div>
</p>
               </div>
            </div>
         </div>
      
      <div id="baybutton"><button @click="fnBeforePay"><a href="javascript:;">결제하기<a></a></button></div>
      </div>
    

</div>
<div style="margin-top: 100px;"><%@ include file="../page/footer.jsp" %> </div>
</body>
</html>
<script>
const userCode = "imp36711884"; 
IMP.init(userCode); 

Vue.filter('numberWithCommas', function (value) {
    if (!value) return '';
    return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');});


function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
   app.fnResult(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo);
}

   var app = new Vue({
      el : '#app',
      data : {
         usePoint : 0,
         uId : "${map.uId}",
         uPoint : 0,
         pNo : "${map.pNo}",
         cnt : "${map.cnt}",
             uDname : "",
             recipient : "",
             uDphone : "",
         addr : "",
         addrDetail : "",
         zipNo : "",
         email : "",
         list : [],
         delivery : 0,
         numberWithCommas : "",
         totalPrice: 0,
          user : {
                   uId : "",
                   uDname : "",
                   uPoint2 : 0,
                   recipient : "",
                   phone1 : "",
                   phone2 : "",
                   phone3 : "",
	               addr : "",
	               addrDetail : "",
	               zipNo : "",
	               phone : "",
	               duNo : "",
	               oNo: "",
	               buyNo: "",
	               uId : ""
            },
         info : [],
         flg : false,
             phone1 : "",
         phone2 : "",
         phone3 : "",
         dText : "",
         duNo : "",
         oNo : "",
         buyNo: "",
         nameErrorMessage : "",
         dNameErrorMessage : "",
         addrErrorMessage : "",
         addrDetailErrorMessage : "",
         addrDetailErrorMessage : "",
         zipNoErrorMessage : "",
         dTextErrorMessage : "",
         phoneErrorMessage : "",
         
      },
      methods : {
         fnGetList : function(){
               var self = this;
               var nparmap = {uId : self.uId, pNo : self.pNo};        
               $.ajax({
                   url : "searchProductAll.dox",
                   dataType:"json",   
                   type : "POST", 
                   data : nparmap,
                   success : function(data) { 
                      self.list = data.list;
                      console.log("리스트 ==>",self.list);
                   }
               }); 
           },calculateTotal: function (item) {
              var self = this;
                return item.price * self.cnt;
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

            },updateItemCnt: function (item) {
               if (parseInt(event.target.value) > 1){
                   item.cnt = parseInt(event.target.value);
                 this.calculateTotalPrice();
               }
            },fnSearchAddr : function (check){
            var self = this;
             var option = "width = 500, height = 500, top = 100, left = 200, location = no"
             window.open("/mypag/addr.do", "test", option);
            self.check = check;
            
            },fnResult : function(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
             var self = this;
             
                self.user.addr = roadAddrPart1;
                self.user.addrDetail = addrDetail;
                self.user.zipNo = zipNo;
          
          }, fnAddrList : function(){
               var self = this;
               if (self.uId == null || self.uId == "") {
                   alert('세션이 만료되었습니다. 다시 로그인해주세요.');
                   location.href ="/user/login.do"
               }
               var nparmap = {uId : self.uId};
               $.ajax({
                   url : "searchDeliveryUserInfo.dox",
                   dataType:"json",   
                   type : "POST", 
                   data : nparmap,
                   success : function(data) { 
                      self.info = data.dlist; //사용자
                      self.flg = !self.flg;
                   }
               }); 
          } ,fnAddAddrList : function(){
              var self = this;
                 
                 if(self.user.uDname == null || self.user.uDname == "" || self.user.phone1 == null || self.user.phone1 == "" || self.user.phone2 == null || self.user.phone2 == ""|| self.user.phone3 == null || self.user.phone3 == ""|| self.user.addr == null || self.user.addr == "" || self.user.addrDetail == null || self.user.addrDetail == "" ||  self.user.zipNo == null || self.user.zipNo == "" || self.user.recipient == null || self.user.recipient == ''){
                  alert("내용을 모두 입력해주세요.");   
                    return;                 
                 }
              
            // 정규식 패턴 설정
              /*  var dNamePattern = /^[가-힣\s]{1,20}$/;
               var namePattern = /^[가-힣]{1,10}$/;
               var phonePattern = /^\d{4}$/;
               var zipNoPattern = /^\d{1,10}$/;
               var messagePattern = /^.{0,30}$/;
   
               if (!dNamePattern.test(self.user.uDname)) {
                   alert("배송주소록의 이름은 20자 이하의 한글만 입력 가능합니다.");
                   return;
               }
               
               if (!namePattern.test(self.user.recipient)) {
                   alert("받는 사람은 10자 이하의 한글만 입력 가능합니다.");
                   return;
               }
   
               if (!phonePattern.test(self.user.phone2) || !phonePattern.test(self.user.phone3)) {
                   alert("핸드폰 번호는 공백 없이 4자리 숫자만 입력 가능합니다.");
                   return;
               }
   
               if (self.user.addr.length > 50) {
                   alert("주소는 50자 이하의 한글 및 숫자만 입력 가능합니다.");
                   return;
               }
   
               if (self.user.addrDetail.length > 50) {
                   alert("상세 주소는 50자 이하의 한글 및 숫자만 입력 가능합니다.");
                   return;
               }
   
               if (!zipNoPattern.test(self.user.zipNo) || self.user.zipNo.length > 10) {
                   alert("우편번호는 10자 이하의 숫자만 입력 가능합니다.");
                   return;
               }
   
               if (!messagePattern.test(self.user.dText)) {
                   alert("배송 메시지는 30자 이하로 입력 가능합니다.");
                   return;
               }
                 
                 if(self.uId == null || self.uId == ""){
                    alert("세션이 만료되었습니다. 다시 로그인해주세요.");
                    return;
                 } */
                 
                 self.user.uDphone = self.user.phone1 + self.user.phone2 + self.user.phone3;
               var nparmap = {uId : self.uId, uDname : self.user.uDname, uDphone : self.user.uDphone, addr : self.user.addr, addrDetail : self.user.addrDetail, zipNo : self.user.zipNo, uDmessage : self.user.dText, recipient : self.user.recipient };
               $.ajax({
                   url : "/mypag/addAddr.dox",
                   dataType:"json",   
                   type : "POST", 
                   data : nparmap,
                   success : function(data) { 
                      console.log("배송지 등록 성공");
                      
                   }
                  }); 
          }, fnBeforePay : function(){   
        	  var self = this;
        	 
               //핸드폰 번호 합치기
               self.user.phone = self.user.phone1+"-" + self.user.phone2 +"-" +self.user.phone3;
		       self.requestPay();
                
         }, requestPay : function() {
          var self = this;
            var timestamp = new Date().getTime();
             IMP.request_pay({
                 pg: "nice",
                 pay_method: "card",
                 merchant_uid:  "order_" + timestamp,
                 name: "결제 실행",
                 amount: self.totalPrice - self.usePoint,
                 buyer_addr : self.user.addr + self.user.addrDetail,
                 buyer_postcord : self.user.zipNo,
                 buyer_name: self.user.uDname,
                 buyer_tel: self.user.phone,
            
          }, function (rsp) { // callback
                 if (rsp.success) {               
                  self.fnInsertAll();
                  self.fnAddAddrList();
                  alert("주문 완료");
                  $.pageChange("nonmemberpayView.do", {oNo : self.oNo});
                  //location.href = "nonmemberpayView.do"; 
                 } else {
                   // 결제 실패 시
                   self.fnAddAddrList();
                   self.fnInsertAll();               
                   alert("주문 완료");
                   //비회원결제테스트중
                   //location.href = "nonmemberpayView.do";                                                 
                   $.pageChange("nonmemberpayView.do", {oNo : self.oNo});
                 }
             });
        }, fnInsertAll : function(){
           var self = this;
           var timestamp =  new Date().getTime(); 
           self.oNo = timestamp;
                    var nparmap = {uId : self.uId, pNo : self.list[0].pNo, price : self.list[0].price, cnt : self.cnt, artist : self.list[0].artist, oNo : self.oNo, usePoint : self.usePoint};
                    console.log("파람값==>",nparmap);                     
                    $.ajax({
                          url : "insertALL.dox",
                          dataType:"json",      
                          type : "POST", 
                          data : nparmap,
                          success : function(data) { 
                             self.buyNo = data.buyNo;
                             self.fninsertDelivery();
                          }
                      });  
        }, fninsertDelivery : function(){
           var self = this;
           self.user.uId = self.uId;
           self.user.oNo = self.oNo;
           self.user.buyNo = self.buyNo;
           
            var nparmap = self.user;
            console.log("파람값==>",nparmap); 
               $.ajax({
                   url : "insertNonDelivery.dox",
                   dataType:"json",      
                   type : "POST", 
                   data : nparmap,
                   success : function(data) { 
                   }
               });  
        }
        , fnInsertAll2 : function(){
            var self = this;
            var timestamp =  new Date().getTime(); 
            self.oNo = timestamp;
                     var nparmap = {uId : self.uId, pNo : self.list[0].pNo, price : self.list[0].price, cnt : self.cnt, artist : self.list[0].artist, oNo : self.oNo, usePoint : self.usePoint};
                       $.ajax({
                           url : "insertALL.dox",
                           dataType:"json",      
                           type : "POST", 
                           data : nparmap,
                           success : function(data) { 
                              self.buyNo = data.buyNo;
                              self.fninsertDelivery2();
                           }
                       });  
         }, fninsertDelivery2 : function(){
            var self = this;
            self.user.uId = self.uId;
            self.user.oNo = self.oNo;
            self.user.buyNo = self.buyNo;
            self.user.uPoint2 = self.usePoint;
             var nparmap = self.user;
                $.ajax({
                    url : "insertDelivery.dox",
                    dataType:"json",      
                    type : "POST", 
                    data : nparmap,
                    success : function(data) { 
                        alert("결제 성공");
                        location.href = "payView.do"; 
                    }
                });  
         }//정규식 시작
        , validateDname: function() {
            var self = this;
            if (!self.uDname) {
                self.dNameErrorMessage = '';
            } else if (!/^[가-힣\s]{1,20}$/.test(self.uDname)) {
                self.dNameErrorMessage = '배송주소록의 이름은 20자 이하의 한글로 입력하세요.';
            } else {
                self.dNameErrorMessage = '';
            }
        }, validateName: function() {
            var self = this;
            if (!self.recipient) {
                self.nameErrorMessage = '';
            } else if (!/^[가-힣]{1,10}$/.test(self.recipient)) {
                self.nameErrorMessage = '받는 사람은 10자 이하의 한글로 입력하세요.';
            } else {
                self.nameErrorMessage = '';
            }
        }, validateAddress: function() {
            var self = this;
            if (!self.addr) {
                self.addrErrorMessage = '';
            } else if (self.addr.length > 50) {
                self.addrErrorMessage = '주소는 50자 이하로 입력하세요.';
            } else {
                self.addrErrorMessage = '';
            }
        }, validateAddrDetail: function() {
            var self = this;
            if (!self.addrDetail) {
                self.addrDetailErrorMessage = '';
            } else if (self.addrDetail.length > 50) {
                self.addrDetailErrorMessage = '상세 주소는 50자 이하로 입력하세요.';
            } else {
                self.addrDetailErrorMessage = '';
            }
        }, validateZipNo: function () {
            var self = this;
            var zipNoPattern = /^\d{1,10}$/;
            if (!self.zipNo) {
                self.zipNoErrorMessage = '';
            } else if (!zipNoPattern.test(self.zipNo) || self.zipNo.length > 10) {
                self.zipNoErrorMessage = '우편번호는 10자 이하의 숫자만 입력 가능합니다.';
            } else {
                self.zipNoErrorMessage = '';
            }
        },validatePhone: function () {
            var self = this;
            var phonePattern = /^\d{4}$/;
            var phone2Value = parseInt(self.phone2, 10);

            if (!self.phone2) {
                self.phoneErrorMessage = '';
            } else if (!phonePattern.test(phone2Value)) {
                self.phoneErrorMessage = '핸드폰 번호는 4자리 숫자만 입력 가능합니다.';
            } else {
                self.phoneErrorMessage = '';
            }
        }, validatePhone2: function () {
            var self = this;
            var phonePattern = /^\d{4}$/;
            var phone3Value = parseInt(self.phone3, 10);

            if (!self.phone3) {
                self.phoneErrorMessage = '';
            } else if (!phonePattern.test(phone3Value)) {
                self.phoneErrorMessage = '핸드폰 번호는 4자리 숫자만 입력 가능합니다.';
            } else {
                self.phoneErrorMessage = '';
            }
        },
        allPointUse: function () {
        	var self = this;
        	if(self.totalPrice >= self.uPoint){
        		self.usePoint = self.uPoint;
        	}else{
        		self.usePoint = self.totalPrice;
        	}
        },
        poinAppl: function () {
             var self = this;
             var totalPrice = self.totalPrice - self.usePoint;

             if (totalPrice < 0) {
               totalPrice = 0;
             }

             self.totalPrice = totalPrice;
           }

   },created : function() {
         var self = this;
         self.uPoint = "${sessionPoint}";
         self.fnGetList();
      }
   });
   
</script>