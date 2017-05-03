<?xml version="1.0" encoding="UTF-8" ?>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/WEB-INF/include/taglib.jsp"%>
<%
	String rootPath = request.getContextPath();
	String baseRootPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+rootPath+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>会话管理</title>
<script language="JavaScript" src="<%=path%>/js/jquery-easyui-1.4/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery-easyui-1.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery-easyui-1.4/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=baseRootPath %>dwr/engine.js"></script>
<script type="text/javascript" src="<%=baseRootPath %>dwr/util.js"></script>
<script type="text/javascript" src="<%=baseRootPath %>dwr/interface/messageService.js"></script>

<link rel="stylesheet" type="text/css" href="<%=path%>/js/jquery-easyui-1.4/themes/gray/easyui.css"/>
<link rel="stylesheet" type="text/css" href="<%=path%>/js/jquery-easyui-1.4/themes/icon.css"/>
 
    
<script type="text/javascript">

var senderid='${senderid}';

$(function(){
	/* dwr.engine.setActiveReverseAjax(true); // 激活反转 重要  
	//这个就是当页面加载时，后台listen监听器去除失效的scriptSession，再创建新的scriptSession
	dwr.engine.setNotifyServerOnPageUnload(true,true);
	//自定义的javascript函数
	//onPageLoad();
	dwr.engine.setErrorHandler(function(){
		//这个方法 防止项目已经关闭，客户页面还未关闭，页面会谈Error的问题
	}); */
	
	var height = $(window).height()-20;  
	
	stView_layout = $('#lo_chat').layout({  
		width: '100%',  
		height: 450  
		});  
	
	//默认点击第一个联系人
	var contact_size = $("a[name='contact']").length;
	if(contact_size > 0){
		
		var vid="${contactid }";
		
		if(vid != null && vid != "" && vid != "null" ){
			$("a[id='"+vid+"']").eq(0).click();
		}else{
			$("a[name='contact']").eq(0).click();
		}
	}
	
});  
 
function chatInfo(receiverid,contactname,obj){
	var test_sender=$("#test_sender").val();
	var test_receiver=$("#test_receiver").val();
	
	//将会话的发送按钮设置为可用
	//$('#btn_send').linkbutton('enable');
	$("#lo_chat").layout('panel','center').panel('setTitle','会话-'+contactname);
	$("#lo_chat").layout('panel','center').panel('refresh','chating?receiverid='+receiverid+'&senderid='+senderid);
	$('#lo_chat').layout('remove', 'east');
	
	//更新联系人列表状态
	$(obj).html(contactname);
	
}
 

</script>
	
</head>
<body>
	<div align="center" >
	
    <div id="lo_chat" >
        <div data-options="region:'west',split:true" title="联系人列表" style="width:200px;">
        
        	<ul id="tr" class="easyui-tree" >   
        	 <c:forEach items="${contactsList}" var="item">  
        		<li data-options="iconCls:'icon-chat-head'">
        			<a id="${item.contactid }" name="contact" onclick="chatInfo('${item.contactid }','${item.contactname }',this);">
        				${item.contactname }
        				<c:if test="${item.unreadcount != null}">
        					<span style="color: red;margin-right: 1px;padding-right: 1px;" >新信息(${item.unreadcount })</span>
        				</c:if>
       				</a>
        		</li>
        	 </c:forEach>
        	</ul>
        </div>
        
        <div data-options="region:'center',title:'会话 - 选择一个联系人就可以进行会话'" style="overflow-x: hidden;">
			
			
			<!-- <div id="pn_chating" class="easyui-panel" style="width:100%;height:60%;padding:10px;background:#848484;"  >   

			</div>  
			
			<div id="pn_send" class="easyui-panel" style="width:100%;height:40%;padding:30px;background:#fafafa;text-align: right;"  >   
			     <input class="easyui-textbox" data-options="multiline:true" value="1111" style="width:100%;height:150px;padding: 10px;" />
			     <input class="easyui-textbox" data-options="multiline:true" value="This TextBox will allow the user to enter multiple lines of text." style="width:300px;height:100px">
			     <a id="btn_send" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-send',disabled:true" style="margin-top: 15px;">发送</a>  
			     
			</div> -->  
			
		
        </div>
        

    </div>










	</div>
	
</body>
</html>
