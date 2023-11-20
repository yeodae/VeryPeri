<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>멤버십 댓글 신고</title>
<style>
    @font-face {
    	font-family: "a타이틀고딕2";
        src: url("../../../font/A타이틀고딕2.TTF") format("truetype");
    }
    
    *{
    	font-family: a타이틀고딕2;
    }
    body{
    	background-color: rgb(230, 230, 255);
    }
    
</style>
</head>
<body>
<div id="app">
    <template>
      <div class="report-modal">
	      <h2>댓글 신고</h2>
	      <label>신고 사유 선택:</label>
	      <select v-model="selectedReason">
	        <option value="">신고 사유 선택</option>
	        <option value="A">욕설 및 괴롭힘</option>
	        <option value="B">부적절한 콘텐츠</option>
	        <option value="C">스팸 및 광고</option>
	        <option value="D">불법 콘텐츠</option>
	        <option value="E">기타</option>
	      </select>
	      <input type="text" v-if="selectedReason === 'E'" v-model="otherReason" placeholder="기타 신고 사유 입력">
	      <label>추가 설명:</label>
	      <textarea v-model="reportDescription"></textarea>
	      <button @click="submitReport">신고하기</button>
    </div>
    </template>

</div>
</body>
</html>
<script>
var app = new Vue({
    el: '#app',
    data: {
        gcNo: "${map.gcNo}",
        uId: "${map.uId}",
        selectedReason: "",
        otherReason: "",
        reportDescription: "",
    },// data
    methods: {
        reportPost() {
        	var self = this;
        	self.selectedReason = ""; // 초기화
        	self.otherReason = ""; // 초기화
        	self.reportDescription = ""; // 초기화
        	self.showReportModal = true;
          },
          submitReport() {
        	 var self = this;
            if (!self.selectedReason) {
              alert("신고 사유를 선택해주세요.");
              return;
            }
            // 신고 데이터를 서버로 전송하는 로직 추가
            var reportData = {
              gcNo: self.gcNo,
              reason: self.selectedReason,
              otherReason: self.otherReason,
              description: self.reportDescription,
              uId : self.uId
            };

            $.ajax({
              url: "report2.dox", // 신고 데이터를 처리할 서버 API 주소
              dataType: "json",
              type: "POST",
              data: reportData,
              success: function (data) {
                alert("신고가 접수되었습니다. 감사합니다.");
                window.opener.location.reload();
                window.close();
              }
            });
          }
        
    }, // methods
    created: function () {
    }// created
});
</script>