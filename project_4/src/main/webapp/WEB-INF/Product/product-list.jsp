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
        .mainInput {
        	margin-bottom: 10px;
        }
        .productListButtonPos{
        	position: absolute;
        	left: 1300px;
        }
 </style>
</head>
<body>
<%@ include file="../Staff/staff-header.jsp" %>
<%@ include file="../Staff/staff-left.jsp" %>

<div id="app">
	<div class="mainBox">



	<div class="mainPos2">상품 관리</div>
	<hr>
	<div class="productListButtonPos">
		<button @click="fnProductAdd">상품 추가</button>
		<button @click="fnProductDelete">상품 삭제</button>
	</div>
	<div class="mainInput">

		<select v-model="artist" @change="fnArtistSearch">
		  <option value="All">전체</option>
		  <option value="BTS">방탄소년단</option>
		  <option value="TXT">투모로우바이투게더</option>
		  <option value="EHP">엔하이픈</option>
		  <option value="SVT">세븐틴</option>
		  <option value="FMN">프로미스나인</option>
		  <option value="LSF">르세라핌</option>
		  <option value="NJS">뉴진스</option>
		  <option value="BND">보이넥스트도어</option>
		  <option value="ZIC">지코</option>
		</select>
		<input type="text" v-model="keyword" @keyup.enter="fnProduckSearch"> 
	    <button @click="fnProduckSearch">검색</button>
	</div>
    <table>
		<tr>
			<th></th>
			<th>아티스트</th>
			<th>상품코드</th>
			<th>이름</th>
			<th>가격</th>
			<th>재고</th>
			<th>재고조정</th>
			<th>멤버십</th>
			<th>판매일</th>
			<th>종류</th>
		</tr>

		<tr v-for="(item, index) in list">
			<td><input type="radio" name="product" :value="item.pNo" v-model="pNo"></td>
			<td>{{item.artist}}</td>
			<td><a href="javascript:;" @click="fnProductPage(item)">{{item.pNo}}</a></td>
			<td>{{item.pName}}</td>
			<td>{{Number(item.price).toLocaleString('ko-KR', {style: 'currency', currency: 'KRW'})}}</td>
			<td>{{item.stock}}</td>
			<td><button @click="fnStockPopup(item)">재고</button></td>
			<td>{{item.membership}}</td>
			<td>{{item.pDate}}</td>
			<td>{{item.category}}</td>
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
		selectItem : "",
		pNo : "",
		selectPage: 1,
		pageCount: 1,
		cnt : 0,
		artist: "",
		keyword : "",
		pNo : ""
	},// data
	methods : {
		fnGetList : function(){
            var self = this;
            var startNum = ((self.selectPage-1) * 10);
    		var lastNum = 10;
            var nparmap = {startNum : startNum, lastNum : lastNum};
            $.ajax({
                url : "/product/list.dox",
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
        fnProductAdd : function(){
        	var self = this;
      		window.open("../product/add.do", "addPopup", "width=700,height=500,left=500,top=100");
        },
        fnBack : function(){
        	location.href = '../staff/main.do';
        },
        fnProductPage : function(item){
        	  var url = "../product/productView.do?pNo=" + item.pNo;
        	  window.open(url, "_blank", "width=1300, height=600, left=250, top=200");
        },
        fnStockPopup : function(item) {
        	  var self = this;
        	  window.open("../product/stockpopup.do?pNo=" + item.pNo, "stockPopup", "width=700,height=500,left=500,top=100");
        	},
        fnProductDelete : function() {
        	var self = this;
            var nparmap = {pNo : self.pNo};
            if (self.pNo == "") {
                alert("삭제할 상품을 선택해주세요.");
                return;
            }
            if(!confirm("정말 삭제하시겠습니까?")){
                return;
            }
            $.ajax({
                url : "/product/delete.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("삭제되었습니다.");
                	self.fnGetList();
                }
            }); 
        }, fnSearch : function(pageNum){
			var self = this;
			self.selectPage = pageNum;
			var startNum = ((pageNum-1) * 10);
			var lastNum = 10;
			var nparmap = {startNum : startNum, lastNum : lastNum};
			$.ajax({
				url : "/product/list.dox",
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
		 fnArtistSearch : function() {
		    var self = this;
		    var startNum = 0;
		    var lastNum = 10;
		    var nparmap = {startNum: startNum, lastNum: lastNum, artist: self.artist};
		    $.ajax({
		      url: "/product/search.dox",
		      dataType: "json",   
		      type: "POST", 
		      data: nparmap,
		      success: function (data) {
		        self.list = data.list;
		        self.cnt = data.cnt;
		        self.pageCount = Math.ceil(self.cnt / 10);
		      },
		    });
		  },
		  fnProduckSearch : function() {
			    var self = this;
			    var startNum = 0;
			    var lastNum = 10;
			    var nparmap = {startNum: startNum, lastNum: lastNum, keyword : self.keyword};
			    $.ajax({
			      url: "/product/search2.dox",
			      dataType: "json",   
			      type: "POST", 
			      data: nparmap,
			      success: function (data) {
			        self.list = data.list;
			        self.cnt = data.cnt;
			        self.pageCount = Math.ceil(self.cnt / 10);
			      },
			    });
			  }
	}, // methods
	created : function() {
		var self = this;
		self.fnGetList();
	}// created
});
</script>