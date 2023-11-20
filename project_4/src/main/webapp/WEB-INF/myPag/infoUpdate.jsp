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
 <title>회원 정보 수정 </title>
  <style type="text/css">
      @font-face {
       font-family: "a타이틀고딕1";
        src: url("../../../font/a타이틀고딕1.ttf") format("truetype");
    }
    
    *{
       font-family: a타이틀고딕1;
    }
  #container {
    height: 2457px;
    width: 100%;
    margin-bottom: 163px;
}
   .updatetable{
    	width: 900px;
   }
   .warning{
   	     padding-left: 690px;
   	 text-align: right;
   }
   .updatetable th {
   	text-align: left;
   	width: 147px;
   	height: 60px;
   }
   .updatetable td {
   	height: 80px;
   }
  input {
  border-color : #e3e3e3;
  outline: none;
  border-width: 0 0 1px;
  width: 100%;	
  font-size: 1.2em;
}
.ph input{
	margin : 0px 20px;
	width: 150px;
}
select{
	border : none;
	width: 100px;
	height: 70px;
	font-size: 1.3em;
}
.buttomfn{
	width : 1200px;
	margin-top : 150px;
 	text-align: center;
 	height: 300px;
}
.buttomfn button{
	width: 150px;
	height: 55px;
	margin: 0px 10px;
	border-radius: 50px;
	font-size: 0.8em;
	background-color: #fff;
	font-weight: bold;
}
.buttomfn a{
padding: 19px 34px;
	font-size: 0.8em;
	font-weight: bold;
	padding: 30px;
}
#fndd{
	
	background-color:rgb(24, 0, 109);
}
#fndd a{
color: #fff;
}

#remove{
	margin-left: 200px;
}
#yn input{
	width: 50px;
	height: 20px;
	text-align: left;
}
#art{
	padding: 30px;
}
#extext p{
	padding-left : 30px;
	font-size: 0.6em;
}
#artimg input{
	width: 30px;
	height:18px;
}
#artimg{
	margin: 40px;
}
#add1 input[type="radio"] {
  width: 200px;
  height: 200px;
  border-radius: 50%;
  border: 2px solid #1FBED6;
  background-color: white;
  -webkit-appearance: none; /*to disable the default appearance of radio button*/
  -moz-appearance: none;
}

#add1 input[type="radio"]:focus { /*no need, if you don't disable default appearance*/
  outline: none; /*to remove the square border on focus*/
}

#add1 input[type="radio"]:checked { /*no need, if you don't disable default appearance*/
  background-color: #1FBED6;
}

#add1 input[type="radio"]:checked ~ span:first-of-type {
  color: white;
}

#add1 label span:first-of-type {
  position: relative;
  left: -27px;
  font-size: 15px;
  color: #1FBED6;
}

#add1 label span {
  position: relative;
  top: -12px;
}
#add1 div{
	width: 200px;
	height: 200px;
	border-radius: 50%;
	margin: 30px;
	
}

#add1{
	display: flex;
	display: flex;
    flex-direction: row;
    flex-wrap: wrap;
}
#add1 div img{
	width: 200px;
	height: 200px;
	border-radius: 50%;

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
                      <span class="name">{{info.uName}}</span> <span class="nickname">{{info.uName2}}</span>
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
										<span v-if="refund != 0">{{refund}} /</span>
										<span v-else>0 /</span>
										
										<span v-if="exchange != 0"> {{exchange}}</span>
										<span v-else>0</span>
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
                           
                              <div class="lowerBox"> 회원 정보 수정 <span class="warning"><i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i> 필수사항</span> </div> 
                              
                              <table class="updatetable">
                              
                              	<tr>
                              		<th> 아이디</th>
                              		<td>{{info.uId}}</td>
                              	</tr>
                              	<tr>
                              		<th><i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i> 닉네임</th>
                              		<td><input type="text" v-model="info.uName2"></td>
                              	</tr>
                             	<tr>
                              		<th><i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i> 비밀번호</th>
                              		<td><input type="password" v-model="info.uPw" placeholder="영문+숫자+특수문자 조합하여 사용해야 합니다"></td>
                              	</tr>
                             	<tr>
                              		<th><i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i> 새 비밀번호 확인</th>
                              		<td><input type="password" v-model="info.uPw2"></td>
                              	</tr>
                             	<tr>
                              		<th><i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i> 이름</th>
                              		<td><input type="text" v-model="info.uName" ></td>
                              	</tr>
                             	<tr>
                              		<th><i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i> 연락처</th>
                              		<td class="ph">
                              			<select v-model="phnum">
                              				<option value="010">010</option>
                              				<option value="011">011</option>
                              				<option value="017">017</option>
                              				<option value="016">016</option>
                              			</select>
                              			<input type="text" v-model="prefix"> -
                              			<input type="text" v-model="suffix"> 
                              		</td>
                              	</tr>
                             	<tr>
                              		<th> SMS 수신여부</th>
                              		<td id="yn">
                              			<label><input type="radio" name="evtyn"  v-model="info.uSmsyn" value="Y">수신함</label>
                                 		<label><input type="radio" name="evtyn" v-model="info.uSmsyn" value="N">수신안함</label>
                              		</td>
                              	</tr>
                              	
                              </table>
                               
                                 	
                               
                                 <div class="buttomfn">
                                 
                                <button @click="fnback"><a href="javascript:;">취소</a></button>
                                 <button id="fndd" @click="fnUpdate"><a href="javascript:;">확인</a></button>
                                 <button id="remove" @click="userRemove"><a href="javascript:;">회원 탈퇴</a></button>                                 
                                
                                 </div> 
                                 
                      		<div id="art">Artist 선택</div>
                      		<hr>
			                <div id="extext">
			                	<p>좋아하는 Artist을 선택해주세요!</p>
			                </div>      		
                      			<div id="artimg">                      			
                      				<div id="add1">
                      				
                      					<div><a @click="addimg('../../img/Artist/boy.jpg')" href="javascript:;"><img src="../../img/Artist/boy.jpg"></a></div>
                      					<div><a @click="addimg('../../img/Artist/bts.png')"href="javascript:;"><img src="../../img/Artist/bts.png"></a></div>
                      					<div><a @click="addimg('../../img/Artist/epn.jpeg')"href="javascript:;"><img src="../../img/Artist/epn.jpeg"></a></div>
                      					<div><a @click="addimg('../../img/Artist/new.jpg')"href="javascript:;"><img src="../../img/Artist/new.jpg"></a></div>
                      					<div><a @click="addimg('../../img/Artist/txt.jpg')"href="javascript:;"><img src="../../img/Artist/txt.jpg"></a></div>
                      					<div><a @click="addimg('../../img/Artist/zico.png')"href="javascript:;"><img src="../../img/Artist/zico.png"></a></div>
                      					<div><a @click="addimg('../../img/Artist/les.jpg')"href="javascript:;"><img src="../../img/Artist/les.jpg"></a></div>
                      					<div><a @click="addimg('../../img/Artist/su.png')"href="javascript:;"><img src="../../img/Artist/su.png"></a></div>
                      					<div><a @click="addimg('../../img/Artist/dog.jpg')"href="javascript:;"><img src="../../img/Artist/dog.jpg"></a></div>
                      					 
								
                      				</div>               			
                      			</div>
                      			
                      			
                      			
                           </div>
                           
                          
                   
                   </div>
             
           </div>

	</div>
	
	
</div>
   <%@ include file="../page/footer.jsp" %> 
</body>
</html>
<script type="text/javascript">
var app = new Vue({
    el: '#app',
    data: {
       info : [],
       user : {
    	   uName2 : "",
    	   uPw : "",
    	   uPw2 : "",
    	   uName : "",
    	   uPhone : "",
    	   uSmsyn : ""
       },
       uId : "${sessionId}",
       order : 0,
       exchange : "",
       refund : "",
       prefix: "",
       suffix: "",
       phnum : "010",
       maxpoint : undefined,
       
    },
    methods: {
    	
    	addimg : function(item){    	
    		 var self = this;
             var nparmap = {img : item, uId : self.uId};
             $.ajax({
                 url : "/updateupdateprofile.dox",
                 dataType:"json",   
                 type : "POST", 
                 data : nparmap,
                 success : function(data) { 
                	 alert("변경 완료되었습니다");
                	 location.replace(location.href);
               
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
                   self.user = self.info;
               	   self.user.uPw = undefined;
             	   const phoneNumber = self.user.uPhone.substring(3);
            	   self.prefix = phoneNumber.substring(0, 4);            	   
            	   self.suffix = phoneNumber.substring(4);
            	   self.info.uSmsyn = self.user.uSmsyn === 'Y' ? 'Y' : 'N';
                }
            }); 
        },
        fnUpdate : function(){
        	var self = this;
        	self.info.uId = self.uId;
        	if(self.info.uName2 == undefined || self.info.uName2 == ""){
				alert("아이디를 입력해주세요.");
				return;
			}
        	if(self.info.uPw == undefined || self.info.uPw == ""){
				alert("패스워드를 입력해주세요.");
				return;
			}
        	if(self.info.uPw != self.user.uPw2){
				alert("확인패스워드가 일치하지 않습니다.");
				return;
			}
        	var pwCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{2,16}$/;
			if (!pwCheck.test(self.info.uPw))
			{
				alert("비밀번호는 영문+숫자+특수문자 조합하여 사용해야 합니다");
				return;
			}
        	if(self.info.uName == undefined || self.info.uName == ""){
				alert("이름을 입력해주세요.");
				return;
			}
        	if(self.prefix == undefined || self.prefix == ""){
				alert("연락처를 입력해주세요.");
				return;
			}
        	if(self.suffix == undefined || self.suffix == ""){
				alert("연락처를 입력해주세요.");
				return;
			}
        	self.user.uPhone = self.phnum + self.prefix + self.suffix;
        	var nparmap = self.user;
            $.ajax({
                url : "/editInfo.dox",
                dataType:"json",   
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                   self.info = data.findPw; //사용자
                   alert("정상 수정 되었습니다.");
                   self.fnGetList();
                 }
             }); 
        },
        //뒤로가기
	    fnback : function(){
	    	var self = this;
	    	$.pageChange("main.do", {uId : self.uId});
	    },
	    userRemove : function(){
	    	var self = this;
	    	if(!confirm("정말 탈퇴하시겠습니까?")){
				return;
			}
	    	var nparmap = {uId : self.uId};
            $.ajax({
                url : "/removeUser.dox",
                dataType:"json",   
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                   alert("이용해주셔서 감사합니다.");
                   location.href="main.do";
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
    },
    created: function() {
      var self = this;
      self.fnGetList();
	  self.fnPoint();
	  self.fnCntList();
    }
});
</script>