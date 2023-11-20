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

	span{
		color: #ccc;
		font-size: small;
	}
		body {
		background-color: #eae2eb;
	}
	
</style>
</head>
<body>
<div id="app">

	<div>제목 : <input v-model="info.aTitle"></div>
	<div>아이디 : <input v-model="info.aContent"></div>
	
	<div> 종류 : <select v-model="info.aKind">
		<option value="공지">공지</option>
		<option value="이벤트">이벤트</option>
	</select></div>
	<div> 아티스트 : <select v-model="info.artist">
		<option value="공통">공통</option>
		<option value="방탄소년단">방탄소년단</option>
		<option value="투모로우바이투게더">투모로우바이투게더</option>
		<option value="엔하이픈">엔하이픈</option>
		<option value="세븐틴">세븐틴</option>
		<option value="프로미스나인">프로미스나인</option>
		<option value="르세라핌">르세라핌</option>
		<option value="뉴진스">뉴진스</option>
		<option value="보이넥스트도어">보이넥스트도어</option>
		<option value="지코">지코</option>
	</select></div>
	
	



	<button @click="fnABoardEdit">수정</button>

	
</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		aNo: "${map.aNo}",
		info : {
		aTitle : "",
		aContent : "",
		aKind : "",
		artist : ""
		}
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
            var nparmap = self.info;
            if(self.info.aTitle == "" || self.info.aTitle == undefined){
		        alert("제목을 입력해주세요");
		        return;
		    } else if(self.info.aTitle.length > 50){
		        alert("제목은 최대 50자까지 입력 가능합니다.");
		        return;
		    }
		    if(self.info.aContent == "" || self.info.aContent == undefined){
		        alert("내용은 입력해주세요");
		        return;
		    } else if(self.info.aContent.length > 3000){
		        alert("내용은 최대 3000자까지 입력 가능합니다.");
		        return;
		    }
		    if(self.info.aKind == "" || self.info.aKind == undefined){
		        alert("종류를 선택해주세요");
		        return;
		    }
		    if(self.info.artist == "" || self.info.artist == undefined){
		        alert("아티스트를 선택 해주세요");
		        return;
		    }
            $.ajax({
                url : "/aboard/edit.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("수정되었습니다.");
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