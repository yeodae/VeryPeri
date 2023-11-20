<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="mypageheader.jsp" %>
  <script src="../js/jquery.js"></script>  
  <link href="../css/footer.css" rel="stylesheet" type="text/css">
   <link href="../css/mypag.css" rel="stylesheet" type="text/css">  
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
  <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
 <meta charset="UTF-8">
  <style type="text/css">
      @font-face {
       font-family: "a타이틀고딕1";
        src: url("../../../font/a타이틀고딕1.ttf") format("truetype");
    }
    
    *{
       font-family: a타이틀고딕1;
    }
  #container {
    height: 1564px;
    width: 100%;
    margin-bottom: 163px;
}
     #adrbut{
        width: 150px;
        height: 40px;
        border-radius: 10px;
        margin: 0px auto;
        background-color: #697BC9;
        font-size: 0.8em;
        color: #fff;
        border-color: #ddd;
        
     }
     #adrbutdiv{
        text-align: right;
        width: 900px;
     }
   .l{
        margin-bottom: 30px;
     }
     .warningm{
        width: 930px;
         line-height: 80px;
         color : rgb(73, 73, 73);
     }
     #warningImg{
        margin-right: 20px;
        
     }
     table input{
        width: 300px;
        height: 50px;
        border-width: 0 0 1px;
        outline: none;        
     }
     #pp{
     width: 900px;
    margin: 30px auto;
    display: flex;
    flex-direction: row;
    justify-content: center;
     }
     #pp > button {
      margin: 0px 10px;
      width: 100px;
      height: 40px;
      border-radius: 40px;
      
   }
   #bbut{
      background-color: #fff;
   }
   #edut{
      background-color:  rgb(47, 47, 145);
      color: #fff;
   }
  </style>
</head>
<title>배송 주소록 수정</title>
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
                              <table v-for="item in list">
                                  <tr>
                                    <th><label for="a1">· 배송지명</label></th>
                                    <td><input id="a1" v-model="item.uDname"></td>                            
                                 </tr>
                                  <tr>
                                    <th><label for="a1">· 받는 사람</label></th>
                                    <td><input id="a1" v-model="item.recipient"></td>                            
                                 </tr>
                                 <tr>
                                    <th><label for="b">· 휴대전화</label></th>
                                    <td><input id="b" v-model="item.uDphone"></td>                            
                                 </tr>
                                 
                              <tr v-if="user.uDaddr != null">
                                <th><label for="e" for="">· 주소</label></th>
                                 <td ><input id="e" style="width : 300px;" type="text" v-model="user.uDaddr"></td>                            
                             </tr>
                             <tr v-if="user.uDaddr != null">
                                 <th><label for="f" for="">· 상세주소</label></th>
                                  <td><input id="f"  style="width : 300px;" type="text" v-model="user.uDaddrDetail"></td>                            
                               </tr>
                             <tr v-if="user.uDaddr != null">
                                  <th><label for="g" for="">· 우편주소</label></th>
                                   <td><input id="g" style="width : 300px;" type="text" v-model="user.zipNo"></td>                            
                             </tr>
                                 
                                 
                              </table>
                              
                            <div id="adrbutdiv"><button id="adrbut" @click="fnSearchAddr">주소 검색</button></div>
                            <div id="pp"><button id="bbut" @click="infoAddr">취소</button>
                            <button id="edut" @click="fnEdit">수정</button></div>
                                       
                              <div class="lowerBox l"> 배송 주소록 유의사항 </div>
                                 <div class="warningm"> 
                                     <i id="warningImg" class="fa-solid fa-circle-exclamation fa-2xl" style="color: #ff5c5c;"></i>
                                     <span>배송 주소록은 최대 10개까지 등록할 수 있으며, 별도로 등록하지 않을 경우 최근 배송 주소록 기준으로 자동 업데이트 됩니다.</span>
                              </div>                   
                              </div>
             
                    </div>
  
         </div>
      </div>
   
</div>
   <div><%@ include file="../page/footer.jsp" %></div>
</body>
</html>
<script>
function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
   app.fnResult(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo);
}

var app = new Vue({
    el: '#app',
    data: {
       list : [],
       info :{},
       uId : "${sessionId}",
       duNo : "${map.duNo}",
       order : "",
       maxpoint : undefined,
       order : 0,
       exchange : "",
       refund : "",
       user : {
             uId : "",
             uDname : "",
         recipient : "",
             uDphone : "",
             addr : "",
             addrDetail : "",
         zipNo : "",
         duNo : "",
         
      },
       
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
               self.info = data.findPw;
            }
         });
      },
       fnGetList : function(){
            var self = this;
            self.info.uId = self.uId;
            var nparmap = {uId : self.uId, duNo : self.duNo};
            $.ajax({
                url : "/delivery/searchDeliveryUser.dox",
                dataType:"json",   
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                   self.list = data.list; //사용자
                   self.user.uId = self.uId;
                             
                }
            }); 
        },
        fnEdit : function(){ // 주소록 변경
            var self = this;
            self.user.duNo = self.duNo;
            self.user.uDname = self.list[0].uDname;
            self.user.recipient = self.list[0].recipient;
            self.user.uDphone = self.list[0].uDphone;
            self.user.addr = self.list[0].uDaddr;
            self.user.addrDetail = self.list[0].uDaddrDetail;
            self.user.zipNo = self.list[0].zipNo;
            
        if(self.user.uDname == "" || self.user.uDname == undefined){
        	 alert("배송지를 입력해주세요");
        	 return;
        }
        if(self.user.recipient == "" || self.user.recipient == undefined){
       	 alert("받는사람을 입력해주세요");
       	 return;
       }
        if(self.user.uDphone == "" || self.user.uDphone == undefined){
       	 alert("전화번호를 입력해주세요");
       	 return;
       }
        var phoneRegex = /^\d{11}$/; // 숫자 11자리
        if (!phoneRegex.test(self.user.uDphone)) {
            alert("연락처 형식에 맞추어 작성하세요.\n ex) 01012345678 11글자 ");
            return;
        }
          
             var nparmap = self.user;               
              $.ajax({
                 url : "/mypag/editAddr.dox",
                 dataType:"json",   
                 type : "POST", 
                 data : nparmap,
                 success : function(data) { 
                    alert("주소 수정 완료!");
                    location.href="infoAddr.do"
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
        editAddr : function(){
            var self = this;
            $.pageChange("infoAddr2.do", {uId : self.uId});
        },
        fnSearchAddr : function (){
         var self = this;
          var option = "width = 500, height = 500, top = 100, left = 200, location = no"
          window.open("addr.do", "test", option);
      },
      fnResult : function(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
          var self = this;
          self.user.uDaddr = roadAddrPart1;
          self.user.uDaddrDetail = addrDetail;
          self.user.zipNo = zipNo;
          // 콘솔 통해 각 변수 값 찍어보고 필요한거 가져다 쓰면 됩니다.
       },
       infoAddr : function(){
           var self = this;
          /*  $.pageChange("infoAddr.do", {uId : self.uId}); */
           window.history.back();
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


    },
    created: function() {
      var self = this;
      self.fnGetList();
      self.fnPoint();
      self.fnCntList();
      self.fnGetInfo();
    }
});
</script>