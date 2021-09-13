/**
 * 
 */
//로그아웃버튼
function logOut(){
	window.location.href = "http://localhost/DEworld/html/loginpage/login.html";
	
	sessionStorage.clear();
}

// 상단페이지 ""님 어서오세요 안에들어가는값 지정
$(document).ready(function(){

	if(sessionStorage.getItem("nowLogin") == "user"){
	    channelChatBot();
	}
	
	var user = sessionStorage.getItem("nowLogin");
	
	if(user == null){
		alert("세션ID 정보가 존재하지 않습니다.\n로그인 페이지로 이동합니다.");
		logOut();
	}
	if(user == "user"){
	var memId = sessionStorage.getItem("Nickname");

	$.ajax({
		url : "/DEworld/MemberServlet"
		,type : "post"
		,data : {"memId" : memId, "flag" : "setMyPage"}
		,dataType : "json"
		,success : function(data){
			var memName = data[0].memName;
			var memMail = data[0].memMail;
			var memNickname = data[0].memNickname;
			var ownPeanut = data[0].memCybermoney;
			
			$("#ownPeanut").html(ownPeanut);
			$("#memName").html(memName);
			$("#memMail").html(memMail);
			$("#idArea").html(memNickname);
		}
		,error : function(xhr){
		
			
		}
	});
	}
	if(user =="admin"){
		$("#btnShop").hide();
		$("#btnMypage").hide()
		$("#idArea").html("관리자");
		$("#changeBtn").text("유저 관리 페이지");
		$("#changeBtn").attr("onclick","goadminRoom()");
		//관리자 로그인시 내미니홈피 버튼이 >>>>>>회원관리페이지 버튼
		
	}
});

function goMain(){
	window.location.href = "http://localhost/DEworld/html/mainPage/topic.jsp"
}

function goChargePage(){
	window.location.href = "http://localhost/DEworld/html/chargeMoney/chargeMoney.html"
}
function goadminRoom(){
	window.location.href = "http://localhost/DEworld/html/adminRoom/adminRoom.html";
}
function searchNick(){
	var searchNickname = $(".search_input").val();
	var enc = encodeURI(searchNickname);
	$(".search_icon").attr("href","http://localhost/DEworld/html/userSearch/userSearch.html?search="+enc);
}