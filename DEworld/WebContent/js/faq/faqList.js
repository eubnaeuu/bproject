$(document).ready(function(){
	readFaqList();
});

function readFaqList(){
	var param = {
		flag : "L"
	};
	$.ajax({
		url : "/DEworld/faq/faqList.do"
		,type : "post"
		,data : param
		,dataType : "json"
		,success : function(data){
			

			makeFaqList(data);
		}
		,error : function(data){
			
		}
	});
	
}

function makeFaqList(data){
	$("#FaqList tbody").empty();
	
	var strHtml = "";
	if(data.length >=5){
		for(var i=0 ; i<=4 ; i++) {
				strHtml += "<tr>"
				+ "<td style='width: 30%;display: inline-block;'>"+data[i].lfaqNm+"</td>"
				+ "<td style='width: 70%;display: inline-block; overflow: hidden; text-overflow: ellipsis;'>"
				+ "<a href='/DEworld/faq/faqDetail.do?faqId=" + data[i].faqId + "' style='color:black'>" + data[i].faqTitle + "</a></td>"
				+ "</tr>";
		}
		
	}else if(data.length==0){
		for(var i=data.length-1 ; i>=0 ; i--) 
			strHtml += "<tr>"
				+ "<td colspan='2'>" + "데이터가없습니다"+ "</td>";	
				+ "</tr>";
	}
	
	else{
		for(var i=0 ; i<data.length ; i++) {
			strHtml += "<tr>"
				+ "<td style='width: 30%;display: inline-block;'>"+data[i].lfaqNm+"</td>"
				+ "<td style='width: 70%;display: inline-block; overflow: hidden; text-overflow: ellipsis;'>"
				+ "<a href='/DEworld/faq/faqDetail.do?faqId=" + data[i].faqId + "' style='color:black;'>" + data[i].faqTitle + "</a></td>"
				+ "</tr>";
		}

	}
	$("#FaqList tbody").html(strHtml);
	
	
	var strHtml2 = "";
			for(var i=0 ; i<data.length ; i++) {
			strHtml2 += "<tr>"
				+ "<td style='width: 30%;display: inline-block;'>"+data[i].lfaqNm+"</td>"
				+ "<td style='width: 70%;display: inline-block;'>"
				+ "<a href='/DEworld/faq/faqDetail.do?faqId=" + data[i].faqId + "' style='color:black'>" + data[i].faqTitle + "</a></td>"
				+ "</tr>";
		}


	$("#FaqBoard tbody").html(strHtml2);
	
	
}