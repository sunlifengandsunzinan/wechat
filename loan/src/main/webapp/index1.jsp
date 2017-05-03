<?xml version="1.0" encoding="UTF-8" ?>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String rootPath = request.getContextPath();
	String baseRootPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+rootPath+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script language="JavaScript" src="js/jquery-easyui-1.4/jquery.min.js"></script>
<script type="text/javascript" src="<%=baseRootPath %>dwr/engine.js"></script>
<script type="text/javascript" src="<%=baseRootPath %>dwr/util.js"></script>
<script type="text/javascript" src="<%=baseRootPath %>dwr/interface/reverseAjaxDwrService.js"></script>
<script type="text/javascript">
/** 
 * 页面初始化 
 */ 
$(function(){
	dwr.engine.setActiveReverseAjax(true); // 激活反转 重要  
	//这个就是当页面加载时，后台listen监听器去除失效的scriptSession，再创建新的scriptSession
	dwr.engine.setNotifyServerOnPageUnload(true,true);
	//自定义的javascript函数
	onPageLoad();
	dwr.engine.setErrorHandler(function(){
		//这个方法 防止项目已经关闭，客户页面还未关闭，页面会谈Error的问题
		
	});
    reverseAjaxDwrService.updateUsersList(null, false); // 当你打开界面的时候,先获得在线用户列表.  
})	
/** 
 * 注册帐号 
 */  
function onPageLoad() {
    
    reverseAjaxDwrService.pageLoad(function(datas) {  
    	for(var i=0;i<datas.length;i++){
    			dwr.util.setValues("sender", datas[i].userid);
    			dwr.util.setValues("msg", datas[i].username);
    	}  
    });  
}  

function showMsg(data){
	//for(var i=0;i<users.length;i++){
	//	dwr.util.setValues("sender", users);
	//	dwr.util.setValues("msg", "");
	//}
	//alert(data.userid);
	//var dataObj=eval("("+data+")");//转换为json对象 
	var obj = eval('(' + data + ')'); 
	$("#showMessage").append("<span>"+obj.userid+"</span>对你说:<span>"+obj.username+"</span><br>");
	//alert(obj.userid);
	/* $.each(data, function(idx,item){
		alert(1);
		alert(item.userid);
	}); */
	//dwr.util.setValues("sender", obj.userid);
	//dwr.util.setValues("msg", obj.username);
}
 
/** 
 * 发送消息 
 */  
function send() {  
    var receiver = dwr.util.getValue('receiver'); // 获得接受者id  
    var msg = dwr.util.getValue('message'); // 获得消息内容  
    reverseAjaxDwrService.send(receiver, msg); // 发送消息  
    $("#showMessage").append("你说:<span>"+msg+"</span><br>");
}  
  
</script>
<title></title>
  </head>
    <body>  
        
        <br />  
        <br />  
        我要对  
        <select name="receiver" id="receiver" > 
        <option value="127.0.0.1" selected="selected">a</option> 
        <option value="192.168.0.107">b</option> 
        </select>  
        说:  
        <input type="text" name="message" id="message" />  
        <input type="button" value="发送" id="send" name="send"
            onclick="send();" />  
        <br />  
        <br />  
        在线用户列表:  
         
  
        <div id="showMessage" >  
            
        </div>  
    </body>  
</html>  
