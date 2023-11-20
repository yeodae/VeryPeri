<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>  
<link href="../css/footer.css" rel="stylesheet" type="text/css">
<link href="../css/mypag.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<meta charset="UTF-8">
<title>상품 상세&구매 페이지</title>
<%@ include file="../Product/sexyheader.jsp" %>
<style>
#app{
	margin-bottom: 50px;
}
  .nonMember{
         font-family: "a타이틀고딕1";
        src: url("../../../font/a타이틀고딕1.ttf") format("truetype");
    }
    
    *{
       font-family: a타이틀고딕1;
    }
	div{
		display : block;
	}
	
	#imgBox{
		background-color : gray;
		height : 840px;
		width : 700px;
		txext-align : center;
		float : left;
		position : relative;
	}	
	.headingArea{
		position : relative;
		padding : 0 0 10px;
		margin : 15px 0 15px;
		line-height : 24px;
		border-bottom : 1px solid #d4d5d9;
	}
	table{
		text-indent: initial;
	}
	#infoArea {
	    float: right;
	    width: 350px;
	    margin: 0 0 0 48px;
	    background-color: #fff;
	    position: relative;
	}
	.infoDetail{
		border-bottom : 1px solid #d4d5d9;
		
	}
	.pointDetail{
		border-bottom : 1px solid #d4d5d9;
	}
	.productsAddList{
		background-color: #f8f8f8;
	    position: relative;
	    display: block;
	    margin-bottom: 4px;	 
	    padding: 14px;
	    margin-top : 20px;
	}
	#totalPrice {
	    margin: 20px 0 0;
	    height: 34px;
	    line-height: 34px;
	    padding: 0 9px 0;
	    color: #2d2f43;
	    vertical-align: middle;
	    background: #fff;
	    font-size: 14px;
	    margin-bottom : 20px;
	}
	#itemSlideArea{
	 	display: flex;
	 	justify-content: center;
   		align-items: center;
		width : 350px;
		height: 300px;
	}
	.itemSlide{
		margin: 0 20px;
    	text-align: center;
		width : 175px;
		height: 260px;
	}
	.itemContainer {
	    display: inline-block;
    	vertical-align: top; /* div요소에 있는 이미지와 텍스트 상단 정렬 */
	}
	.txt-box {
    	margin-top: 10px; 
    	font-weight : bold;
    	font-size : 13px;
	}
	.pc-wrap .slider-type2 .swiper-slide .txt-box {
	    min-height: 76px;
	    padding: 0 15px 0;
	    box-sizing: border-box;
	}
	.explanation{
		width: 1200px;
    	margin: 80px auto;
    	margin: 130px auto 0 !important;
	}
	#container{
		height: auto;
		width: 1200px;
	    padding: 0;
	    margin: 0 auto;
	    /* content: "";
    	display: block;
    	clear: both; */
	}
	#radioMenu {
	  display: flex;
	  gap: 20px;
	  border-bottom : 2px solid #d4d5d9;
	  justify-content: center;
	}
	#radioMenu input[type="radio"] {
	  display: none;
	}
	
	#radioMenu label {
	  display: inline-block;
	  padding: 10px 20px;
	  border-bottom: 3px solid transparent;
	  cursor: pointer;
	  transition: color 0.3s, border-bottom 0.3s;
	}
	
	#radioMenu label:hover {
	  color: RGB(102, 103, 171);
	}
	
	#radioMenu input[type="radio"]:checked + label {
	  color:RGB(102, 103, 171);
	  border-bottom-color: RGB(102, 103, 171);
	  font-weight: bold;
	  
	}
	pre{
		padding : 20px;
	}
	/* 버튼 기본 스타일 */
	.button {
	  display: inline-block;
	  padding: 10px 20px;
	  font-size: 14px;
	  text-align: center;
	  color: #black;
	  background-color: white;
	  border-radius: 30px;
	  border : 1px solid #d4d5d9;
	  cursor: pointer;
	  transition: background-color 0.3s;
	  width : 49%;
	  margin-right : 3px;
	  margin-bottom : 30px;
	  
	}
	
	/* 버튼 호버 효과 */
	.button:hover {
	  background-color: #d4d5d9;
	}
	
	/* 버튼 클릭 효과 */
	.button:active {
	  background-color: #1f618d;
	}
	 .buyButton {
	    background-color: rgb(102, 103, 171); /* 바로구매 버튼 배경색 */
	    color: white; /* 바로구매 버튼 글자색 */
	    border-radius: 30px; /* 라운딩 처리 */
	    padding: 10px 20px; 
	    font-weight: bold; 
	    font-size: 16px;
	    cursor: pointer; 
	    border: none; /* 테두리 없애기 */
	    width : 100%;
	    margin-bottom : 10px;
  }
  .wishlist-button{
	  display: inline-block;
	  padding: 10px 20px;
	  font-size: 14px;
	  text-align: center;
	  color: #black;
	  background-color: white;
	  border-radius: 30px;
	  border : 1px solid #d4d5d9;
	  cursor: pointer;
	  transition: background-color 0.3s;
	  width : 49%;
	  margin-right : 3px;
	  margin-bottom : 30px;	  
	}
	/* 버튼 호버 효과 */
	.wishlist-button:hover {
	  background-color: #d4d5d9;
	}
	
	/* 버튼 클릭 효과 */
	.wishlist-button:active {
	  background-color: #1f618d;
	}
  .buyButton:hover {
   	 	 background-color:rgb(71, 72, 141);
  }
  .buyButton:active {
	   background-color: rgb(91, 92, 161);
	}
	em{
		color:#d4d5d9;
		font-size : 14px;
	}
	.category{
		font-size : 15px;
	}
	.notice{
		color : tomato;
		font-size : 12px;
		font-weight : bold;
	}
	.pointArea{
		border-bottom : 1px solid #d4d5d9;
		padding-bottom : 15px;
		margin-bottom : 15px;
	}
	.jeokrip{
		margin : 40px;
	}
	#totalProducts{
		margin-bottom : 10px;
	}
	#quantity{
		border: none; /* 입력 상자 테두리 없애기 */
		background-color: transparent; /* 배경색 없애기 */
		outline: none; /* 포커스 시 나타나는 테두리 없애기 */
		font-weight:bold;
		width: 16px;
		margin-left : 6px;
	}
	.total{
		float:right;
	}
	.price{
		font-weight : bold;
		font-size : 14px;
	}
	.h3 {
    	margin-bottom: 0; 
	}
	.xans-myshop-layerwish {
    position: fixed;
    top: 50%;
    left: 50%;
    z-index: 1000;
    width: 410px;
    margin: -175px 0 0 -205px;
    border-radius: 30px;
	}
	.ec-base-layer {    
	    border: 1px solid #3d435f;    
	    -webkit-border-radius: 5px;    
	    background-color: #fff;
	}
	.ec-base-layer .header {
	    padding: 10px 35px 10px 40px;
	    color: #fff;
	    background: #3d435f;
	}
	.ec-base-layer .header > h1, .ec-base-layer .header > h3 {
	    font-size: 16px;
	    color: #fff;
	    font-weight: 400;   
	}
	.xans-myshop-layerwish .content {
	    padding: 100px 20px 0;
	    text-align: center;
	    background: url(https://www.smtownandstore.com/morenvyimg/m_order/popup_wish_icon.png) no-repeat center 40px;
	}
	.ec-base-layer .action_login2 .action_cancle {
	    width: 160px;
	    height: 50px;
	    background-color: #fff;
	    color: #2d2f43;
	    font-size: 16px;
	    font-weight: 400;
	    float: left;
	    display: block;
	    text-align: center;
	    line-height: 50px;
	    border-radius: 50px;
	    border: 1px solid #b4b5c1;
	}
	.ec-base-layer .action_login2 .action_send {
	    width: 160px;
	    height: 50px;
	    background-color: #3d435f;
	    color: #fff;
	    font-size: 16px;
	    font-weight: 400;
	    float: right;
	    display: block;
	    text-align: center;
	    line-height: 50px;
	    border-radius: 50px;
	    border: 1px solid #3d435f;
	}
	.xans-myshop-layerwish .action_login2 {
	    margin: 50px auto 40px;
	    padding: 0;
	}
	.ec-base-layer .action_login2 {
    	width: 332px;
    	height : 50px;
    }
    .qsoldout{
    	font-weight : bold;
    	color:#3d435f;
    }
    #mainImg{
    	padding-bottom : 50px;
    	border-bottom : 2px solid #d4d5d9;    	
    }
    #mainImg img{
    	width : 100%;
    	height: 100%;
    }
    .explanation img{
    	margin-top : 100px;
    }
    
    .loading-overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    display: none;
    justify-content: center;
    align-items: center;
}

.loading-spinner {
    border: 4px solid rgba(255, 255, 255, 0.3);
    border-top: 4px solid #ffffff;
    border-radius: 50%;
    width: 40px;
    height: 40px;
    animation: spin 2s linear infinite;
}

@keyframes spin {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
}
#sexyLogo {
  margin: 0px auto;
  width: 152px;
  height: 139px;
  top: 21px;
  z-index: 11110;
  display: flex;
  justify-content: center;
  position: absolute;
  top: 50%;
  right: 50%;
  transform: translate(677%, 0%);
}


</style>
</head>
<body>

<div id="app">
	<div id="container">
		<div id="imgBox">
			 <div id="mainImg">
			 <img :src="path">
			 </div>
		</div>	
		<div id="infoArea" style="display : block;, height: 623px; top:auto; ">
			<div class="headingArea">
				<h2 class="cboth">
					<em>[CONNECTION] {{artist}}</em>
					<div class="category">{{category}}</div>
					<div>{{pName}}</div>
				</h2>
				<div class="priceArea">
					<span><i class="fa-solid fa-won-sign"></i></span>
					<span><strong>{{formattedPrice}}</strong></span>
				</div>
			</div>	

			<div class="infoDetail">
				<div>
					<div class="pointArea">
						<span width="100px" height="30px">
							<span style="font-size:14px;color:#232744; font-weight:bold; text-align:left;" >적립금</span>
						</span>
						<span class="pointArea" width="250px" height="30px" >
							<span class="jeokrip" style="font-size:14px;color:#232744;">최대 0.50% ({{price*0.005}} P)</span>
						</span>
					</div>
					<div>
						<div width="360px" height="60px" >
							<span class="notice">								
								<div v-if='membership == "N"'>*GOT the beat Stamp On It MD끼리만 주문 가능합니다.</div>
								<div style="margin-bottom:20px;">*해당 상품은 결제 후 7~10일(주말,공휴일 제외) 이내 배송이 시작될 예정입니다.</div>
							</span>
						</div>
					</div>
				</div>
			</div>	

			<div class="productsAddList">
				<div style="max-height: none;">
					<div style="position:relative; top:0; left:0; backgound-color:#232744;">
						<div id="totalProducts">
							{{pName}}
						</div>

						<span class="qsoldout" v-if="info.stock == 0">SOLD OUT</span>
						<span v-else class="quantity">
							<a href="#none" @click="decreaseQuantity"><i class="fa-solid fa-minus"></i></a>
							<input id="quantity" name="quantity_opt[]" v-model="quantity" @input="formatQuantity" type="text" max="info.pLimit">
							<a href="#none" @click="increaseQuantity"><i class="fa-solid fa-plus"></i></a>
							<span style="font-weight:bold; font-size:15px; float:right;">₩{{ totalPrice }}</span>							
						</span>
					</div>
				</div>
			</div>


			<div v-if="info.stock != 0" id="totalPrice">
				<span>TOTAL</span>
				<span class="total"><strong style="font-size:25px;">₩{{ totalPrice }}</strong> ({{ quantity }}개)</span>
			</div>

			<div class="buyArea" style="position: static; bottom: auto; width: auto; margin-left: 0px;">
				<div style="position : relative;">
					<button v-if="info.stock != 0" class="buyButton" style="display: block" @click="fnProductOrder">바로 구매하기</button>
					<button v-else class="buyButton" style="display: block; background-color: lightgray; pointer-events: none; " @click="fnProductOrder">SOLD OUT</button>
					<div>
						<button class="button" @click="fnCart" >장바구니 담기</button><button class="wishlist-button" @click="wishList">위시리스트 담기</button>
					</div>
				</div>				
			</div>
		
			
			<div class="h3"><h3>함께하면 좋은 상품!</h3></div>
			<div id="itemSlideArea">		  			 
			    <div class="itemSlide" v-for="item in together">
			    	<a @click="fucking(item)">
			        <div class="itemContainer" >			        
			            <div>
			                <img style="width:155px;" :src="item.path">
			            </div>
			            <div class="txt-box">
			                <span class="xname">{{item.pName}}</span>
			                <div>
			                    <span class="price">₩ {{formattedPrice}}</span>
			                </div>
			            </div>
			        </div>
			        </a>
			    </div>
			</div>
		</div>	

		<div class="explanation">
			<img alt="상품상세설명" :src="path2">
			<div id="radioMenu">
	    		<input id="1" type="radio" name="Menu" value="상품정보" v-model="selectedMenu">
	    		<label for="1">상품정보</label>
	    		<input id="2" type="radio" name="Menu" value="주문 및 배송 안내" v-model="selectedMenu">
	    		<label for="2">주문 및 배송 안내</label>
	    		<input id="3" type="radio" name="Menu" value="교환 및 환불 안내" v-model="selectedMenu">
	    		<label for="3">교환 및 환불 안내</label>
	    		<input id="4" type="radio" name="Menu" value="품질보증기준" v-model="selectedMenu">
	    		<label for="4">품질보증기준</label>    		
    		</div>

    		<div id="selectedMenu">
    			<pre v-if = "selectedMenu == '상품정보'">
<h4>[상품정보]</h4>
구매한 상품의 취소/반품은 마이페이지의 주문내역에서 신청 가능합니다.
상품 문의를 통해 취소나 환불, 반품 등은 처리되지 않습니다.
가격, 판매자, 교환/환불 및 배송 등 해당 상품 자체와 관련 없는 문의는 마이페이지 내 1:1 문의하기를 이용해주세요.
"해당 상품 자체"와 관계없는 글, 양도, 광고성, 욕설, 비방, 도배 등의 문의는 예고 없이 이동, 노출제한, 삭제 등의 조치가 취해질 수 있습니다.

- 판매원 : SM BRAND MARKETING 
- KC 인증 : R-C-REI-SME-SM01
- 제조사 : 드림어스 컴퍼니

[안내 사항]
* 멤버쉽 카테고리 상품은 환불이 불가능 합니다.
* 단순 변심으로 인한 교환/반품이 불가합니다.
* 설명서를 충분히 숙지 후 사용해주세요.


[추가 안내 사항] 
* 본 제품은 사용연령 만 14세 이상 분들을 위한 제품으로, 어린이용이 아닙니다.
* 본 제품은 공정거래위원회고시 소비자분쟁해결기준에 의거 교환 또는 보상을 받을 수 있습니다.
    			</pre>
    			<pre v-if="selectedMenu=='주문 및 배송 안내'">
<h4>[주문 및 배송정보]</h4>
[국내 일반 배송]
・배송방식 : Very Peri  물류센터 직접배송(CJ대한통운)
・배송지역 : 전국(일부지역 제외)
・배송비용 : 3,000원 / 주문금액 50,000원 이상 시 무료배송
・도서산간지역은 추가 배송비가 발생할 수 있습니다.
・배송기간 : 결제 후 3~10일 이내 (영업일 기준)



- 상품의 재고상황에 따라 배송기간이 다소 지연될 수도 있습니다.
- 물류센터 사정으로 인해 배송이 지연될 수 있습니다.

- 예약판매 상품 등 당일 배송이 어려운 상품을 함께 구매하는 경우
   모든 상품이 배송 가능한 상태가 되는 시점에 주문하신 상품이 함께 배송됩니다.
    (상품별 배송일정이 상이하오니 자세한 일정은 상품 상세페이지를 참고 바랍니다.)
- 기본 배송기간 이상 소요되는 상품이거나 품절된 상품은 개별 연락 드리겠습니다.
    			</pre>
    			<pre v-if="selectedMenu=='교환 및 환불 안내'">
<h4>[교환 및 환불정보]</h4>
[교환∙반품 방법]

- 상품 수령일로부터 7일 이내 교환/반품 사유가 가능한 사진 (상품 전체 혹은 불량 부분 확대사진)을 첨부하여 주문번호, 상품 바코드, 사유 등을 1:1문의 또는 고객센터(1661-6110) 접수 바랍니다.
- 첨부파일의 용량이 큰 경우 CSCENTER@SMTOWN.COM으로 메일 발송 후 1:1문의 또는 고객센터(1661-6110) 접수 바랍니다.

・상품교환∙반품단계
- Step1: 교환∙반품 기간확인
- Step2: 마이페이지 또는 1:1문의로 교환∙반품접수
- Step3: CS담당자의 안내 후 7일 이내 지정 반품지 및 지정 반품수단으로 교환, 반품 배송
- Step4: 반품지에 상품 입고 및 검품 후 교환∙반품 진행
- Step5: 교환∙반품 완료



[교환∙반품시 유의사항]
・상품의 색상은 모니터 사양에 따라 실제 색상과는 다소 차이가 있을 수 있으며, 
   상품 라벨의 위치나 색상은 이미지와 다를 수 있습니다.
- 구성품 누락 및 불량으로 인한 교환/환불을 위해서는 택배 박스 및 상품 개봉(구성품 포함) 영상이 반드시 필요합니다.
  개봉 영상이 없을 경우 교환 및 환불이 어려울 수 있습니다
- 개봉 영상은 개봉 전 박스의 모든 면이 보이고, 상품 개봉 장면이 온전하게 보이도록 촬영 하셔야 합니다.
- 구성품이 랜덤인 상품의 경우, 교환 진행 시 교환 상품도 랜덤으로 발송됩니다.
- 상품 결함의 경우 5mm 이하의 찍힘 자국과 상품 공정상 발견 될 수 있는 스크래치 및 눌림, 찍힘 자국은 교환 및 반품의 대상이 되지 않습니다.
- 인화류/지류 및 초상 상품의 경우 뒷면, 배경 등 초상 이외의 결함과 공정 과정에서 발생 할 수 있는 스크래치, 눌림 및 찍힘은 교환 및 반품의 대상이 되지 않습니다.
- 모든 상품은 빛 반사가 없는 상태에서 보이는 하자일 경우에만 교환/환불 가능합니다.
- PVC 상품의 경우 소재 특성상 주변환경(온. 습도)의 영향에 따라 형태의 변형 또는 PVC 간 달라붙음 등의 하자가 발생할 수 있으며, 그로인한 교환 및 반품의 대상이 되지 않습니다.

・교환∙반품 가능기간
- 변심, 배송오류, 파손, 불량 등 상품 결함 : 단순 변심, 상품 하자, 오배송의 경우 수령일로부터 7일 이내까지 1:1문의 또는 CS CENTER로 접수 가능합니다.

・교환∙반품 불가한 경우
- 상품 수령 후 7일을 초과한 경우
- 상품의 가치가 감소한 경우 (포장지 훼손, 세탁, 상품 얼룩, 향수 냄새, 탈취제 냄새, 증정품 훼손, 구성품 훼손, 사용 흔적 등)
- 구매자의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우
- 시간의 경과에 의하여 재판매가 곤란할 정도로 상품등의 가치가 현저히 감소한 경우(상품 바코드 제거, 수선 등)
- 주문제작 상품이나 세일 상품, 음반 등 상품 상세페이지에 교환/환불 불가를 공지한 상품의 경우 
- 복제가 가능한 상품등의 포장을 훼손한 경우
- 제품의 오배송, 불량 상품이라도 사용 흔적, 훼손 등의 흔적이 있을 경우 
- 촬영 또는 해상도 등의 영향으로 고객님의 모니터에서 확인되는 색상과 실제 수령한 상품의 색상 차이가 있을 경우 
- 상품의 프린트 혹은 패턴이 있는 경우 상품상세페이지 이미지와 다를 수 있습니다.
- 교환/반품 진행시 이벤트, 프로모션으로 증정된 증정품을 함께 보내주셔야 하며, 누락시 교환/환불이 불가합니다.
- 모든 상품 특성상 재고가 조기 소진될 수 있어 단순변심에 의한 교환은 어려울 수 있으며, 
   반품/교환은 전자상거래 등에서의 소비자 보호에 관한 법률에 의거한 규정을 따릅니다.
- Very Peri 온라인스토어에서 구매하신 상품은 공식 오프라인 매장에서 교환/환불이 절대 불가합니다.
- 공식 오프라인 매장에서 구매하신 상품은 Very Peri 온라인스토어에서 교환/환불이 절대 불가합니다.
- 각 상품별로 교환/환불 정책은 차이가 있을 수 있으며 자세한 사항은 상품정보에서 확인 부탁드립니다.
 (자세한 내용은 1:1문의 또는 CS CENTER를 이용해 주시기 바랍니다)

・교환∙반품 비용
- 변심 : 단순 변심으로 반품을 원할 경우에는 구매자가 왕복배송비 지불
- 배송오류, 파손, 불량 등 상품 결함 : 상품하자, 오배송의 경우에는 판매자가 배송비 지불
 (정확한 교환∙반품비용은 1:1문의 또는 CS CENTER를 이용해 주시기 바랍니다)



[미성년자 권리보호안내]
미성년 고객께서 상품을 주문(계약) 하시는 경우, 법정대리인(부모님 등)이 그 주문(계약)에 동의하지 않으면
미성년자 본인 또는 법정대리인(부모님 등)이 그 주문(계약)을 취소하실 수 있습니다. 
    			</pre>
    			<pre v-if="selectedMenu=='품질보증기준'">
<h4>[품질보증기준]</h4>
제품의 품질에 이상이 있을 경우, 반품, 교환, A/S, 환불 , 품질보증 및 피해보상 등에 관한 사항은 소비자분쟁해결기준(공정거래위원회 고시)에 의거하여 처리됩니다.
    			</pre>
    		</div>

		</div>    
	</div>

	<div class="xans-element- xans-myshop xans-myshop-layerwish ec-base-layer" v-show="showWishlistPopup">

	    <div class="header">
	        <h3>관심상품 담기</h3>
	    </div>

		    <div class="content">
		        <p>선택하신 상품을 관심상품에 담았습니다. <br>지금 관심상품을 확인하시겠습니까?</p>
		    </div>
		    <div class="cboth action_login2">
		        <a href="#none" class="action_cancle move" complete="complete" @click="hideWishlistPopup">쇼핑 계속하기</a>
		        <a class="action_send move"><button class="action_send move" @click="moveWish">관심상품 확인</button></a>
		    </div>
	    <a class="close" @click="hideWishlistPopup"></a>
	</div>
</div>

<div class="xans-myshop-layerwish ec-base-layer" style="display: none;">
        <!-- 팝업 내용 및 버튼들 -->
    </div>
    
<script>
   $(document).ready(function() {
    // 페이지 로드 시 팝업을 초기에 숨김
    togglePopup(false);
    // '위시리스트 담기' 버튼 클릭 시 팝업 표시
    $('.wishlist-button').click(function() {
        // 로컬 스토리지에 정보 저장
        localStorage.setItem('wishlistPopupShown', 'true');
        // 팝업 표시
        app.showWishlistPopup = true;
    });
    // '쇼핑 계속하기' 링크나 '관심상품 확인' 링크 클릭 시 팝업을 숨기게 합니다.
    $('.action_cancle.move, .action_send.move').click(function() {
        togglePopup(false);
    });
    // 팝업 오른쪽 상단의 닫기 아이콘 클릭 시 팝업을 숨김
    $('.close').click(function() {
        // 팝업 숨김
        app.showWishlistPopup = false;
    });
});
// togglePopup 함수를 정의합니다.
function togglePopup(show) {
    if (show) {
        $('.xans-myshop-layerwish').show();
    } else {
        $('.xans-myshop-layerwish').hide();
    }
}
</script>
<div style="width: 100%;">
<%@ include file="../page/footer.jsp" %>
</div>
</body>
</html>
<script>
var app = new Vue({
    el: '#app',
    data: {    	
    	uId : "${sessionId}",    	
    	list : [],
    	info : [],
    	together : [],
    	pNo : "${map.pNo}",
    	pName : "",
    	artist : "",
    	price: "",
    	formattedPrice: "",
    	artist : "",
    	path : "",
    	path2 : "",
    	category : "",
    	membership : "",
    	quantity: "1", // 기본 수량 값
    	totalPrice : 0, // 총 가격 초기값 0
    	selectedMenu : "상품정보",
    	showWishlistPopup: false,
    },
    methods: {
    	fnGetList : function(){
            var self = this;            
            var nparmap = {pNo : self.pNo};            
            $.ajax({
                url : "/product/selectProductInfo.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.info = data.info; //사용자
                	self.pName = self.info[0].pName;
                	self.price = self.info[0].price;
                	
                	self.formattedPrice = self.formatPrice(self.price); // 가격 포맷 변환
                	
                	self.artist = self.info[0].artist;
                	self.path = self.info[0].path;
                	self.path2 = self.info[1].path;
                	self.category = self.info[0].category;
                	self.membership = self.info[0].membership;
                	console.log(self.info);     
                	self.fnGetList2();
                }
            }); 
            //주문 페이지로 이동
        },  fnProductOrder : function(){
        	var self = this;
        	var param = {cnt : self.quantity, pNo : self.pNo}
        	if(self.uId == null || self.uId == ''){
        		if(confirm("비회원으로 구매하시겠습니까?")){
        			if(self.info[0].category == 'MEM'){
                		alert("비회원은 멤버쉽 상품을 구매하실 수 없습니다.");	
                		return;
                	}else{
                		param = {cnt : self.quantity, pNo : self.pNo, uId : "비회원"}
                		$.pageChange("/payment/nonmemberpayment.do", param);
                	}
        		}
        	}else{
        		$.pageChange("/payment/payment.do", param);	
        	}        	
        	
        },//위시리스트 이동  
        wishList : function(){
        	var self = this;
        	
      	  	if(self.uId == null || self.uId == '' ){
      	  		alert("회원 로그인 후 이용하실 수 있습니다.")
      	  		return;
      	  	}
        	
            var nparmap = {pNo : self.pNo, uId : self.uId};            
            $.ajax({
                url : "/product/insertWish.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {         
                    // 팝업 변경
                    self.togglePopup(true); // 수정된 부분
                    // 로컬 스토리지에 정보 저장
                    self.showWishlistPopup = true;
                    localStorage.setItem('wishlistPopupShown', 'true');
                }
            }); 
        },
        togglePopup: function(show) {
            if (show) {
                $('.xans-myshop-layerwish').show();
            } else {
                $('.xans-myshop-layerwish').hide();
            }
        },
        //pop-up : 위시리스트로 이동
        moveWish : function(){
        	var self = this;
        	$.pageChange("/mypag/myInformation.do",{uId : self.uId}); 
        	self.showWishlistPopup = true;
        },
        //함께하면 좋은상품!!이동
        fucking : function(item){
        	var self = this;
        	$.pageChange("/product/productView.do",{pNo : item.pNo}); 
        },
        
        
        //pop-up 팝업을 숨기는 동작
        hideWishlistPopup() {  
        	var self = this;
        	self.showWishlistPopup = false;
        },
        	//장바구니로 이동
        fnCart : function(){
      	  var self = this;
      	  	
      	  	if(self.uId == null || self.uId == '' ){
      	  		alert("회원 로그인 후 이용하실 수 있습니다.")
      	  		return;
      	  	}
      	  	
      	  	if(self.quantity > self.info[0].pLimit){
      	  	alert("1회 구매 횟수 제한을 초과하였습니다.")
      	  		return;
      	  	}
      	  
            var nparmap = {pNo : self.pNo, uId : self.uId, quantity : self.quantity};            
            $.ajax({
                url : "/cart/addCart.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
              	  if(confirm("장바구니 추가 완료. 장바구니로 이동하시겠습니까?")){
			        	location.href= "/cart/cartList.do";  
              	  }
                }
            }); 
        },
        formatPrice: function(price) {
        	// 가격 포맷 변환을 위한 함수
        	return price.toLocaleString();
        },
        formatQuantity: function() {
        	var self = this;
    		// 수량 포맷 변환을 위한 함수
    		self.quantity = self.quantity.replace(/\D/g, ''); // 숫자 이외의 문자 제거
    		self.quantity = parseInt(self.quantity); // 숫자로 변환
    		self.quantity = self.quantity.toLocaleString(); // 포맷 변환
    	},
    	increaseQuantity: function() {
    		var self = this;
            // 수량 증가를 위한 함수
            if(self.quantity < self.info[0].pLimit){
            	self.quantity++;	
            }
            else{
            	alert("해당상품의 최대구매수량은 "+self.info[0].pLimit+"개 입니다.");
            }
        },
        decreaseQuantity: function() {
        	var self = this;
            // 수량 감소를 위한 함수
            if (self.quantity > 1) {
            	self.quantity--;
            }
        },
        calculateTotalPrice: function() {
            // 총 가격을 계산하는 함수
            var self = this;
            var numericQuantity = parseInt(self.quantity.replace(/\D/g, '')); // 숫자로 변환
            self.totalPrice = (self.price * numericQuantity).toLocaleString();
        },
         fnGetList2 : function(){
            var self = this;            
            var nparmap = {artist : self.artist}; 
            console.log(nparmap);
            $.ajax({
                url : "/product/together.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.together = data.together; //사용자
                	console.log(self.together);
                	console.log(self.artist);
                	console.log("together ==>",self.together);
                }
            })
        } 
    },
    //총 가격 계산
   computed: {
    	totalPriceCalculation: function() {
        var numericQuantity = parseInt(this.quantity, 10);
        return this.price * numericQuantity;
    	},
	},
	watch: {
	    totalPriceCalculation: function(newTotalPrice) {
	        this.totalPrice = newTotalPrice.toLocaleString();
	    }
	},
    created: function() {
      var self = this;
      self.fnGetList();
    },
    mounted: function () {
        // 팝업을 초기에 숨김
        this.showWishlistPopup = false;
    }
});
</script>