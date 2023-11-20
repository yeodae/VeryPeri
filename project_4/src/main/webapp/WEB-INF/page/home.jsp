<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>VERY & PERI</title>
<link href="../css/footer.css" rel="stylesheet" type="text/css">

<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
<%@ include file="../Product/sexyheader.jsp" %>

<style>

.popup{
z-index: -111;}
#app{
	height: 6800px;
}
* {
    padding: 0;
    margin: 0;
    box-sizing: border-box;
}

a {
    text-decoration: none;
}

* #footer {
 margin-top: auto;
  left: 0;
  position: relative;
  bottom:-10px;
  width: 100%;
   z-index: 100; /* 푸터의 z-index 값을 높게 설정 */
}
.slidetext {
	font-size:2em;

	}
.dot {
    width: 12px;
    height: 12px;
    margin: 10px 5px;
    background-color: #bbb;
    border-radius: 50%;
    display: inline-block;
    transition: background-color 0.6s ease;
    position: absolute; 
    bottom: 20px;
  /*   left: 50%; 
  /*   transform: translateX(-50%);  */
}

#app{
	widows: 100%
	}

#container-color{
	margin-top: 60px;
  	justify-content:center;
	width: auto;
	height:900px;
	
	}
	
img.topimg{
	/* margin-top:100px;
	margin-bottom:100px; */
    vertical-align: middle;
	width:auto;
	height: 650px;
	position: absolute;
    left: 50%; 
    transform: translateX(-50%); 
	align-items: center;
	}
	

 #nav1, #nav2, #nav3, #nav4 {
    position: relative; 
    z-index: 1; 
}
#div3{
	position: relative; 
    z-index: 1; 
    margin-top: 50px;
	margin-bottom: 50px;
	float:left;
	width : 100%;
}
#nav1{
	margin-top:-60px;
	margin-bottom:30px;
	padding:130px;
	width: 100%;
	height:1000px;
	}

#nav2{
	widows: 1800px;
	height: 1800px;
	margin-top: 50px;
	margin-bottom: 50px;
	float:left;
}
#nav3{
	widows: 1800px;
	height: 1800px;
	margin-top: 50px;
	margin-bottom: 50px;
	float:left;

}

#nav4{
	widows: 1800px;
	height: 800px;
	margin-top: 80px;
	margin-bottom: 50px;
	float:left;
	} 

 .Sbox1 {
 	background-color:orange;
    vertical-align: middle;
	width:1500px;
	height: 1500px;
	position: absolute;
    left: 50%; 
    transform: translateX(-50%); 
	align-items: center;
	flex-wrap: wrap;
	padding:50px;
} 


.productList {
 	height:320px;
  	width: 230px;
  	position : relative;
  	text-align: center;
   	box-shadow:  0 10px 20px  rgba(0, 0, 0, 0.5); 
  	font-size : 16px;
   	border-radius : 10px;
   
}
.productList:hover{
	cursor:pointer;
}

.productList-container {
  content-align: center;
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  width: 100%;
  margin: 0 -10px;
   left: 50%; 
    transform: translateX(-50%); 
}

.productList:hover .sub {
	position: absolute;
	bottom: 0px;
	opacity: 1;
} 

.sect2 {
	padding: 50px;
	widows: 1800px;
	height: 1800px;
	display: flex;
 	flex-wrap: wrap;
  	width: 100%; 
  	length: 1000px;
}

.sect2name {
	font-size:70px;
	margin-top:0px;
	height: 100px;
	width:300px;
	display: relative; 
	width: 100%;
	justify-content: center;
	text-align: center; 
	text-shadow: 0 0 .1em, 0 0 .3em skyblue; 
}

.sect2 div {
	float: left;
	margin-right:10px;
	margin:20px;
	
}


 
.sect2 div:hover a {
	opacity: 1;
	
}

.sect2 div .sub {
	position: absolute;
	bottom: -100px;
	width: 230px;
	height: 140px;
	background: rgba(45,47,67,0.8);
	/* text-shadow: 0 5px 5px  rgba(199,225,50, 1); */
	color:white;
	line-height: 25pt;
	font-family: arial;
	font-size: 15pt;
	text-align: left;
	padding-left: 11px;
	box-sizing: border-box;
	opacity: 0;
	transition: all 1s;
	border-radius : 0px 0px 10px 10px;
}



.sect2 div .sub .sname {
	font-size: 13px;
	font-weight: lighter;
	box-sizing: border-box;
	text-align: left;
 	height: 30px;
    margin-top: 20px;
    color:grey;
}
.sub li {
	height : 50px;
	line-height: 20px;
}



.sect3 {
	padding: 50px;
	widows: 1800px;
	height: 1800px;
	display: flex;
 	flex-wrap: wrap;
  	width: 100%; 
  	length: 1000px;
  
}

.sect3name {
	font-size:70px;
	margin-top:0px;
	height: 100px;
	width:300px;
	display: relative; 
	width: 100%;
	justify-content: center;
	text-align: center; 
	text-shadow: 0 0 .1em, 0 0 .3em red; 
}

.sect3 div {
	float: left;
	margin-right:10px;
	margin:20px;
	
}


 
.sect3 div:hover a {
	opacity: 1;
}

.sect3 div .sub {
	position: absolute;
	bottom: -100px;
	width: 230px;
	height: 140px;
	background: rgba(45,47,67,0.8);
	/* text-shadow: 0 5px 5px  rgba(199,225,50, 1); */
	color:white;
	line-height: 25pt;
	font-family: arial;
	font-size: 15pt;
	text-align: left;
	padding-left: 11px;
	box-sizing: border-box;
	opacity: 0;
	transition: all 1s;
	border-radius : 0px 0px 10px 10px;
	}



.sect3 div .sub .sname {
	font-size: 13px;
	font-weight: lighter;
	box-sizing: border-box;
	text-align: left;
/*	text-decoration: none;
	transition: 1s; */
 	height: 30px;
    margin-top: 20px;
    color:grey;
    
}
.ostimg {
    display: flex;
    justify-content: center;
    align-items: center;
   	position: absolute;
	right: 50%;
	transform: translate(50%, -50%);
	width: 1665px;
	margin: 0 auto;
	margin-top: 240px;
}

.ostimg>div {
	width: 208px;
	height: 208px;
	float: left;
	margin-left: 103px;
	border-radius: 100%;
	background: #900;
	border: 5px solid #d4dafa;
}

.ostimg>div:first-child {
	margin-left: 0;
}

.ostimg .img1 {
	background: url(img/homeimg/txt_ost.gif);
	background-size: cover;
}

.ostimg .img2 {
	background: url(img/homeimg/lsf_ost.gif);
	background-size: contain;
}

.ostimg .img3 {
	background: url(img/homeimg/bts_album.gif);
	background-size: contain;
	width: 370px;
	height: 370px;
	margin-top: -100px;
}

.ostimg .img4 {
	background: url(img/homeimg/njs_ost.gif);
	background-size: cover;
}

.ostimg .img5 {
	background: url(img/homeimg/svt_ost.gif);
	background-size: cover;
}

/*SECT1- animation*/
.ostimg .img1 {
	animation: Sback 32s 4s infinite;
	transition: all 2s;
}

.ostimg .img2 {
	animation: Lback 32s 4s infinite;
	transition: all 2s;
}

.ostimg .img3 {
	animation: Hback 32s 4s infinite, Hrotate 6.6s 4s infinite;
}

.ostimg .img4 {
	animation: Dback 32s 4s infinite;
	transition: all 2s;
}

.ostimg .img5 {
	animation: Iback 32s 4s infinite;
	transition: all 2s;
}

/*SECT1- animation2*/
.sect1 .ost {
	width: 572px;
	height: 88px;
	background: no-repeat;
	margin-left: 300px;
	display:block;
	top: 74px;
	animation: ostname 32s 4s infinite;
	transition: all 2s;
}
.sect1 {
  position: relative;
  
  left: 0;
  width: 100%;
  flex-wrap: wrap;
  justify-content: center;
  align-items: center;
  height: 600px;
  background-color: #C4F5DC;
  margin-top:150px;
  margin-bottom:300px;
  padding-top:55px;
}
.sPname{
	height : 50px;
	font-size : 16px;
}
.newIssue{
	width : 100%;
	text-align : center;	
}
.newIssue h1{
	font-size : 46px;
	margin-bottom : 50px;
}
.evtList{
	width : 100%;
	background-color : #fff;
	display: flex;
	justify-content: center;
}
.evtBox img{
	width : 390px;
	height : 520px;	 
}
.evtBox p{
	
}
.evtBox img:hover {
	transition: opacity 0.35s;
	opacity: 0.8;
	cursor : pointer;
}
.evtBox p {
    bottom: 45px;
    left: 25px;
    height: 50px;
}
.overlay-container {
  position: relative;
  display: inline-block;
  width: 500px;
  margin-left : 15px;
}

.overlay-container img {
  display: block;
  width: 100%;
  height: auto;
}

.overlay-container p {
  position: absolute;
  bottom: 0;
  left: 0;
  background-color: rgba(0, 0, 0, 0.7);
  color: white;
  padding: 5px;
  width: 100%;
  margin: 0;
  text-align: center;
  font-size: 14px;
}

</style>
<!-- Start HEAD section -->
<link href="../css/mainpageslideshow.css" rel="stylesheet" type="text/css">

<!-- End HEAD section -->
</head>

<body>

	<div id="app">

		<div id="container-color">
		
			<nav id="nav1">
			
				<div class="slideshow-container">
				
					<div class="mySlides fade">		
						<div class="slidetext"></div>
				 		<img class="topimg" src="img/homeimg/boynext.jpg" >
				  
					</div>
				
						<div class="mySlides fade">
						  <div class="slidetext"></div>
				 		 <img class="topimg" src="img/homeimg/seventeen_main.jpg" >
				  
						</div>
				
					<div class="mySlides fade">
						<div class="slidetext"></div>
				 		<img class="topimg" src="img/homeimg/promiss_main.jpg">
					</div>
				</div>
			<br>
				<div style="text-align:center">
				  <span class="dot"></span> 
				  <span class="dot"></span> 
				  <span class="dot"></span> 
				</div>
			</nav>
			
		<div id="div3">
		  <div class="newIssue">
		    <div class="sect2name">NEW ISSUE</div>
		    <div class="evtList">
		      <div class="evtBox" v-for="(item, index) in evt.slice(0, 3)" :key="index">
		        <div class="overlay-container">
		          <img :src="item.thumbnail" @click="evtInfo(item)">
		          <p>{{ item.aTitle }}</p>
		        </div>
		      </div>
		    </div>
		  </div>
		</div>
			
			
<nav id="nav2">

  <section class="sect2">
   
     <div class="Sbox1">
     <div class="sect2name"><a href="newitem.do">NEW ARRIVAL</a></div>
    <!--   <p class="more"><a href="#">MORE</a></p> -->
     
       <div @click="productView(item)" v-for="(item, index) in list" class="productList" :key="index" style="border:0; margin-bottom:50px;" >
          <img :src="item.path" class="productList" style="margin : 0px;">
          <!-- <div style="font-weight :bold; font-size:18px; ">{{ item.pName }}</div> -->
          
            <ul class="sub">
              <li class="sname">[{{item.category}}]{{item.artist}}</li>
              <li class="sPname">{{item.pName}}</li>
              <li>₩<strong>{{ item.price | formatPrice }}</strong></li>
            </ul>
           
          </div>
        </div>
      </section>
	</nav>
		
		
		<nav id="nav3">
		
		  <section class="sect3">
		      <div class="Sbox1">
      <div class="sect3name" style="font-shadow:0 0 50px; rgb(255,255,255, 0.5)"><a href="newitem.do">BEST ITEM</a></div>
         
         <div @click="productView(zz)" v-for="(zz, index) in best" class="productList" :key="index" style="border:0; margin-bottom:50px;" >
         <img :src="zz.path" class="productList" style="margin :0px;"  >
          <!-- <div style= "font-weight :bold; font-size:18px;">{{ zz.pName }}</div> -->
            <ul class="sub">
              <li class="sname">[{{zz.category}}]{{zz.artist}}</li>
              <li class="sPname">{{zz.pName}}</li>
              <li>₩<strong>{{ zz.price | formatPrice }}</strong></li>
            </ul>
           
          </div>
        </div>
      </section>
	</nav>
		
		
		      <nav id="nav4">
      <section class="sect1">
      <div class="sect2name">NEW SONG</div>
         <div class="ostimg">
            <div class="img1" @click="playAudio('audio1', 60)"></div> <!-- TXT - 어느날 머리에서 뿔이 자랐다 -->
            <div class="img2" @click="playAudio('audio2', 60)"></div> <!-- LE SSERAFIM - UNFORGIVEN -->
            <div class="img3" @click="playAudio('audio3', 60)"></div> <!-- BTS - Butter -->
            <div class="img4" @click="playAudio('audio4', 60)"></div> <!-- NewJeans- Super Shy -->
            <div class="img5" @click="playAudio('audio5', 60)"></div> <!-- SEVENTEEN - 손오공 -->
         </div>
         
         <audio id="audio1">
             <source src="../audio/TXT - 어느날 머리에서 뿔이 자랐다.mp3"> <!-- TXT - 어느날 머리에서 뿔이 자랐다 -->
         </audio>
         <audio id="audio2">
             <source src="../audio/LE SSERAFIM - UNFORGIVEN.mp3"><!-- LE SSERAFIM - UNFORGIVEN -->
         </audio>
         <audio id="audio3">
             <source src="../audio/BTS -  Butter.mp3"><!-- BTS -  Butter -->
         </audio>
         <audio id="audio4">
             <source src="../audio/NewJeans- Super Shy.mp3"> <!-- NewJeans- Super Shy -->
         </audio>
         <audio id="audio5">
             <source src="../audio/SEVENTEEN - 손오공.mp3"> <!-- SEVENTEEN - 손오공 -->
         </audio>

      </section>
      
      </nav>

   </div> 
     
</div> <!-- app div -->
<%@ include file="footer.jsp" %>
</body>
 
</html>
<script>
Vue.filter('formatPrice', function(value) {
	  if (typeof value !== 'number') {
	    return value;
	  }
	  const formatter = new Intl.NumberFormat('en-US');
	  return formatter.format(value);
	});
	
		
var app = new Vue({
   el : '#app',
   data : {
      uId : "${sessionId}",
      list : [],
      info : {},
      best : [],
      evt : [],
    currentAudio: null 
   }, 
   
   methods : {
      playAudio(audioId, durationInSeconds) {
           var audio = document.getElementById(audioId);

           if (this.currentAudio === audio && !audio.paused) {
             // 동일한 오디오 요소를 눌렀고, 현재 재생 중인 경우에는 일시정지
             audio.pause();
             audio.currentTime = 0;
             clearTimeout(this.audioTimer);
           } else {
             if (this.currentAudio && !this.currentAudio.paused) {
               // 다른 오디오 요소가 재생 중인 경우에는 일시정지
               this.currentAudio.pause();
               this.currentAudio.currentTime = 0;
               clearTimeout(this.audioTimer);
             }

             audio.play();

             // 기존 타이머 제거
             clearTimeout(this.audioTimer);

             this.audioTimer = setTimeout(function () {
               audio.pause();
               audio.currentTime = 0;
             }, durationInSeconds * 1000);
           }

           this.currentAudio = audio; // 현재 재생 중인 오디오 요소 저장
         },

         stopAllAudio() {
           if (this.currentAudio && !this.currentAudio.paused) {
             this.currentAudio.pause();
             this.currentAudio.currentTime = 0;
             clearTimeout(this.audioTimer);
           }
         },
     
     fnGetList() { 
        var self = this;
        var nparmap = {uId: self.uId};            
        $.ajax({
           url: "/home3.dox",
           dataType: "json",
           type: "POST",
           data: nparmap,
           success(data) {                  
              self.list = data.list;
           }
        });
     },

     fnBestItem() { 
        var self = this;
        var nparmap = {uId: self.uId};            
        $.ajax({
          url: "/bestItemLoad.dox",
          dataType: "json",
          type: "POST",
          data: nparmap,
          success(data) {                  
            self.best = data.list;
          }
       });
    },
    
    productView(item) {
    	var self = this;
        $.pageChange("/product/productView.do", {pNo : item.pNo});
    },
    evtInfo : function(item){
    	var popWidth = 840;
        var popHeight = 1000;
        // 화면 정 중앙에 띄우기 위한 변수
        var screenWidth = window.screen.width;
        var screenHeight = window.screen.height;
        
        var left = (screenWidth - popWidth) / 2;
        var top = ((screenHeight - popHeight) / 2) - 100; // 세로 높이는 정 중앙보다 조금 높은 위치에 띄우기 위해 -100 하였다.
        
        var popSize = "width=" + popWidth + ", height=" + popHeight + ", top=" + top + ", left=" + left;
        
        window.open("/event/eventpageView.do?aNo=" + item.aNo, "request", popSize);
    },
    EventList : function(){
        var self = this;
        var nparmap = {};
        $.ajax({
            url : "/event/list4.dox",
            dataType:"json",	
            type : "POST", 
            data : nparmap,
            success : function(data) { 
            	self.evt = data.list;            	  	
            }
        }); 
    },
  },
   
   created() {
      var self = this;
      self.fnGetList();
      self.fnBestItem();
      self.EventList();

   }
});

var slideIndex = 0;
var slides = document.getElementsByClassName("mySlides"); 
var gradientColors = [ 'linear-gradient(to bottom, #e5cfff, #8fd6ff, #d8ff8f)',
                   'linear-gradient(to bottom, #f0c3ff, #8fffd8, #ffb38f)',
                   'linear-gradient(to bottom, #e5cfff, #8fd6ff, #d8ff8f)']

function showSlides() {
    var i;
    var dots = document.getElementsByClassName("dot");
    var container = document.getElementById("container-color");
    
    for (i = 0; i < slides.length; i++) {
       slides[i].style.display = "none";  
    }
    slideIndex++;
    if (slideIndex > slides.length) {slideIndex = 1}    
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex-1].style.display = "block";  
    dots[slideIndex-1].className += " active";
    
    var gradient = gradientColors[slideIndex % gradientColors.length];
    container.style.background = gradient;
    
    setTimeout(showSlides, 5000); // Change image every 2 seconds
}
showSlides(); 
</script>