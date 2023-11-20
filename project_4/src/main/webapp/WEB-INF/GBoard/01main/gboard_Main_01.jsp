<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">	
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<title>Membership Main</title>
<%@ include file="../../Product/sexyheader.jsp" %>
<style>
    @font-face {
    	font-family: "a타이틀고딕1";
        src: url("../../../font/a타이틀고딕1.ttf") format("truetype");
    }
    
    *{
    	font-family: a타이틀고딕1;
    }
	ul, li{
		text-decoration: none;
		list-style: none;
	}
	.container{
		padding-top:130px;
	}
	.imgBox {
    width: 100%; /* 박스가 전체 너비를 차지하도록 설정 */
    max-height: 400px; /* 높이를 최대 200px로 제한 */
    overflow: hidden; /* 최대 높이 이상의 부분은 가려줌 */
    background-color : black;
    text-align:center;
}

.imgBox img {
	margin : 0px auto;
    width: 531px;
    aspect-ratio: auto 531 / 299;
    height: 299px;
    text-align:center;
}
.artistArea{
	padding : 0 80px;
}
.artistArea2{
	margin : 0px 200px;
	width : 100%;
}
.artistBox{
	width : 200px;
}
.artistArea{
	display: flex;
    flex-wrap: wrap;
    gap: 23px 14px;
}
.artistArea2 ul{
	width: 100%;
	    text-align: center;
}
.artistArea2 li{
	width: 200px;
	display: inline-block;
	margin-right : 40px;
	margin-bottom : 40px;
	
}
.artistArea2 a{
	height : 100%;
	border-radius: 14px;
}
.artistArea2 h2{
	margin-bottom : 60px;
	margin-top: 90px;
}
.artistBox img {
	border-radius: 14px;
	box-shadow: 0 1px 0 rgba(0,0,0,.0.1);
}
.artistText{
	text-align:center;
}
.artistBox img:hover {
    transform: scale(1.05); /* 이미지 확대 효과 적용 */
}
.artistBox img {
    transition: transform 0.3s ease; /* 변환에 0.3초 동안 부드러운 효과 적용 */
}
a:hover{
 cursor : pointer;
}
</style>
</head>
<body>
	<div id="app">
		<div class="container">
			<div class="imgBox">
				<img src="https://cdn-v2pstatic.weverse.io/wev_web_fe/assets/web/home_banner_slogan.gif"/>
			</div>
			<div class="artistArea">
				<div class="artistArea2">
					<h2 style="text-align:center; color:#3d435f;">관심있는 아티스트를 만나보세요!</h2>
					<ul>
						<li><a class="artistBox" href="javascript:"><div @click="fnMove('BTS')"><img src="https://phinf.wevpstatic.net/MjAyMzA2MDlfMjA5/MDAxNjg2MjgyOTI4MjM4.uzwN0D1RUzZ7zjv451iLx3k58NbU5tuNGQcNriaLGMog.8BqToW1rnUi10zbpxcvjow74zOJ8mUCJ49z2yGQVaEMg.PNG/8799005373953432ff510aa1-b04b-40f8-8b6d-1e7883e7a481.png?type=f416_416" width="208" height="208" alt=""></div>
							<div class="artistText"><strong>방탄소년단</strong></div></a></li>
							
						<li><a href="javascript:"><div class="artistBox" @click="fnMove('NJS')"><img src="https://phinf.wevpstatic.net/MjAyMzA3MDZfNjAg/MDAxNjg4NjU1NTEwNDk5.8BzMNO2CEBiV7FiQf0sqP-y_CcXTVfMsmQ8QugCtengg.eQc3M6dbk8xgaRFzbdFkJNNWDmDReznOSwdS_EhAwRkg.PNG/320158174454655029be17145-30a2-45e9-9134-ab4619dc057e.png?type=f416_416" width="208" height="208" alt=""></div>
							<div class="artistText"><strong>뉴진스</strong></div></a></li>
							
						<li><a href="javascript:"><div class="artistBox" @click="fnMove('ZIC')"><img src="https://phinf.wevpstatic.net/MjAyMjA3MTlfMTAw/MDAxNjU4MjAwMzQ4MTEw.4Hx5nWX-whENqwgXbTGI5v7OM_meNjpjRT552TB25SEg.Msf5w64dAA_uTH9VPuTSQZjZSzICDfCkqTGuhQ4waowg.PNG/4268524813805226322d3bb6f-4aae-44c9-a87a-0154ff5c8e47.png?type=f416_416" width="208" height="208" alt=""></div>
							<div class="artistText"><strong>지코</strong></div></a></li>
							
						<li><a href="javascript:"><div class="artistBox" @click="fnMove('EHP')"><img src="https://phinf.wevpstatic.net/MjAyMzA1MDlfMTk1/MDAxNjgzNjQ0MjEwMzM4.CpcRsTOtUKAaA-xHsgUPjdfDyMwdC4pZVxTChgoCMdUg.MJSGYFAN9x6n0Zlij0j0adHpt1weRrO5s8FrX4V5tAEg.PNG/6160287466499467001d8c96-089a-4b05-a758-6891b41be817.png?type=f416_416" width="208" height="208" alt=""></div>
							<div class="artistText"><strong>엔하이픈</strong></div></a></li>
							
						<li><a href="javascript:"><div class="artistBox" @click="fnMove('SVT')"><img src="https://phinf.wevpstatic.net/MjAyMzA0MTVfMjky/MDAxNjgxNDg0ODk1OTM0.hgDXuhSs45mvYhQFpCZssg703JOF9pGxHSca3PzEiXsg.amuI9iS6nDLJqwhR5ad4d0zGaxsZz0wVns3YXH2d4wMg.PNG/178367443285053282989e3de-2d15-46e5-818b-73b2cdeab453.png?type=f416_416" width="208" height="208" alt=""></div>
							<div class="artistText"><strong>세븐틴</strong></div></a></li>
							
						<li><a href="javascript:"><div class="artistBox" @click="fnMove('FMN')"><img src="https://phinf.wevpstatic.net/MjAyMzA1MjVfMjA3/MDAxNjg1MDE3OTYwOTY3.It-QCieMbJEupe9ljb03Bza8p8e7tWOUCMmuUgmqzy4g.fYICCBLYFGJxky_WUeM7dPjbhtYlqb6cykapIG_tE08g.PNG/18677645385851861a9ea80be-6fa8-42e9-bc2a-9d3700099e48.png?type=f416_416" width="208" height="208" alt=""></div>
							<div class="artistText"><strong>프로미스나인</strong></div></a></li>
							
						<li><a href="javascript:"><div class="artistBox" @click="fnMove('LSF')"><img src="https://phinf.wevpstatic.net/MjAyMzA0MThfMTYz/MDAxNjgxNzc5NTYzOTg5.nbfYYYPT9R_V1-h7a-IFajvmrVNBeQ9bLSyYmfWULN0g.d4huHued8TsqCoZOZgozThXFraLHJzzuVF69KFWxY4Ug.PNG/773745721093888179bd7fbe0-3f88-4e86-a06e-cf20a4b05acf.png?type=f416_416" width="208" height="208" alt=""></div>
							<div class="artistText"><strong>르세라핌</strong></div></a></li>
							
						<li><a href="javascript:"><div class="artistBox" @click="fnMove('TXT')"><img src="https://phinf.wevpstatic.net/MjAyMzA3MDZfNzgg/MDAxNjg4NTY5NzQ4NDI5.niD9DkXuaiyevBHm-egtOP3SAgviERNpcLFaIbz8Zc8g.vpnLqw1Qz0nEld4Ufc51HNOhxGUyHNVaOJSvNrpHYk8g.PNG/239543933128684334abf30a5-cf31-470d-8de3-5e31a2a6cb06.png?type=f416_416" width="208" height="208" alt=""></div>
							<div class="artistText"><strong>투모로우바이투게더</strong></div></a></li>
							
						<li><a href="javascript:"><div class="artistBox" @click="fnMove('BND')"><img src="https://phinf.wevpstatic.net/MjAyMzA4MjJfMjc1/MDAxNjkyNzEyNTIzMTc3.dUOo7M7h8qn-C0X7u9Ou718ljJZLGxSv8lHmRSC6fWog.irQ474UFF2vw7hruRE6qmJbfsEG4clFR6_sPcHheSocg.PNG/7719739320887855418eb035c-5c7e-44e4-be43-8c4519755c84.png?type=f416_416" width="208" height="208" alt=""></div>
							<div class="artistText"><strong>보이넥스트도어</strong></div></a></li>						
					</ul>
					<a @click="fnMyPage" style="text-align:center; color:#3d435f;"><h2>MEMBERSHIP MY PAGE <i class="fa-solid fa-door-open"></i></h2></a>					
				</div>				
			</div>
		</div>
	</div>
	
<%@ include file="../../page/footer.jsp" %>
</body>
</html>
<script>
	    var app = new Vue({
	        el: '#app',
	        data: {
	            list: [],
	            uId : "${sessionId}"
	        },// data
	        methods: {
	            fnGetList: function() {
	                var self = this;
	                var nparmap = {uId : self.uId};
	                $.ajax({
	                    url: "/gboard/membershipCheck.dox",
	                    dataType: "json",
	                    type: "POST",
	                    data: nparmap,
	                    success: function (data) {
	                        self.list = data.list;
	                        console.log("list==>",self.list);
	                    }
	                });
	            }, fnMove : function(artist){
	            	 var self = this;
	            	    var membershipSubscribed = false;

	            	    for (var i = 0; i < self.list.length; i++) {
	            	        if (self.list[i].artist === artist) {
	            	            membershipSubscribed = true;
	            	            break;
	            	        }
	            	    }
	            	    
	            	    if (membershipSubscribed) {
	            	     	location.href = artist.toLowerCase() + '.do';
	            	    } else {
	            	        alert("해당 멤버십을 구독하지 않았습니다.");
	            	    } 
	           }, fnMyPage : function(){
	        	   location.href ="myPage.do"
	        	   
	           }
	            	
	        }, // methods
	        created: function () {
	            var self = this;
	            self.fnGetList();
	        }// created
	    });
	</script>
