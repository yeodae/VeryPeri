<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setDateHeader("Expires", 0); // Proxies.
%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
<meta charset="UTF-8">
<style>
  .nonMember{
         font-family: "a타이틀고딕1";
        src: url("../../../font/a타이틀고딕1.ttf") format("truetype");
    }
    
    *{
       font-family: a타이틀고딕1;
    }
#sexyHeadiner{
	margin: 0px;
    top: 0px;
    position: relative;
    width: 100%;
    z-index: 1111;
  
}
#headiner {
    font-family: Graduate, Kelly Slab, Aldrich;
    font-size: 1.1em;
    color: #000;
    justify-content: center;
    align-items: center;
    width: 100vw;
    margin: 0;
}
.sexyIcon {
float : right;
padding-right : 30px;
margin-right : 10px;
margin-top : 20px;
color:black;
}
* {
	margin: 0;
	padding: 0;
}
ul, ol, li {
	list-style: none;
	line-height: 50px;
}
a {
	color:black;
	text-decoration: none;
} 
nav {
	width: 100%;
	height: 100px;
	position: relative;
	z-index: 9999;
}

.navWrap {
   width: 100%;
    height: 75px;
    overflow: hidden;
    transition: all 0.9s;
    position: relative;
    background: rgba(245, 235, 236, 0); /* 완전히 투명한 배경 색상 설정 */
    margin: 0px;
    }
    
.navWrap:hover {
    height:520px; 
    background: rgba(245, 235, 236); 
    }
			
nav .menu {
	font-weight : bold;
	width: 1500px;
	margin: 0 auto;
	height: 100px;
	 z-index: 1;
}
nav .menu a {
	color: 000000;
}
.menu-container {
    display: flex;
    justify-content: center;
}
nav .menu>li {
	width: 100px;
	float: left;
	position: relative;
}
nav .menu>li:hover>a {
	color: #b4adf6;
}
nav .menu>li:last-child {
	margin-left: 0;
}
nav .menu>li a {
	display: block;
	width: 105px;
	height: 100%;
	text-align: center;
	line-height: 120px;
}
nav .menu .depths {
	position: absolute;
}
nav .menu .depths li {
	width: 300px;
}
nav .menu .depths li a {
	font-size: 0.8rem;
	line-height: 40px;
}
nav .menu .depths li:hover a {
	color: #6fd7ff;
}
.titleLi{
 margin: 0xp;
}
#sexyLogo {
  margin: 0px auto;
  width: 90px;
  height: auto;
  top: 10px;
  z-index: 11110;
  display: flex;
  justify-content: center;
  position: absolute;
  top: 50%;
  right: 50%;
  transform: translate(50%, -50%);
}

 
.mene{
	text-align: center;
	padding-left: 5px;
}
#headiner{
width: 100%; 
margin: 0 auto;
}
.sexyIcon{
	color : rgb(45, 47, 70);
}
.logjo{
	color: #8a8a8a;
	font-size : 14px;
	font-weight : 300;
}
.logjo2{
	color: #8a8a8a;
	font-size : 14px;
	font-weight : 300;
}
.logjo3{
	color: #8a8a8a;
	font-size : 14px;
	font-weight : 300;
}
.sexyIcon .logjo{
	position: absolute;
	display : block;
	right : 17%;
	top : 5px;
	float : right;
}
.sexyIcon .logjo2{
	position: absolute;
	display : block;
	right : 20%;
	top : 5px;
	float : right;
}
.sexyIcon .logjo3{
	position: absolute;
	display : block;
	right : 16%;
	top : 22px;
}
.navWrap.translucent {
    background-color: rgba(255, 255, 255, 0.7);
}
</style>
</head>
<body>
	<div id="sexyHeadiner">		
		<nav>
			<span><a href="../home.do"><img id="sexyLogo" src="../../img/logo/veryperiii.png"></a></span>
		<div id="sexyHeadiner">
			<div class="navWrap" v-bind:class="{ 'translucent': isTranslucent }" >
			<ul class="menu">
						<li class="titleLi"><a href="/product/artistAll.do">ARTIST</a>
						<ul class="depths">
							<li ><a href="/product/BTS.do">BTS</a></li>
							<li ><a href="/product/LSF.do">LE SSERAFIM</a></li>
							<li ><a href="/product/SVT.do">SEVENTEEN</a></li>
							<li ><a href="/product/FMN.do">fromis_9</a></li>
							<li ><a href="/product/TXT.do">TXT</a></li>
							<li ><a href="/product/NJS.do">NewJeans</a></li>
							<li ><a href="/product/EHP.do">ENHYPEN</a></li>
							<li ><a href="/product/BND.do">BOYNEXTDOOR</a></li>
							<li ><a href="/product/ZIC.do">ZICO</a></li>
						</ul>
					</li>

					<li class="titleLi"><a href="/product/main.do">PRODUCT</a>
						<ul class="depths">
							<li><a href="/product/membership.do">MEMBERSHIP</a></li>
							<li><a href="/product/album.do">ALBUM</a></li>
							<li><a href="/product/merch.do">MERCHANDISE</a></li>
							<li><a href="/product/dvd.do">DVD</a></li>
							<li><a href="/product/photoBook.do">PHOTO BOOK</a></li>
						</ul>
					</li>

					<li class="titleLi">
						<a href="/event/eventpage.do" onclick="window.open(this.href, 'event', 'width=850,height=1000,top=200,left=500'); return false;">EVENT</a>
					</li>

					<li class="titleLi">
						<a href="/mypag/noticeList.do" onclick="window.open(this.href, 'notice', 'width=1000,height=1000,top=200,left=500'); return false;">NOTIFY</a>
					</li>	
					

						<div class="sexyIcon">
							
							<span class="sexyIcon"><a v-if="uId == null || uId =='' " href="/basket.do" href="bookmark.do"><i class="fa-brands fa-shopify"></i></a>
							<a v-else href="/cart/cartList.do"><i class="fa-brands fa-shopify"></i></a></span>

							<span class="sexyIcon"><a v-if=" uId !='' " href="/mypag/myInformation.do"><i class="fa-solid fa-bookmark fa-1xl"></i></a>
							<a v-if="uId == ''" href="/user/login.do"><i class="fa-solid fa-bookmark fa-1xl"></i></a></span>
							
							<span class="sexyIcon">
								<a v-if="uId == ''" href="/user/login.do"><i class="fa-brands fa-wordpress-simple fa-rotate-180"></i></a>								
								<a v-if="uId != ''" href="/gboard/main.do"><i class="fa-brands fa-wordpress-simple fa-rotate-180"></i></a>								
							</span>
							
							<span class="sexyIcon">
								<a v-if="uId == null || uId == ''" href="/user/join.do" class="logjo">JOIN</a>								
								<a v-if="uId != null" href="../mypag/main.do"><i class="fa-solid fa-user fa-1xl"></i></a>								
							</span>

							<span class="sexyIcon">
								<a v-if="uId == null || uId == ''" href="/user/login.do" class="logjo2">LOGIN</a>							
								<button v-else-if="uId != null " @click="fnLogout" style="background: none; border: none; cursor: pointer;" class="logjo3">LOGOUT</button>

							</span>							
						</div>

					</ul>
				</div>					
			</div>
		</nav>
	</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#sexyHeadiner',
	data : {
		uId : "${sessionId}",
		isTranslucent: false,
		
	},
	methods: {
		fnLogout : function(){
			var self = this;
			var param = {uId : self.uId, uPw : self.uPw};
			$.ajax({
                url : "/logout.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) { 
                	location.href = "http://localhost:8082/home.do"
                }
            }); 
		},
		fnGetList : function(){			
            var self = this;
            var nparmap = {};                   
		},
		handleScroll: function() {
            // 스크롤 위치에 따라 반투명 클래스를 추가하거나 제거합니다
            this.isTranslucent = window.scrollY > 0;
            var icons = document.querySelectorAll('.sexyIcon i');
            var texts = document.querySelectorAll('.logjo, .logjo2, .logjo3');
            var links = document.querySelectorAll('#sexyHeadiner a');
            var linkColor = this.isTranslucent ? "#000" : "#6667AB";
            var elementColor = this.isTranslucent ? "#000" : "#6667AB";
            for (var i = 0; i < links.length; i++) {
                links[i].style.color = linkColor;
            }
            for (var i = 0; i < texts.length; i++) {
                texts[i].style.color = elementColor;
            }
        }
},
	created : function() {
		  var self = this;
		    // 세션 값 uId가 존재하면 로그인 상태로 변경
		  var uId = sessionStorage.getItem('uId'); // 세션스토리지에서 uId 가져오기
		  window.addEventListener('scroll', this.handleScroll);
	},
	destroyed: function() {
        // 컴포넌트가 제거될 때 스크롤 이벤트 리스너를 제거합니다
		window.removeEventListener('scroll', this.handleScroll);
    }
});
</script>