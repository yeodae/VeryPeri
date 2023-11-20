<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
<meta charset="UTF-8">
<title>장바구니 구매 버튼누르면 구매로 이동</title>
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
span {
	margin-left: 111px;
}
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

</style>
</head>
<body>
	<div id="app">

		<div id="container">
		
			<div id="title">Order</div>

			<div class="body">
				<table class="table">
					<tr>
						
						<th colspan="2">상품정보</th>
						<th>수량</th>
						<th>배송비</th>
						<th>주문금액</th>						
					</tr>

					<tr v-for="(item, index) in 3">
						
						<td class="a">이미지</td>
						<td class="b">이름</td>
						<td class="c">넘어온 숫자</td>
						<td class="d">배송비</td>
						<td class="e">가격</td>
						

					</tr>

				</table>
				<div class="ch_deletebutton"><span>\ 금액</span> + <span>\ 배송</span> ｜ <span class="red">\ 합</span></div>
			
				<div class="payment"></div>
				<div class="baybutton">상품의 옵션 및 수량 변경은 상품상세 또는 장바구니에서 가능합니다.</div>
			</div>
			<div id="addr">
				<div>
				<div id="inputaddr">
						<div id="inputhd">
						<h3>주문자 정보</h3> <span><i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i>필수 입력사항</span>
						</div>
					<table class="adr" border="0">
						<tr>
							<th> <i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i> 주문하시는 분 </th>
							<td><input  class="nameinput " type="text" v-model="name"> </td>
						</tr>
						
						<tr>
							<th><i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i> 주소</th>
							<td>
							<input class="addrinput" type="text" >  <button>주소 찾기</button> 
							<br>
							<input class="addrinput2" type="text" placeholder="기본주소">
							<br>
							<input class="addrinput2" type="text" placeholder="나머지 주소 ">							
							</td>
						</tr>
						
						<tr>
							<th>　일번전화</th>
							<td>
							<select class="select">
								<option>02</option>
								<option>031</option>
								<option>032</option>
								<option>033</option>
								<option>043</option>
							</select>
							<input class="numinput" type="text">	- <input class="numinput" type="text">								
							</td>
						</tr>
						
						<tr>
							<th> <i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i>휴대전화</th>
							<td>
								<select class="select">
								<option>010</option>
								<option>011</option>
								<option>016</option>
								<option>017</option>
								<option>018</option>
								<option>019</option>
							</select>
							<input class="numinput" type="text"> - <input class="numinput" type="text">			
							</td>						
						</tr>
						
						<tr>
							<th>　<i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i>이메일</th>
							<td><div style="width: 793px;">
								<input class="numinput" type="text"> @ <input class="numinput" type="text" :v-model="mail">	
									<select class="select2"  :v-model="email">
											<option value="">-이메일 선택-</option>
											<option value="naver.com">naver.com</option>
											<option value="daum.net">daum.net</option>
											<option value="nate.com">nate.com</option>
											<option value="hotmail.com">hotmail.com</option>
											<option value="gmail.com">gmail.com</option>
											<option value="직접입력">직접입력</option>
									</select>
								</div></td>
						</tr>
						
					</table>
				</div>
				
				<div id="inputaddr">
						<div id="inputhd">
						<h3>배송 정보</h3> <span><i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i>필수 입력사항</span>
						</div>
					<table class="adr" border="0">
					
						<tr>
							<th> <i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i> 배송지선택 </th>
							<td>
								<div id="to" >
										<label><input name="addr" type="radio" style="height: 12px; width: 30px;">주문자 정보와 동일</label> 
										<label><input name="addr" type="radio" style="height: 12px; width: 20px;" > 새로운 배송지</label>
										<button>주소록 보기</button>
							 	</div>
							</td>
						
						</tr>
						
					
						<tr>
							<th> <i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i> 주문하시는 분 </th>
							<td><input  class="nameinput " type="text"> </td>
						</tr>
						
						<tr>
							<th><i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i> 주소</th>
							<td>
							<input class="addrinput" type="text" >  <button>주소 찾기</button> 
							<br>
							<input class="addrinput2" type="text" placeholder="기본주소">
							<br>
							<input class="addrinput2" type="text" placeholder="나머지 주소 ">							
							</td>
						</tr>
						
						<tr>
							<th>　일번전화</th>
							<td>
							<select class="select">
								<option>02</option>
								<option>031</option>
								<option>032</option>
								<option>033</option>
								<option>043</option>
							</select>
							<input class="numinput" type="text">	- <input class="numinput" type="text">								
							</td>
						</tr>
						
						<tr>
							<th> <i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i>휴대전화</th>
							<td>
								<select class="select">
								<option>010</option>
								<option>011</option>
								<option>016</option>
								<option>017</option>
								<option>018</option>
								<option>019</option>
							</select>
							<input class="numinput" type="text"> - <input class="numinput" type="text">			
							</td>						
						</tr>
						
						<tr>
							<th>　배송메시지</th>
							<td><textarea rows="7" cols="110"></textarea> </td>
						</tr>
						
					</table>
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
								
								<td>
									}}포인트{{ P
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
<div>- 기본 배송기간 이상 소요되는 상품 또는 품절된 상품은 개별 연락　　　 드리겠습니다.</div>

<div style="color: red">- 복제 가능한 상품의 경우 개봉 후 단순 변심으로 인한 반품이 불가합니다.</div>
</p>
				
			
					</div>
				</div>
			</div>
		<div id="baybutton"><button>결제하기</button> </div>
		</div>
	</div>

</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			uId : "dcsdsd3",/* "${sessionId}" */
			name : "",
			addr : "",
			ph : "",
			ph2 : "",
			ph3 : "",
			email : "",
			mail : "",
		},
		methods : {
		

		},
		created : function() {
			var self = this;
		}
	});
</script>
