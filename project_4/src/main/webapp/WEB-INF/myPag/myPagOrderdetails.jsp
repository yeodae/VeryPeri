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
<!-- 페이징 추가 1 -->
<script src="https://unpkg.com/vuejs-paginate@latest"></script>
<script src="https://unpkg.com/vuejs-paginate@0.9.0"></script>
<meta charset="UTF-8">
<style type="text/css">

#ftnav{
position: absolute;
left:0%;
width:100%;
font-size:0.7em;
}


#container {
    height: 1650px;
    width: 100%;
    margin-bottom: 163px;
}

<!-- 페이징 추가 2-->
.ft{
}
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
.button11{
   background: none;
    border: none;
    padding: 0;
    font-family: inherit;
    font-size: inherit;
    color: inherit;
    cursor: pointer;
}
.headerListArea th{
   border-bottom: 1px solid #f1f1f1;
   padding-bottom : 20px;
   font-size: 14px;
   color: #98989f;
   
}
.footerListArea th{
   border-bottom: 1px solid #f1f1f1;
   height : 35px;
   padding : 4px 10px;
}
.footerListArea td{
   border-bottom: 1px solid #f1f1f1;
   height : 35px;
   padding : 20px 10px;
}
.column2{
   text-align : center;
}
.column{
   text-align : left;
}
.pagepage{

}
.calenderArea{
   margin-top: 40px;
    background-color: #fcfcfc;
    border: 1px solid #d8d9df;
    
}
.calenderArea2{
    border: 0;
    border-bottom: 1px dashed #d8d9df;
    padding: 33px 24px;
}
.calenderArea2 ul{
   padding : 0px;
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
.dateSearch{
   color: #96979e;
   font-size : 20px;
   font-weight : bolder;
}
.date22{
   margin-left : 40px;
}
.button {
     display: inline-block;
     padding: 10px 20px;
     font-size: 14px;
     text-align: center;
     color: #black;
     background-color: white;
     border-radius: 60px;
     border : 1px solid #d4d5d9;
     cursor: pointer;
     transition: background-color 0.3s;
     width : 60px;
     margin-right : 3px;
     
   }
   
   /* 버튼 호버 효과 */
   .button:hover {
     background-color: #d4d5d9;
   }
   
input[type="date"] {
    border: 1px solid #ccc;
    padding: 8px;
    border-radius: 5px;
    font-size: 14px;
    outline: none;
    transition: border-color 0.3s ease-in-out;
}

input[type="date"]:focus {
    border-color: #3498db;
}
</style>
<title>주문 내역 조회</title>
</head>
<body>

   <div id="app">
         <div id="container">
            <div id="top">
               <div id="topbody">
                  <div style="height: 150px;"></div>

                  <div class="a">
                     <div class="left topImgBoxwid">
                        <a href="/mypag/main.do"><div id="profileImg"><img :src="infouser.profile"></div></a>
                     </div>
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
                      <div class="lowerBox"> 주문 내역 조회 </div>
                      <div class="find">
                         <div class="calenderArea">            
                            <div class="calenderArea2">           
                              <span class="dateSearch"> 결제 일자 조회 </span> 
                              <span class="date22">
                                 <input id="startDate" type='date' v-model="startDate">
                                  ~ 
                                 <input id="endDate" type='date' v-model="endDate"></span>
                              <span><button class="button" @click="searchCalender"><i class="fa-solid fa-magnifying-glass"></i></button></span>
                           </div>
                              <ul>
                                 <li><i class="fa-regular fa-bell"></i>기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시 지난 주문내역을 조회하실 수 있습니다.</li>
                                 <li><i class="fa-regular fa-bell"></i>주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.</li>
                                 <li style="color: red;"><i class="fa-regular fa-bell"></i>날짜 검색 시 하루 정도 오차가 있을 수 있으니 하루 다음날로 검색해 주세요</li>
                              </ul>                           
                        </div>
                      </div>
                      
                       <div class="lowerBox">주문 상품 정보</div>
                     <div>
                        <div class="calenderArea" v-if="list == 0">
                           <ul>
                              <li><i class="fa-regular fa-face-smile"></i> 주문내역이 존재하지 않습니다.</li>
                              <li><i class="fa-regular fa-face-smile"></i> 주문 후 확인이 가능합니다.</li>
                           </ul>                                    
                        </div>
                        <table v-else class="table">
                              <tr class="headerListArea">
                                 <th class="column-width1">주문번호</th>
                                 <th class="column-width2">주문일자</th>
                                 <th class="column-width3">상품정보</th>
                                 <th class="column-width4">결제금액</th>
                                 <th class="column-width5">주문상태</th>
                              </tr>
                              
                              <tr class="footerListArea" v-for="item in list">                                                               
                                 <td class="column2"><button class="button11" @click="orderDetail(item)">{{item.oNo}}</button></td>
                                 <td class="column">{{item.oDate}}</td>
                                 <td v-if="item.cnt >= 2"><button class="button11" @click="productDetail(item)">{{ item.pName }}외 {{ parseInt(item.cnt) - 1 }}건</button></td>
                                 <td v-else><button class="button11" @click="productDetail(item)">{{ item.pName }}</button></td>
                                 <td class="column-width5">{{ Number(item.paymentSum).toLocaleString('ko-KR', {style: 'currency', currency: 'KRW'}) }}</td>
                                 <td class="column2">{{item.dState}}</td>                                                      
                              <tr>
                              
                              <!-- 페이징 추가 3 -->
         <template class="pagepage">
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
                        </table> 
                     </div>  
                         <nav id="ftnav">
         <div id="ft"><%@ include file="../page/footer.jsp" %></div>
      </nav>     
                  </div>
                  
               </div>
                  
            </div>
            
         </div>       
      </div>
 
    
</body>
</html>
<script type="text/javascript">
<!-- 페이징 추가 4 -->
Vue.component('paginate', VuejsPaginate)
   var app = new Vue({
      el : '#app',
      data : {
         info : [],
         orderCntList : [],
         uId : "${sessionId}",
         order : 0,
         exchange : "",
         refund : "",
         list : [],
         price : [],
         dat : "",
         <!-- 페이징 추가 5 -->
         selectPage: 1,
         pageCount: 1,
         cnt : 0,
         startDate: '', 
         endDate: '',
         maxpoint : undefined,
          infouser : [], 
   
      }, 
      methods : {
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
         fnGetList : function() {
            var self = this;
            <!-- 페이징 추가 6 -->
            var startNum = ((self.selectPage-1) * 10);
             var lastNum = 10;
            var param = {uId:self.uId, startNum : startNum, lastNum : lastNum};
            $.ajax({
                   url : "/meme/list.dox",
                   dataType:"json",   
                   type : "POST",
                   data : param,
                   success : function(data) { 
                      self.list = data.list;
                      self.cnt = data.cnt;
                      self.fnOrderList();
                      self.pageCount = Math.ceil(self.cnt / 10);
                   }
               }); 
         },         
         fnSearch : function(pageNum){
            var self = this;
            self.selectPage = pageNum;
            var startNum = ((pageNum-1) * 10);
            var lastNum = 10;
            var nparmap = {uId:self.uId,startNum : startNum, lastNum : lastNum};
            $.ajax({
               url : "/meme/list.dox",
               dataType : "json",
               type : "POST",
               data : nparmap,
               success : function(data) {
                  self.list = data.list;
                  self.cnt = data.cnt;

                  self.fnOrderList();
                  self.pageCount = Math.ceil(self.cnt / 10);
               }
            });
         },
         fnOrderList : function() { // 사용자 구매 내역 
            var self = this;
            var nparmap = {uId : self.uId};            
            $.ajax({
               url : "/mypag/Orderp.dox",
               dataType : "json",
               type : "POST",
               data : nparmap,
               success : function(data) {                  
                  self.list = data.list;
                  console.log(self.list);
               }
            });
         },
         searchCalender : function(){
            var self = this;
            console.log(self.startDate);
            console.log(self.endDate);
            if(self.startDate > self.endDate){
               alert("조회날짜를 다시 확인해주세요.");
               return;
            }
            if(self.startDate == ""){
               alert("조회날짜를 체크해주세요.");
               return;
            }
            if(self.endDate == ""){
               alert("조회날짜를 체크해주세요.");
               return;
            }
            var nparmap = {uId : self.uId, startDate : self.startDate, endDate : self.endDate};            
             $.ajax({
               url : "/mypag/searchOrderCalender.dox",
               dataType : "json",
               type : "POST",
               data : nparmap,
               success : function(data) {                  
                  self.list = data.list;
                  if(self.list == 0){
                     alert("해당 날짜에 주문내역이 없습니다.");
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
         productDetail : function(item){
            var self = this;
            $.pageChange("/product/productView.do", {pNo : item.pNo});
         },
         orderDetail : function(item){
            var self = this;
            $.pageChange("/myPag/OrderListView.do", {oNo : item.oNo});
         }
      },
      created : function() {
         var self = this;
         self.fnGetList();         
         self.fnGetInfo();
       self.fnPoint();
       self.fnCntList();
      }
   });
</script>