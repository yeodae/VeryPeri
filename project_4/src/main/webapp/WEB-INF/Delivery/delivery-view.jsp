<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://unpkg.com/vuejs-paginate@latest"></script>
<script src="https://unpkg.com/vuejs-paginate@0.9.0"></script>
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
        body{
               background-color: #decfdf;
           }
        #app{
               width: 1200px;
               margin: 0px auto;
           }
       table{
           border : 1px solid black;
           border-collapse: collapse;
           text-align : center;
           background-color: #eae2eb;
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
       button{
        margin-top: 10px;
        margin-bottom: 10px;
        margin-left: 20px;

       }
   </style>
</head>
<body>
<div id="app">
	<div>주문번호 : {{oNo}}</div>
	<table>
    <tr>
      <th>상품명</th>
      <th>상품코드</th>
      <th>현재상태</th>
      <th>주문수량</th>
      <th>주문자명</th>
      <th>주문자 연락처</th>
      <th>주문자 주소1</th>
      <th>주문자 주소2</th>
      <th>정제 주소</th>
    </tr>
      <tr v-for="(item, index) in list">
        <td>{{ item.pName }}</td>
        <td>{{ item.pNo }}</td>
        <td>
          <select v-model="item.dState" @change="fnUpdateState(item)">
            <option value="상품 준비중">상품 준비중</option>
            <option value="배송 준비중">배송 준비중</option>
            <option value="배송중">배송중</option>
            <option value="배송완료">배송완료</option>
            <option value="업체 사유로 거절">업체 사유로 거절</option>
            <option value="고객 사유로 거절">고객 사유로 거절</option>
            <option value="배송사 사유로 거절">배송사 사유로 거절</option>
 			<option value="교환접수" hidden>교환접수</option>
			 <option value="교환수거중" hidden>교환수거중</option>
			 <option value="교환수거완료" hidden>교환수거완료</option>
			 <option value="교환상품배송중" hidden>교환상품배송중</option>
			 <option value="교환완료" hidden>교환완료</option>
			 <option value="반품접수" hidden>반품접수</option>
			 <option value="반품수거중" hidden>반품수거중</option>
			 <option value="결제사취소중" hidden>결제사취소중</option>
			 <option value="반품완료" hidden>반품완료</option>           

          </select>
        </td>
        <td>{{ item.oCount }}</td>
        <td>{{ item.uDname }}</td>
        <td>{{ item.uDphone }}</td>
        <td>{{ item.uDaddr }}</td>
        <td>{{ item.uDaddrDetail }}</td>
        <td>{{ item.uDaddr }} {{ item.uDaddrDetail }}</td>
      </tr>
</table>

</div>
</body>
<script>
var app = new Vue({
	el : '#app',
	data : {
		list : [],
        oNo: '' // 데이터 정의
	},// data
	methods : {
		fnGetList : function(){
            var self = this;
            var startNum = ((self.selectPage-1) * 10);
    		var lastNum = 10;
            var nparmap = {oNo : self.oNo};
            $.ajax({
                url : "/delivery/listInfo.dox",
                dataType:"json",
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.list = data.list;
                }
            }); 
        },   
        fnUpdateState : function(item) {
        	var self = this;
        	if (item.dState === '배송완료') {
        	    self.updateState2(item);
        	} else {
        	    self.updateState1(item);
        	}
        },
        updateState1 : function(item) {
          	var self = this;
        	var exchangeVal = '';
        	if (item.dState.includes('거절')) {
        	    exchangeVal = 'R';
        	}
        	$.ajax({
        	    url: "/order/updateOrderInfo.dox",
        	    dataType: "json",
        	    type: "POST",
        	    data: {
        	      exchange: exchangeVal,
        	      buyNo: item.buyNo,
        	      dState: item.dState
        	    },
        	    success: function(data) {
        	      alert("주문 상태가 업데이트 되었습니다.");
        	      self.fnGetList();
        	    }
        	  }); 
        },
        updateState2 : function(item) { // 새로운 함수
          	var self = this;
        	$.ajax({
        	    url: "/delivery/updateOrderInfo2.dox",
        	    dataType: "json",
        	    type: "POST",
        	    data: {
        	      buyNo: item.buyNo,
        	      dState: item.dState
        	    },
        	    success: function(data) {
        	      alert("주문 상태가 업데이트 되었습니다.");
        	      self.fnGetList();
        	    }
        	  }); 
         }
	}, // methods
	created : function() {
	  this.oNo = "${map.oNo}"; // 데이터 할당
		var self = this;
		self.fnGetList();
	}// created
});
</script>
