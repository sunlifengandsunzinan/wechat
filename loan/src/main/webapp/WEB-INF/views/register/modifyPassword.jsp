<?xml version="1.0" encoding="UTF-8" ?>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/WEB-INF/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>修改密码</title>
<script language="JavaScript" src="<%=path%>/js/jquery-easyui-1.4/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/scrollable.js"></script>
 <script type="text/javascript" src="<%=path%>/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery-easyui-1.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery-easyui-1.4/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=basePath %>dwr/engine.js"></script>
<script type="text/javascript" src="<%=basePath %>dwr/util.js"></script>
<script type="text/javascript" src="<%=basePath %>dwr/interface/checkOldPassword.js"></script>

<link rel="stylesheet" type="text/css" href="<%=path%>/js/jquery-easyui-1.4/themes/gray/easyui.css"/>
<link rel="stylesheet" type="text/css" href="<%=path%>/js/jquery-easyui-1.4/themes/icon.css"/>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/style.css"/>

<script language="javascript">

	$(function(){
		/* dwr.engine.setActiveReverseAjax(true); // 激活反转 重要  
		//这个就是当页面加载时，后台listen监听器去除失效的scriptSession，再创建新的scriptSession
		dwr.engine.setNotifyServerOnPageUnload(true,true);
		//自定义的javascript函数
		//onPageLoad();
		dwr.engine.setErrorHandler(function(){
			//这个方法 防止项目已经关闭，客户页面还未关闭，页面会谈Error的问题
		}); */
	}); 

	$.extend($.fn.validatebox.defaults.rules, {    
	    equals: {    
	        validator: function(value,param){    
	            return value == $(param[0]).val();    
	        },    
	        message: '两次新密码不相同.'   
	    }    
	});  


 	function doCheck(){
 		var oldPassword = $("#oldpwd").val();
 		var passowrd = $("#oldPassword").val();
 		
 		checkOldPassword.checkPassword(oldPassword , passowrd,callback);
 	}
 	
 	function callback(a){ 
 		if(a == true){
 			$('#fm_save').form('submit', {    
 			    url:'<%=path%>/register/modifyPassword',
 			   success:function(data){    
 				  $.messager.alert('提示','新密码设置成功，请牢记新密码！');
 				  $("#oldPassword").val('');
 				  $("#newPassword").val('');
 				  $("#newPasswordRepeat").val('');
 			    }  
 			});  
 		}else{
 			$.messager.alert('警告','原始密码输入错误');
 			return;
 		}
 	}
 	
 	
 	
</script>
	
</head>
<body>

	

	<table width="904" border="0" cellpadding="0" cellspacing="1" bgcolor="#dedede">
      <tr>
        <td width="902" height="450" align="center" valign="top" bgcolor="#f6f6f6"><table width="902" border="0" cellspacing="1" cellpadding="0">
          <tr>
            <td width="902" height="40" align="left" valign="middle" background="<%=path %>/images/hy_03.jpg" class="STYLE4">修改密码</td>
          </tr>
        </table>
        <form id="fm_save" name="fm_save" action="<%=path%>/register/modifyPassword" method="post">   
				<input type="hidden" name="id" value="${register.id }" />
          <table width="902" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="902" height="450" align="center" valign="middle"><table width="830" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="800" height="400" align="center" valign="middle"><table width="320" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="90" height="40" align="right" valign="middle">用 户 名：</td>
                      <td width="230" align="left" class="STYLE8">${register.company }</td>
                    </tr>
                    <tr>
                      <td height="40" align="right" valign="middle">原 密 码：</td>
                      <td align="left">
                      	<!-- <input type="text" name="textfield7" id="textfield7" style="width:230px; height:25px; line-height:25px; padding-left:5px;" /> -->
                      	<input id="oldpwd" type="hidden" value="${register.password }" />
							<input type="password" id="oldPassword" name="oldPassword" value="" class="easyui-validatebox textbox" data-options="required:true" style="width: 230px; height: 25px;" />
                       </td>
                    </tr>
                    <tr>
                      <td height="50" align="right" valign="middle">新 密 码：</td>
                      <td align="left">
                        <!-- <input type="text" name="textfield" id="textfield" style="width:230px; height:25px; line-height:25px; padding-left:5px;" /> -->
                        <input type="password" id="newPassword" name="newPassword" value="" class="easyui-validatebox textbox" data-options="required:true" style="width: 230px; height: 25px;" />
                      </td>
                    </tr>
                    <tr>
                      <td height="50" align="right" valign="middle">确认密码：</td>
                      <td align="left">
                      	<!-- <input type="text" name="textfield2" id="textfield2" style="width:230px; height:25px; line-height:25px; padding-left:5px;" /> -->
                      	<input type="password" id="newPasswordRepeat" name="newPasswordRepeat" value="" class="easyui-validatebox textbox" required="required" validType="equals['#newPassword']" style="width: 230px; height: 25px;" />
                      </td>
                    </tr>
                    <tr>
                      <td height="50" colspan="2" align="center" valign="middle"><a href="javascript:void(0);"><img src="<%=path %>/images/an06.jpg" width="123" onclick="doCheck();" height="32" border="0" /></a></td>
                      </tr>
                  </table></td>
                </tr>
              </table></td>
            </tr>
          </table>
          </form>
          </td>
      </tr>
      
    </table>




















	<%-- <div class="rightinfo" align="center" style="padding-top: 100px;">
		
		<div class="easyui-panel" title="修改密码" style="width: 450px; padding: 10px 60px 10px 60px;" align="center">
			<form id="fm_save" name="fm_save" action="<%=path%>/register/modifyPassword" method="post">   
				<input type="hidden" name="id" value="${register.id }" />
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td height="30" align="right" valign="middle">原密码 : &nbsp;</td>
						<td height="30" align="left" valign="middle">
							<input id="oldpwd" type="hidden" value="${register.password }" />
							<input type="password" id="oldPassword" name="oldPassword" value="" class="easyui-validatebox textbox" data-options="required:true" style="width: 200px; height: 20px;" >
						</td>
					</tr>
					<tr>
						<td height="30" align="right" valign="middle">新密码 : &nbsp;</td>
						<td height="30" align="left" valign="middle">
							<input type="password" id="newPassword" name="newPassword" value="" class="easyui-validatebox textbox" data-options="required:true" style="width: 200px; height: 20px;" >
						</td>
					</tr>
					<tr>
						<td height="30" align="right" valign="middle">再次输入新密码: &nbsp;</td>
						<td height="30" align="left" valign="middle">
							<input type="password" name="newPasswordRepeat" value="" class="easyui-validatebox textbox" required="required" validType="equals['#newPassword']" style="width: 200px; height: 20px;" >
						</td>
					</tr>
				</table>
			</form>
			<a href="javascript:void(0);" class="easyui-linkbutton" onclick="doCheck();" iconCls="icon-ok" style="height: 20px">保存</a>
		</div>	 
		
	</div> --%>
</body>
</html>
