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
        .mainInput {
        	margin-bottom: 10px;
        }
 </style>
</head>
<body>
<%@ include file="../Staff/staff-header.jsp" %>
<%@ include file="../Staff/staff-left.jsp" %>
<div id="app">
	<div class="mainBox">
	
	<div class="mainPos2">문의 관리</div>
<hr>	
<div class="mainInput">
	<input type="text" placeholder="문의번호 혹은 고객 아이디" v-model="keyword"@keyup.enter="fnSearchList"><button @click="fnSearchList">검색</button>
	</div>
    <table>
		<tr>
			<th>문의번호</th>
			<th>문의제목</th>
			<th>문의날짜</th>
			<th>카테고리</th>
			<th>문의고객</th>
			<th>상태</th>
			<th>민원여부</th>
		</tr>
		<tr v-for="(item, index) in list">
			<td>{{item.iNo}}</td>
			<td><a href="javascript:;" @click="fnAnswer(item)">{{item.iQtitle}}</a></td>
			<td>{{item.iQtime}}</td>
			<td>{{item.category}}</td>
			<td>{{item.uId}}</td>
			<td v-if="item.state == 'PENDING'" :style="{'color': 'blue'}">{{item.state}}</td>
			<td v-else :style="{'color': 'red'}">{{item.state}}</td>
			<td>{{item.iComplain}}</td>
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
		keyword : ""
	},// data
	methods : {
		fnGetList : function(){
            var self = this;
            var startNum = ((self.selectPage-1) * 10);
    		var lastNum = 10;
            var nparmap = {startNum : startNum, lastNum : lastNum, keyword : self.keyword};
            $.ajax({
                url : "/inquiry/list.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.list = data.list;
                	self.cnt = data.cnt;
	                self.pageCount = Math.ceil(self.cnt / 10);
                }
            }); 
        },
        fnAnswer : function(item){
            var self = this;
       	 window.open("../inquiry/view.do?iNo=" + item.iNo, "stockPopup", "width=700,height=800,left=500,top=100");
          },
          fnBack : function(){
            	location.href = '../staff/main.do';
          },
          fnSearch : function(pageNum){
  			var self = this;
  			self.selectPage = pageNum;
  			var startNum = ((pageNum-1) * 10);
  			var lastNum = 10;
  			var nparmap = {startNum : startNum, lastNum : lastNum};
  			$.ajax({
  				url : "/inquiry/list.dox",
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
  		fnSearchList : function(){
  			var self = this;
  			var nparmap = {keyword : self.keyword};
  			$.ajax({
  				url : "/inquiry/search.dox",
  				dataType : "json",
  				type : "POST",
  				data : nparmap,
  				success : function(data) {
  					self.list = data.list2;
  					
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