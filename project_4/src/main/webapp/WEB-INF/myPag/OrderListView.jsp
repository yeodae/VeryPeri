<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>주문 상세 내역</title>
<%@ include file="mypageheader.jsp" %>
<script src="../js/jquery.js"></script>
<link href="../css/footer.css" rel="stylesheet" type="text/css">
<link href="../css/mypag.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
   integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
   crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
<meta charset="UTF-8">
<!-- 페이징 추가 1 -->
<script src="https://unpkg.com/vuejs-paginate@latest"></script>
<script src="https://unpkg.com/vuejs-paginate@0.9.0"></script>

<style type="text/css">

    @font-face {
       font-family: "a타이틀고딕1";
        src: url("../../../font/a타이틀고딕1.ttf") format("truetype");
    }
    
    *{
       font-family: a타이틀고딕1;
    }
.orderArea{
   font-size : 15px;
}
.DateNoList{
   border-bottom : 2px solid black;
   margin : 20px 0px;
   padding-bottom : 20px;
}
.DateNoList span{
   margin-left : 50px;
}
.imgOrderBox{
   width : 100px;
   height : 120px;
   float:left;
}
.fontCCC{
   color : #777777;
   font-size : 14px;
   font-weight : 400;
   line-height: 22px;
}
.orderInfo{
   display: table-cell;
    padding-left: 10px;
    vertical-align: middle;
    float:left;
    text-align : left;
}
.noticeArea{   
    color : #777777;
   font-size : 14px;
   font-weight : bold;
   margin-bottom : 60px;
}
.noticeArea li{
   margin : 5px 0px;
}
.noticeArea li:before {
  content: ""; 
  margin-right: 8px; 
}
.ordertbody:hover {
      background-color:#f8f8f8;
  }
 .addrArea h6{
    width : 625px;
    margin : 20px 0px;
 }
.bottomBorder{
   border-bottom : 1px solid black;
}
.addrInfouser{
   text-align: left;
}
.addrInfouser th{
   border-bottom: 1px solid #f1f1f1;
   width : 30%;
   height : 35px;
   padding : 4px 10px;
}
.addrInfouser td{
   width : 70%;
   border-bottom: 1px solid #f1f1f1;
   height : 35px;
   padding : 4px 10px;
   text-align : left;
}
.headerListArea th{
   border-bottom: 1px solid #f1f1f1;
}
.finishList{
   height:100px;
}
.button {
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
	  width : 80px;
	  margin-right : 3px;	  
	}
	
	/* 버튼 호버 효과 */
	.button:hover {
	  background-color: #d4d5d9;
	}
	

	.button:active {
	  background-color: #1f618d;
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
                        <a href="/mypag/main.do"><div id="profileImg"><img :src="info.profile"></div></a>
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
                      <div class="lowerBox"> 주문 상세 내역 </div>
                      <div class="orderArea">
                         <div>
                            <div class="DateNoList">주문번호 <strong>{{oNo}}</strong> <span>주문일자 <strong>{{oDate}}</strong></span></div>
                         </div>
                         <table>
                            <tr class="headerListArea">
                               <th>상품정보</th>
                               <th>적립금</th>                               
                               <th>주문금액</th>
                               <th>배송 정보</th>
                               <th>주문 상태</th>
                            </tr>
                            <div class="thArea"></div>
                            <tbody class="ordertbody">
                               <tr v-for="item in list">
                                  <td>
                                     <div>
                                        <a href="#" @click="productDetail(item)"><img class="imgOrderBox" :src="item.path">
                                        <ul class="orderInfo">
                                           <li>{{item.artist}} <span class="fontCCC">{{item.pNo}}</span></li>
                                           <li><strong>{{item.pName}}</strong></li>
                                           <li class="fontCCC">수량 : {{item.oCount}}</li>
                                        </ul>                                     
                                        </a>
                                     </div>      
                                  </td>
                                  <td>{{item.price*0.02}} P</td>                               
                                  <td>{{ Number(item.price).toLocaleString('ko-KR', {style: 'currency', currency: 'KRW'}) }}
                                     <div class="fontCCC">{{item.oCount}}개</div>
                                  </td>
                                  <td>
                                     <div>{{item.artist}}</div>
                                     <div>업체 배송</div>
                                     <div>평균출고일:1.1일</div>
                                  </td>
                                  <td v-if='item.dState == "업체확인중" ||item.dState == "상품준비중" '><div>{{item.dState}}</div><button class="button" @click="fnOrderCancel(item)">취소</button></td>
                                 <td v-else-if='item.dState == "배송완료"'><div>{{item.dState}}</div><button class="button" @click="fnOrderchange(item)">교환/반품</button><button class="button" @click="fnOrderConfirm(item)">구매 확정</button></td>                                 
                                 <td v-else>{{item.dState}}</td>
                               </tr>
                            </tbody>
                         </table>   
                         
                         <ul class="noticeArea">
                            <li>동일한 주문번호라도 2개 이상의 브랜드에서 주문하신 경우 출고지 주소가 달라 각각 출고됩니다. (택배 박스를 2개 이상 수령 가능)</li>
                            <li>출고 완료 직후 교환 / 환불 요청을 하더라도 상품을 수령하신 후 택배 업체를 통해 보내주셔야 처리 가능합니다.</li>
                            <li>별도의 구매 결정이 없더라도 상품 배송 완료 후 7일이 지난 경우에는 자동 구매확정, 적립금이 자동 지급됩니다.</li>
                            <li>자세한 내용은 <a href="/mypag/faq.do" style="color:#0078ff; font-weight:bold;">FAQ</a>를 확인하여 주시기 바랍니다.</li>
                         </ul>                                      
                      </div>
                      
                      <div class="addrArea">
                         <div class="bottomBorder">
                            <h6>배송지 정보</h6>
                         </div>
                            <table class="addrInfouser">
                              <colgroup>
                                 <col style="width:190px">
                                 <col style="width:*">
                              </colgroup>
                           <tbody>
                           <tr>
                              <th scope="row">이름</th>
                              <td>{{list2.uName}}</td>
                           </tr>
                           <tr>
                              <th scope="row">연락처</th>
                              <td>{{list2.uPhone}} / {{list2.uDphone}}</td>
                           </tr>
                                             <tr>
                              <th scope="row">배송지 주소</th>
                              <td>({{list2.zipNo}}) &nbsp; {{list2.uDaddr}}  {{list2.uDaddrDetail}}</td>
                           </tr>
                           <tr>
                              <th scope="row">배송 메시지</th>
                              <td>{{list2.uDmessage}}</td>
                           </tr>
                           </tbody>
                        </table>
                        
                        <ul class="noticeArea">
                            <li>발송전 일때만 배송지 주소를 변경하실 수 있습니다.(미입금/입금확인/출고요청 단계까지만가능)</li>                            
                         </ul>         
                      </div>
                      
                      
                      <div class="paydaypayday">
                         <div class="bottomBorder">
                            <h6>최종 결제 정보</h6>
                         </div>
                            <table class="addrInfouser">
                              <colgroup>
                                 <col style="width:190px">
                                 <col style="width:*">
                              </colgroup>
                           <tbody>
                           <tr>
                              <th scope="row">상품 합계</th>
                              <td>{{calcPrice}}원</td>
                           </tr>
                           <tr>
                              <th scope="row">배송비</th>
                              <td v-if="calcPrice < 50000">배송비 3,000원</td>
                              <td v-else style="color:#14aaff;">배송비 무료</td>
                           </tr>
                           <tr>
                              <th scope="row">결제 수수료</th>
                              <td>0원</td>
                           </tr>
                           <tr>
                              <th scope="row" style="font-weight:bold;">최종 결제 금액</th>
                              <td v-if="parseFloat(calcPrice.replace(/,/g, ''))>=50000" style="font-weight:600; font-size:20px;">{{calcPrice}}원
                                 <div style="font-size:12px;">예상 적립금 {{parseFloat(calcPrice.replace(/,/g, ''))*0.02}}P</div>
                              </td>
                              <td v-else style="font-weight:600; font-size:20px;">{{calcPrice}}원
                                 <div style="font-size:12px;">예상 적립금 {{calcPrice*0.02}}P</div>
                              </td>
                           </tr>
                           <tr>
                              <th scope="row">결제 수단</th>
                              <td style="font-size:14px; font-weight:bolder;">카카오페이 + 적립금</td>
                           </tr>
                           </tbody>
                        </table>
                        
                        <ul class="noticeArea">
                            <li>카드결제시 현금영수증/세금계산서 발급이 불가능하며 카드전표로 대체하실 수 있습니다.</li>                            
                            <li>PG사 또는 카드사에서 제공하는 즉시 할인은 최종 결제 금액에 반영되지 않습니다. (ex. 카카오페이 즉시할인)</li>                            
                            <li>바로접속 OFF 상태일 때에는 각종 할인 혜택이 제한될 수 있습니다.</li>                            
                         </ul>         
                      </div>
                  <div class="finishList"></div>                  
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
      el : '#app',
      data : {
         info : [],
         orderCntList : [],
         uId : "${sessionId}",
         order : 0,
         exchange : "",
         refund : "",
         maxpoint : undefined,
         list : [],
         list2 : [],
         price : [],
         dat : "",
         oDate : "",
         oNo : "${map.oNo}"
         
      }, 
       computed: {
         
    	   calcPrice: function () {
    		   var total = 0;
    		   for (var i = 0; i < this.list.length; i++) {
    		     var item = this.list[i];
    		     total += item.price * item.oCount;
    		   }
    		   return total.toLocaleString();
    		 }
           },
      methods : {
    	  fnGetInfoList : function() { // 사용자 정보 불러오기 이름 , 별명 (닉네임)
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
         fnGetList : function() { 
            var self = this;
            var nparmap = {oNo : self.oNo, uId : self.uId};            
            $.ajax({
               url : "/mypag/OrderListView.dox",
               dataType : "json",
               type : "POST",
               data : nparmap,
               success : function(data) {   
                  self.list = data.list;
                  self.list2 = data.list[0];
                  self.oDate = self.list[0].oDate;
                  
               }
            });
         },
         productDetail : function(item){
            var self = this;
            $.pageChange("/product/productView.do", {pNo : item.pNo});
         },
         fnOrderCancel  : function(item) {
            var self = this;
            if(!confirm("정말 취소하시겠습니까?")){
                   return;
               }
            var nparmap = {buyNo : item.buyNo};
            $.ajax({
               url : "/mypag/mypageOrderCancel.dox",
               dataType : "json",
               type : "POST",
               data : nparmap,
               success : function(data) {
                  alert("취소되었습니다.");
                  self.fnGetList();

               }
            });
         },
         fnOrderchange  : function(item) {
            var self = this;
            window.open("/mypag/orderExchange.do?buyNo=" + item.buyNo, "마이페이지 주문 교환/반품 팝업", "width=400, height=400 top=300, left=700");
         },
         fnOrderConfirm  : function(item)  {
            var self = this;
            if(!confirm("정말 구매확정하시겠습니까?")){
                   return;
               }
            var userPointAdd = parseInt((self.list2.price * self.list2.oCount) * 0.02);
            var nparmap = {buyNo : item.buyNo, userPointAdd : userPointAdd, uId : self.uId, oNo : self.oNo};
            $.ajax({
               url : "/mypag/mypageOrderConfirm.dox",
               dataType : "json",
               type : "POST",
               data : nparmap,
               success : function(data) {
                  alert("구매 확정 처리되었습니다.");
                  self.fnGetList();
               }
            });
         }
      },
      created : function() {
         var self = this;
         self.fnGetList();
         self.fnPoint();
         self.fnCntList();
         self.fnGetInfoList();
      }
   });
</script>