<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>MY PAGE</title>
<%@ include file="mypageheader.jsp" %>
<script src="../js/jquery.js"></script>
<link href="../css/mypage.css" rel="stylesheet" type="text/css">
<link href="../css/footer.css" rel="stylesheet" type="text/css">
<link href="../css/mypag.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="../css/swiper.css" rel="stylesheet" type="text/css">

<script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>

<!-- Swiper library -->
<link href="https://cdn.jsdelivr.net/npm/swiper@5.3.6/css/swiper.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/swiper@5.3.6/js/swiper.min.js"></script>
<!-- vue-awesome-swiper -->
<script src="https://cdn.jsdelivr.net/npm/vue-awesome-swiper@4.1.1/dist/vue-awesome-swiper.js"></script>

<meta charset="UTF-8">
<style type="text/css">
    @font-face {
       font-family: "a타이틀고딕1";
        src: url("../../../font/a타이틀고딕1.ttf") format("truetype");
    }
    
    *{
       font-family: a타이틀고딕1;
    }
.swiper-container {
	height:420px;
	border-radius:7px;
}
.swiper-slide {
    line-height: 50px;
	text-align:center;
	align-items:center; /* 위아래 기준 중앙정렬 */
	justify-content:center; /* 좌우 기준 중앙정렬 */
}
.swiper-slide img {

	max-width:100%; /* 이미지 최대너비를 제한, 슬라이드에 이미지가 여러개가 보여질때 필요 */
	/* 이 예제에서 필요해서 설정했습니다. 상황에따라 다를 수 있습니다. */
}
.b{ 

	height: 350px;
	display: flex;
	width: 1200px;	
}
.j{
	margin-bottom: 55px;
}
.c{

	width: 250px;
	height: 350px;
	margin-right: 63px;
}
.justimg{
	width: 250px;
	height: 200px;
}
.justBox{
 	width: max-content;
 	word-break: break-all;
	max-width: 170px;
	display: inline-block;
	font-size: 0.7em;
	margin-bottom: 10px;
	line-height: 20px;
	
}
.justpay, .justBox {
	width : 276px;
    text-align: right;
  	margin:  0px;
  	padding: 0xp;
}

.isPName{
	font-size: 0.7em;
	margin-bottom: 10px;
	line-height: 20px;
}
</style>
</head>
<body>

	<div id="app">

			<div id="container">
				<div id="top">
					<div id="topbody">
						<div style="height: 150px;"></div>

						<div class="a">
							<div class="left topImgBoxwid">
								<a class="logobut" href="/mypag/main.do"><div id="profileImg"><img :src="info.profile"></div></a>
							</div>
							<div class="topBox">
								<span class="name">{{info.uName}}</span> <span class="nickname">{{info.uName2}}</span>
							</div>

							<div class="topBox">
								<div class="details">
									<div>Order</div>
			                        <label><a class="logobut" href="/mypag/myPagOrderdetails.do">                            
			                        <div v-if="order != 0">{{order}}</div>
			                        <div v-else>0</div>
                          			</a></label>

								</div>

								<div class="details">

									<div >교환/환불</div>
									<div>
									<a class="logobut" href="http://localhost:8082/mypag/myPagOrderdetails.do">
										<span v-if="refund != 0">{{refund}} /</span>
										<span v-else>0 /</span>										
										<span v-if="exchange != 0"> {{exchange}}</span>
										<span v-else>0</span>
									</a>
									</div>

								</div>
								<div class="details">
									<div >포인트</div>
									<a class="logobut" href="http://localhost:8082/mypag/mypageReserves.do">
									<div v-if="!maxpoint == 0">{{maxpoint}} P</div>
									<div v-else>0 P</div>
									</a>
								</div>
								
							</div>
						</div>


					</div>
				</div>


				<div id="body">

					<div id="left">
						<div class="categories">MY PAGE</div>
						<div style="text-align: left;">
							<ul style="padding: 0px;">
                                 <li class="ulh1">나의 쇼핑 정보 </li>
                                 <li>
                                    <ul>
                                       <li><a href="/mypag/myPagOrderdetails.do">주문내역</a></li>
                                       <li><a href="/cart/cartList.do">장바구니</a></li>
                                       <li><a href="/mypag/myInformation.do">찜 목록</a></li>
                                       <li><a href="/mypag/mypageReserves.do">포인트</a></li>                                 
                                    </ul>   
                                 </li>  
                              </ul>
                              <ul style="padding: 0px;">
                                 <li class="ulh1">회원 정보</li>
                                 <li>
                                    <ul>
                                       <li><a href="/mypag/infoUpdate.do">회원 정보 수정</a></li>
                                       <li><a href="/mypag/infoAddr.do">배송주소록</a></li>                           
                                    </ul>   
                                 </li>  
                              </ul>
                               <ul style="padding: 0px;">
                                 <li class="ulh1">고객센터</li>
                                 <li>
                                    <ul>
                                       <li><a  href="/mypag/myInquiry.do">1:1 문의</a></li>
                                       <li><a @click="fnNotice" href="#javascript:;">공지사항</a></li>
                                       <li><a @click="fnUseGuide" href="#javascript:;">이용안내</a></li>
                                       <li><a @click="fnFaq" href="#javascript:;">FAQ</a></li>                                 
                                    </ul>   
                                 </li>  
                              </ul>


						</div>
					</div>

					<div id="right">

						<div class="View" style="margin-bottom : 30px;">
							<div class="lowerBox j">주문상품</div>
							
							<div v-if="orderlist.length == 0">
									<div class="nodata">내역이 없습니다</div>							
							</div> 
							
						<div v-else-if="orderlist.length ==1">
							<div>
								<div @click="productDetail(orderlist[0].pNo)">
								<img class="justimg" :src="orderlist[0].path">
								</div>
								<div class="justBox">{{orderlist[0].pName}}</div>
								  <div class="justpay">{{ Number(orderlist[0].price).toLocaleString('ko-KR', {style: 'currency', currency: 'KRW'}) }}</div>	
							</div>
						</div>
						
						<div v-else-if="orderlist.length ==2">
							<template v-for="item in orderlist">
								<div style="display: inline-block; margin-right: 10px;"@click="productDetail(item.pNo)">
								<img class="justimg" :src="item.path">
								<div class="isPName">{{ item.pName.length > 30 ? item.pName.slice(0, 30) + '...' : item.pName }}</div>
								  <div class="justpay">{{ Number(item.price).toLocaleString('ko-KR', {style: 'currency', currency: 'KRW'}) }}</div>	
							    </div>
							    </template>
							    
						</div>
							
							<div v-else class="swiper-container">
							<swiper
							    ref="swiperComponent"
							    :options="swiperOptions"
							    @click-slide="onSwiperClickSlide"
							    @set-translate="onSetTranslate"
							>
								<template v-for="item in orderlist">
							    	<swiper-slide>
						    			<div @click="productDetail(item.pNo)">
						    			<img class="justimg" :src="item.path">
						    			</div>
							            <div class="justBox">{{item.pName}}</div>
							            <div class="justpay">{{ Number(item.price).toLocaleString('ko-KR', {style: 'currency', currency: 'KRW'}) }}</div>		
							    	</swiper-slide>
							    </template>
						          <div class="swiper-pagination"  slot="pagination"></div>
							      <div class="swiper-button-prev" slot="button-prev"></div>
							      <div class="swiper-button-next" slot="button-next"></div>
							</swiper>
						</div>
				
						</div>

						<div class="View">						
							<div class="lowerBox j">장바구니</div>
								<div v-if="cartlist.length == 0">
									<div class="nodata">내역이 없습니다</div>							
								</div> 
								
								<div v-if="cartlist.length == 1">
									<div @click="productDetail(cartlist[0].pNo)">
										<img class="justimg" :src="cartlist[0].path">
									</div>
									<div class="justBox">{{cartlist[0].pName}}</div>
									<div class="justpay">{{ Number(cartlist[0].price).toLocaleString('ko-KR', {style: 'currency', currency: 'KRW'}) }}</div>									
								</div> 
								
						<div v-if="cartlist.length == 2">
    						<template v-for="item in cartlist">
        						<div style="display: inline-block; margin-right: 10px;" @click="productDetail(item.pNo)">
            						<img  class="justimg" :src="item.path">
            						<div class="isPName">{{ item.pName.length > 30 ? item.pName.slice(0, 30) + '...' : item.pName }}</div>
            						<div class="justpay">{{ Number(item.price).toLocaleString('ko-KR', {style: 'currency', currency: 'KRW'}) }}</div>
        						</div>
    						</template>							
						</div>
								
								
								
									<div v-else class="swiper-container">
										<swiper
										    ref="swiperComponent"
										    :options="swiperOptions"
										    @click-slide="onSwiperClickSlide"
										    @set-translate="onSetTranslate"
										>
											<template v-for="item in cartlist">
										    	<swiper-slide>
									    			<div @click="productDetail(item.pNo)">
									    			<img class="justimg" :src="item.path" >
									    			</div>
										            <div class="justBox">{{item.pName}}</div>
										            <div class="justpay">{{ Number(item.price).toLocaleString('ko-KR', {style: 'currency', currency: 'KRW'}) }}</div>		
										    	</swiper-slide>
										    </template>
									          <div class="swiper-pagination"  slot="pagination"></div>
										      <div class="swiper-button-prev" slot="button-prev"></div>
										      <div class="swiper-button-next" slot="button-next"></div>
										</swiper>
									</div>
							
						</div>

						<div class="View">
						<div class="lowerBox j">찜목록</div>
						<div v-if="wishlist.length == 0">
									<div class="nodata">내역이 없습니다</div>							
								</div> 
								<div v-else class="swiper-container">
										<swiper
										    ref="swiperComponent"
										    :options="swiperOptions"
										    @click-slide="onSwiperClickSlide"
										    @set-translate="onSetTranslate"
										>
											<template v-for="item in wishlist">
										    	<swiper-slide>
									    			<div><img class="justimg" :src="item.path" @click="productDetail(item.pNo)"></div>
										            <div class="justBox">{{item.pName}}</div>
										            <div class="justpay">{{ item.price.toLocaleString('ko-KR', {style: 'currency', currency: 'KRW'}) }}</div>
										    	</swiper-slide>
										    </template>
									          <div class="swiper-pagination"  slot="pagination"></div>
										      <div class="swiper-button-prev" slot="button-prev"></div>
										      <div class="swiper-button-next" slot="button-next"></div>
										</swiper>
									</div>
						</div>

					</div>

				</div>


			</div>
		
		</div>
	<div><%@ include file="../page/footer.jsp" %></div>
		
</body>
</html>
<script type="text/javascript">
Vue.use(VueAwesomeSwiper);
	var app = new Vue({
		el : '#app',
		data : {
			info : [],
			orderCntList : [],
			uId : "${sessionId}",
			order : 0,
			exchange : "",
			refund : "",
			wishlist : [],
			orderlist : [],
			cartlist : [],
			maxpoint : undefined,
			swiperOptions: {
		      loop: true,
		      slidesPerView: 3, 
		      pagination: {
		        el: '.swiper-pagination',
		        clickable : true, 
	            type: 'bullets'
		      },
		      navigation: {
		        nextEl: '.swiper-button-next',
		        prevEl: '.swiper-button-prev'
		      }
		    }
		},
		methods : {
			fnGetList : function() { // 사용자 정보 불러오기 이름 , 별명 (닉네임)
				var self = this;
				var nparmap = {uId : self.uId};				
				$.ajax({
					url : "/user2.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {						
						self.info = data.findPw;
					}
				});
			},
			/* 상단 구매내역 카운트 숫자 */
			fnCntList : function() {
				var self = this;
				var nparmap = {uId : self.uId};
				$.ajax({
					url : "/mypag/listExchange.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						
						var listCnt = data.list;
						for (var i = 0; i < listCnt.length; i++) {
							if (listCnt[i].exchange == "C") {								
								self.refund = listCnt[i].orderCnt;							
							} else if (listCnt[i].exchange == "R") {
								self.exchange = listCnt[i].orderCnt;
							} else{
								self.order += listCnt[i].orderCnt;

							}
						}

					}
				});
			},
			 /* 찜목록 */
			fnwish: function() {
				var self = this;
				var nparmap = {uId : self.uId};
		
				$.ajax({
					url : "/mypag/wishlist.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.wishlist = data.list;
					}
				});
			},
			 /* 구매내역 */
			fnorder: function() {
				var self = this;
				var nparmap = {uId : self.uId};
			
				$.ajax({
					url : "/mypag/productInformation.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {						
						self.orderlist = data.list;

					}
				});
			},
			 /* 장바구니 */
			fncart: function() {
				var self = this;
				var nparmap = {uId : self.uId};
			
				$.ajax({
					url : "/mypag/selectcartlist.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {						
						self.cartlist = data.list;

					}
				});
			},fnPoint : function(){ // 포인트 내역 확인
		        var self = this;
		        var nparmap = {uId : self.uId};
		        $.ajax({
		            url : "/pointList.dox",
		            dataType:"json",	
		            type : "POST", 
		            data : nparmap,
		            success : function(data) { 	
		            	self.usepointList = data.list;
		            	var x = 0;
		            	var datalist = data.list;
		            	for(var i=0; i<datalist.length; i++){
		            		x += datalist[i].point;	
		            	}
		            	self.maxpoint = x; // 사용가능 포인트 
		            
		            }
		        }); 
		    },
	         productDetail : function(pNo){
	             var self = this;
	             $.pageChange("/product/productView.do", {pNo : pNo});
	          },
			onSetTranslate() {
			    /*   console.log('onSetTranslate') */
		    },
		    onSwiperSlideChangeTransitionStart() {
		     /*  console.log('onSwiperSlideChangeTransitionStart') */
		    },
		    onSwiperClickSlide(index, reallyIndex) {
		      /* console.log('Swiper click slide!', reallyIndex) */
		    },
		    
		    fnNotice : function (){ // 공지 
				var self = this;
	    		var option = "width=1000,height=1000,top=200,left=500, location = no"
	    		window.open("http://localhost:8082/mypag/noticeList.do", "Notice", option);
			},
			fnUseGuide : function (){ //이용안내
				var self = this;
	    		var option = "width=1000,height=1000,top=200,left=500, location = no"
	    		window.open("http://localhost:8082/mypag/useGuide.do", "UseGuide", option);
			},
			fnFaq : function (){ //faq
				var self = this;
	    		var option = "width=1000,height=1000,top=200,left=500, location = no"
	    		window.open("http://localhost:8082/mypag/faq.do", "fnFaq", option);
			},

		
		},
		mounted() {
/* 			console.log('Swiper instances:', this.$refs.swiperComponent.$swiper, this.swiper);
 */		},
		created : function() {
			var self = this;
			self.fnGetList();
			self.fnCntList();
			self.fnorder();
			self.fncart();
			self.fnwish();
			self.fnPoint();
		}
	});

</script>
