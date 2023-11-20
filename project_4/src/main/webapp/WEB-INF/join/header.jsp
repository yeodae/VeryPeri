<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">

<style>
 font-family: "a타이틀고딕1";
        src: url("../../../font/a타이틀고딕1.ttf") format("truetype");
    }
    
    *{
       font-family: a타이틀고딕1;
    }

.icon {
float : right;
margin-left :30px;
}

.mark{

transform: translate(50%, -50%);
}
* {
	margin: 0;
	padding: 0;
}

img, area {
	border: 0;
	outline: none;
}

ul, ol, li {
	list-style: none;
}

a {
	color: rgb(138, 138, 138);
	text-decoration: none;
} 
body{ font-family:Graduate, Kelly Slab, Aldrich;/*OCR A Std, arial;*/ font-size:1.5em; color:#000;}

nav {
	width: 100%;
	height: 140px;
	position: relative;
	z-index: 9999;
}

<!--
로고 있는 부분 -->.

nav{ width:100%; height:140px;position:relative; z-index:9999;}
		.navWrap{ width:100%; height:140px; overflow:hidden; transition: all 0.6s; position:relative;}
		.navWrap:hover{ height:500px; background:rgb(245, 235, 236);}
			h1{ width:100%; height:93px; text-align:center; padding-top:12px; box-sizing:border-box;}
			hr{ width:1381px; height:1px; background:rgba(255,255,255,0.8); text-align:center; margin-left:257px; border:none;}
			
nav .menu {
	font-weight : bold;
	width: 1230px;
	margin: 0 auto;
	height: 43px;
}

nav .menu a {
	color: 000000;
}


/* 간격 조정 */
nav .menu>li {
	width: 105px;
	float: left;
	margin-right: 40px;
	height: 43px;
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
	line-height: 43px;
}

nav .menu .depths {
	position: absolute;
}

nav .menu .depths li {
	width: 200px;
}

nav .menu .depths li a {
	font-size: 1rem;
	line-height: 38px;
}

nav .menu .depths li:hover a {
	color: #6fd7ff;
}

.ban {
	position: absolute;
	top: 140px;
	right: 0px;
	z-index: 9998;
}

header {
	width: 100%;
	height: 703px;
	color: #fff;
	overflow: hidden;
}

header #container1 {
	position: absolute;
	top: 0px;
}
</style>
<!-- Start HEAD section -->
<link rel="stylesheet" type="text/css" href="engine1/style.css" />
<script type="text/javascript" src="engine1/jquery.js"></script>
<!-- End HEAD section -->
</head>

<body>


		<nav>
			<div class="navWrap">
				
<div class="mark"><a href="#"><img src="img/head_logo.png" alt="" /></a></div>
				<hr>

				<ul class="menu">
					<li><a href="#">ARTIST</a>
						<ul class="depths">
							<li><a href="#">BTS</a></li>
							<li><a href="#">LE SSERAFIM</a></li>
							<li><a href="#">SEVENTEEN</a></li>
							<li><a href="#">fromis_9</a></li>
							<li><a href="#">TXT</a></li>
							<li><a href="#">NewJeans</a></li>
							<li><a href="#">ENHYPEN</a></li>
							<li><a href="#">BOYNEXTDOOR</a></li>
							<li><a href="#">ZICO</a></li>
						</ul>
					</li>
						
						
					<li><a href="#">PRODUCT</a>
						<ul class="depths">
							<li><a href="#">MEMBERSHIP</a></li>
							<li><a href="#">ALBUM</a></li>
							<li><a href="#">MERCHANDISE</a></li>
							<li><a href="#">DVD</a></li>
							<li><a href="#">PHOTO BOOK</a></li>
						</ul>
					</li>
						
						
					<li><a href="#">EVENT</a>
						<ul class="depths">
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
						</ul>
					</li>

					<li><a href="#">STORY</a>
						<ul class="depths">
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
						</ul>
					</li>							
						<div class="icon">
						<span class="icon"><a href="#"><i class="fa-solid fa-user" style="color: #8a8a8a;"></i></a></span>
						<span class="icon"><a href="#"><i class="fa-solid fa-magnifying-glass" style="color: #8a8a8a;"></i></a></span>
						<span class="icon"><a href="#"><i class="fa-solid fa-bookmark" style="color: #8a8a8a;"></i></a></span>
						</div>
						
					</ul>
					</div>
			</nav>
		



		
</body>
</html>
<script>
// 슬라이드를 자동으로 변경하는 함수
function changeSlide() {
  var currentSlide = document.querySelector('input[type="radio"]:checked');
  var nextSlide = currentSlide.nextElementSibling || document.querySelector('input[type="radio"]:first-child');
  nextSlide.checked = true;

  // 만약 5번째 슬라이드일 경우, 1번째 슬라이드로 자동으로 변경
  if (currentSlide.id === 'slide5') {
    document.querySelector('#slide1').checked = true;
  }
}

// 페이지가 로드되면 슬라이더 타이머를 시작
document.addEventListener('DOMContentLoaded', function() {
  setInterval(changeSlide, 3000); // 3000 밀리초 = 3초
});
	
</script>