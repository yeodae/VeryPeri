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
	  updateWidth(); // 이 부분을 추가하여 width를 업데이트합니다.
	  
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
console.log(currentIdx, slideCount);

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
console.log(timer);
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

