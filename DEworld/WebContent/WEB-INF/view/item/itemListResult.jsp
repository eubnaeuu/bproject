<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.item.vo.ItemVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
[
<%
List<ItemVO> list = (List<ItemVO>)request.getAttribute("itemList");

for(int i=0; i<list.size(); i++){
	ItemVO iv = list.get(i);
	if(i>0){
		%>,<%
	}
	%>
	{
		"itemId" : "<%=iv.getItemId()%>",
		"itemName" : "<%=iv.getItemName()%>",
		"itemPrice" : "<%=iv.getItemPrice()%>",
		"itemImg" : "<%=iv.getItemImg()%>",
		"itemDesc" : "<%=iv.getItemDesc()%>",
		"litemGu"  : "<%=iv.getLitemGu()%>"
	}
	<%
}
%>
]
    