<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>Periwinkle</title>
<style>
	@font-face {
    	font-family: "a타이틀고딕2";
        src: url("../../../font/A타이틀고딕2.TTF") format("truetype");
    }
    
    *{
    	font-family: a타이틀고딕2;
    }
   body{
   background-color:#d4d5d9;
      width : 500px;
      margin : 10px auto;
   }
   ul, li{
      text-decoration : none;
      list-style : none;   
   }
   .feedType{
      width: 300px;
      height: 200px;
       display: inline-block; 
   }
    .feedType > div {
       width: 300px;
      height: 200px;
       position: relative; 
         display: inline-block; 
       border: 1px solid tomato;
       padding: 32px;
       margin: 10px; 
       vertical-align: top; 
       box-sizing: border-box; 
     }
   .container{
      width: 500px;      
      padding: 32px;
      background-color:white;
      border-radius: 10px;
   }
   a{
        text-decoration: none;
        color: inherit;
   }
   .write{
         width: 300px;
      height: 100px;
      padding: 32px;
   }
   
   .container > ul{
        background-color: #eee;
        border-radius: 10px;
   }
   
  .profile-image {
      width: 50px; /* 원하는 이미지 크기 조절 */
      height: 50px;
      border : 1px solid #BB91E7;
      border-radius: 50%; /* 50%로 설정하여 동그라미 모양으로 자름 */
      }
      
      hr{
          border: none; /* 기본 테두리 제거 */
           height: 2px; /* 높이 설정 */
           background: linear-gradient(to right, #BB91E7, #F2DAED); /* 그라디언트 배경 설정 */
           margin: 20px 0; /* 위아래 마진 설정 */
      }
      .image{
         border : none;
         width : 300px;
         height : 300px;
      }
      .imageX{
         display: none;
      }
</style>
</head>
<body>
<div id="app">
    
    <div class="container">
        <ul v-for="item in list" v-if="item.gBanYN < 5 && item.gDelYN != 'Y'">
            <li>{{item.artist}}</li>
            <li>{{item.nickName}}</li>
           <li>
           		<img :src = "item.gpPath" class="profile-image" v-if="item.gpPath != null && item.gpPath != ''">
           		<img src ="../img/logo/profileImg.jpg"class="profile-image" v-else />
           </li>
            <li>{{item.gDate}}</li>
            <li>{{item.gContent}}</li>
            <li><span @click="fnLike(item.gNo)"><a href="javascript:" style="color: rgb(179, 179, 255);">LIKE ♥</a></span>{{item.gLike}}</li>
            <li class="clickThis"><span @click="reportPost1(item.gNo)" v-if="item.gArtist != 'Y'"><a href="javascript:">신고🚨<a></span></li>
            
            <li class="clickThis">
            	<img v-if="item.path" :src="item.path" class="image" />
            	<img v-else class="imageX" />
            </li>
            <li> 
                <!-- v-if="cUser == item.cUser && item.delYn == 'N' || status == 'A'" v-model="item.gNo" -->
            </li>
        </ul>
        <hr>
        <button @click = "fnReload">새로 고침</button>

	<!-- 댓글 -->
        <ul v-for="item in commentList" v-if="item.gcDelYN !== 'Y'">
            <li>{{item.nickName}}</li>
           <li>
           		<img :src = "item.gpPath" class="profile-image" v-if="item.gpPath != null && item.gpPath != ''">
           		<img src ="../img/logo/profileImg.jpg"class="profile-image" v-else />
           </li>
            <li>{{item.gcDate}}</li>
            <li>{{item.gcContent}}</li>
            <li @click="fnCommnetLike(item.gcNo)"><span class="clickThis"><a href="javascript:" style="color: rgb(179, 179, 255);">LIKE ♥ </a>{{item.gcLike}}</span></li>
            <li>
            	<span class="clickThis" @click="reportPost2(item.gcNo)" v-if="item.gcArtist != 'Y'"><a href="javascript:">신고🚨<a></span>
           		<div class="clickThis" @click="fnRemove(item.gcNo)" v-if="uId == item.uId || uId =='admin'"><span><a href="javascript:">삭제✖</a></span></div>
            </li>
            <li>
               <div><span @click="fnCoCommentView(item.gcNo)" ><a href="javascript:">댓글✉</a></span><div>
               
       <!-- 대댓글  -->        
               <ul v-for ="citem in cocommentList" v-if="citem.gcDelYN !== 'Y' && citem.gcGroup == item.gcNo">
                  <li>{{citem.nickName}}</li>
                   <li>
                   		<img :src = "citem.gpPath" class="profile-image" v-if="citem.gpPath != null && citem.gpPath != ''">
                   		<img src ="../img/logo/profileImg.jpg"class="profile-image" v-else />
                   </li>
                  <li>{{citem.gcDate}}</li>
                  <li>{{citem.gcContent}}</li>   
	              <li><span class="clickThis" @click="fnCommnetLike(citem.gcNo, item.gcNo)"><a href="javascript:" style="color: rgb(179, 179, 255);">LIKE ♥ </a>{{citem.gLike}}</span></li>
                  <li><span @click="fnCommnetLike(citem.gcNo, item.gcNo)"><a href="javascript:" style="color: rgb(179, 179, 255);">LIKE ♥ </a>{{citem.gcLike}}</span></li>
                  <li><button @click="reportPost2(citem.gcNo)">신고</button></li>
                  <li>
                     	<span @click="reportPost2(citem.gcNo)" v-if="citem.gcArtist != 'Y'"><a href="javascript:">신고🚨<a></span>
                        <div class="clickThis" @click="fnCocoRemove(citem.gcNo)" v-if="uId == citem.uId || uId =='admin'"><span><a href="javascript:">삭제✖</a></span></div>
                  </li>
               
               </ul>
               <div><button @click="fnReload" v-if="reload">닫기</button></div>
             	<textarea rows="5" cols="30" v-model="cocomment" ></textarea>
               <button @click="fnCoComment(item)" >등록</button>
               
            </li>
               
        </ul>
        <hr>
    <div class="write">
        <textarea rows="5" cols="30" v-model="comment"></textarea>
        <button @click="fnCommentAdd">댓글 등록</button>
    </div>
    </div><!-- /컨테이너 div -->
    <button @click="fnMove">닫기</button>
</div>
</body>
</html>
<script>
var app = new Vue({
    el: '#app',
    data: {
        list: [],
        uId: "${sessionId}",
        comment: "",
        artist: "SVT",
        commentList : [],
        gNo : "${map.gNo}",
        cocomment : "",
        cocommentList : [],
        reload : false,
        selectedReason: "",
        otherReason: "",
        reportDescription: "",
        
    },// data
    methods: {
        fnGetList: function () {
             var self = this;
             var nparmap = { artist: self.artist, gNo : self.gNo };
             $.ajax({
                 url: "list.dox",
                 dataType: "json",
                 type: "POST",
                 data: nparmap,
                 success: function (data) {
                     self.list = data.list;
                 }
             });
         },
        fnGetCnt: function () {
             var self = this;
             var nparmap = {gNo : self.gNo };
             $.ajax({
                 url: "list.dox",
                 dataType: "json",
                 type: "POST",
                 data: nparmap,
                 success: function (data) {
                     self.list = data.list;
                 }
             });
         },
        fnGetComments: function () {
            var self = this;
            var nparmap = { artist: self.artist, gNo : self.gNo };
            $.ajax({
                url: "commentList.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
                    self.commentList = data.commentList;
                }
            });
        },
        fnCommentAdd: function () {
            var self = this;
            if(!self.comment){
            	  alert("내용을 입력해주세요.");
                  return;
            }
            
            if (self.comment.length > 500) {
                alert("500자까지만 입력 가능합니다.");
                return;
            }
            
            var nparmap = { comment: self.comment, artist: self.artist, uId : self.uId, gNo : self.gNo, artist : self.artist };
			
            $.ajax({
                url: "addComment.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
                    alert("등록되었어요.");
                    self.comment = "";
                    self.fnGetComments();
                }
            });
        },
        fnRemove: function (gcNo) {
            var self = this;
            if (!confirm("삭제하시겠어요?")) {
                return;
            }
            var nparmap = { gcNo: gcNo };
            $.ajax({
                url: "commentRemove.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
                    alert("삭제되었습니다.");
                    self.fnGetComments();
                }
            });
        },
        fnMove: function () {
           window.close();
        
        },fnLike: function(gNo) {
            var self = this;
            var nparmap = {artist : self.artist, gNo: gNo, uId : self.uId};
            $.ajax({
                url: "like.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
                   self.fnGetList();
                }
            });
            
        }, fnCommnetLike : function(gcNo, gcGroup) {
            var self = this;
            var nparmap = {artist : self.artist, gcNo: gcNo, uId : self.uId};
            $.ajax({
                url: "commentLike.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
                   self.fnGetComments();
                   self.fnCoCommentView(gcGroup);
                }
            });
            
        }, fnCoCommentView : function(gcNo) {
            var self = this;
            var nparmap = { gcNo: gcNo,  artist: self.artist };
            $.ajax({
                url: "cocommentList.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
                    self.cocommentList = data.cocommentList;
                    self.reload = true;
                }
            });
            
        }, fnCoComment: function(item) {
            var self = this;
	            if(!self.cocomment){
	          	  alert("내용을 입력해주세요.");
	                return;
	          }
	          
	          if (self.cocomment.length > 500) {
	              alert("500자까지만 입력 가능합니다.");
	              return;
	          }
	            
	          if(self.uId == null || self.uId == ''){
	                alert("로그인 해주세요.");
	                location.href = "main.do";
	          }
	            
	            var nparmap = { artist: self.artist, gcNo: item.gcNo, uId: self.uId, cocomment: self.cocomment };
            
            $.ajax({
                url: "cocomment.dox",
                dataType: "json",   
                type: "POST",
                data: nparmap,
                success: function (data) {
                	self.cocomment = "";
                   location.reload();
                }
            });
            
        }, fnCocoRemove : function(gcNo) {
            var self = this;
            var nparmap = { gcNo: gcNo, uId: self.uId};
            
            if(!confirm("삭제하시겠습니까?")){
               return;
            }
            
            if(self.uId == null || self.uId == ''){
                alert("로그인 해주세요.");
                location.href = "main.do";
             }
 
            
            $.ajax({
                url: "cocommentRemove.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
                   alert("삭제완료");
                   self.fnCoCommentView();
                }
            });
        }, fnReload : function(){
           location.reload();
           
        }, reportPost1 : function(gNo) {
            var self = this;
            self.selectedReason = ""; // 초기화
            self.otherReason = ""; // 초기화
            self.reportDescription = ""; // 초기화
            self.showReportModal = true;
            
            var option = "width=auto,height=auto,top=100,right";
            var url = "report.do?gNo=" + gNo + "&uId=" + self.uId;
            window.open(url, "gNo", option);
          
        },  reportPost2 : function(gcNo) {
            var self = this;
            self.selectedReason = ""; // 초기화
            self.otherReason = ""; // 초기화
            self.reportDescription = ""; // 초기화
            self.showReportModal = true;
            
            var option = "width=700,height=500,top=100,right";
            var url = "report2.do?gcNo=" + gcNo + "&uId=" + self.uId;
            window.open(url, "gcNo", option);
        }
        
    }, // methods
    created: function () {
        var self = this;
        self.fnGetList();
        self.fnGetComments();
    }// created
});
</script>