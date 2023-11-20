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
      background-color:#F1E9F0;
      font-size:16px;
      width: 800px;
    }
    .eveFont {
    	font-size: 50px;
    	text-align: right;
    }
    button{
    	margin-left: 5px;
	    height: 30px;
	    border-radius: 10px;
	    border: none;
	    background: purple;
	    color: white;
    }
    button:hover{
	    background: #5c3564;
    }
    .eveTitleFont {
    	font-size: 25px;
    	font: bold;
    }
    .inputPos1{
    	text-align: center;
    }
    div>input {
	width: 400px;
	height: 30px;
	margin-bottom: 10px;
	text-align: center;
	}
  </style>
</head>
<body>
<div id="app">

	<div onclick="history.back();"><a href="javascript:;">← 되돌아가기</a></div>
	
	
	<div class="eveFont">응모</div>
	<hr>
	
	<div class="eveTitleFont">[이벤트 응모방법]</div>
	<div>※응모 시 제출하신 정보는 <span style="color: red">제출 완료 후 수정이 불가하오니</span> 제출 시, 정확한 정보작성에 유의해주시기 바랍니다. 정보를 잘못 기재하여 발생한 불이익은 보상하지 않습니다.</div>
	<br>
	<div class="eveTitleFont">[응모 시 유의사항]</div>
	<div>1. 이벤트 응모는 응모 기간 내 앨범 구매 및 응모 완료 시간을 기준으로 처리됩니다.</div>
	<div>2. 당첨자 발표 및 팬사인회 참여는 응모 시 기재한 필수정보를 기준으로 처리됩니다.</div>
	<div>3. 외국인의 경우 이벤트에 응모하신 영문 이름이 신분증 상 영문 이름과 동일해야 하며, 해당 이름 기준으로만 응모 가능합니다. (한글 이름으로 응모 불가)</div>
	<div>4. 응모 기간 내 앨범을 구매하여 이벤트에 응모한 이후 주문을 취소할 경우, 당첨 대상에서 제외됩니다.</div>
	<div>5. 이벤트 응모 후 당첨되지 않은 경우, 구매하신 앨범은 반품하실 수 없습니다.</div>
	<div>6. 본 이벤트는 당첨자 본인만 참석 가능합니다.</div>
	<div>7. 본 이벤트 당첨권은 대리수령 및 타인에게 양도, 매매가 불가합니다. (적발 시 참여 불가)</div>
	<div>8. 본 이벤트 참여 시 본인 확인을 위한 신분증을 반드시 지참하셔야 합니다. 미지참 시 참여가 절대 불가합니다.</div>
	<div>9. 2번 이상 통화 연결이 되지 않을 경우, 다음 당첨자가 먼저 진행되며, 다음 당첨자의 이벤트 진행 이후 한 번 더 연락을 드릴 예정입니다. 다시 연락이 되지 않을 경우에는 참여 의사가 없는 것으로 판단하여 재연락을 드리지 않습니다.</div>
	<div>10. 이벤트 진행 시 아티스트 보호를 위해 운영 담당자가 참관하며, 모든 영상은 녹화됩니다. 영상통화 내용이 부적절하다고 판단될 경우, 이벤트가 강제 종료될 수 있습니다.</div>
	<hr>
	
	<div class="inputPos1">
	<div v-if="info.cnt >= 1">
		<div v-if="ynApplyYn == 0">
			<div><input type="text" placeholder="응모자명" v-model="eUname"></div>
			<div><input type="text" placeholder="연락처 (-) 없이 입력" v-model="eUphone"></div>
			<div>개인정보 수집 동의</div>
			<label><input type="radio" name="Yn" value="Y" v-model="eYn">동의함</label>
			<label><input type="radio" name="Yn" value="N" v-model="eYn">동의안함</label>
			<div><button @click="fnApply(info)">응모하기</button></div>
		</div>
		<div v-else>
			<div>해당 이벤트는 이미 응모되었습니다.</div>
			<div>1회 응모 후 앨범 구입시 자동응모되오니, 참고하시길 바랍니다.</div>
		</div>
	</div>
	<div v-else>
		<div>해당 계정으로 구매한 상품이 확인 되지 않습니다</div>
	</div>
	</div>
	
</div>
</body>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		evtNo : "${map.evtNo}",
		uId : "${map.uId}",
		info : {},
		ynApplyYn : 0,
		eUname : "",
		eUphone : "",
		eYn : ""
	},// data
	methods : {
		fnGetList : function(){
            var self = this;
            var nparmap = {evtNo : self.evtNo, uId : self.uId};
            $.ajax({
            	url : "/event/evtApplyYn.dox",
                dataType:"json",
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.info = data.info;
                	self.ynApplyYn = data.ynApplyYn;
                	console.log(data);
                }
            }); 
        },
        fnApply : function(info){
            var self = this;
            var nparmap = {pNo : self.info.pNo, evtNo : self.evtNo, uId:self.uId, eUname : self.eUname, eUphone : self.eUphone, eYn : self.eYn };
            if(self.eUname == "" || self.eUname == undefined){
		        alert("이름을 입력해주세요");
		        return;
		    }
            if(self.eUphone == "" || self.eUphone == undefined){
		        alert("연락처를 입력해주세요");
		        return;
		    }
            if(self.eYn == "" || self.eYn == undefined){
		        alert("개인정보 수집 동의 여부를 체크해주세요, 동의 하지 않을시 이벤트 당첨 불가");
		        return;
		    }
            
            if(!confirm("정말 응모하겠습니까? 응모 후 정보 수정 불가합니다.")){
                return;
            }
            $.ajax({
            	url : "/event/evtApply.dox",
                dataType:"json",
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("정상응모 되었습니다.");
                	self.fnGetList();
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