<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<meta charset="UTF-8">
<title>나는 스테프 헤더</title>
<style>
 @font-face {
       font-family: "a타이틀고딕1";
        src: url("../../../font/a타이틀고딕1.ttf") format("truetype");
    }
    
    *{
       font-family: a타이틀고딕1;
       }

        #app1{
            width: 1500px;
            height: 100px;
            margin: 0px auto;
            float: left;
            margin-bottom: 50px;
        }
        .headerBut1 > button{
        	width : 100px;
            display: inline-block;
            margin-right: 10px;
            margin-bottom: 10px;
            border-radius: 20px;
            border: none;
            background-color: #eddcfd;
            position: relative;
            top: -100px;
            left: 500px;
            
            
        }
    
        .headerBut1 > button:hover {
            background-color: #d7acff;
            color: white;
    
        }
        .headerCenter {
            margin: 0px auto;
            width: 1000px;
            text-align: center;
        }
        .headerPos1{
        	position :relative;
        	top : -100px;
        	left: 500px;
        	color: #f269ff;
        }
        .headerImg{
        	width: 100px;
        }
        
    </style>
    
</head>
<body>
<div id="app1">
    <div class="headerCenter">
    <a href="javascript:;" @click="fnHome"><img class="headerImg" src="../img/logo/veryperiii.png"></a>
	<div class="headerPos1"> {{sName}}님, 환영합니다. <a href="javascript:;" @click="fnLogout"><i class="fa-solid fa-right-from-bracket" style="color: #7a0561;"></i></a></div>
	<div class="headerBut1">
	<button @click="fnMain">베리페리샵</button>
	<button @click="fnGBoard">멤버십게시판</button>
    </div>
    </div>
</div>
</body>
</html>
<script>
var app1 = new Vue({
	el : '#app1',
	data : {
		list : [],
		sName : "${sName}",
        sNo : "${sNo}",
        sStatus : "${sStatus}"
	},// data
	methods : {
		fnMain : function() {
			 window.open('../home.do', '_blank');
		},
		fnGBoard : function() {
			window.open('../gboard/main.do', '_blank');
		},
		fnLogout : function(){
			var self = this;
			var param = {uId : self.uId, uPw : self.uPw};
			$.ajax({
                url : "/logout.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) { 
                	window.location.reload();
                }
            }); 
		},
		fnHome : function(){
            location.href = '../staff/home.do';
        }
	}, // methods
	created : function() {
		var self = this;
		/* self.fnGetList(); */
	}// created
});
</script>