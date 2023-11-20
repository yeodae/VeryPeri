<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
<title>고객 상세보기</title>
<style>
	 @font-face {
	       font-family: "a타이틀고딕1";
	        src: url("../../../font/a타이틀고딕1.ttf") format("truetype");
	    }
	    
	    *{
	       font-family: a타이틀고딕1;
	       }
        body{
               background-color: #decfdf;
           }
        #app{
               width: 1200px;
               margin: 0px auto;
           }
       table{
           border : 1px solid black;
           border-collapse: collapse;
           text-align : center;
           background-color: #eae2eb;
       }
       th, td {
           border : 1px solid black;
           padding : 5px 10px;
       }
   </style>
</head>
<body>
<div id="app">
	<div>
	<h2>고객 정보</h2>

	<table>
		<tr>
			<th>아이디</th>
			<th>비밀번호초기화</th>
			<th>비밀번호오류횟수</th>
			<th>이름</th>
			<th>닉네임</th>
			<th>전화번호</th>
			<th>이메일</th>

		</tr>
		<tr>
			<td>{{info.uId}}</td>
			<td><button @click="fnPwReset">비밀번호 초기화</button></td>
			<td v-if="info.uCnt >= 5"><button @click="fnCntReset">오류초기화</button></td>
			<td v-else></td>
			<td>{{info.uName}}</td>
			<td>{{info.uName2}}</td>
			<td>{{info.uPhone}}</td>
			<td>{{info.uEmail}}</td>

		</tr>
	</table>
	</div>
	
	<div>
	<h2>정지</h2>
	<div v-if="info.bYn =='Y'">
	<table>
	<tr>
		<th>정지사유</th>
		<th>정지날짜</th>
	</tr>
	<tr>
		<td>{{info.bReasons}}</td>
		<td>{{info.bDate}}</td>
	</tr>
	</table>
	<button @click="fnUserBanDel">정지 해제</button>
	</div>
	<div v-else><button @click="fnUserBan">정지</button></div>
	</div>
	
	<div>
	<h2>포인트</h2>
	<div>고객 잔여 포인트 : {{info.uPoint}}</div>
	<div><button @click="fnPointAdd">추가</button></div>
	</div>
	
	<div>
	<h2>1:1문의 확인</h2>
  <template v-if="inquiry.length > 0 && inquiry[0].hasOwnProperty('iQtitle')">
    <table>
      <tr>
        <th>문의번호</th>
        <th>문의제목</th>
        <th>문의날짜</th>
        <th>상태</th>
      </tr>
      <tr v-for="(item, index) in inquiry">
        <td>{{item.iNo}}</td>
        <td><a href="javascript:;" @click="fnInquiryInfo(item)">{{item.iQtitle}}</a></td>
        <td>{{item.iQtime}}</td>
        <td v-if="item.state == 'PENDING'" :style="{'color': 'blue'}">{{item.state}}</td>
        <td v-else-if="item.state == 'OPEN'" :style="{'color': 'red'}">{{item.state}}</td>
        <td v-else :style="{'color': 'black'}">{{item.state}}</td>
      </tr>
    </table>
  </template>
  <div v-else>문의 내역이 없습니다.</div>
	</div>
	
	<div>
	<h2>주문내역 확인</h2>
	<template v-if="order.length > 0 && order[0].hasOwnProperty('oNo')">
    <table>
      <tr>
        <th>주문번호</th>
        <th>상품명</th>
        <th>상품코드</th>
        <th>구매갯수</th>
        <th>주문날짜</th>
        <th>가격</th>
        <th>결제금액</th>
      </tr>
      <tr v-for="(item, index) in order">
        <td>{{item.oNo}}</td>
        <td>{{item.pName}}</td>
        <td>{{item.pNo}}</td>
        <td>{{item.oCount}}</td>
        <td>{{item.oDate}}</td>
        <td>{{ Number(item.price).toLocaleString('ko-KR', {style: 'currency', currency: 'KRW'}) }}</td>
        <td>{{ Number(item.price * item.oCount).toLocaleString('ko-KR', {style: 'currency', currency: 'KRW'}) }}</td>
      </tr>
    </table>
  </template>
  <div v-else>주문 내역이 없습니다.</div>
	</div>
	
	<div>
	<h2>이벤트 응모 내역 확인</h2>
	  <template v-if="apply.length > 0 && apply[0].hasOwnProperty('evtNo')">
    <table>
      <tr>
        <th>이벤트코드</th>
        <th>이벤트명</th>
        <th>당첨여부</th>
      </tr>
      <tr v-for="(item, index) in apply">
        <td>{{item.evtNo}}</td>
        <td>{{item.evtName}}</td>
        <td>{{item.ePrize}}</td>
      </tr>
    </table>
  </template>
  <div v-else>이벤트 내역이 없습니다.</div>
	</div>
	
	<div>
	<h2>배송 정보 확인</h2>
	<template v-if="delivery.length > 0 && delivery[0].hasOwnProperty('duNo')">
    <table>
      <tr>
        <th>이름</th>
        <th>우편번호</th>
        <th>주소</th>
        <th>상세주소</th>
        <th>연락처</th>
        <th>배송메세지</th>
      </tr>
      <tr v-for="(item, index) in delivery">
        <td>{{item.uDname}}</td>
        <td>{{item.zipNo}}</td>
        <td>{{item.uDaddr}}</td>
        <td>{{item.uDaddrDetail}}</td>
        <td>{{item.uDphone}}</td>
        <td>{{item.uDmessage}}</td>
      </tr>
    </table>
  </template>
  <div v-else>등록된 배송 주소가 없습니다.</div>
	</div>
	
</div>
</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		info : {},
		apply : [],
		delivery : [],
		inquiry : [],
		order : [],
		uId : "${map.uId}",
		uResetPw : ""
	},// data
	methods : {
		fnGetList : function(){
            var self = this;
            var nparmap = {uId : self.uId};
            $.ajax({
                url : "/user2/view.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.info = data.Info;
                	self.apply = data.Apply;
                	self.delivery = data.Delivery;
                	self.inquiry = data.Inquiry;
                	self.order = data.Order;
                }
            }); 
        },
        fnCntReset : function(){
            var self = this;
            var nparmap = {uId : self.uId};
            $.ajax({
                url : "/user2/cntReset.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("초기화되었습니다.");
                	self.fnGetList();
                }
            }); 
        },
        fnPwReset : function(){
            var self = this;
            var nparmap = {uId : self.uId , uResetPw : self.info.uPhone};
            if(!confirm("정말 변경하시겠습니까?")){
                return;
            }
            $.ajax({
                url : "/user2/userPwReset.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("전화번호 끝 4자리로 변경되었습니다.");
                	self.fnGetList();
                }
            }); 
        },
        fnPointAdd: function(){
            var self = this;
            var pointAdd = prompt("얼마를 추가할까요? 차감시에는 - 붙이기");
            if(pointAdd == undefined || pointAdd == null){
            	return;
            }
            var nparmap = {uId : self.uId , pointAdd};
            $.ajax({
                url : "/user2/pointAdd.dox",
                dataType : "json", 
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                    alert("포인트가 추가되었습니다.");
                    self.fnGetList();
                }
            }); 
        },
        fnUserBan : function(){
            var self = this;
            var bReasons = prompt("정지 사유를 입력해주세요!");
            if(bReasons == undefined || bReasons == null){
            	return;
            }
            var nparmap = {uId : self.uId , bReasons};
            $.ajax({
                url : "/user2/userBan.dox",
                dataType : "json", 
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                    alert("정지되었습니다.");
                    self.fnGetList();
                }
            }); 
        },
        fnUserBanDel : function(){
            var self = this;
            if(!confirm("정지를 해제하겠습니까?")){
                return;
            }
            var nparmap = {uId : self.uId};
            $.ajax({
                url : "/user2/userBanDel.dox",
                dataType : "json", 
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                    alert("해제되었습니다.");
                    self.fnGetList();
                }
            }); 
        },
        fnInquiryInfo: function(item){
        	  var self = this;
        	  window.open("../inquiry/view.do?iNo=" + item.iNo, "inquiryView", "width=800, height=800, left=100, top=50, resizable=yes, scrollbars=yes");
        	}

	}, // methods
	created : function() {
		var self = this;
		self.fnGetList();
	}// created
});
</script>