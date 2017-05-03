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
  

	
</head>
<body>
<%
	String rootPath = request.getContextPath();
	String baseRootPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+rootPath+"/";
%>
<script type="text/javascript" src="<%=baseRootPath %>dwr/engine.js"></script>
<script type="text/javascript" src="<%=baseRootPath %>dwr/util.js"></script>
<script type="text/javascript" src="<%=baseRootPath %>dwr/interface/messageService.js"></script>
<script language="javascript">
	Date.prototype.format =function(format)
	{
	var o = {
	"M+" : this.getMonth()+1, //month
	"d+" : this.getDate(), //day
	"h+" : this.getHours(), //hour
	"m+" : this.getMinutes(), //minute
	"s+" : this.getSeconds(), //second
	"q+" : Math.floor((this.getMonth()+3)/3), //quarter
	"S" : this.getMilliseconds() //millisecond
	}
	if(/(y+)/.test(format)) format=format.replace(RegExp.$1,
	(this.getFullYear()+"").substr(4- RegExp.$1.length));
	for(var k in o)if(new RegExp("("+ k +")").test(format))
	format = format.replace(RegExp.$1,
	RegExp.$1.length==1? o[k] :
	("00"+ o[k]).substr((""+ o[k]).length));
	return format;
	}
	
	$(function(){
		
		 dwr.engine.setActiveReverseAjax(true); // 激活反转 重要  
		//这个就是当页面加载时，后台listen监听器去除失效的scriptSession，再创建新的scriptSession
		dwr.engine.setNotifyServerOnPageUnload(true,true);
		//自定义的javascript函数
		//onPageLoad();
		dwr.engine.setErrorHandler(function(){
			//这个方法 防止项目已经关闭，客户页面还未关闭，页面会谈Error的问题
		});
		
		var receiverid = '${receiver.id}';
		var senderid='${sender.id}';
		messageService.onPageLoad(senderid , receiverid);
		
		/* $('#messageId').textbox({    
			multiline:true,
			width:'100%',
			height:60
		}); */

		
		
	});  

	
	function sendMessage(){
		var message = $("#messageId").val();
		if(message == null || message == ""){
			$.messager.alert('警告','发送消息内容不能为空！ ');   
			return;
		}
		
		var senderid =  $("#sender").val();
		var receiverid = $("#receiver").val();
		
		var senderName =  $("#companyName").val();
		var receiverName = $("#receiverName").val();
		
		messageService.sendMessageAuto(senderid,receiverid,senderName,receiverName,message,chatCallback);
		
		var companyName = $("#companyName").val();
		
		var d =new Date().format('yyyy-MM-dd hh:mm:ss');
		
		//刷新发送者页面聊天记录
		var table = "<br/><table width='100%' cellspacing='0' cellpadding='0'>"
				  +	"<tr>"
				  + "<td width='85%' height='20' align='right' cellspacing='0' cellpadding='0' style='color:#5B5B5B;border-top-style:solid;border-top-width:2px; border-top-color: #D6D2D3;border-bottom-style:solid;border-bottom-width:2px; border-bottom-color: #D6D2D3;border-left-style:solid;border-left-width:2px; border-left-color: #D6D2D3;' > "+d+" </td>"
				  +	"<td width='15%' height='44' rowspan='2' cellspacing='0' cellpadding='0' align='center' valign='middle' style='color:#FFFFFF;border-style: solid;border-width: 2px;border-color: #D6D2D3;background:url(../images/hy_10.jpg);'> "+companyName+"</td>"
				  + "</tr>"
				  + "<tr>"
				  + "<td height='20' align='right' cellspacing='0' cellpadding='0' style='color:#5B5B5B;border-bottom-style:solid;border-bottom-width:2px; border-bottom-color: #D6D2D3;border-left-style:solid;border-left-width:2px; border-left-color: #D6D2D3;' > "+message+" </td>"
				  + "</tr>"
			      + "</table>";
			      
		$("#pn_chating").append(table);
		
		$("#messageId").val('');
		
		$('#pn_chating').scrollTop( $('#pn_chating')[0].scrollHeight );
		
	}
	
	function showMessage(message){
		var obj = eval('(' + message + ')'); 
		
		//刷新接收者页面聊天记录
		var table = "<br/><table width='100%' cellspacing='0' cellpadding='0' style='background-color: white;'>"
				  +	"<tr>"
				  +	"<td width='15%' height='44' rowspan='2' align='center' style='color:#FFFFFF;border-style: solid;border-width: 2px;border-color: #D6D2D3;background:url(../images/hy_12.jpg);'> "+obj.sendername+" </td>"
				  +	"<td width='85%' height='20' style='color:#5B5B5B;border-top-style:solid;border-top-width:2px; border-top-color: #D6D2D3;border-bottom-style:solid;border-bottom-width:2px; border-bottom-color: #D6D2D3;border-right-style:solid;border-right-width:2px; border-right-color: #D6D2D3;'> "+obj.sendtime+"</td>"
				  +"</tr>"
				  +"<tr>"
				  +	"<td height='20' style='color:#5B5B5B;border-bottom-style:solid;border-bottom-width:2px; border-bottom-color: #D6D2D3;border-right-style:solid;border-right-width:2px; border-right-color: #D6D2D3;'> "+obj.chatcontent+" </td>"
				  +"</tr>"
				  +"</table>";
		      
		$("#pn_chating").append(table);
		$('#pn_chating').scrollTop( $('#pn_chating')[0].scrollHeight );
	
	}
	
	
	function showChatRecord(){
		//判断是否已显示聊天记录，如果已显示则返回
		//var east = $('#lo_chat').layout('panel', 'east').panel('clear');
		
		var east = $('#lo_chat').layout('panel', 'east');
		
		if(east.length > 0){
			return;
		}
		
		var senderid =  $("#sender").val();
		var receiverid = $("#receiver").val();
		//var href="test";//"chatRecord?senderid="+senderid+"&receiverid="+receiverid;
		var options = {
                region: 'east',
                width : 200,
        		split : true,
        		title : '聊天记录',
        		style:'{overflow-x: hidden}'
            };
		 $('#lo_chat').layout('add', options);
		 
		 var frame="<iframe id='chatRecordFrame' src='chatRecord?senderid="+senderid+"&receiverid="+receiverid+"' style='width: 98%;height: 99%;'> </iframe>";
		 $('#lo_chat').layout('panel', 'east').append(frame);
		
	}
	
	
	function clearScreen(){
		$("#pn_chating").empty();
	}
	
	function chatCallback(data){
		var obj = eval('(' + data + ')'); 
		
		if(obj.exsit == false){
			var d =new Date().format('yyyy-MM-dd hh:mm:ss');
			var table = "<br/><table width='100%' cellspacing='0' cellpadding='0' style='background-color: white;'>" 
					  +	"<tr>"
					  +	"<td width='15%' height='44' rowspan='2' align='center' style='color:#FFFFFF;border-style: solid;border-width: 2px;border-color: #D6D2D3;background:url(../images/hy_11.jpg);'> "+"系统回复"+" </td>"
					  +	"<td width='85%' height='20' style='color:#5B5B5B;border-top-style:solid;border-top-width:2px; border-top-color: #D6D2D3;border-bottom-style:solid;border-bottom-width:2px; border-bottom-color: #D6D2D3;border-right-style:solid;border-right-width:2px; border-right-color: #D6D2D3;'> "+ d +"</td>"
					  +"</tr>"
					  +"<tr>"
					  +	"<td height='20' style='color:#5B5B5B;border-bottom-style:solid;border-bottom-width:2px; border-bottom-color: #D6D2D3;border-right-style:solid;border-right-width:2px; border-right-color: #D6D2D3;'>  "+"您好，" + obj.receiver.company +"现在不在线，您可以拨打电话或者发邮件与其联系，以下是联系方式：<br>"
					  + "电话：" + obj.receiver.phone + "<br>" + "电子邮箱：" + obj.receiver.email+ "<br>" + "QQ：" + obj.receiver.oicq + "<br>" + "微信："+ obj.receiver.wechat + "<br>" +"地址：" + obj.receiver.address 
					  +" </td>"
					  +"</tr>"
					  +"</table>";
					  
					   
		      
			$("#pn_chating").append(table);
			$('#pn_chating').scrollTop( $('#pn_chating')[0].scrollHeight );
		}
	}
	
</script>
			
		<div id="pn_chating" class="easyui-panel" data-options="height:245" style="width:100%;padding:10px;background:#FFFFFF;"  >   
				<!-- <br />
				<table width="100%" cellspacing="0" cellpadding="0" style="background-color: white;">
					<tr>
						<td width="15%" height='44' rowspan="2" align="center" style="color:#FFFFFF;border-style: solid;border-width: 2px;border-color: #D6D2D3;background:url(../images/hy_12.jpg);"> 1111111 </td>
						<td width="85%" height='20' style="color:#5B5B5B;border-top-style:solid;border-top-width:2px; border-top-color: #D6D2D3;border-bottom-style:solid;border-bottom-width:2px; border-bottom-color: #D6D2D3;border-right-style:solid;border-right-width:2px; border-right-color: #D6D2D3;">22222222 </td>
					</tr>
					<tr>
						<td height='20' style="color:#5B5B5B;border-bottom-style:solid;border-bottom-width:2px; border-bottom-color: #D6D2D3;border-right-style:solid;border-right-width:2px; border-right-color: #D6D2D3;"> 333333 </td>
					</tr>
				</table>  -->
				
				
				<!-- <br/><table width='100%' cellspacing='0' cellpadding='0'>
				  <tr>
				  <td width='85%' height='20' align='right' cellspacing='0' cellpadding='0' style='color:#5B5B5B;border-top-style:solid;border-top-width:2px; border-top-color: #D6D2D3;border-bottom-style:solid;border-bottom-width:2px; border-bottom-color: #D6D2D3;border-left-style:solid;border-left-width:2px; border-left-color: #D6D2D3;' > 222222</td>
				  <td width='15%' height='44' rowspan='2' cellspacing='0' cellpadding='0' align='center' valign='middle' style='color:#FFFFFF;border-style: solid;border-width: 2px;border-color: #D6D2D3;background:url(../images/hy_10.jpg);'> 33333</td>
				  </tr>
				  <tr>
				  <td height='20' align='right' cellspacing='0' cellpadding='0' style='color:#5B5B5B;border-bottom-style:solid;border-bottom-width:2px; border-bottom-color: #D6D2D3;border-left-style:solid;border-left-width:2px; border-left-color: #D6D2D3;'> 111111 </td>
				  </tr>
			      </table> -->
				
				<br />
			 
				<c:forEach items="${chatList}" var="item">  
				
				<table width="100%" cellspacing="0" cellpadding="0" style="background-color: white;">
					<tr>
						<td width="15%" height='44' rowspan="2" align="center" style="color:#FFFFFF;border-style: solid;border-width: 2px;border-color: #D6D2D3;background:url(../images/hy_12.jpg);"> ${item.sendername} </td>
						<td width="85%" height='20' style="color:#5B5B5B;border-top-style:solid;border-top-width:2px; border-top-color: #D6D2D3;border-bottom-style:solid;border-bottom-width:2px; border-bottom-color: #D6D2D3;border-right-style:solid;border-right-width:2px; border-right-color: #D6D2D3;"> <fmt:formatDate value='${item.sendtime }' pattern='yyyy-MM-dd HH:mm:ss'/> </td>
					</tr>
					<tr>
						<td height='20' style="color:#5B5B5B;border-bottom-style:solid;border-bottom-width:2px; border-bottom-color: #D6D2D3;border-right-style:solid;border-right-width:2px; border-right-color: #D6D2D3;"> ${item.chatcontent} </td>
					</tr>
				</table>
				<br />
			</c:forEach>
		
		</div>  
		<div id="pn_function" class="easyui-panel" style="width:100%;padding:5px;text-align: right;"  >
			<a id="btn_showChatRecord" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-clear-broom'" onclick="clearScreen();">清屏</a>
			<a id="btn_showChatRecord" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-chat-record'" onclick="showChatRecord();">聊天记录</a>
		</div> 
		<div id="pn_send" class="easyui-panel" data-options="height:125"  style="width:100%;padding:10px;background:#fafafa;text-align: right;overflow-x: hidden;"  >   
			<input type="hidden" id="sender" value="${sender.id}" />
			<input type="hidden" id="receiver" value="${receiver.id}" />
			<input type="hidden" id="companyName" value="${sender.company}" />
			<input type="hidden" id="receiverName" value="${receiver.company}" />
		
		     <!-- <input id="messageId"  /> -->
		      <textarea name="textarea" id="messageId" cols="45" rows="5" style="width:100%; height:60px;"></textarea>
		     <br />
		     <a id="btn_send" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-send'" style="margin-top: 10px;" onclick="sendMessage();">发送</a>  
		</div>  
		
			
</body>
</html>
