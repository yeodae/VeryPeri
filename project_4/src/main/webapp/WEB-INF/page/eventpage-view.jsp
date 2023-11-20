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
    * {
      box-sizing: border-box;
    }
    body {
      background-color:#F1E9F0;
      font-size:16px;
      width: 800px;
    }
    #wrapper{
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
      grid-gap: 16px;
    }
    .card {
      background-color:#fff;
      box-shadow:0px 1px 5px #222;
    }
    .card > header {
      font-size:1.5rem;
      padding:0.5rem;
    }
    .card > p {
      padding:0.5rem;
      line-height:1.6em;
    }
    img {
      width:100%;
      height: 70%;
    }
    .eveFont {
    	font-size: 50px;
    	text-align: right;
    }
    .eventButton1{
    	margin-left: 30px;
    }
    .eventButton1 > button{
	    margin-left: 5px;
	    height: 30px;
	    border-radius: 10px;
	    border: none;
	    background: purple;
	    color: white;
    }
    button{
    	 margin-left: 5px;
	    height: 30px;
	    border-radius: 10px;
	    border: none;
	    background: purple;
	    color: white;
    }
    button:hover{
	    background: #5c3564;
    }
    .evtTitle{
    	font-size: 30px;
    }
    div {
		margin-bottom: 10px;
		color: black;
	}
  </style>
</head>
<body>
<div id="app">

	<div onclick="history.back();"><a href="javascript:;">← 되돌아가기</a></div>
	
	<div class="evtTitle">{{info.aTitle}}</div>
	<div>{{info.aDate}}</div>
	<hr>
	<div>
		<img :src="info.thumbnail">
	</div>
	<div>{{info.aContent}}</div>
	
	<div><button @click="fnEvtApply">응모하러가기</button></div>
</div>
</body>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		info : {},
		aNo : "${map.aNo}",
		uId : "${sessionId}",
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
	fnEvtApply : function(){
        var self = this;
        $.pageChange("eventpageApply.do", {evtNo : self.info.evtNo, uId : self.uId, pNo : self.info.pNo});
    }
	}, // methods
	created : function() {
		var self = this;
		self.fnGetList(); 
	}// created
});
</script>