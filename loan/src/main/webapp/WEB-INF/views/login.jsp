<?xml version="1.0" encoding="UTF-8" ?>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String rootPath = request.getContextPath();
	String baseRootPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+rootPath+"/";
%>
<%@ include file="/WEB-INF/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />


<link href="<%=path %>/css/imgautoplay.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/css/base.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=path%>/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery.jslides.js"></script>
<script type="text/javascript" src="<%=path %>/js/koala.min.1.5.js"></script>




<script type="text/javascript">
/** 
 * 页面初始化 
 */ 
$(function(){
	var json='${user}';
	if(json == ""){
	return;
	}else{
		$('#user').empty();
		$('#user').html("<a href='javascript:void(0)' onclick='person();'>["+'${user.email}'+"]</a>▪<a href='#' onclick='LoginOut();'>注销</a>");
	}
});



</script>
<title>P2P</title>
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
/* search */
.search{border:1px solid #29282e;height:25px;margin:2px auto 0 auto;width:241px; background-color:#46454a;}
.search select{display:none;}
.search .select_box{font-size:12px;color:#999999;width:80px;line-height:25px;float:left;position:relative;}
.search .select_showbox{height:25px;background:url(images/search_ico.png) no-repeat 60px center;text-indent:1.5em;}
.search .select_showbox.active{background:url(images/search_ico_hover.png) no-repeat 60px center;}
.search .select_option{border:1px solid #29282e;border-top:none;display:none;left:-1px;top:25px;position:absolute;z-index:99;background:#fff;}
.search .select_option li{text-indent:1.5em;width:70px;cursor:pointer;}
.search .select_option li.selected{background-color:#F3F3F3;color:#999;}
.search .select_option li.hover{background:#46454a;color:#fff;}
.search input.inp_srh,.search input.btn_srh{border:none;background:none;height:25px;line-height:25px;float:left}
.search input.inp_srh{outline:none;width:150px;}
.search input.btn_srh{background:#f58400;color:#FFF;font-family:"微软雅黑";font-size:15px;width:60px;}
</style>
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
  <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/jquery.select.js"></script>

<!--   
<iframe runat="server" src="top.html" width="100%" height="50" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes"></iframe>
 -->
<table width="100%" height="578" style=" background-image:url(images/bj_01.jpg);" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="578" align="center" valign="middle"><table width="1440" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="1440" height="100" align="center" valign="middle"><img src="images/denglu.png" width="144" height="37" /></td>
      </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td background="images/dian01.png" style="width:100%; height:2px;"></td>
      </tr>
    </table>
    <table width="1440" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="320" align="center" valign="middle"><table width="400" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="100" align="center" valign="middle" style="font-size:15px; color:#CCCCCC;">登陆邮箱：</td>
              <td height="50" colspan="2" align="left" valign="middle"><input type="text" name="username" id="username" style="width:261px; height:27px; line-height:27px; padding-left:5px;" /></td>
            </tr>
            <tr>
              <td align="center" valign="middle" style="font-size:15px; color:#CCCCCC;">登陆密码：</td>
              <td height="50" colspan="2" align="left" valign="middle"><input type="password" name="password" id="password" style="width:261px; height:27px; line-height:27px; padding-left:5px;"/></td>
            </tr>
            <tr>
              <td align="center" valign="middle">&nbsp;</td>
              <td height="30" colspan="2" align="left" valign="middle"><table width="300" border="0" cellspacing="0" cellpadding="0">
              </table></td>
            </tr>
            <tr>
              <td align="center" valign="middle">&nbsp;</td>
              <td width="142" height="40" align="left" valign="middle"><a href="javascript:void(0)" onclick="return onSubmit();"><img src="images/an01.jpg" width="123" height="32" border="0" /></a></td>
              <td width="158" align="left" valign="middle"><a href="javascript:void(0)" onclick="Register();"><img src="images/an02.jpg" width="123" height="32" border="0" /></a></td>
            </tr>
        </table></td>
      </tr>

    </table></td>
  </tr>
</table>
<iframe runat="server" src="bottom.html" width="100%" height="325" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes"></iframe>
</body>
</html>  
