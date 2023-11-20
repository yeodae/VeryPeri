<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>포인트</title>
<%@ include file="mypageheader.jsp" %>
<link href="../css/footer.css" rel="stylesheet" type="text/css">
  <script src="../js/jquery.js"></script>  
  <link href="../css/mypag.css" rel="stylesheet" type="text/css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
 <meta charset="UTF-8">

<style type="text/css">
    @font-face {
       font-family: "a타이틀고딕1";
        src: url("../../../font/a타이틀고딕1.ttf") format("truetype");
    }
    
    *{
       font-family: a타이틀고딕1;
    }
    #ftnav{
position: absolute;
left:0%;
width:100%;
font-size:0.7em;
margin-top:200px;
}

#container {
    height: 1166px;
    width: 100%;
    margin-bottom: 163px;
}
	#table th {
	width : 300px;
		padding: 30px;
		border-bottom: 1px solid #e3e3e3; 
	}
	#table td {
		width : 360px;
		padding: 30px;
		border-bottom: 1px solid #e3e3e3; 
	}
#table{
	width: 1000px;
	border-collapse : collapse
}
.pointp{
	text-align: left;
}
.num{
	text-align: right;
}
.View{
	height: 309px;
}
.pointable{
	width: 1000px;
	text-align: center;
	border-collapse : collapse;
}
.pointable td {	
	height: 40px;
	padding: 10px;
	border-bottom: 1px solid #e3e3e3; 
}
.pointable th {
	border-bottom: 1px solid #e3e3e3; 
	height: 60px;
	padding: 10px 0px;
}
.potd{
	text-align: left;
}
.ab{
	margin: 0px;
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
					    	 	 <a href="/mypag/main.do"><div id="profileImg"><img :src="info.profile"></div></a>
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
								<div class="categories ab"> 포인트</div>
							     <div class="View">
									<table id="table">
										<tr>
											<th rowspan="3">
												사용가능 적립금
												<h1>{{maxpoint}} P</h1>
											
											</th>
											<td class="pointp">총 적립금</td>
											<td class="num">{{numpoint + maxpoint}}P</td>
											
										</tr>
										<tr>											
											<td class="pointp">사용된 적립금</td>
											<td class="num">{{numpoint}}P</td>
										</tr>
										<tr>											
											<td class="pointp">환불 예정 적립금</td>
											<td class="num">{{repoint}}P</td>
										</tr>
										
									</table>
							     </div> 
							     	<div class="categories ab">적립금 내역</div>
							     	 <div class="View">
							     	 	<table class="pointable">
							     	 		<tr>
							     	 			<th>주문날짜</th>
							     	 			<th>관련주문</th>
							     	 			<th>적립금</th>
							     	 										     	 		
							     	 		</tr> 
							     	 		
							     	 		<tr v-for="item in usepointList" >
							     	 			<td>{{item.podata}}</td>
							     	 			<td class="potd">{{item.pName}}</td>
							     	 			<td> 
								     	 			<span v-if="!item.point == 0">+ {{item.point}}</span>
								     	 			<span v-else>- {{item.usepoint}}</span>	
							     	 			</td>							     	 			
							     	 			
							     	 		</tr>
							     	 		
							     	 	</table>
									<nav id="ftnav">
      									<div id="ft"><%@ include file="../page/footer.jsp" %></div>
      								</nav> 
							     	 </div>  
		  
                  			</div>	
					</div>
			 </div>   
		</div>

</div>

</body>
</html>
<script type="text/javascript">
var app = new Vue({
    el: '#app',
    data: {
    	info : [],
    	orderCntList : [],
    	uId : "${sessionId}",
    	order  : 0,
    	exchange : "",
    	refund : "",
    	usepointList : [],
    	maxpoint : undefined,
    	numpoint : undefined,
    	repoint : undefined,
    	maxpoint : undefined,
 	    infouser : [],
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
            var nparmap = {uId : self.uId};
            $.ajax({
                url : "/user2.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.info = data.findPw; //사용자
                	self.fnCntList();
                }
            }); 
        },    
        fnNotice : function (){ // 공지 
			var self = this;
    		var option = "width = 915, height = 500, top = 100, left = 200, location = no"
    		window.open("http://localhost:8082/mypag/noticeList.do", "Notice", option);
		},
		fnUseGuide : function (){ //이용안내
			var self = this;
    		var option = "width = 1100, height = 500, top = 100, left = 200, location = no"
    		window.open("http://localhost:8082/mypag/useGuide.do", "UseGuide", option);
		},
		fnFaq : function (){ //faq
			var self = this;
    		var option = "width = 1100, height = 500, top = 100, left = 200, location = no"
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
	            	var y = 0;
	            	var z = 0;
	            	var datalist = data.list;
	            	for(var i=0; i<datalist.length; i++){
	            		x += datalist[i].point;	  
	            		y += datalist[i].usepoint;
	            		z += datalist[i].repoint;
	            	}
	            	
	            	self.maxpoint = x; // 사용가능 포인트 
	            	self.numpoint = y; // 사용한 포인트
	            	self.repoint = z; // 환불 포인트
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
