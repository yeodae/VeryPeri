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
.nonMember{
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

	<div><input type="text" placeholder="이벤트 코드" v-model="info.evtNo"></div>
	<div><input type="text" placeholder="이벤트 이름" v-model="info.evtName"></div>
	<div>
		아티스트 : 
	<select v-model="info.artist">
		<option value="BTS">방탄소년단</option>
		<option value="TXT">투모로우바이투게더</option>
		<option value="EHP">엔하이픈</option>
		<option value="SVT">세븐틴</option>
		<option value="FMN">프로미스나인</option>
		<option value="LSF">르세라핌</option>
		<option value="NJS">뉴진스</option>
		<option value="BND">보이넥스트도어</option>
		<option value="ZIC">지코</option>
	</select>
	</div>
	<div><input type="text" placeholder="이벤트 상품 코드" v-model="info.pNo"></div>
	
	<div><button @click="fnEventAdd(info)">이벤트 추가</button></div>

	
</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		info : {
			evtNo : "",
			evtName : "",
			artist : "",
			pNo : ""
		}
	},// data
	methods : {
		fnEventAdd: function(info) {
			  var self = this;
			  var nparmap = self.info;
			  nparmap.evtNo = (nparmap.artist + nparmap.evtNo);
			  if(self.info.evtNo.length != 7){
			        alert("이벤트코드를 확인하시오");
			        return;
			    }
			  if(self.info.evtName == "" || self.info.evtName == undefined){
			        alert("이벤트 이름을 입력해주세요");
			        return;
			    }
			  if(self.info.artist == "" || self.info.artist == undefined){
					alert("아티스트를 선택해주세요");
					return;
				}
			  if(self.info.pNo == "" || self.info.pNo == undefined){
					alert("상품 코드를 입력 해주세요");
					return;
				}
			  $.ajax({
			    url : "/event/add.dox",
			    dataType : "json",
			    type : "POST",
			    data : nparmap,
			    success : function(data) {
			      alert("이벤트가 등록되었습니다.");
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