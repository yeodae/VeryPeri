<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
<title>관리자 로그인 페이지</title>
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
	#app {
		width: 800px;
		margin: 0px auto;
	}
	input {
		width: 500px;
		height: 80px;
		margin-bottom: 20px;
		font-size: 20px;
	}
	
	button {
	  background-color: #eddcfd;
	  width: 200px;
	  height: 50px;
	  display: inline;
	  border-radius: 20px;
	  border: none;
	  margin-bottom: 1px;
	}
	
	button:hover {
	  background-color: #d7acff;
	}
	.box1{
		border: 3px dashed white;
		width: 700px;
		text-align: center;
		padding: 50px;
	}
	h2{
		margin-bottom: 50px;
		color: #7C81BB;
	}
	h1{
		color: #7C81BB;
	}
</style>
</head>
<body>
<div id="app">

	<h1>관리자 페이지입니다.</h1>
	<h2>성함과 사번을 입력 후 접속 부탁드립니다.</h2>
	<div class="box1">
		<form @submit.prevent="fnStaffLogin">
		    <div><input type="text" placeholder="이름" v-model="staffName"></div>
		    <div><input type="text" placeholder="사번" v-model="staffNo"></div>
		    <div><button type="submit">로그인</button></div>
	    </form>
    </div>
</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		list : [],
		staffNo : "",
		staffName : ""
	},// data
	methods : {
		fnGetList : function(){
            var self = this;
            var nparmap = {};
            $.ajax({
                url : "list.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.list = data.list;
                }
            }); 
        },
        fnStaffLogin : function(){
            var self = this;
            var nparmap = {staffName : self.staffName, staffNo : self.staffNo};
            $.ajax({
                url : "/staff/staffLogin.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	if(data.success){
                		alert(data.message);
                		location.href="../staff/home.do";
                	} else {
                		alert("성함 혹은 사번을 확인해주세요");
                	}
                }
            }); 
        }
	}, // methods
	created : function() {
		var self = this;
		/* self.fnGetList(); */
	}// created
});
</script>