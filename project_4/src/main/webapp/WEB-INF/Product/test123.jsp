<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <link href="../css/ProductPag.css" rel="stylesheet" type="text/css">
  <link href="../css/header.css" rel="stylesheet" type="text/css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="../js/jquery.js"></script>  
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
  <meta charset="UTF-8">
  <title>상품 페이지</title>
  <style type="text/css">
  .nonMember{
  margin: 0px 10px;
  }
  .login_loginout{  
  	color : #8a8a8a;
  	text-align: right;
  }
  #login{
  margin-top :15px;
  }
  #header.fixed{
  position: fixed; 
  left: 50%;
  width: 100%;
  z-index: 1;
  transform: translateX(-50%);
  transition: top 1s ease;
  background-color: rgba(255, 255, 255);
  }
#header{
	margin-bottom: 20px;
	width: 100%;
}
  .nonMember{
         font-family: "a타이틀고딕1";
        src: url("../../../font/a타이틀고딕1.ttf") format("truetype");
    }
    
    *{
       font-family: a타이틀고딕1;
    }
  </style>
</head>
<body>

<div id="app">

   <div id="wrap">
        <div id="container">
        <div id="login">
        <div class="login_loginout"><span class="nonMember">로그인</span>  |  <span class="nonMember">회원가입</span></div>
        <div class="login_loginout" v-if="false"> 로그아웃</div>
        </div>
            <div id="header" >

                <%@ include file="hd.jsp" %>

            </div>

            <div class="slide_wrapper_main">
                <div class="slide_wrapper">
                    <ul class="slides">
                      <li ><img src="https://cdn.topstarnews.net/news/photo/first/201604/img_192402_1.jpg"></li>
                      <li ><img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FyPLo3%2Fbtrz6qShOq3%2FIa3mcJQ7WPrIApAN3ZlH70%2Fimg.jpg"></li>
                      <li ><img src="https://cdn.eyesmag.com/content/uploads/sliderImages/2022/07/22/NEW-JEANS-01-94cfa2f0-0e0e-493a-a811-07d3db1fa6d5.jpg"></li>
                      <li ><img src="https://blog.kakaocdn.net/dn/SbnII/btqEMwrZGyP/qsc0F50OjuXal84GGGP1ek/img.png"></li>

                </div>
                <p class="controls">
                <a class="next_prev" href="Javascript:;"><i class="fa-solid fa-chevron-left fa-2xl prev"></i></a>
                  <button class="button1 button"></button>
                  <button class="button2 button"></button>
                  <button class="button3 button"></button>
                  <button class="button4 button"></button>
                  <a class="next_prev" href="Javascript:;"><i class="fa-solid fa-chevron-right fa-2xl next"></i></a>
              </p>
            </div>
            <div class="body" style="margin-top: 80px;">
                <select class="select">
                    <option>최신순</option>
                    <option>상품명</option>
                    <option>낮은가격</option>
                    <option>높은가격</option>
                </select>
                <div class="body2" style=" width: 198px; height: 600px;" >

                    <div id="CategoryTitle" class="CategoryTitle"> PRODUCT</div>


                      <div class="menu">
                            <a class="aTitle" href="Javascript:;">MUSIC</a>
                            <ul class="sub">
                                <li><a href="Javascript:;">CD</a></li>
                                <li><a href="Javascript:;">DVD</a></li>
                                <li><a href="Javascript:;">etc.</a></li>
                            </ul>
                     </div>

                     <div class="menu2">
                        <a class="aTitle" href="Javascript:;">PHOTO</a>
                        <ul class="sub2">
                            <li><a href="Javascript:;">Printed</a></li>
                            <li><a href="Javascript:;">Photo Book</a></li>
                        </ul>
                 </div>

                 <div class="menu3">
                    <a class="aTitle" href="Javascript:;">CONCERT</a>
                    <ul class="sub3">
                        <li><a href="Javascript:;">Offcial Fanlight</a></li>
                        <li><a href="Javascript:;">Conert Gods</a></li>
                    </ul>
             </div>

             <div class="menu4">
                <a class="aTitle" href="Javascript:;">LIVING</a>
                <ul class="sub4">
                    <li><a href="Javascript:;">Home</a></li>
                    <li><a href="Javascript:;">Kitchen</a></li>
                    <li><a href="Javascript:;">F & B</a></li>
                    <li><a href="Javascript:;">Tech</a></li>
                    <li><a href="Javascript:;">Book</a></li>
                    <li><a href="Javascript:;">Pet</a></li>
                </ul>
         </div>


         <div class="menu5">
            <a class="aTitle" href="Javascript:;">BEAUTY</a>
            <ul class="sub5">
                <li><a href="Javascript:;">Skin Care</a></li>
                <li><a href="Javascript:;">Make UP</a></li>
                <li><a href="Javascript:;">Cleansing</a></li>
                <li><a href="Javascript:;">Body & Hair</a></li>
                <li><a href="Javascript:;">Pack & masks</a></li>
                <li><a href="Javascript:;">Perfume</a></li>
                <li><a href="Javascript:;">Tool</a></li>
                <li><a href="Javascript:;">Men's</a></li>
            </ul>
     </div>

     <div class="menu6">
        <a class="aTitle" href="Javascript:;">STATIONERY</a>
        <ul class="sub6">
            <li><a href="Javascript:;">Note</a></li>
            <li><a href="Javascript:;">Office</a></li>
            <li><a href="Javascript:;">Pen</a></li>
            <li><a href="Javascript:;">Deco</a></li>
            <li><a href="Javascript:;">Binder</a></li>
            <li><a href="Javascript:;">Toy</a></li>
        </ul>
 </div>

            <div class="menu7">
                <a class="aTitle" href="Javascript:;">FASHION</a>
                <ul class="sub7">
                    <li><a href="Javascript:;">Clothing</a></li>
                    <li><a href="Javascript:;">Acc</a></li>
                    <li><a href="Javascript:;">jewelry</a></li>
                </ul>
            </div>

            <div class="menu8">
            <a class="aTitle" href="Javascript:;">CUSTOMIZING</a>
            <ul class="sub8">
                <li><a href="Javascript:;">Phone Case</a></li>
                <li><a href="Javascript:;">Fashion</a></li>
                <li><a href="Javascript:;">Acc</a></li>
            </ul>
            </div>



                </div>

                <div class="body2 " style=" width: 1000px; height: 2000px;">

                   <div v-for="index in 10" :key="index">
                    <div class="magin body2" style="width: 300px; height: 400px; border: 1px solid black;">

                    </div>
                   </div> 

                </div>

            </div>        
        </div>
    </div>

</div>

</body>
</html>
<script type="text/javascript">
var app = new Vue({
    el: '#app',
    data: {
    	
    },
    methods: {
      
    },
    created: function() {
      var self = this;
      // Vue.js 코드 작성 가능
    }
  });
var lnb = $("#header").offset().top;
$(window).scroll(function() {
    var window = $(this).scrollTop();
    if(lnb <= window) {
        $("#header").addClass("fixed");
        $("#header").css("top", "0"); // 스크롤 내릴 때 애니메이션 효과
    } else {
        $("#header").removeClass("fixed");
        $("#header").css("top", "-100px"); // 스크롤 올릴 때 애니메이션 효과
    }
});
var lnb = $("#header").offset().top;
$(window).scroll(function() {
  	var window = $(this).scrollTop();
    if(lnb <= window) {
      $("#header").addClass("fixed");
    } else {
      $("#header").removeClass("fixed");
    }
})
let subToggle=true;
$(".menu").click(()=>{
if(subToggle){
  $(".sub").slideDown(500);
}else{
  $(".sub").slideUp(1000);
}
subToggle=!subToggle;
});
$(".menu2").click(()=>{
if(subToggle){
  $(".sub2").slideDown(500);
}else{
  $(".sub2").slideUp(1000);
}
subToggle=!subToggle;
});
$(".menu3").click(()=>{
if(subToggle){
  $(".sub3").slideDown(500);
}else{
  $(".sub3").slideUp(1000);
}
subToggle=!subToggle;
});
$(".menu4").click(()=>{
if(subToggle){
  $(".sub4").slideDown(500);
}else{
  $(".sub4").slideUp(1000);
}
subToggle=!subToggle;
});
$(".menu5").click(()=>{
if(subToggle){
  $(".sub5").slideDown(500);
}else{
  $(".sub5").slideUp(1000);
}
subToggle=!subToggle;
});
$(".menu6").click(()=>{
if(subToggle){
  $(".sub6").slideDown(500);
}else{
  $(".sub6").slideUp(1000);
}
subToggle=!subToggle;
});
$(".menu7").click(()=>{
if(subToggle){
  $(".sub7").slideDown(500);
}else{
  $(".sub7").slideUp(1000);
}
subToggle=!subToggle;
});
$(".menu8").click(()=>{
if(subToggle){
  $(".sub8").slideDown(500);
}else{
  $(".sub8").slideUp(1000);
}
subToggle=!subToggle;
});
var slides = document.querySelector('.slides'), 
    slide = document.querySelectorAll('.slides li'),  //모든 슬라이드 선택 
    currentIdx = 0, //슬라이드 이동
    slideCount = slide.length, //슬라이드 겟수
    slideWidth = 1200, // 슬라이드 너비
    slideMargin = 0, // 마진
    prevBtn = document.querySelector('.prev'), // 좌우 버튼
    nextBtn = document.querySelector('.next'); // 좌우 버튼
    
makeClone();
function makeClone(){
  for(var i = 0; i<slideCount; i++){
    // a.cloneNode() a요소 복사  
    // a.cloneNode(true) a의 자식요소 복사 
    var cloneSlide = slide[i].cloneNode(true);
    cloneSlide.classList.add('clone');
    //a.appendChild(b) a에다가 b를 추가 
    slides.appendChild(cloneSlide); // ul 복사본 뒤에다 추가
  }
  for(var i = slideCount -1; i>=0; i--){
    //a.prepend(b) 앞에 추가
    var cloneSlide = slide[i].cloneNode(true);
    cloneSlide.classList.add('clone');
    //a.prepend(b) a앞에다 추가 
    slides.prepend(cloneSlide); // ul 복사본 뒤에다 추가      
  }
  updateWidth();
  setInitialpos();
  setTimeout(function(){
    slides.classList.add('animated');
  },100);  
}
function updateWidth(){
  var currentSlides = document.querySelectorAll('.slides li');
  var newSlideCount = currentSlides.length;
  var newWidth = (slideWidth + slideMargin) * newSlideCount - slideMargin + 'px';
  slides.style.width = newWidth;
}
function setInitialpos(){
  var initialTranslateValue = -(slideWidth + slideMargin) * slideCount; // SlideCount를 slideCount로 수정
  //slides {transform:translateX(-1000px);}
  slides.style.transform = 'translateX('+ initialTranslateValue +'px)';
}
nextBtn.addEventListener('click', function(){
  moveSlide(currentIdx + 1);
})
prevBtn.addEventListener('click', function(){
  moveSlide(currentIdx - 1);
})
function moveSlide(num){ // unm을 num으로 수정
slides.style.left= -num * (slideWidth + slideMargin) +'px'; // sleft를 left로 수정
currentIdx = num;
if(currentIdx == slideCount || currentIdx == -slideCount){
  setTimeout(function(){
      slides.classList.remove('animated');
      slides.style.left = '0px'; // lift를 left로 수정
      currentIdx = 0;
  },500);
  
  setTimeout(function(){
      slides.classList.add('animated');
  },600);
}  
}
//clearInterval(timer);
var timer = undefined;
function autoSlide(){
if(timer == undefined){
  timer = setInterval(function(){
    moveSlide(currentIdx + 1 );
  },3000);
}
}
autoSlide();
function stopSlide(){
clearInterval(timer);   
timer = undefined;
}
slides.addEventListener('mouseenter', function(){
stopSlide();
});
slides.addEventListener('mouseleave', function(){
autoSlide();
});
const buttons = document.querySelectorAll('.controls button');
for (let i = 0; i < buttons.length; i++) {
  buttons[i].addEventListener('click', function() {
      moveSlide(i);
      updateButtonColor(i);
  });
}
//버튼 색상을 업데이트하는 함수입니다.
function updateButtonColor(selectedIndex) {
  // 모든 버튼 요소를 선택합니다.
  const allButtons = document.querySelectorAll('.controls button');
  
  // 모든 버튼을 순회하면서 선택된 버튼에 해당하는 색상을 변경하고, 나머지 버튼은 원래 색상으로 변경합니다.
  for (let i = 0; i < allButtons.length; i++) {
      if (i === selectedIndex) {
          // 선택된 버튼의 색상을 변경합니다.
          allButtons[i].style.backgroundColor = '#3838388f';
      } else {
          // 선택되지 않은 버튼의 색상을 원래 색상으로 변경합니다.
          allButtons[i].style.backgroundColor = '#acacac8f';
      }
  }
}
function moveSlide(num) {
      slides.style.left = -num * (slideWidth + slideMargin) + 'px';
      currentIdx = num;
      if (currentIdx === slideCount || currentIdx === -slideCount) {
          setTimeout(function () {
              slides.classList.remove('animated');
              slides.style.left = '0px';
              currentIdx = 0;
          }, 500);
          setTimeout(function () {
              slides.classList.add('animated');
              updateButtonColor(currentIdx); // 추가
          }, 600);
      } else {
          updateButtonColor(currentIdx); // 추가
      }
  }
</script>