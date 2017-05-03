<?xml version="1.0" encoding="UTF-8" ?>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/WEB-INF/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>注册</title>
<script language="JavaScript" src="<%=path%>/js/jquery-easyui-1.4/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/scrollable.js"></script>
 <script type="text/javascript" src="<%=path%>/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery-easyui-1.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery-easyui-1.4/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery-easyui-1.4/datagrid-detailview.js"></script>

<link rel="stylesheet" type="text/css" href="<%=path%>/js/jquery-easyui-1.4/themes/gray/easyui.css"/>
<link rel="stylesheet" type="text/css" href="<%=path%>/js/jquery-easyui-1.4/themes/icon.css"/>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/style.css"/>
<script language="javascript">
 	function doSave(){
 		var oForm = document.getElementById("fm_save"); 
 		oForm.submit(); 
 	}
</script>
	
</head>
<body>

<form id="fm_save" name="fm_save" action="<%=path%>/register/modifyRegister" method="post">   
				<input type="hidden" name="id" value="${register.id }" />
<table width="904" border="0" align="center" cellpadding="0" cellspacing="0" style="margin:0 auto;">
  <tr>
    <td height="450" align="center" valign="top"><table width="900" border="0" cellpadding="0" cellspacing="1" bgcolor="#dedede">
      <tr>
        <td width="900" height="500" align="center" valign="top" bgcolor="#f6f6f6"><table width="900" border="0" cellspacing="1" cellpadding="0">
            <tr>
              <td width="900" height="40" align="center" valign="middle" background="<%=path %>/images/hy_03.jpg" class="STYLE4">填写会员信息</td>
            </tr>
          </table>
            <table width="900" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="900" height="500" align="center" valign="middle"><table width="830" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="800" height="450" align="center" valign="top"><table width="830" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="83" height="40" align="right" valign="middle">登陆邮箱：</td>
                            <td align="left" class="STYLE8"><table width="747" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="220" height="40" align="left" valign="middle">
                                	<!-- <input type="text" name="textfield5" id="textfield7" style="width:200px; height:25px; line-height:25px; padding-left:5px;" /> -->
                                	<input name="email" value="${register.email }"  class="easyui-textbox" disabled="disabled" data-options="editable:false"  style="width: 200px; height: 25px;" />
                                </td>
                                <td width="90" align="left" valign="middle" class="STYLE8"><!-- * 填写邮箱地址 --></td>
                                <td width="83" align="right" valign="middle">公司名称：</td>
                                <td width="220" align="left" valign="middle">
                                	<!-- <input type="text" name="textfield5" id="textfield8" style="width:200px; height:25px; line-height:25px; padding-left:5px;" /> -->
                                	<input name="company" value="${register.company }" class="easyui-textbox" disabled="disabled" data-options="editable:false" style="width: 200px; height: 25px;" />
                               	</td>
                                <td width="134" align="left" valign="middle" class="STYLE8"><!-- * 填写公司名称 --></td>
                              </tr>
                            </table></td>
                          </tr>
                          <tr>
                            <td height="40" align="right" valign="middle">昵称：</td>
                            <td align="left"><table width="747" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td width="220" height="40" align="left" valign="middle">
                                  	<!-- <input type="text" name="textfield" id="textfield" style="width:200px; height:25px; line-height:25px; padding-left:5px;" /> -->
                                  	<input name="username" value="${register.username }" class="easyui-validatebox textbox" data-options="required:true" style="width: 200px; height: 25px;" />
                                  </td>
                                  <td width="90" align="left" valign="middle" class="STYLE8">* 填写用户昵称</td>
                                  <td width="83" align="right" valign="middle">职务名称：</td>
                                  <td width="220" align="left" valign="middle">
                                  	<!-- <input type="text" name="textfield2" id="textfield2" style="width:200px; height:25px; line-height:25px; padding-left:5px;" /> -->
                                  	<input name="job" value="${register.job }" class="easyui-validatebox textbox" data-options="required:true" style="width: 200px; height: 25px;" />
                                  </td>
                                  <td width="134" align="left" valign="middle" class="STYLE8">* 填写联系人职务</td>
                                </tr>
                            </table></td>
                          </tr>
                          <tr>
                            <td height="40" align="right" valign="middle">微信号：</td>
                            <td align="left"><table width="747" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td width="220" height="40" align="left" valign="middle">
                                  	<!-- <input type="text" name="textfield3" id="textfield3" style="width:200px; height:25px; line-height:25px; padding-left:5px;" /> -->
                                  	<input name="wechat" value="${register.wechat }" class="easyui-validatebox textbox" data-options="required:true" style="width: 200px; height: 25px;" />
                                  </td>
                                  <td width="90" align="left" valign="middle" class="STYLE8">* 常用微信号</td>
                                  <td width="83" align="right" valign="middle">办公地址：</td>
                                  <td width="220" align="left" valign="middle">
                                  	<!-- <input type="text" name="textfield3" id="textfield4" style="width:200px; height:25px; line-height:25px; padding-left:5px;" /> -->
                                  	<input name="address" value="${register.address }" class="easyui-validatebox textbox" data-options="required:true" style="width: 200px; height: 25px;" />
                                  </td>
                                  <td width="134" align="left" valign="middle" class="STYLE8">* 现用办公地址</td>
                                </tr>
                            </table></td>
                          </tr>
                          <tr>
                            <td height="40" align="right" valign="middle">QQ：</td>
                            <td align="left"><table width="747" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td width="220" height="40" align="left" valign="middle">
                                  	<!-- <input type="text" name="textfield4" id="textfield5" style="width:200px; height:25px; line-height:25px; padding-left:5px;" /> -->
                                  	<input name="oicq" value="${register.oicq }" class="easyui-validatebox textbox" data-options="required:true" style="width: 200px; height: 25px;" />
                                  </td>
                                  <td width="90" align="left" valign="middle" class="STYLE8">* 常用QQ号</td>
                                  <td width="83" align="right" valign="middle">电话：</td>
                                  <td width="220" align="left" valign="middle">
                                  	<!-- <input type="text" name="textfield4" id="textfield6" style="width:200px; height:25px; line-height:25px; padding-left:5px;" /> -->
                                  	<input name="phone" value="${register.phone }" class="easyui-validatebox textbox" data-options="required:true" style="width: 200px; height: 25px;" />
                                  </td>
                                  <td width="134" align="left" valign="middle" class="STYLE8">* 请填写联系人电话</td>
                                </tr>
                            </table></td>
                          </tr>
                        </table>
                          <table width="830" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="84" height="150" align="right" valign="middle">营业执照：</td>
                              <td width="420" align="left" valign="middle" colspan="2">
                              	<!-- <input type="text" name="textfield6" id="textfield9" style="width:400px; height:25px; line-height:25px; padding-left:5px;" /> -->
                              	<img alt="" src="<%=path%>/img/show?path=${register.img }" width="140" height="140" />
                              	</td>
                              <!-- <td width="80" align="left" valign="middle"><a href="#"><img src="images/an03.jpg" width="68" height="25" border="0" /></a></td> -->
                              <td width="246" align="left" valign="middle"><span class="STYLE8"><!-- * 上传企业营业执照图片 --></span></td>
                            </tr>
                          </table>
                          <table width="830" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="83" height="150" align="right" valign="top" style="padding-top:15px;">公司描述：</td>
                              <td width="747" align="left" valign="top" style="padding-top:10px;"><label>
                              	<!-- <textarea name="textarea" id="textarea" cols="45" rows="5" style="width:710px; height:130px;"></textarea> -->
                              	<input name="companyDesc" class="easyui-textbox validatebox" data-options="multiline:true" value="${register.companyDesc }" style="width:710px;height:60px" />
                              </label></td>
                            </tr>
                          </table>
                        <table width="830" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="830" height="32" align="center" valign="middle"><a href="javascript:void(0);"><img src="<%=path %>/images/an06.jpg" onclick="doSave();" width="123" height="32" border="0" /></a></td>
                            </tr>
                        </table></td>
                    </tr>
                </table></td>
              </tr>
          </table></td>
      </tr>
    </table></td>
  </tr>
</table>
</form>












<%-- 
	<div class="rightinfo" align="center" style="padding-top: 100px;">
		<div class="easyui-panel" title="个人信息修改"
			style="width: 750px; padding: 10px 60px 10px 60px;" align="center">
			<form id="fm_save" name="fm_save" action="<%=path%>/register/modifyRegister" method="post">   
				<input type="hidden" name="id" value="${register.id }" />
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td height="30" align="right" valign="middle">公司名称 : &nbsp;</td>
						<td height="30" align="left" valign="middle">
							<input name="company" value="${register.company }" class="easyui-textbox" disabled="disabled" data-options="editable:false" style="width: 200px; height: 20px;background-color: green;" >
						</td>
						<td align="right" valign="middle">邮箱 : &nbsp;</td>
						<td align="left" valign="middle">
							<input name="email" value=${register.email }  class="easyui-textbox" disabled="disabled" data-options="editable:false"  style="width: 200px; height: 20px;">
						</td>
					</tr>
					<tr>
						<td height="30" align="right" valign="middle">微信 : &nbsp;</td>
						<td height="30" align="left" valign="middle">
							<input name="wechat" value="${register.wechat }" class="easyui-validatebox textbox" data-options="required:true" style="width: 200px; height: 20px;">
						</td>
						<td height="30" align="right" valign="middle">qq : &nbsp;</td>
						<td height="30" align="left" valign="middle">
							<input name="oicq" value="${register.oicq }" class="easyui-validatebox textbox" data-options="required:true" style="width: 200px; height: 20px;">
						</td>
					</tr>
					<tr>
						<td height="30" align="right" valign="middle">手机号码 : &nbsp;</td>
						<td height="30" align="left" valign="middle">
							<input name="phone" value=${register.phone } class="easyui-validatebox textbox" data-options="required:true" style="width: 200px; height: 20px;">
						</td>
						<td height="30" align="right" valign="middle">昵称 : &nbsp;</td>
						<td height="30" align="left" valign="middle">
							<input name="username" value="${register.username }" class="easyui-validatebox textbox" data-options="required:true" style="width: 200px; height: 20px;">
						</td>
					</tr>
					<tr>
						<td height="30" align="right" valign="middle">公司地址 : &nbsp;</td>
						<td height="30" align="left" colspan="3" valign="middle">
							<input name="address" value="${register.address }" class="easyui-validatebox textbox" data-options="required:true" style="width: 528px; height: 20px;">
						</td>
					</tr>
					<tr>
						<td height="30" align="right" valign="middle">公司描述: &nbsp;</td>
						<td height="30" align="left" colspan="3" valign="middle">
							 <input name="companyDesc" class="easyui-textbox validatebox" data-options="multiline:true" value="${register.companyDesc }" style="width:528px;height:60px">
						</td>
					</tr>
					<tr>
						<td align="right" valign="middle">营业执照 : &nbsp;</td>
						<td align="left" colspan="3" valign="middle">
							<img alt="" src="http://localhost:8080/upload/${register.img }" width="50" height="40" >
						</td>
					</tr>
				</table>
			</form>
			<a href="javascript:void(0);" class="easyui-linkbutton" onclick="doSave();" iconCls="icon-ok" style="height: 20px">保存</a>
		</div>	 
	</div>
 --%>	
</body>
</html>
