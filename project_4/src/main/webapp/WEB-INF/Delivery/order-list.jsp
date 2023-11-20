<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://unpkg.com/vuejs-paginate@latest"></script>
<script src="https://unpkg.com/vuejs-paginate@0.9.0"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
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
               width: 80%;
               margin: 0px auto;
               text-align: center;
               float: left;
               margin-left: 20px;

           }
       .mainBox{
     		   width : 1200px;
     		   height : 550px;
               text-align: center;
        	   margin-left: 50px;
           }
       table{
           border : 1px solid black;
           border-collapse: collapse;
           text-align : center;
           background-color: #eae2eb;
           margin: 0 auto;
       }
       th, td {
           border : 1px solid black;
           padding : 5px 10px;
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
           background: #e2d6e4;
       }
       .page-item a {
           color:#666;
           text-decoration: none;
       }
       .pagination li.active {
           background-color : #bb76c4;
           color:white;
       }
       .pagination li.active a {
           color:#fff;
       }
       .mainPos1 > button{
        margin-top: 10px;
        margin-bottom: 10px;
        margin-left: 20px;
       }
       hr{
        	width: 1000px;
        }
        .mainPos2{
        	color: white;
        }
 </style>
</head>
<body>
<%@ include file="../Staff/staff-header.jsp" %>
<%@ include file="../Staff/staff-left.jsp" %>
<div id="app">
	<div class="mainBox">
	
	<div class="mainPos2">주문 관리</div>
<hr>	
    <table>
    <thead>
      <tr>
        <th>주문번호</th>
        <th>상품명</th>
        <th>상품코드</th>
        <th>현재상태</th>
      </tr>
    </thead>
    <tbody>
      <tr v-for="(order, oIndex) in orders" :key="oIndex">
        <template v-if="oIndex === 0 || orderNo(order) !== orderNo(orders[oIndex - 1])">
          <td :rowspan="rowSpan(order, orders)">{{ order.oNo }}</td>
          <td>{{ order.pName }}</td>
          <td>{{ order.pNo }}</td>
          <td>
            <select v-model="order.dState" @change="fnUpdateState(order, oIndex)">
              <option value="업체확인중">업체확인중</option>
              <option value="상품 준비중">상품 준비중</option>
              <option value="업체 사유로 거절">업체 사유로 거절</option>
              <option value="고객 사유로 거절">고객 사유로 거절</option>
              <option value="배송사 사유로 거절">배송사 사유로 거절</option>
            </select>
          </td>
        </template>
        <template v-else>
          <td>{{ order.pName }}</td>
          <td>{{ order.pNo }}</td>
          <td>
            <select v-model="order.dState" @change="fnUpdateState(order, oIndex)">
              <option value="업체확인중">업체확인중</option>
              <option value="상품 준비중">상품 준비중</option>
              <option value="업체 사유로 거절">업체 사유로 거절</option>
              <option value="고객 사유로 거절">고객 사유로 거절</option>
              <option value="배송사 사유로 거절">배송사 사유로 거절</option>
            </select>
          </td>
        </template>
      </tr>
    </tbody>
  </table>
	
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
	
</div>
</body>
</html>
<script>
Vue.component('paginate', VuejsPaginate)
var app = new Vue({
  el : '#app',
  data : {
    list : [],
    selectPage: 1,
    pageCount: 1,
    cnt : 0,
    orders: []
  },// data
  methods : {
    fnGetList : function(){
      var self = this;
      var startNum = ((self.selectPage-1) * 10);
      var lastNum = 10;
      var nparmap = {startNum : startNum, lastNum : lastNum};
      $.ajax({
        url : "/order/list.dox",
        dataType:"json",
        type : "POST", 
        data : nparmap,
        success : function(data) { 
          self.orders = data.list;
          self.cnt = data.cnt;
          self.orders.sort((a, b) => a.oNo - b.oNo);
          self.pageCount = Math.ceil(self.cnt / 10);
          console.log(data);
        }
      }); 
    },
    fnSearch : function(pageNum){
      var self = this;
      self.selectPage = pageNum;
      var startNum = ((pageNum-1) * 10);
      var lastNum = 10;
      var nparmap = {startNum : startNum, lastNum : lastNum};
      $.ajax({
        url : "/order/list.dox",
        dataType : "json",
        type : "POST",
        data : nparmap,
        success : function(data) {
          self.orders = data.list;
          self.cnt = data.cnt;
          self.pageCount = Math.ceil(self.cnt / 10);
        }
      });
    },
    fnUpdateState : function(item, index) {
      var self = this;
      var exchangeVal = '';
    	if (item.dState.includes('거절')) {
    	    exchangeVal = 'R';
    	}
      $.ajax({
        url: "/order/updateOrderInfo.dox",
        dataType: "json",
        type: "POST",
        data: {
          exchange: exchangeVal,
          buyNo: item.buyNo,
          dState: item.dState
        },
        success: function(data) {
          alert("주문 상태가 업데이트 되었습니다.");
          self.fnGetList();
        }
      }); 
    },
    rowSpan(item, list) {
      const orderNo = this.orderNo(item);
      const sameOrders = list.filter(v => this.orderNo(v) === orderNo);

      return sameOrders.length;
    },
    orderNo(item) {
      return item.oNo;
    }
  }, // methods
  created : function() {
    var self = this;
    self.fnGetList();
  }// created
});

</script>