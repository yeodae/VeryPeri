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
        body{
            background-color: #decfdf;
            }
        #app{
                width: 370px;
                margin: 0px auto;
            }
        button{
            width: 90px;
            height: 50px;
            margin-top: 20px;
            margin-left: 120px;
            background-color: #c094c4;
            border: none;
            border-radius: 10px;
        }

                
       </style>
</head>
<body>
<div id="app">

		
		<div>문의 번호 : {{info.iNo}}</div>
		<div>카테고리 : 
			<select v-model="info.category">
				<option value="상품문의">상품문의</option>
				<option value="배송문의">배송문의</option>
				<option value="멤버십문의">멤버십문의</option>
				<option value="페리윙클문의">페리윙클문의</option>
				<option value="기타문의">기타문의</option>
			</select>
			<select v-model="info.state">
				<option value="OPEN">OPEN</option>
				<option value="PENDING">PENDING</option>
				<option value="SOLVED">SOLVED</option>
			</select>
		</div>
		<div>상품번호 : <input v-model="info.pNo"></div>
		<div>문의고객 : <a href="javascript:;" @click="fnuserInformation">{{info.uId}}</a></div>
		<div>문의 제목 : {{info.iQtitle}}</div>
		<div>문의 내용 : <pre v-html="info.iQcontent"></pre></div>
		 0
		<textarea rows="30" cols="50" v-model="info.iAcontent"></textarea>
		
		<div>민원 : 
		<select v-model="info.iComplain" @change="fnUpdateComplain(info, $index)">
		  <option value="N">N</option>
		  <option value="Y">Y</option>
		</select>

			답변시간 : {{info.iAtime}}
		</div>
		
		<button @click="fnAnswer">답변하기</button>
		
		



</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		info : {},
			iNo: "${map.iNo}",
			category : "",
			state : "",
			pNo : "",
			iAcontent : "",
			iComplain : ""
	},// data
	methods : {
		fnGetList : function(){
            var self = this;
            var nparmap = {iNo : self.iNo};
            $.ajax({
                url : "/inquiry/info.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.info = data.info;
                }
            }); 
        },
        fnAnswer : function(){
        	var self = this;
        	 var nparmap = {iNo : self.iNo, category : self.info.category, state : self.info.state, pNo : self.info.pNo, iAcontent : self.info.iAcontent, iComplain : self.info.iComplain};
        	 if(self.info.category == "" || self.info.category == undefined){
 		        alert("카테고리를 선택해주세요");
 		        return;
 		    }
        	 if(self.info.state == "" || self.info.state == undefined || self.info.state == "OPEN"){
   		        alert("상태를 확인해주세요! ");
   		        return;
   		    }
        	 if(self.info.iAcontent == "" || self.info.iAcontent== undefined){
  		        alert("답변을 입력해주세요");
  		        return;
  		    } else if(self.info.iAcontent > 10000){
  		        alert("답변은 최대 10,000자까지 입력 가능합니다.");
  		        return;
  		    }
             $.ajax({
                 url : "/inquiry/answer.dox",
                 dataType:"json",
                 type : "POST",
                 data : nparmap,
                 success : function(data) { 
                	 alert("답변이 등록되었습니다.");
                	 self.fnGetList();
                 }
             }); 
         },
         fnuserInformation: function() {
       	  var self = this;
       	  window.open("../user2/view.do?uId=" + self.info.uId, "popup2", "width=800,height=1000,left=500,top=100");
       	},
       	fnUpdateComplain: function(item, index) {
    	    var self = this;
    	    $.ajax({
    	      url: "/complain/update.do",
    	      dataType: "json",
    	      type: "POST",
    	      data: {
    	    	  iNo: item.iNo,
    	    	  iComplain: item.iComplain
    	      },
    	      success: function(data) {
    	        alert("민원 여부가 업데이트 되었습니다.");
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