<?xml version="1.0" encoding="UTF-8" ?>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/WEB-INF/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>云城系统经销商平台</title>
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/css/top.css" rel="stylesheet" type="text/css" />
<!--banner-->
<link rel="stylesheet" type="text/css" href="<%=path%>/css/jquery.jslides.css" media="screen" />
<%-- <script type="text/javascript" src="<%=path%>/js/jquery-1.8.0.min.js"></script> --%>

	<script type="text/javascript" src="<%=path%>/js/jquery.jslides.js"></script>
	<script type="text/javascript" src="<%=path%>/js/scrollable.js"></script>
	 <script type="text/javascript" src="<%=path%>/js/ajaxfileupload.js"></script>
	

<script language="javascript">
//点击注册按钮跳转到注册页面
function Register(){	
	<%-- window.parent.location.href = "<%=path%>/register/registerStepOne"; --%>
	window.parent.location.href = "<%=path%>/registerStepOne";
}

function LoginOut(){
	loginDwrService.LoginOut({callback: loginOutCallBack});
}

//注销登陆
function loginOutCallBack(data){

	if(data =="true"){
		alert("注销成功");
		window.parent.location.href = "<%=path%>";
	}
}

function Login(){
	window.parent.location.href = "<%=path%>/login";
}

/**
 * 搜索供需单
 */
function searchSupplyDemand(){
	 document.forms["fm_search"].submit();
}
 
//跳转发布供应
function toSupply(){
	<%-- $('#center', window.parent.document).attr('src','<%=path%>/supplyDemandManager/selectSupplyOrder'); --%>
	
	window.parent.location.href = "<%=path%>/supplyDemandManager/selectSupplyOrder";
}

//跳转发布需求
function toDemand(){
	<%-- $('#center', window.parent.document).attr('src','<%=path%>/supplyDemandManager/selectDemandOrder'); --%>
	
}

</script>

</head>

<body style="background-color:#262626">

<div class="top">
  <div class="topmid">
    <div style="display:block; float:left;"><a href="#"><img src="<%=path%>/images/logo.jpg" width="77" height="50" /></a></div>
    <ul class="topnav">
      <li><a href="javascript:void(0)" onclick="window.parent.location.href = '<%=path%>';">网站首页</a></li>
      <li><a href="javascript:void(0);" onclick="toSupply();">发布供应</a></li>
      <li><a href="javascript:void(0);" onclick="toDemand();">发布需求</a></li>
    </ul>
   <div class="topdl" id= "user"><a href="javascript:void(0)" onclick="Login();">登录</a> ▪ <a href="javascript:void(0)" onclick="Register();">注册</a></div>

    <div class="topright">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td align="left" valign="middle"><div class="search radius6">
	<form id="fm_search" name="fm_search" method="post" action="<%=path%>/supplyDemandManager/searchSupplyDemand">
		<input name='ecmsfrom' type='hidden' value='9'/>
		<input type="hidden" name="show" value="title,newstext"/>
		<select name="type" id="choose">
			<option value="0">搜供应</option>
			<option value="1">搜需求</option>
		</select> 
		<input class="inp_srh" name="keyWords" style="color:#d1d1d1;"  placeholder="请输入您要搜索的文字" />
	</form>
</div></td>
          <td width="19%" height="50" align="left" valign="middle"><img onclick="searchSupplyDemand();" src="<%=path%>/images/an08.jpg" style="cursor:pointer;" /></td>
        </tr>
      </table>
    </div>
  </div>
</div>
<%-- <script type="text/javascript" src="<%=path %>/js/jquery-1.8.3.min.js"></script> --%>
<script type="text/javascript" src="<%=path %>/js/jquery.select.js"></script>

</body>
</html>
