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
	body {
		background-color: #eae2eb;
	}
</style>
</head>
<body>
<div id="app">

	<div>상품코드 : {{info.pNo}}</div>
	<div>상품명 : {{info.pName}}</div>
	<div>재고 : <input type="text" v-model="info.stock"><button @click="fnStockPlus">추가</button></div>
	<button v-on:click="fnAdd(10)"> + 10개</button>
	<button v-on:click="fnAdd(50)"> + 50개</button>
	<button v-on:click="fnAdd(100)"> + 100개</button>
	<button v-on:click="fnAdd(500)"> + 500개</button>
	<button v-on:click="fnAdd(1000)"> + 1,000개</button>
	<button v-on:click="fnAdd(5000)"> + 5,000개</button>
	<button v-on:click="fnAdd(10000)"> + 10,000개</button>

</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		info : {},
		pNo : "${map.pNo}",
		stock : ""
	},// data
	methods : {
		fnGetList : function(){
            var self = this;
            var nparmap = {pNo : self.pNo};
            $.ajax({
                url : "/product/selectProductStock.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	console.log(data);
                	self.info = data.info;
                }
            }); 
        },
        fnProductAdd : function(){
        	location.href="../product/add.do";
        },
        fnBack : function(){
        	location.href = '../staff/main.do';
        },
        fnAdd : function(count) {
        	var self = this;
        	self.info.stock += count;
		},
		fnStockPlus : function(){
            var self = this;
            var nparmap = {stock : self.info.stock, pNo : self.pNo};
            $.ajax({
                url : "/product/produckStockPlus.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("변경되었습니다.");
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