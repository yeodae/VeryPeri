<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>    
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
  <!-- 페이징 추가 1 -->
<script src="https://unpkg.com/vuejs-paginate@latest"></script>
<script src="https://unpkg.com/vuejs-paginate@0.9.0"></script>
 <meta charset="UTF-8">
  <title>공지사항</title>
  <style>
      @font-face {
       font-family: "a타이틀고딕1";
        src: url("../../../font/a타이틀고딕1.ttf") format("truetype");
    }
    
    *{
       font-family: a타이틀고딕1;
    }
  body{
  	background-color: #F1E9F0;
  }
  #app{
  	width: 600px;
  	height: 800px;  	
  }
  #wc, table{
  	margin: 0px auto;
  	text-align: center;  
  	width: 500px;
  }

  .acb{
  padding : 20px;
   font-size : 20px;
   text-align : left;
  	margin: 0px auto;
  	width: 800px;
  	border-bottom: 1px solid #eee;
  	display: flex;

  }
  #contaienr{
  	width: 100%;
  	height: 800px;
  	display: flex;
  	flex-direction: column;
  }
 
  	#notice{
  	font-weight : bold;
  	font-size : 4rem;
  	margin-top : 150px;
	text-align: center;
	margin-bottom: 65px;
				
  	}
  <!-- 페이징 추가 2-->
	.pagination {
        margin:24px;
        display: inline-flex;
        
    }
    .pagination li {
    	   position : relative;
    	   left : 150px;
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
	.date{
		text-align: right;
	}
	.column-width-5{
	  width: 10%; /* 첫 번째 열의 너비 20% */
	}
	.column-width-60 {
    width: 60%; /* 두 번째 열의 너비 20% */
	}
	
	.column-width-25{
	    width: 25%; /* 세 번째 열의 너비 50% */
	}
	
	.column-width-10 {
	    width: 10%; /* 네 번째 열의 너비 10% */
	    text-align: center;
	}
	.notice{
	background-color : #E6CDFF;
	padding : 20px;
   font-size : 2rem;
   text-align : left;
  	margin: 0px auto;
  	width: 800px;
  	border-bottom: 1px solid #fff;
  	display: flex;
	}
	hr{
		width: 800px;
	}
	a{
		text-decoration: none;
		color: black;
	}
	a:hover {
		color: #ccc;
	}
  </style>
</head>
<body>
<div id="app">
<div id="container">
    <div id="wc">
    	<div id="notice">Notice</div>
    	<hr>
    	<table>
    		<tr class="acb" v-for="item in list">
    			<td class="column-width-5">{{item.aNo}}. </td>
    			<td class="column-width-60"><a href="#" @click="noticeView(item)"><span style="font-size : 20px">{{item.aTitle}}</span></a></td>
    			<td class="column-width-25">{{formatWithoutTime(item.aDate)}}</td>
    			<td class="column-width-10" style="font-size: 15px; color: #ccc;">{{item.hits}}</td>
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
</div>
</body>
</html>
<script type="text/javascript">
<!-- 페이징 추가 4 -->
Vue.component('paginate', VuejsPaginate)
var app = new Vue({
    el: '#app',
    data: {
       list : [],
       uId : "${sessionId}",
       <!-- 페이징 추가 5 -->
		selectPage: 1,
		pageCount: 1,
		cnt : 0
    },
    methods: {
    	formatWithoutTime(dateString) {
    	      const date = new Date(dateString);
    	      const formattedDate = new Date(
    	        date.getFullYear(),
    	        date.getMonth(),
    	        date.getDate()
    	      );
    	      return formattedDate.toISOString().split('T')[0];
    	},
       fnGetList : function(){
            var self = this;<!-- 페이징 추가 6 -->
			var startNum = ((self.selectPage-1) * 10);
    		var lastNum = 10;
			var param = {startNum : startNum, lastNum : lastNum};
            $.ajax({
                url : "/aboard/list3.dox",
                dataType:"json",   
                type : "POST", 
                data : param,
                success : function(data) { 
                   self.list = data.list; //사용자      
                   self.cnt = data.cnt;
	               self.pageCount = Math.ceil(self.cnt / 10);
                
                 
                }
            }); 
        },
        <!-- 페이징 추가 7-->
		fnSearch : function(pageNum){
			var self = this;
			self.selectPage = pageNum;
			var startNum = ((pageNum-1) * 10);
			var lastNum = 10;
			var nparmap = {startNum : startNum, lastNum : lastNum};
			$.ajax({
				url : "/aboard/list3.dox",
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
        noticeView : function(item){
        	 var self = this;
             $.pageChange("noticeView.do", {aNo : item.aNo});
         }
    },
    created: function() {
      var self = this;
      self.fnGetList();
      
    }
});
</script>