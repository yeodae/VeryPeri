<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
  <script src="../js/jquery.js"></script>    
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
   <link href="../css/mypag.css" rel="stylesheet" type="text/css">
  <script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
 <meta charset="UTF-8">
  <title>Notice</title>
  <style type="text/css">
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
  	#notice{
  		margin-top : 150px;
		width: 800px;
		text-align: center;  		
  	}
  	.noticeContentPos1{
  		width: 500px;
  		margin:auto;
  	}
  	.noticeContentPos2{
  		width: 800px;
  		margin:auto;
  	}
	.noticeNextPos{
	  	position: absolute;
	  	right: 0px;
	  	margin-right: 10px;
	}
	.noticePreviousPos{
		margin-left: 10px;
	}
	hr {
		margin-top : 20px;
	}
	
	img{
		width: 300px;
		height: 300px;
		border: none;
	}

  </style>
</head>
<body>
<div id="app">

	<div onclick="history.back();"><a href="javascript:;">← 되돌아가기</a></div>
    <div id="wc">
    	<h1 id="notice">Notice</h1>
    	
    	<div v-for="(item,index) in list" v-if="item.aNo == aNo" :key="item.aNo">
    		<div>
    			<hr>
    			<h2>{{item.aTitle}}</h2>
    			<div><strong>작성일</strong> {{formatWithoutTime(item.aDate)}}
    				<span><strong>조회수</strong> <sup style="color: #ccc;">{{item.hits}}</sup></span></div>
    			<hr>
    		</div>
    	<div>
	    		<div class="noticeContentPos1" v-if="item.thumbnail != NULL">
					<img :src="item.thumbnail">
	    		</div>
	    		<div class="noticeContentPos1" v-else>
	    			<span></span>
	    		</div>
	    			<div class="noticeContentPos2">{{item.aContent}}</div>
        			<hr>
        			
    		<span v-if="index > 0">
          			<label @click="previous" class="noticePreviousPos"> <b>←</b> <span>{{ list[index - 1].aTitle }}</span></label>
      		</span>
      		<span v-if="index < list.length - 1">
          		<label @click="next" class="noticeNextPos"><span>{{ list[index + 1].aTitle }}</span><b>→</b> </label>
      		</span>
    </div>
    	
           		
                   
	</div>
</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({
    el: '#app',
    data: {
       list : [],
       uId : "${sessionId}",
       aNo : "${map.aNo}",
       currentIndex: 0
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
            var self = this;
            var nparmap = {aNo : self.aNo};
            $.ajax({
                url : "/aboard/list2.dox",
                dataType:"json",   
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                   self.list = data.list; //사용자                  
                }
            }); 
        },
        noticeList : function(){
        	var self = this;
            $.pageChange("noticeList.do", {uId : self.uId});
        },
        previous : function(){
        	var self = this;
        	if (self.currentIndex > 0) {
        		self.currentIndex--; // 이전 아이템 인덱스 감소
        		self.aNo = self.list[self.currentIndex].aNo; // 이전 아이템의 aNo로 설정
        		self.fnGetList(); 
            }
        },
        next : function(){
        	var self = this;
        	if (self.currentIndex < this.list.length - 1) {
        		self.currentIndex++; // 다음 아이템 인덱스 증가
        		self.aNo = self.list[self.currentIndex].aNo; // 이전 아이템의 aNo로 설정
        		self.fnGetList(); 
            }
        }
    },
    created: function() {
      var self = this;
      self.fnGetList();
      // Vue.js ì½ë ìì± ê°ë¥
    }
});
</script>