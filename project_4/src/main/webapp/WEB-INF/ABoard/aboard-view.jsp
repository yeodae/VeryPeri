<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
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
	body {
		background-color: #eae2eb;
	}

	span{
		color: #ccc;
		font-size: small;
	}
	img {
		width: 300px;
		height: 300px;
	}
	
</style>
</head>
<body>
<div id="app">

	<div>제목 : {{info.aTitle}} <span>{{info.hits}}</span></div>
	<div>등록일 : {{info.aDate}}</div>
	<div>내용 : {{info.aContent}}</div>
	<div><span>{{info.aKind}} / {{info.artist}}</span></div>
	<div>
		<img :src="info.thumbnail">
	</div>
	
	



	<button @click="fnABoardEdit">수정</button>
	<button @click="fnABoardDel">삭제</button>


	
</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		aNo: "${map.aNo}",
		info : {}
	},// data
	methods : {
		fnGetList : function(){
            var self = this;
            var nparmap = {aNo : self.aNo};
            $.ajax({
                url : "/aboard/info.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.info = data.info;
                }
            }); 
        },
        fnABoardEdit : function(){
        	 var self = this;
             $.pageChange("../aboard/edit.do", {aNo : self.aNo});
        },
        fnABoardDel: function(){
        	  var self = this;
        	  var nparmap = {aNo : self.aNo};
        	  if(!confirm("정말 삭제하시겠습니까?")){
        	    return;
        	  }
        	  $.ajax({
        	    url : "/aboard/delete.dox",
        	    dataType:"json",	
        	    type : "POST", 
        	    data : nparmap,
        	    success : function(data) { 
        	      alert("삭제되었습니다.");
        	      window.close(); // 팝업창 닫기
        	      window.opener.location.reload(); // 부모창 새로고침
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