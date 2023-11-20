<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>멤버십 댓글</title>
<style>
	@font-face {
    	font-family: "a타이틀고딕2";
        src: url("../../../font/A타이틀고딕2.TTF") format("truetype");
    }
    
    *{
    	font-family: a타이틀고딕2;
    }
   body{
   	background-color:  rgb(230, 230, 255);
   	overflow: auto;
   	max-height: 300px;
   }
	
	ul{	
		width:500px;
		margin:5px auto;
		list-style:none;
		border: 1px solid black;
		background-color: white;
		padding: 10px;
	}
	.aa{
		float: right;
	}
</style>
</head>
<body>
<div id="app">
    
    <div class="container">
    
    	<!-- 게시글 최신 알람 1개 -->
        <ul v-for="item in list" v-if="item.noRead != 'Y' && flg1">
            <li @click="fnMove(item.gNo, 'a')">{{item.noMessage}}  <a href="#" class="aa"><i class="fa-solid fa-xmark" style="color: #f20707;" @click="fnAlarmRemove('a')"></i></a></li>
        </ul>
        
        <!-- 댓글 최신 알람 1개 -->
        <ul v-for="item in list2" v-if="item.cNoRead != 'Y' && flg2" >
            <li @click="fnMove(item.gNo, 'b')">{{item.cNoMessage}}  <a href="#" class="aa"><i class="fa-solid fa-xmark" style="color: #f20707;" @click="fnAlarmRemove('b')"></i></a></li>
        </ul>
      
      	<!-- 아티스트 최신 게시글 알람 1개 -->
      	<ul v-for="item in list3" v-if="item.noRead != 'Y' && flg3">
            <li @click="fnMove(item.gNo, 'a')">{{item.noMessage}}  <a href="#" class="aa"><i class="fa-solid fa-xmark" style="color: #f20707;" @click="fnAlarmRemove('c')"></i></a></li>
        </ul>
        
        <!-- 아티스트 최신 댓글 알람 1개 -->
        <ul v-for="item in list4" v-if="item.cNoRead != 'Y' && flg4">
            <li @click="fnMove(item.gNo, 'b')">{{item.cNoMessage}}  <a href="#" class="aa"><i class="fa-solid fa-xmark" style="color: #f20707;" @click="fnAlarmRemove('d')"></i></a></li>
        </ul>
        
      	<button @click="fnAlarmRemove('all')" style="float:right;">모두 삭제</button>
      </div>  
        
</div>
</body>
</html>
<script>
var app = new Vue({
    el: '#app',
    data: {
        list: [],
        list2: [],
        list3 : [],
        list4 : [],
        uId: "${sessionId}",
        artist: "${map.artist}",
        flg1 : true,
        flg2 : true,
        flg3 : true,
        flg4 : true,
    },// data
    methods: {
        fnGetList: function () {
             var self = this;
             var nparmap = {artist: self.artist, uId : self.uId };
             $.ajax({
                 url: "alramList.dox",
                 dataType: "json",
                 type: "POST",
                 data: nparmap,
                 success: function (data) {
                     self.list = data.list;
                     self.list2 = data.list2;
                     self.list3 = data.list3;
                     self.list4 = data.list4;
                 }
             });
         },fnAlarmRemove : function(check){
        	 var self = this;
        	 if(check == 'a'){
				self.flg1 = false;        		 
        	 }else if (check == 'b'){
				self.flg2 = false;        		 
        	 }else if (check == 'c'){
				self.flg3 = false;        		 
        	 }else if (check == 'd'){
				self.flg4 = false;        		 
        	 }else if (check == 'all'){
        		 self.flg1 = false;   
        		 self.flg2 = false; 
        		 self.flg3 = false;  
        		 self.flg4 = false;
        	 }
        	 
         }, fnMove : function(num, check){
        	 var self = this;
        	 var param = {}
             var width = 700;
             var height = 500;
             var left = (window.innerWidth - width) / 2;
             var top = (window.innerHeight - height) / 2;
             var option = "width=" + width + ",height=" + height + ",left=" + left + ",top=" + top;
             
		     var url = "view.do?gNo=" + num + "&artist=" + self.artist;
		     window.open(url, "gNo", option);
        	 
         }
        
    }, // methods
    created: function () {
        var self = this;
        self.fnGetList();
    }// created
});
</script>