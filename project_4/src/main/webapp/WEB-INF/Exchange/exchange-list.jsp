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
	
	<div class="mainPos2">교환/반품 관리</div>
<hr>	
    <table>
      <tr>
        <th>접수번호</th>
        <th>구매번호</th>
        <th>주문번호</th>
        <th>고객</th>
        <th>상태</th>
        <th>사유</th>
        <th>상품번호</th>
        <th>상품명</th>
      </tr>
      <tr v-for="item in list">
          <td>{{ item.exNo }}</td>
          <td>{{ item.buyNo }}</td>
          <td><a href="javascript:;" @click="fnProductPopup(item)">{{item.oNo}}</a></td>
          <td><a href="javascript:;" @click="fnuserInformation(item)">{{item.uId}}</a></td>
          <td>
			<select v-model="item.dState" @change="fnUpdateState(item, index)">
			    <option value="교환접수">교환접수</option>
			    <option value="교환수거중">교환수거중</option>
			    <option value="교환수거완료">교환수거완료</option>
			    <option value="교환상품배송중">교환상품배송중</option>
			    <option value="교환완료">교환완료</option>
			    <option value="교환거절">교환거절</option>
			    <option value="반품접수">반품접수</option>
			    <option value="반품수거중">반품수거중</option>
			    <option value="결제사취소중">결제사취소중</option>
			    <option value="반품완료">반품완료</option>
			    <option value="반품거절">반품거절</option>
			</select>
		  </td>
          <td>{{ item.bReasons }}</td>
          <td>{{ item.pNo }}</td>
          <td>{{ item.pName }}</td>
          </tr>
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
  },// data
  methods : {
    fnGetList : function(){
      var self = this;
      var startNum = ((self.selectPage-1) * 10);
      var lastNum = 10;
      var nparmap = {startNum : startNum, lastNum : lastNum};
      $.ajax({
        url : "/exchange/list.dox",
        dataType:"json",
        type : "POST", 
        data : nparmap,
        success : function(data) { 
          self.list = data.list;
          self.cnt = data.cnt;
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
        url : "/exchange/list.dox",
        dataType : "json",
        type : "POST",
        data : nparmap,
        success : function(data) {
          self.list = data.list;
          self.cnt = data.cnt;
          self.pageCount = Math.ceil(self.cnt / 10);
        }
      });
    },
    fnuserInformation: function(item) {
  	  var self = this;
  	  window.open("../user2/view.do?uId=" + item.uId, "popup", "width=800,height=1000,left=500,top=100");
  	},
    fnProductPopup : function(item){
   	 window.open("../delivery/view.do?oNo=" + item.oNo, "productPopup", "width=1250,height=800,left=500,top=100");
   },   
   fnUpdateState : function(item) {
	   	var self = this;
	   	$.ajax({
	   	    url: "/mypag/updateExchangeState.dox",
	   	    dataType: "json",
	   	    type: "POST",
	   	    data: {
	   	      buyNo: item.buyNo,
	   	      dState: item.dState
	   	    },
	   	    success: function(data) {
	   	      alert("주문 상태가 업데이트 되었습니다.");
	   	      self.fnGetList();
	   	    }
	   	  }); 
	   }
  }, // methods
  created : function() {
    var self = this;
    self.fnGetList();
  }// created
});

</script>