<?xml version="1.0" encoding="UTF-8" ?>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>云城系统经销商平台</title>
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=path %>/css/imgautoplay.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/css/base.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/css/top.css" rel="stylesheet" type="text/css" />
<!--banner-->
<link rel="stylesheet" type="text/css" href="<%=path%>/css/jquery.jslides.css" media="screen" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery.jslides.js"></script>
<script type="text/javascript" src="<%=path %>/js/koala.min.1.5.js"></script>
<script type="text/javascript" src="<%=path %>/dwr/engine.js"></script>
<script type="text/javascript" src="<%=path %>/dwr/util.js"></script>
<script type="text/javascript" src="<%=path %>/dwr/interface/reverseAjaxDwrService.js"></script>
<script type="text/javascript" src="<%=path %>/dwr/interface/loginDwrService.js"></script>
<script type="text/javascript"> 
	$(function(){  
		var json='${user}';
		if(json == ""){
		return;
		}else{
			$('#user').empty();
			$('#user').html("<a href='javascript:void(0)' onclick='person();'>["+'${user.email}'+"]</a>▪<a href='#' onclick='LoginOut();'>注销</a>");
		}
	});  
	 
	//点击注册按钮跳转到注册页面
	function Register(){	
		<%-- window.parent.location.href = "<%=path%>/register/registerStepOne"; --%>
		window.parent.location.href = "<%=path%>/registerStepOne";
	}
	function LoginOut(){
		loginDwrService.LoginOut({callback: loginOutCallBack});
	}
	//点击用户名跳转到个人中心
	function person(){
		<%-- window.parent.location.href = "<%=path%>/register/registerStepThree"; --%>
		<%-- $('#pictureRotation', window.parent.document).hide();
		$('#center', window.parent.document).attr('height','100');
		$('#center', window.parent.document).attr('src','<%=path%>/register/toPersonalCenter'); --%>
		
		window.parent.location.href = "<%=path%>/toPersonalCenter";
		
	}

	//跳转发布供应
	function toSupply(){
		$('#pictureRotation', window.parent.document).hide();
		$('#center', window.parent.document).attr('height','100');
		$('#center', window.parent.document).attr('src','<%=path%>/supplyDemandManager/selectSupplyOrder');
		
		<%-- window.parent.location.href = "<%=path%>/supplyDemandManager/selectSupplyOrder"; --%>
	}

	//跳转发布供应
	function toDemand(){
		$('#pictureRotation', window.parent.document).hide();
		$('#center', window.parent.document).attr('height','100');
		$('#center', window.parent.document).attr('src','<%=path%>/supplyDemandManager/selectDemandOrder');
		
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
	 * ifram 自动调整大小
	*/
	 function iFrameHeight() {
        var ifm= document.getElementById("center");
        var subWeb = document.frames ? document.frames["center"].document : ifm.contentDocument;
            if(ifm != null && subWeb != null) {
            ifm.height = subWeb.body.scrollHeight;
        }
    }
	 
	 /**
	   * 搜索供需单
	   */
	 function searchSupplyDemand(){
		 document.forms["fm_search"].submit();
	 }
	 
	 
	</script>
<!-- <style type="text/css">
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
</style> -->
</head>
<body>
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
 

<!-- <iframe runat="server" src="top" width="100%" height="50" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes"></iframe> -->
<iframe id="pictureRotation" runat="server" src="pictureRotation" width="100%" height="380" frameborder="no" border="0"  scrolling="no" allowtransparency="yes"></iframe>
<!-- <iframe id="center" name="center" runat="server" src="center" width="100%" height="1000" frameborder="no" border="0"  scrolling="no" allowtransparency="yes"></iframe> -->
<iframe id="center" name="center" src="center" marginheight="0" marginwidth="0" frameborder="0" scrolling="no" width="100%" height="500"  onLoad="iFrameHeight()" ></iframe>


<iframe runat="server" src="bottom" width="100%" height="325" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes"></iframe>
</body>
</html>
