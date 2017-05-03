<?xml version="1.0" encoding="UTF-8" ?>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/WEB-INF/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>会话管理</title>
<script language="JavaScript" src="<%=path%>/js/jquery-easyui-1.4/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery-easyui-1.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery-easyui-1.4/locale/easyui-lang-zh_CN.js"></script>

<link rel="stylesheet" type="text/css" href="<%=path%>/js/jquery-easyui-1.4/themes/gray/easyui.css"/>
<link rel="stylesheet" type="text/css" href="<%=path%>/js/jquery-easyui-1.4/themes/icon.css"/>
 
    
<script language="javascript">

$(function(){
	
	
	
});  
 
function chatInfo(senderId){
	//将会话的发送按钮设置为可用
	$('#btn_send').linkbutton('enable');

}

</script>
	
</head>
<body>
	<link href="<%=path %>/css/pages.css" rel="stylesheet" type="text/css" />
	
	 
	
	
	<div id="pn_chatrecord"  class="easyui-panel" style="width:100%;height:100%;padding:10px;" >   
	 
	<c:forEach items="${list}" var="item">  
	
		<c:if test="${item.senderid==currentUser.id}">
			<table width='100%' cellspacing='0' cellpadding='0'>
				<tr>
					<td width='85%' height='20' align='right' cellspacing='0' cellpadding='0' style='color:#5B5B5B;border-top-style:solid;border-top-width:2px; border-top-color: #D6D2D3;border-bottom-style:solid;border-bottom-width:2px; border-bottom-color: #D6D2D3;border-left-style:solid;border-left-width:2px; border-left-color: #D6D2D3;' > <fmt:formatDate value='${item.sendtime }' pattern='yyyy-MM-dd HH:mm:ss'/> </td>
					<td width='15%' height='44' rowspan='2' cellspacing='0' cellpadding='0' align='center' valign='middle' style='color:#FFFFFF;border-style: solid;border-width: 2px;border-color: #D6D2D3;background:url(../images/hy_10.jpg);'> ${item.sendername} </td>
				</tr>
				<tr>
					<td height='20' align='right' cellspacing='0' cellpadding='0' style='color:#5B5B5B;border-bottom-style:solid;border-bottom-width:2px; border-bottom-color: #D6D2D3;border-left-style:solid;border-left-width:2px; border-left-color: #D6D2D3;' > ${item.chatcontent} </td>
				</tr>
			</table>
		</c:if>
		
		<c:if test="${item.receiverid==currentUser.id}">
	   		<table width='100%' cellspacing='0' cellpadding='0' style='background-color: white;'>
				<tr>
					<td width='15%' height='44' rowspan='2' align='center' style='color:#FFFFFF;border-style: solid;border-width: 2px;border-color: #D6D2D3;background:url(../images/hy_12.jpg);'> ${item.sendername} </td>
					<td width='85%' height='20' style='color:#5B5B5B;border-top-style:solid;border-top-width:2px; border-top-color: #D6D2D3;border-bottom-style:solid;border-bottom-width:2px; border-bottom-color: #D6D2D3;border-right-style:solid;border-right-width:2px; border-right-color: #D6D2D3;'> <fmt:formatDate value='${item.sendtime }' pattern='yyyy-MM-dd HH:mm:ss'/> </td>
				</tr>
				<tr>
					<td height='20' style='color:#5B5B5B;border-bottom-style:solid;border-bottom-width:2px; border-bottom-color: #D6D2D3;border-right-style:solid;border-right-width:2px; border-right-color: #D6D2D3;'> ${item.chatcontent} </td>
				</tr>
			</table>
		</c:if>
		
		<br/>
   	</c:forEach>
	<form action="<%=path %>/chat/chatRecord" method="post" id="fm_chatRecord"  >
		<input type="hidden" name="senderid" value="${senderid }" />
		<input type="hidden" name="receiverid" value="${receiverid }" />
	</form>	
	<div class="pagin">
    	<p:pages totalCount="${pageInfo.count }" pageSize="${pageInfo.pageSize }" totalPage="${pageInfo.total }" curPage="${pageInfo.pageNo }" formId="fm_chatRecord" ></p:pages>
  	</div>
	 	 
 </div> 
	
</body>
</html>
