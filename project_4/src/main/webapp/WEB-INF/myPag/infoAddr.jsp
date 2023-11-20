<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="mypageheader.jsp" %>
<link href="../css/footer.css" rel="stylesheet" type="text/css">
  <script src="../js/jquery.js"></script>    
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
   <link href="../css/mypag.css" rel="stylesheet" type="text/css">
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
     table{
        width: 910px;
        border-collapse : collapse;
        text-align: center;
     }
     table td{
     height : 40px;
     padding : 25px 0px;
        border-bottom: 1px solid #e3e3e3; 
     }
     .tablebutton{
        width: 930px;
        display: flex;
        flex-direction: column;
        align-items: center;
     }   
     .button > button{
        margin: 40px 10px;
        width: 150px;
        height: 60px;
        border-radius: 50px;
        background-color: #fff;
        font-size: 0.5em;
        font-weight: bold;
     }
     #remo{
        border: none;
        background-color: rgb(24, 0, 109);
        color: #fff;]
        
     }
     .l{
        margin-bottom: 30px;
     }
     .warningm{
        width: 900px;
         line-height: 80px;
         color : rgb(73, 73, 73);
     }
     #warningImg{
        margin-right: 20px;
     }
     #editbut{
            margin: 5px;
		    width: 73px;
		    height: 33px;
		    border-radius: 25px;
		    background-color: #fff;
     }
      #editbut:hover{
       background-color: #d4d5d9;
      }

#editbut a{
	padding: 8px;
}
.i{
	padding: 20px;
}
  </style>
  <title>배송 주소록</title>
  
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
                              <div class="lowerBox"> 배송 주소록 관리 </div>
                                 <div> 
                                    <table>
                                       <tr>
                                          
                                          <th>No.</th>
                                          <th>배송지</th>
                                          <th>주소</th>
                                          <th>연락처</th>
                                          <th>배송지 관리</th>
                                       </tr>
                                       <tr v-for = "(item, index) in info">
                                          
                                          <td>{{index + 1}}</td>
                                          <td>{{item.uDname}}</td>
                                          <td>{{item.uDaddr}} {{item.uDaddrDetail}}</td>
                                          <td>{{item.uDphone}}</td>
                                          <td>
                                          <button class="button" @click="editAddr(item)" id="editbut"><a href="javascript:;"> 수정</a></button>
                                          <br><button class="button" @click="removeAddr(item.duNo)" id="editbut"><a href="javascript:;"> 삭제</a></button>
                                          
                                          </td>
                                       </tr>
                                    </table>
                                    <div class="tablebutton">
                                       <div class="button">
                                          <button id="eid" @click="fnremoveaddr"><a class="i" href="javascript:;">주소 전체 삭제</a></button>
                                          <button id="remo" @click="addAddr"><a class="i" href="javascript:;" style="color: #fff;">배송지 등록</a></button>
                                       </div>
                                    </div>
                                 </div>
                                <div class="lowerBox l"> 배송 주소록 유의사항 </div>
                               <div class="warningm">  <i id="warningImg" class="fa-solid fa-circle-exclamation fa-2xl" style="color: #ff5c5c;"></i><span>배송 주소록은 최대 10개까지 등록할 수 있으며, 별도로 등록하지 않을 경우 최근 배송 주소록 기준으로 자동 업데이트 됩니다.</span>
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
       list : [],
       info :[],
       uId : "${sessionId}",
       duNo : "",
       order : 0,
       exchange : "",
      refund : "",
      maxpoint : undefined,
      infouser : [],
       
    },
    methods: {
    	fnremoveaddr : function(){
    		var self = this;
    		if(!confirm("전체주소를 삭제하시겠습니까?")){
                return;
             }
            var nparmap = {uId : self.uId};            
            $.ajax({
               url : "/addrAllDelete.dox",
               dataType : "json",
               type : "POST",
               data : nparmap,
               success : function(data) {                  
            	   self.fnGetList();
               }
            });    		
    	},
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
            self.info.uId = self.uId;
            self.info.duNo = self.duNo;
            var nparmap = {uId : self.uId, };
            $.ajax({
                url : "/delivery/list.dox",
                dataType:"json",   
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                   self.info = data.list; //사용자                   
                }
            }); 
        },
        editAddr : function(item){
            var self = this;
            $.pageChange("editAddr.do", {uId : self.uId, duNo : item.duNo});
        },
        infoAddr : function(){
           var self = this;
           $.pageChange("infoAddr.do", {uId : self.uId});
        },
        infoUpdate : function(){
           var self = this;
           $.pageChange("infoUpdate.do", {uId : self.uId});
        },
        addAddr : function(){
           var self = this;
           if(self.info.length == 10){
        	   alert("10개까지만 등록 가능합니다");
        	   return;
           }
           $.pageChange("addAddr.do", {uId : self.uId});
        },
        myInquiry : function(){
          var self = this;
          $.pageChange("myInquiry.do", {uId : self.uId});
       },
        removeAddr : function(duNo){ // 주소삭제
           var self = this;
           if(!confirm("선택주소를 삭제하시겠습니까?")){
              return;
           }
            var nparmap = {duNo : duNo};
            $.ajax({
                url : "deleteAddr.dox",
                dataType:"json",   
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                   alert("해당주소가 삭제되었습니다.");
                   self.fnGetList();
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