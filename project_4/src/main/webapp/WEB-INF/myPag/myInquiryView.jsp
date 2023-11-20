<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <%@ include file="mypageheader.jsp" %>
 <link href="../css/footer.css" rel="stylesheet" type="text/css">
  <script src="../js/jquery.js"></script>  
  <link href="../css/mypag.css" rel="stylesheet" type="text/css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
	<meta charset="UTF-8">
	<title>1:1 문의 답변</title>
	<style type="text/css">
	    @font-face {
       font-family: "a타이틀고딕1";
        src: url("../../../font/a타이틀고딕1.ttf") format("truetype");
    }
    
    *{
       font-family: a타이틀고딕1;
    }
	.tit{
		padding-top: 10px;
		padding-bottom: 10px;	
	}
	.tspn{
		padding-top: 20px;
		padding-bottom: 5	0px;	
	}
	.tspn span{
		margin-left: 30px;
		margin-right: 123px;
	}
	.text2{
		padding-top : 20px;
		height: 500px;
		width: auto;
	}
	.padd{
		padding: 30px 0px;	
	}
	#목록{
		width: 70px;
		height: 30px;
		border-radius: 50px;
		background-color: #fff;
	}
	#rr{/*목록 버튼 상위 di  */
		text-align: right;
	}
	#목록 a{ 
		padding: 8px 17px;
	}
	</style>
</head>
<body>

<div id="app">

			  <div id="container">
			  
					    <div id="top">
					    
					    	<div style="height: 150px;"></div>
					    	
					    <div class="a">
					    	<div class="left topImgBoxwid">
					    	 		<a href="/mypag/main.do"><div id="profileImg"><img :src="infouser.profile"></div></a>
					    	</div >
					    	<div class="topBox">
					    	<span class="name">{{infouser.uName}}</span> <span class="nickname">{{infouser.uName2}}</span>
					    	</div>
					    	
					    	<div class="topBox">
					    	
					    		<div class="details" >
					    		
					    			<div>Order</div>
			                        <label><a href="/mypag/myPagOrderdetails.do">                            
			                        <div v-if="order != 0">{{order}}</div>
			                        <div v-else>0</div>
                          			</a></label>
					    			
					    		</div>
					    		
					    		<div class="details" >
					    		
					    			<div>교환/환불</div>
					    			<div>
					    				<div>
										<span v-if="refund != 0">{{refund}} /</span>
										<span v-else>0 /</span>
										
										<span v-if="exchange != 0"> {{exchange}}</span>
										<span v-else>0</span>
									</div>
					    			</div>
					    			
					    		</div>
					    		<div class="details" >
					    			<div>포인트</div>
									<div v-if="!maxpoint == 0">{{maxpoint}} P</div>
									<div v-else>0 P</div>
					    		</div>
					    	</div>
					    </div>
					    	
					    	 
					    </div>					    
					    <div id="body">
					    
							      <div id="left">
							      	<div class="categories"> MY PAGE</div>
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
                                       <li><a href="/mypag/myAddInquiry.do">1:1 문의</a></li>
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
							    	  <div class="lowerBox"> 1:1문의 </div>
							    	  	<div >
								    	  		<div class="tit"><h4>{{iQtitle}}</h4></div>
								    	  		<div class="tspn">작성일<span>{{iQtime}}</span>답변여부<span>{{state}}</span></div>
								    	  		<hr>
								    	  		<div class="text2"><pre v-html="iQcontent"></pre></div>							    	  	
								    	  	<div v-if="iAcontent == null">
								    	  		<hr>
								    	  			<div class="padd">빠른시간내에 답변드리겠습니다. 잠시만 기다려 주세요!</div>
								    	  		<hr>
								    	  	</div>
								    	  	<div v-else>
								    	  		<hr>
								    	  		<div>답변날짜 {{iAtime}}</div>
								    	  		<hr>
								    	  		<div>{{iAcontent}}</div>
								    	  	</div>
								    	  	<div>
								    	  		<img :src="path">
								    	  	</div>					
							    	  <div>
							    	  	<div id="rr"><button id="목록" @click="fnList"><a href="#">목록</a></button></div>
							    	  </div>
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
var app = new Vue({
    el: '#app',
    data: {
    	info : {},
    	orderCntList : [],
    	uId : "${sessionId}",
    	order  : 0,
    	exchange : "",
    	refund : "",
    	maxpoint : undefined,
 	    infouser : [],
    	list : [],
    	iNo : "${map.iNo}",
    	iQtitle : "",
    	iQtime : "",
    	iQcontent : "",
    	state : "",
    	iAtime : "",
    	iAcontent : "",
    	path : ""
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
    	fnGetList : function(){
            var self = this;
            var nparmap = {uId : self.uId, iNo : self.iNo};
            self.info.uId = self.uId;
            $.ajax({
                url : "/inquiry/info.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.list = data.info; //사용자
                	self.iQtitle = self.list.iQtitle;
                	self.iQtime = self.list.iQtime;
                	self.iQcontent = self.list.iQcontent;
                	self.state = self.list.state;
                	self.iAtime = self.list.iAtime;
                	self.iAcontent = self.list.iAcontent;
                	self.path = self.list.path;
                	console.log(self.iNo);                	
                	console.log(self.iQtitle);
                	console.log(self.list);
                }
            }); 
        },
	    infoAddr : function(){
	    	var self = this;
	    	$.pageChange("infoAddr.do", {uId : self.uId});
	    },
	    infoUpdate : function(){
	    	var self = this;
	    	$.pageChange("infoUpdate.do", {uId : self.uId});
	    },
	    addBoard : function(){
            var self = this;
                $.pageChange("myAddInquiry.do", {uId : self.uId});
        },
        fnList : function(){
        	var self = this;
        	$.pageChange("myInquiry.do", {uId : self.uId});
        },
        fnPoint : function(){ // 포인트 내역 확인
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
	    
    },
    created: function() {
      var self = this;
      self.fnGetList();
      self.fnGetInfo();
		self.fnPoint();
		self.fnCntList();
    }
});
</script>
