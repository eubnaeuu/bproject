/**
 * 
 */

$(document).ready(function() {

	var memId = location.search.replace("?hompiId=", "");

	$.ajax({
		url : "/DEworld/MemberServlet",
		type : "post",
		data : {
			"memId" : memId,
			"flag" : "setHompi"
		},
		dataType : "json",
		success : function(data) {
			console.log(data);
			$("#backgroundTable").attr("background", "/DEworld/image/hompiBackground/" + data[0].hompiBackground)
			$("#leftProfile").attr("src", "/DEworld/image/profileImg/" + data[0].hompiProfileImg);
			$("#leftBarInfo").html(data[0].hompiInfo);
			$("#todayCnt").html(data[0].visitCountToday);
			$("#totalCnt").html(data[0].visitCountTotal);
			$("#bg").attr("src", "/DEworld/image/miniRoom/" + data[0].hompiMiniroom);
			$("#minimi").attr("src", "/DEworld/image/item/" + data[0].hompiMinimi);
		},
		error : function(xhr) {
		
		}
	});

});


function iframeChange(obj){
	$("#rightIframe").attr("src", obj)
	$("#rightIframe").src = $("#rightIframe").src.substr(0,36) + "r_home.html";
}
function iframeChangelink(str){
	$("#rightIframe").attr("src", "/DEworld"+str);
}
function iframeChangelinkdiary(str){
	$("#rightIframe").attr("src", "/DEworld"+str);
	$("#leftframe").attr("src","/DEworld/html/hompi/left_2.jsp");
}
function iframeProfile(){
	$("#rightIframe").src = $("#rightIframe").src.substr(0,36) + "r_profile.html";
}
function iframePictures(){
	$("#rightIframe").src = $("#rightIframe").src.substr(0,36) + "r_pictures.html";
}
function iframeGuest(){
	$("#rightIframe").src = $("#rightIframe").src.substr(0,36) + "r_guest.html";
}
function iframeDiary(){
	$("#rightIframe").src = $("#rightIframe").src.substr(0,36) + "r_diary.html";
}