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
       font-family: "a타이틀고딕1";
        src: url("../../../font/a타이틀고딕1.ttf") format("truetype");
    }
    
    *{
       font-family: a타이틀고딕1;
    }
	table{
		border : 1px solid black;
		border-collapse: collapse;
		text-align : center;
	}
	th, td {
		border : 1px solid black;
		padding : 5px 10px;
	}
	body {
		background-color: #eae2eb;
	}
</style>
</head>
<body>
<div id="app">

	<div><input type="text" placeholder="상품 코드" v-model="info.pNo"></div>
	<div><input type="text" placeholder="상품 이름" v-model="info.pName"></div>
	<div><input type="number" placeholder="가격" v-model="info.price"><input type="number" placeholder="적립금" v-model="info.point" disabled></div>
	<div><input type="number" placeholder="재고" v-model="info.stock"></div>
	<div>
		<select v-model="info.membership">
			<option value="N">전체구매가능</option>
			<option value="Y">멤버십전용</option>
		</select>
	</div>
	<div> 카테고리 : 
		<select v-model="info.category">
			<option value="ALB">앨범</option>
			<option value="MER">머치</option>
			<option value="DVD">DVD</option>
			<option value="PTB">포토북</option>
			<option value="MEM">멤버십</option>
		</select>
	</div>
	<div> 상품 이미지 :<input type="file" id="file1" name="file1" accept="image/*" @change="setThumbnail"></div>
	<div> 최대구매 갯수 : 
		<select v-model="info.pLimit">
			<option value="10">10개</option>
			<option value="9">9개</option>
			<option value="8">8개</option>
			<option value="7">7개</option>
			<option value="6">6개</option>
			<option value="5">5개</option>
			<option value="4">4개</option>
			<option value="3">3개</option>
			<option value="2">2개</option>
			<option value="1">1개</option>
		</select>
	</div>

	<div>
	상세 페이지 : 
	<input type="file" id="file2" name="file2" accept="image/*" multiple>
<!-- 	<input type="file" id="file2" name="file2" accept="image/*" multiple>
	<input type="file" id="file2" name="file2" accept="image/*" multiple> -->


	</div>

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
	<div><input type="text" placeholder="특전코드" v-model="info.fYn"></div>

	<div><button @click="fnProductAdd">상품 추가</button></div>
 <div id="image_container"></div>

</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		info : {
			pNo : "",
			pName : "",
			price : "",
			point : "",
			stock : "",
			membership : "N",
			category : "PTB",
			artist : "BTS",
			fYn : "",
			pLimit : "2"
		}
	},// data
	methods : {
		fnProductAdd: function() {
			  var self = this;
			  var nparmap = self.info;
			  nparmap.point = parseFloat(nparmap.price) * 0.02;
			  nparmap.pNo = (nparmap.artist + nparmap.pNo + nparmap.category);
			  if(self.info.pNo.length != 10){
			        alert("상품번호를 확인하시오");
			        return;
			    }
			  if(self.info.pName == "" || self.info.pName == undefined){
			        alert("상품 이름을 입력해주세요");
			        return;
			    }
			  if(self.info.price == "" || self.info.price == undefined){
					alert("가격을 입력해주세요");
					self.info.price.focus();
					return;
				}
			  if(self.info.stock == "" || self.info.stock == undefined || self.info.stock == 0){
					alert("재고를 입력해주세요");
					return;
				}
			  if(self.info.membership == "" || self.info.membership == undefined){
					alert("멤버십여부를 선택해주세요");
					return;
				}
			  if(self.info.category == "" || self.info.category == undefined){
					alert("카테고리를 선택해주세요");
					return;
				}
			  if(self.info.artist == "" || self.info.artist == undefined){
					alert("아티스트를 선택해주세요");
					return;
				}
			  if(self.info.pLimit == "" || self.info.pLimit == undefined){
					alert("최대구매 갯수 선택해주세요");
					return;
				} 
			  $.ajax({
			    url : "/product/add.dox",
			    dataType : "json",
			    type : "POST",
			    data : nparmap,
			    success : function(data) {
			    	 alert("상품이 등록되었습니다.");
			      var form = new FormData();			     
			      var form2 = new FormData();			     
			      
                  form.append("file1", $("#file1")[0].files[0]);
                  form.append("pNo", data.pNo);
                  self.upload(form);
                  
                  form2.append("pNo", data.pNo);
                  for(var i=0; i < $("#file2")[0].files.length; i++){
                	  form2.append("file2", $("#file2")[0].files[i]);
                      self.upload1(form2);
                  }
                  
              	/*   window.close(); // 팝업창 닫기*/
	        	 /*  window.opener.location.reload(); */ // 부모창 새로고침 
	        	  window.location.reload();
			    }
			  });
			},
			upload: function(form) {
	            var self = this;
	            $.ajax({
	                url: "/product/fileUploadimg.dox",
	                type: "POST",
	                processData: false,
	                contentType: false,
	                data: form,
	                success: function(response) {
	                }
	            });
	        },
	        upload1: function(form2) {
	            var self = this;
	            $.ajax({
	                url: "/product/insertProductDetailedImg.dox",
	                type: "POST",
	                processData: false,
	                contentType: false,
	                data: form2,
	                success: function(response) {
	                }
	            });
	        },
	        setThumbnail: function(event){
	            var reader = new FileReader();
	            var imageContainer = document.querySelector("div#image_container");
		
	            while (imageContainer.firstChild) {
	                imageContainer.removeChild(imageContainer.firstChild);
	            }
	            
	            reader.onload = function(event) {
	                var img = document.createElement("img");
	                img.setAttribute("src", event.target.result);
	                document.querySelector("div#image_container").appendChild(img);
	            };
	            
	            reader.readAsDataURL(event.target.files[0]);
	        }
	    
	}, // methods
	created : function() {
		var self = this;
	}// created
});
</script>