<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
<title>관리자 페이지</title>
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
              /*  width: 800px; */
               width: 80%;
               margin: 0px auto;
               text-align: center;
               float: left;
               margin-left: 20px;
               

           }
       .mainBox{
     		   width : 1200px;
     		   height : 550px;
              /*  position: relative;
               top : -550px;
               left: 200px; */
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
           background: #E4DBD6;
       }
       .page-item a {
           color:#666;
           text-decoration: none;
       }
       .pagination li.active {
           background-color : #E7AA8D;
           color:#fff;
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
        	/* margin-top : -50px;
        	margin-bottom: 20px; */
        }
        .mainPos2{
        	/* position: relative;
        	top : -55px;
        	left: 450px; */
        	color: white;
        }
 </style>
</head>
<body>
<div>
<%@ include file="staff-header.jsp" %> 
<%@ include file="staff-left.jsp" %>
<div id="app">
	<div class="mainBox">
	
	<div class="mainPos2">기본화면</div>
<hr>

<img src="../img/staffImg/staffMainHomeImg.jpg">
    
   
    </div>
</div>
</body>
</html>
<script>
var app = new Vue({
    el : '#app',
    data : {
        list : [],
        selectItem : "",
        sName : "${sName}",
        sNo : "${sNo}",
        sStatus : "${sStatus}"
    },// data
    methods : {
        fnGetList : function(){
            var self = this;
            var nparmap = {};
            $.ajax({
                url : "/staff/list.dox",
                dataType:"json",
                type : "POST",
                data : nparmap,
                success : function(data) {
                    self.list = data.list;
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
