<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
<title>직원 관리</title>
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
        }
        .mainPos2{
        	color: white;
        }
 </style>
</head>
<body>
<%@ include file="staff-header.jsp" %> 
<%@ include file="staff-left.jsp" %> 
<div id="app">
	<div class="mainBox">
	
	<div class="mainPos2">직원 관리</div>
<hr>	
    <table>
        <tr>
            <th></th>
            <th>이름</th>
            <th>사번</th>
            <th>연락처</th>
            <th>부서</th>
        </tr>

        <tr v-for="(item, index) in list">
            <td><input type="radio" :value="item.sNo" v-model="selectItem"></td>
            <td>{{item.sName}}</td>
            <td>{{item.sNo}}</td>
            <td>{{item.sPhone}}</td>
            <td>{{item.sPart}}</td>
        </tr>

    </table>
    <div class="mainPos1">
    <button @click="fnStaffUpdate">수정</button>
    <button @click="fnStaffDelete">삭제</button>
    <button @click="fnStaffAdd">직원추가</button>
	</div>
    </div>
</div>
</body>
</html>
<script>
var app = new Vue({
    el : '#app',
    data : {
        list : [],
        selectItem : ""
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
        },
        fnStaffAdd : function(){
            var self = this;
            window.open("../staff/add.do", "popup1", "width=700,height=500,left=500,top=100");
        },
        fnStaffUpdate : function(item){
            var self = this;
            if (self.selectItem == "") {
                alert("수정할 사원을 선택해주세요.");
                return;
            }
            window.open("../staff/edit.do?sNo=" + self.selectItem, "popup2", "width=700,height=500,left=500,top=100");
        },
        fnStaffDelete : function () {
            var self = this;
            if (self.selectItem == "") {
                alert("삭제할 사원을 선택해주세요.");
                return;
            }
            if(!confirm("정말 삭제하시겠습니까?")){
                return;
            }
            var nparmap = {sNo : self.selectItem};
            $.ajax({
                url: "/staff/delete.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
                    alert("삭제되었습니다.");
                    self.fnGetList();
                }
            });
        },
        fnBack : function(){
            location.href = '../staff/main.do';
        }
    }, // methods
    created : function() {
        var self = this;
        self.fnGetList();
    }// created
});
</script>
