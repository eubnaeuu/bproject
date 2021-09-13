$(document).ready(function(){
	readGiftboxList();
	readMusicGiftboxList();
});
var memId = sessionStorage.getItem("Nickname");

function readGiftboxList(){
	var param = {
		flag : "L",
		memId : memId
	};
	$.ajax({
		url : "/DEworld/giftbox/giftboxList.do"
		,type : "post"
		,data : param
		,dataType : "json"
		,success : function(data){
			console.log(data);
			makeGiftboxList(data);
		}
	,error : function(request,status, error){
		alert("code:" + request.status+ "\n\r" 
		+ "message: " + request.responseText +"\n\r"
		+ "error : " + error);
		}
	});
	
}


function makeGiftboxList(data){
//	$("#giftboxListTable tbody").empty();
	
	var strHtml = "";
	var imgSrc = "";
	for(var i=0 ; i<data.length ; i++) {
		if(data[i].litemGu.indexOf("02") != -1){
			data[i].litemGu = "테마";
			imgSrc = '/DEworld/image/hompiBackground/';
		}else{
			data[i].litemGu = "미니미";	
			imgSrc = '/DEworld/image/item/';
		}
		strHtml += '<tr>'
				
				+  '<td>' + data[i].sendId + '</td>'
				+  '<td>' + data[i].giftMessage + '</td>'
				+  '<td>' + data[i].litemGu + '</td>'
				+  '<td><img src="' + imgSrc + data[i].itemImg + '" style="width:auto; height:50px;"></td>'
				+  '<td>' + data[i].itemName + '</td>'
				+  '<td>' + data[i].sendDate + '</td>'
				
				+ 	'</tr>';
	}
	
	$("#giftboxListTable tbody").html(strHtml);
}

function readMusicGiftboxList(){
	var param = {
		flag : "ML",
		memId : memId
	};
	$.ajax({
		url : "/DEworld/giftbox/giftboxList.do"
		,type : "post"
		,data : param
		,dataType : "json"
		,success : function(data){
			console.log(data);
			makeMusicGiftboxList(data);
		}
	,error : function(request,status, error){
		alert("code:" + request.status+ "\n\r" 
		+ "message: " + request.responseText +"\n\r"
		+ "error : " + error);
		}
	});
	
}


function makeMusicGiftboxList(data){
//	$("#giftboxListTable tbody").empty();
	
	var strHtml = "";
	for(var i=0 ; i<data.length ; i++) {
		strHtml += '<tr>'
				+  '<td>' + data[i].sendId + '</td>'
				+  '<td>' + data[i].giftMessage + '</td>'
				+  '<td><img src="/DEworld/image/musicAlbumImage/' + data[i].musicAlbum + '" style="width:auto; height:50px;"></td>'
				+  '<td>' + data[i].musicTitle + '</td>'
				+  '<td>' + data[i].musicArtist + '</td>'
				+  '<td>' + data[i].sendDate + '</td>'
				
				+ 	'</tr>';
	}
	
	$("#musicgiftboxListTable tbody").html(strHtml);
}