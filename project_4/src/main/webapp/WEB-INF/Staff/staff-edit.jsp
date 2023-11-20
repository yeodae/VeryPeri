<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
<title>직원 수정</title>
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
  <div>이름 : <input v-model="info.sName"></div>
  <div>사번 : <input v-model="info.sNo" disabled="disabled"></div>
  <div>직통번호 : <input v-model="info.sPhone"></div>
  <div>부서 :
    <select v-model="info.sPart">
      <option value="">부서 선택</option>
      <option value="고객관리팀">고객관리팀</option>
      <option value="민원관리팀">민원관리팀</option>
      <option value="배송관리팀">배송관리팀</option>
      <option value="상품관리팀">상품관리팀</option>
      <option value="이사">이사</option>
    </select>
    <input disabled v-model="info.value">
  </div>
  <div>상사 : <input v-model="info.sBoss"></div>
  <button @click="fnEdit()">수정하기</button>
</div>

<script>
var app = new Vue({
  el: '#app',
  data: {
    ssisonsNo: "${map.sNo}",
    info: {
      sName: "",
      sNo: "",
      sPhone: "",
      sBoss: "",
      sPart: "",
      sPosition: "",
      value : ""
    },
  },
  computed: {
    valueDisabled() {
      return true;
    },
  },
  watch: {
    'info.sPart'(newVal) {
      switch (newVal) {
        case '고객관리팀':
          this.info.value = 'A';
          break;
        case '민원관리팀':
          this.info.value = 'C';
          break;
        case '배송관리팀':
          this.info.value = 'B';
          break;
        case '상품관리팀':
          this.info.value = 'D';
          break;
        case '이사':
          this.info.value = 'M';
          break;
        default:
          this.info.value = '';
          break;
      }
    },
  },
  methods: {
    fnGetList() {
      const self = this;
      const param = {ssisonsNo: self.ssisonsNo};
      $.ajax({
        url: '/staff/infoView.dox',
        dataType: 'json',
        type: 'POST',
        data: param,
        success(data) {
          self.info = data.info;
        },
      });
    },
    fnEdit() {
      const self = this;
      const nparmap = self.info;
      $.ajax({
        url: "/staff/edit.dox",
        dataType: 'json',
        type: 'POST',
        data: nparmap,
        success(data) {
          alert(self.info.sName + '님이 수정되었습니다.');
          window.close(); // 팝업창 닫기
     	  window.opener.location.reload(); // 부모창 새로고침
        },
      });
    },
  },
  created() {
    this.fnGetList();
  },
});
</script>
