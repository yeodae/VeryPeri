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
  <!-- 페이징 추가 1 -->
<script src="https://unpkg.com/vuejs-paginate@latest"></script>
<script src="https://unpkg.com/vuejs-paginate@0.9.0"></script>
 <meta charset="UTF-8">
<title>1:1문의 목록</title>
<style type="text/css">
    @font-face {
       font-family: "a타이틀고딕1";
        src: url("../../../font/a타이틀고딕1.ttf") format("truetype");
    }
    
    *{
       font-family: a타이틀고딕1;
    }
#container {
    height: 1300px;
    width: 100%;
    margin-bottom: 163px;
}
table {
	width: 910px;
	text-align: center;
	border-collapse: collapse;
}
td{
 border-bottom: 1px solid black;
 border-color: #ddd;
}
.a1{
	width: 10%;
}
.a2{
width: 10%;
color: red;
}
.a2 a{

color: red;
}
.a3{
width: 50%;
}
.a4{
width: 20%;
}
.a5{
width: 10%;
}
.addbutton{
	text-align: right;
	margin-right: 30px;
	padding: 20px;
}
.addbutton > button{
	width: 100px;
	height: 40px;
	border-radius: 30px;
	border-style: solid;
	border-color: rgb( 0 , 0, 0 , 0.5);
	background-color: #fff;
}
.addbutton a{
    padding: 12px 24px;
}
<!-- 페이징 추가 2-->
	.pagination {
        margin:24px;
        display: inline-flex;
        
    }
    ul {
    }
	.pagination li {
	    min-width:32px;
	    padding:2px 6px;
	    text-align:center;
	    margin:0 3px;
	    border-radius: 6px;
	    border:1px solid #eee;
	    color:#666;
	    display : inline;
	}
	.pagination li:hover {
	    background: #E4DBD6;
	}
	.page-item a {
	    color:#666;
	    text-decoration: none;
	}
	.pagination li.active {
	    background-color : #E7AA8D;
	    color:#fff;
	}
	.pagination li.active a {
	    color:#fff;
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
							    	  <div class="lowerBox"> 1:1문의 </div>
							    	  	<div v-if="info.length > 0" v-for="item in info">
							    	  	
							    	  	<table>
							    	  		<tr>
							    	  			<td class="a1"><a href="#" @click="boardView(item)">{{item.iNo}}</a></td>
							    	  			<td class="a2"><a href="#" @click="boardView(item)">{{item.category}}</a></td>
							    	  			<td class="a3"><a href="#" @click="boardView(item)">{{item.iQtitle}}</a></td>
							    	  			<td class="a4">{{item.iQtime}}</td>
							    	  			<td class="a5">{{item.state}}</td>
							    	  		</tr>
							    	  	
							    	  	</table>
							    	  		
							    	  		
							    	  	</div>
							    	  	<div v-if="info.length == 0" class="nodata"> 검색결과가 없습니다</div>
							    	  	<div class="addbutton"><button @click="addBoard"><a href="#">글쓰기</a></button></div>
							     </div> 
							     
							     
					</div>
					    
					    </div>
			    
			  </div>
</div>
<!-- 페이징 추가 3 -->
	<template>
	  <paginate
	    :page-count="pageCount"
	    :page-range="3"
	    :margin-pages="2"
	    :click-handler="fnSearch"
	    :prev-text="'<'"
	    :next-text="'>'"
	    :container-class="'pagination'"
	    :page-class="'page-item'">
	  </paginate>
	</template>
 <div><%@ include file="../page/footer.jsp" %></div>
</body>
</html>
<script type="text/javascript">
<!-- 페이징 추가 4 -->
Vue.component('paginate', VuejsPaginate)
var app = new Vue({
    el: '#app',
    data: {
    	info : {},
    	orderCntList : [],
    	uId : "${sessionId}",
    	order  : 0,
    	exchange : "",
    	refund : "",
    	list : [],
    	maxpoint : undefined,
 	    infouser : [],
 	   <!-- 페이징 추가 5 -->
		selectPage: 1,
		pageCount: 1,
		cnt : 0
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
            <!-- 페이징 추가 6 -->
			var startNum = ((self.selectPage-1) * 10);
    		var lastNum = 10;
            var nparmap = {uId : self.uId,startNum : startNum, lastNum : lastNum};
            $.ajax({
                url : "/mypag/userInquiry.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.info = data.list; //사용자
                	self.cnt = data.cnt;
	                self.pageCount = Math.ceil(self.cnt / 10);
                	console.log(self.info);
                }
            }); 
        },	    
	    addBoard : function(){
            var self = this;
                $.pageChange("myAddInquiry.do", {uId : self.uId});
        },
        boardView : function(item){
        	var self = this;
        	$.pageChange("myInquiryView.do", {iNo : item.iNo});        	
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
		<!-- 페이징 추가 7-->
		fnSearch : function(pageNum){
			var self = this;
			self.selectPage = pageNum;
			var startNum = ((pageNum-1) * 10);
			var lastNum = 10;
			var nparmap = {startNum : startNum, lastNum : lastNum};
			$.ajax({
				url : "list.dox",
				dataType : "json",
				type : "POST",
				data : nparmap,
				success : function(data) {
					self.list = data.list;
					self.cnt = data.cnt;
					self.pageCount = Math.ceil(self.cnt / 10);
				}
			});
		}
	   
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
