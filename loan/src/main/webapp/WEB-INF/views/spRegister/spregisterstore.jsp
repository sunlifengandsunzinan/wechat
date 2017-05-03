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

    <script type="text/javascript" src="<%=path %>/js/jquery-easyui-1.4/jquery.min.js"></script>
	<script type="text/javascript" src="<%=path %>/js/jquery-easyui-1.4/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=path %>/js/jquery-easyui-1.4/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="<%=path%>/js/jquery-easyui-1.4/jquery-migrate-1.2.1.min.js"></script>
	<script type="text/javascript" src="<%=path%>/js/jquery.jslides.js"></script>
	<script type="text/javascript" src="<%=path%>/js/scrollable.js"></script>
	 <script type="text/javascript" src="<%=path%>/js/ajaxfileupload.js"></script>
	
	<link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui-1.4/themes/gray/easyui.css" />
	<link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui-1.4/themes/icon.css" />

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

function doRegister() {
	 var email = $('#email').val();
		var newpassword = $('#newpassword').val();
		var confirmpassword = $('#confirmpassword').val();
		if(email != "" && newpassword != "" && confirmpassword != ""){
			 if(newpassword != confirmpassword){
				$.messager.alert('提示','您两次输入的新密码不一致.','info');
			}else{
		    	 var url = "<%=path%>/spRegister/doRegister";
			 		$('#fm_spregisterStore').form('submit', {
			 			url : url,
			 			success : function(data) {
			    $.messager.alert('提示','注册成功！','info',function () {
	    			 window.location=("<%=path%>");
 	        });
			 			}
			 		});
			}
		}  	
}


</script>

</head>

<body style="background-color:#262626">

<%-- <div class="top">
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
<script type="text/javascript" src="<%=path %>/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery.select.js"></script> --%>
<%-- <jsp:include  page="/WEB-INF/vies/top.jsp"/>  --%>

<jsp:include page="/WEB-INF/views/top.jsp" flush="true" />

<!-- 
<iframe runat="server" src="../top.html" width="100%" height="50" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes"></iframe>
 -->


<table width="100%" height="578" style=" background-image:url(<%=path%>/images/bj_01.jpg);" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="578" align="center" valign="middle"><table width="1440" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="1440" height="100" align="center" valign="middle"><img src="<%=path%>/images/zhuche.png" width="144" height="37" /></td>
      </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td background="<%=path%>/images/dian01.png" style="width:100%; height:2px;"></td>
      </tr>
    </table>
    
    <table width="1440" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="320" align="center" valign="middle">
         <form id="fm_spregisterStore" name="fm_spregisterStore" action="<%=path%>/spRegister/doRegister" method="post"> 
        <table width="400" border="0" cellspacing="0" cellpadding="0">
        
           <tr style="display:none;">
              <td align="center" valign="middle" style="font-size:15px; color:#CCCCCC;">选择城市ID：</td>
              <td height="50" align="left" valign="middle"><input type="text" name="id" id="id" data-options="required:true" style="width:261px; height:27px; line-height:27px; padding-left:5px;" value ="${id}" /></td>
            </tr>
            
               <tr style="display:none;">
              <td align="center" valign="middle" style="font-size:15px; color:#CCCCCC;">用户类型：</td>
              <td height="50" align="left" valign="middle"><input type="text" name="type" id="type" data-options="required:true" style="width:261px; height:27px; line-height:27px; padding-left:5px;" value ="${type}" /></td>
            </tr>
            <tr>
              <td align="center" valign="middle" style="font-size:15px; color:#CCCCCC;">账号：</td>
              <td height="50" align="left" valign="middle"><input type="text" name="username" id="username" data-options="required:true" style="width:261px; height:27px; line-height:27px; padding-left:5px;" /></td>
            </tr>
            <tr>
              <td align="center" valign="middle" style="font-size:15px; color:#CCCCCC;">登陆密码：</td>
              <td height="50" align="left" valign="middle"><input type="password" name="newpassword" id="newpassword" data-options="required:true" style="width:261px; height:27px; line-height:27px; padding-left:5px;"/></td>
            </tr>
            <tr>
              <td align="center" valign="middle" style="font-size:15px; color:#CCCCCC;">确认密码：</td>
              <td height="50" align="left" valign="middle"><input type="password" name="confirmpassword" id="confirmpassword" data-options="required:true" style="width:261px; height:27px; line-height:27px; padding-left:5px;"/></td>
            </tr>
              <tr>
              <td align="center" valign="middle" style="font-size:15px; color:#CCCCCC;">姓名：</td>
              <td height="50" align="left" valign="middle"><input type="text" name="contactname" id="contactname" data-options="required:true" style="width:261px; height:27px; line-height:27px; padding-left:5px;" /></td>
            </tr>
               <tr>
              <td align="center" valign="middle" style="font-size:15px; color:#CCCCCC;">手机：</td>
              <td height="50" align="left" valign="middle"><input type="text" name="phone" id="phone" data-options="required:true" style="width:261px; height:27px; line-height:27px; padding-left:5px;" /></td>
            </tr>
              <tr>
              <td align="center" valign="middle" style="font-size:15px; color:#CCCCCC;">地址：</td>
              <td height="50" align="left" valign="middle"><input type="text" name="address" id="address" data-options="required:true" style="width:261px; height:27px; line-height:27px; padding-left:5px;" /></td>
            </tr>
               <tr>
              <td align="center" valign="middle" style="font-size:15px; color:#CCCCCC;">便利店名称：</td>
              <td height="50" align="left" valign="middle"><input type="text" name="storename" id="storename" data-options="required:true" style="width:261px; height:27px; line-height:27px; padding-left:5px;" /></td>
            </tr>
            <tr>
              <td align="center" valign="middle">&nbsp;</td>
              <td height="30" align="left" valign="middle"><table width="300" border="0" cellspacing="0" cellpadding="0">

              </table></td>
            </tr>
            <tr>
              <td align="center" valign="middle">&nbsp;</td>
              <td height="40" align="left" valign="bottom" style="padding-left:45px;"><a href="javascript:void(0);" onclick="doRegister();"><img src="<%=path%>/images/an01.jpg" width="123" height="32" border="0" /></a></td>
              </tr>
        </table>
        </form>
        </td>
      </tr>
      <tr>
      
      </tr>
    </table></td>
  </tr>
</table>
<iframe runat="server" src="<%=path%>/bottom" width="100%" height="325" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes"></iframe>

</body>
</html>
