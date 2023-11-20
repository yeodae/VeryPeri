<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="mypageheader.jsp" %>
<link href="../css/footer.css" rel="stylesheet" type="text/css">
<script src="../js/jquery.js"></script>
<link href="../css/mypag.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
<meta charset="UTF-8">
<title>찜목록</title>
<style type="text/css">
    @font-face {
       font-family: "a타이틀고딕1";
        src: url("../../../font/a타이틀고딕1.ttf") format("truetype");
    }
    
    *{
       font-family: a타이틀고딕1;
    }
#container {
    height: 100%;
    width: 100%;
    margin-bottom: 163px;
}
#table {
	width: 1400px;
}
.responsive-image{
	width : 100px;
	height : 100px;
}
.button {
    margin: 5px 0px;
	  display: inline-block;
	  padding: 5px 10px;
	  font-size: 13px;
	  text-align: center;
	  color: #black;
	  background-color: white;
	  border-radius: 30px;
	  border : 1px solid #d4d5d9;
	  cursor: pointer;
	  transition: background-color 0.3s;
	  width : 49%;
	  margin-right : 3px;	  
	}
	
	/* 버튼 호버 효과 */
	.button:hover {
	  background-color: #d4d5d9;
	}
	

	.button:active {
	  background-color: #1f618d;
	}
	.button2{
	 display: inline-block;
	  padding: 15px 20px;
	  font-size: 13px;
	  text-align: center;
	  color: #black;
	  background-color: white;
	  border-radius: 30px;
	  border : 1px solid #d4d5d9;
	  cursor: pointer;
	  transition: background-color 0.3s;
	  width : 14%;
	  font-size : 15px;
	  margin-right : 3px;	  
	}
	.button2:hover {
	  background-color: #d4d5d9;
	}

	.button2:active {
	  background-color: #1f618d;
	}
	.button3{
	 display: inline-block;
	  float : right;
	  left : 300px;
	  padding: 15px 20px;
	  font-size: 13px;
	  text-align: center;
	  color: #black;
	  background-color: white;
	  border-radius: 30px;
	  border : 1px solid #d4d5d9;
	  cursor: pointer;
	  transition: background-color 0.3s;
	  width : 22%;
	  font-size : 15px;
	  margin-right : 70px;	  
	}
	.button3:hover {
	  background-color: #d4d5d9;
	}
	
	/* 버튼 클릭 효과 */
	.button3:active {
	  background-color: #1f618d;
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
.calenderArea{
   margin-top: 40px;
    background-color: #fcfcfc;
    border: 1px solid #d8d9df;
    
}
.calenderArea ul li {
    color: #96979e;
    padding: 0 0 0 25px;
    height: 33px;
    line-height: 33px;
    font-weight: 400;
    font-size: 14px;
}
.calenderArea i {
   padding-right: 10px;
}
</style>

</head>
<body>
	<div id="app">

		<div id="container">

			<div id="top">

				<div style="height: 78px;"></div>

				<div class="a">
					<div class="left topImgBoxwid">
						<a href="/mypag/main.do"><div id="profileImg"><img :src="info.profile"></div></a>
					</div>
					<div class="topBox">
						<span class="name">{{infouser.uName}}</span> <span class="nickname">{{infouser.uName2}}</span>
					</div>

					<div class="topBox">

						<div class="details">

							<div>Order</div>
			                        <label><a href="/mypag/myPagOrderdetails.do">                            
			                        <div v-if="order != 0">{{order}}</div>
			                        <div v-else>0</div>
                          			</a></label>

								</div>

								<div class="details">

									<div>교환/환불</div>
									<div>
										<span v-if="refund != 0">{{refund}} /</span>
										<span v-else>0 /</span>
										
										<span v-if="exchange != 0"> {{exchange}}</span>
										<span v-else>0</span>
									</div>

								</div>
								<div class="details">
									<div>포인트</div>
									<div v-if="!maxpoint == 0">{{maxpoint}} P</div>
									<div v-else>0 P</div>
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
                                       <li><a href="/mypag/myInquiry.do">1:1 문의</a></li>
                                       <li><a @click="fnNotice" href="#javascript:;">공지사항</a></li>
                                       <li><a @click="fnUseGuide" href="#javascript:;">이용안내</a></li>
                                       <li><a @click="fnFaq" href="#javascript:;">FAQ</a></li>                                                              
                                    </ul>   
                                 </li>  
                              </ul>


					</div>
				</div>

				<div id="right">

					<div class="View">
						<div class="lowerBox">
							찜목록</div>
						<div class="box-border-bottom"></div>
						<div class="calenderArea" v-if="wishList.length == 0">
                           <ul>
                              <li><i class="fa-regular fa-face-smile"></i> 찜목록이 존재하지 않습니다.</li>
                              <li><i class="fa-regular fa-face-smile"></i> 위시리스트 담기 후 확인이 가능합니다.</li>
                           </ul>                                    
                        </div>
						<table>
						<thead v-if="wishList.length > 0" class="thead">
							<tr>
								<th><input type="checkbox" @click="fnAllCheck" v-model="selectAll"></th>
								<th></th>
								<th>상품정보</th>
								<th>적립금</th>
								<th>배송비</th>
								<th>판매가</th>
								<th>선택</th>
							</tr>
						</thead>
						<tbody>
							<tr  v-for="item in wishList">
								<td><input type="checkbox" name="ssss" :value="item.wnum" v-model="selectItem"></td>
								<td><button class="button11" @click="productDetail(item)"><img class="responsive-image" :src="item.path" ></button></td>
								<td><button class="button11" @click="productDetail(item)"><div class="artist">{{item.artist}}</div>
									{{item.pName}}</button></td>
								<td>{{item.price*0.005}} P</td>							
								<td v-if="item.price < 50000">기본배송<div>₩3,000</div><div>(조건)</div></td>
								<td v-if="item.price >= 50000">무료배송</td>
								<td><strong>₩{{formatPriceWithCommas(item.price)}}</strong></td>
								<td>
									<button class="button" @click="OrderProduct(item)"> 주문하기 </button>								
									<button class="button" @click="insertCart(item)"> 장바구니 </button>								
									<button class="button" @click="fnRemoveOne(item)">삭제</button>								
								</td>								
							</tr>
						</tbody>
				
						</table>
						<div class="BTbottomArea">
							<button class="button2" @click="fnRemove">삭제</button>
							<button class="button3" @click="fnRemoveAll">찜목록 지우기 </button>
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
var cnt = "Y";
var app = new Vue({
    el: '#app',
    data: {
    	info : [],
    	orderCntList : [],
    	uId : "${sessionId}",
    	order  : 0,
    	exchange : "",
    	refund : "",
    	wishList : [],
    	selectItem : [],
    	selectAll: false,
    	maxpoint : undefined,
 	 	infouser : "",
 	 	quantity: "1"
    	
 
    },
    methods: {
    	fnGetInfo : function() { // 사용자 정보 불러오기 이름 , 별명 (닉네임)
			var self = this;
			var nparmap = {uId : self.uId};				
			$.ajax({
				url : "/user2.dox",
				dataType : "json",
				type : "POST",
				data : nparmap,
				success : function(data) {						
					self.infouser = data.findPw;
				}
			});
		},
    	fnAllCheck: function() {
    		var self = this;
    		self.selectAll = !self.selectAll;
	            if (self.selectAll) {
	            	self.selectItem = self.wishList.map(item => item.wnum);
	            } else {
	            	self.selectItem = [];
	            }
    	    },
    		  
    	fnGetList : function(){
            var self = this;
            var nparmap = {uId : self.uId};
            $.ajax({
                url : "/user2.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.info = data.findPw; //사용자                	
                	self.fnProduct();
                }
            }); 
        },           
	    fnProduct : function(){
	        var self = this;
	        var nparmap = {uId : self.uId};
	        $.ajax({
	            url : "/mypag/wishlist.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) { 	
					self.wishList = data.list;           	
	            }
	        }); 
	    },
	    fnRemove : function(){
			var self = this;
			if(!confirm("정말 삭제할거냐?")){
				return;
			}
			var noList = JSON.stringify(self.selectItem);
			var param = {selectItem : noList};
			$.ajax({
                url : "/mypag/removeWishProduct.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) { 
                	alert("삭제되었다!");
                	self.fnGetList();
                	self.selectItem = [];
                }
            });
		},
		fnRemoveAll : function(){
			var self = this;
			if(!confirm("정말 삭제할거냐?")){
				return;
			}
			var param = {uId : self.uId};
			$.ajax({
                url : "/mypag/removeAllProdeuctWish.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) { 
                	alert("삭제되었다!");
                	self.fnGetList();
                	
                }
            });
		},		
		fnRemoveOne : function(item){		
			var self = this;
				 if(!confirm("정말 삭제할거냐?")){
					return;
				} 
				var param ={wnum : item.wnum};
				 $.ajax({
	                url : "/mypag/removeSingleProdeuctWish.dox",
	                dataType:"json",	
	                type : "POST",
	                data : param,
	                success : function(data) { 
	                	alert(data.list);
	                	self.fnGetList();
	                	self.selectItem = [];
	                }
	            }); 
			 	
			},
		insertCart : function(item){
				var self = this;			
				var param ={uId : self.uId, pNo : item.pNo};
				$.ajax({
	                url : "/mypag/editCart.dox",
	                dataType:"json",	
	                type : "POST",
	                data : param,
	                success : function(data) {
	                	/* 카트로 상품등록수 장바구니로 갈거냐 말꺼냐 창띄우기 */
	                	alert(data.list);
	                }
	            });
		},	   
		OrderProduct : function(item){
			var self = this;
			var param = {pNo : item.pNo, cnt : self.quantity};
			console.log(item);
			  $.pageChange("/payment/payment.do", param);  
		},	   
        myInquiry : function(){
   	    	var self = this;
   	    	$.pageChange("myInquiry.do", {uId : self.uId});
   		},
   		formatPriceWithCommas(price) {
   		    return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
   	  },
   		productDetail : function(item){
			var self = this;
			$.pageChange("/product/productView.do", {pNo : item.pNo});
	}, fnPoint : function(){ // 포인트 내역 확인
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
    fnNotice : function (){ // 공지 
		var self = this;
		var option = "width=850, height=1000, top=200, left=500, location = no"
		window.open("http://localhost:8082/mypag/noticeList.do", "Notice", option);
	},
	fnUseGuide : function (){ //이용안내
		var self = this;
		var option = "width=850, height=1000, top=200, left=500, location = no"
		window.open("http://localhost:8082/mypag/useGuide.do", "UseGuide", option);
	},
	fnFaq : function (){ //faq
		var self = this;
		var option = "width=850, height=1000, top=200, left=500, location = no"
		window.open("http://localhost:8082/mypag/faq.do", "fnFaq", option);
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
	
	    
},created: function() {
      var self = this;
      self.fnGetList();
      self.fnGetInfo();
		self.fnPoint();
		self.fnCntList();
		self.fnProduct();
    }
});
</script>
