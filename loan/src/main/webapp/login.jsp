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
<script type="text/javascript" src="<%=baseRootPath %>dwr/interface/loginDwrService.js"></script>
<script type="text/javascript">
/** 
 * 页面初始化 
 */ 
$(function(){
	
})	
//登录
function onSubmit(){
	var securityCode = $("#securityCode").val();
	if(null != securityCode && "" != securityCode){
		if(securityCode.length == 4){
			loginDwrService.checkRandomSecurityCode(securityCode,{callback: CheckRandomSecurityCodeCallBack});
		}else{
			alert("验证码格式不正确!");
		}
	}else{
		alert("请输入验证码!");
	}
}
/****************************
* 检测验证码回调
****************************/
function CheckRandomSecurityCodeCallBack(dataFromServer){
	if(false == dataFromServer){
		alert("验证码错误!");
		return;
	}
	//执行登录
	var userName = $("#username").val();
	var userPwd = $("#password").val();
	
	if(userName=="" || userName==null){
    	alert("用户名不能为空！");
    	return;
    }else if(userPwd=="" || userPwd==null){
    	alert("密码不能为空");
    	return;
    }
	loginDwrService.Login(userName,userPwd,{callback: loginCallBack});
}
/****************************
* 登录回调
****************************/
function loginCallBack(dataFromServer){
	if(true == dataFromServer){
		//登录成功
		//var _url = getBasePath() + "Login/login.do";
		//ow(_url);
		//window.location.href = _url;
		alert("登录成功");
	}else{
		$("#username").focus();
		alert("用户名或密码错误!");
		var currentTime= new Date().getTime();
		$("#randomImg").attr("src", "<%=baseRootPath %>randomValidateCode/getRandomCode?dtime="+currentTime);
	}
}
/*************************
* 更换验证码
*************************/
function changeValidateCode(obj) {
	var currentTime= new Date().getTime();
	//加时间戳防止图片读取缓存
	obj.src = "<%=baseRootPath %>randomValidateCode/getRandomCode?dtime="+currentTime;
}
</script>
<title></title>
  </head>
    <body>  
        <table>
            <tr>
                <td>用户名：</td>
                <td><input id="username" type="text" name="username"/></td>
            </tr>
            <tr>
                <td>密码：</td>
                <td><input id="password" type="password" name="password"/></td>
            </tr>
            <tr>
                <td>验证码：</td>
                <td>
                    <input id="securityCode" type="text" name="random" maxlength="4"/>
                	<img id="randomImg" src="randomValidateCode/getRandomCode" title="单击更换验证码!" onclick="changeValidateCode(this);"/>
                </td>
            </tr>
            <tr>
                <td><input type="button" value="登&nbsp;&nbsp;录" onclick="return onSubmit();"/></td>
            </tr>
        </table>
        
        <%-- <%
        //request.getLocalAddr()
        
        request.getSession().getId();
        out.print("addr : "+request.getLocalAddr()+"  端口: "+request.getLocalPort()+"<br/>");
        out.print("session id : "+request.getSession().getId()+"<br/>");
        Cookie[] coos = request.getCookies();
        if(coos != null){
        	for(int i=0;i<coos.length;i++){
        		out.println("Cookie name: "+coos[i].getName()+"  value : "+coos[i].getValue()+"<br/>");
        	}
        }else{
        	out.print("Cookie is null "+"<br/>");
        	Cookie c = new Cookie("JSESSIONID","1111111111111111111111");
        	response.addCookie(c);
        }
        
        %> --%>
    </body>  
</html>  
