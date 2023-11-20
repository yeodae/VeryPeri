var footer = document.getElementById("footer");

window.onscroll = function() {
  var scrollBottom = document.body.scrollHeight - window.innerHeight - window.scrollY;

  if (scrollBottom <= footer.offsetHeight) {
    // 스크롤이 맨 아래 위치할 때부터 footer가 보이도록
    footer.style.bottom = "0";
    footer.style.opacity = "1";
    footer.style.transition = "opacity 3s ease"; // 그라데이션 효과 추가
  } else {
    // 스크롤이 맨 아래가 아닐 때
    footer.style.bottom = "-450px"; // 또는 숨길 높이 값으로 조정
    footer.style.opacity = "0";
    footer.style.transition = "opacity 3s ease"; // 그라데이션 효과 추가
  }
};