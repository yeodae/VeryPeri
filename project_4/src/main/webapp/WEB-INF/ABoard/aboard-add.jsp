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
</style>
</head>
<body>
<div id="app">

	<div><input placeholder="제목" v-model="info.aTitle"></div>
	<div><input placeholder="내용" v-model="info.aContent"></div>
	<div> 종류 : <select v-model="info.aKind">
		<option value="공지">공지</option>
		<option value="이벤트">이벤트</option>
	</select></div>
	<div v-if="info.aKind === '이벤트'">
    <input placeholder="이벤트코드입력" v-model="info.evtNo">
	</div>
	<div> 아티스트 : <select v-model="info.artist">
		<option value="공통" selected>공통</option>
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
	
	<div><input type="file" id="file1" name="file1"></div>
	
	
	
	<button @click="fnABoardAdd">공지추가</button>


	
</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		info : {
		aTitle : "",
		aContent : "",
		aKind : "",
		artist : "",
		evtNo : ""
		}
	},// data
	methods : {
		fnABoardAdd : function(){
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
		        url : "/aboard/add.dox",
		        dataType:"json",
		        type : "POST", 
		        data : nparmap,
		        success : function(data) {
	        	   alert("공지가 등록되었습니다.");
		            console.log(data.idx);
	           		var form = new FormData();
	       	        form.append( "file1",  $("#file1")[0].files[0] );
	       	     	form.append( "idx",  data.idx);
	           		self.upload(form);
		        }
		    }); 
		}, 
		upload : function(form){
	    	var self = this;
	         $.ajax({
	           url : "/fileUpload.dox",
	           type : "POST",
	           processData : false,
	           contentType : false,
	           data : form,
	           success:function(response) { 
			       window.close(); // 팝업창 닫기
			       window.opener.location.reload(); // 부모창 새로고침
	        	   
	           }
	           
	       });
		} 	
	}, // methods
	created : function() {
		var self = this;
	}// created
});
</script>