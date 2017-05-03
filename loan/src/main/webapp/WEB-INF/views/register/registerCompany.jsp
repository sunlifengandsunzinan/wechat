<?xml version="1.0" encoding="UTF-8" ?>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/WEB-INF/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>填写公司信息</title>
<script language="JavaScript" src="<%=path%>/js/jquery-easyui-1.4/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/scrollable.js"></script>
 <script type="text/javascript" src="<%=path%>/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery-easyui-1.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery-easyui-1.4/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery-easyui-1.4/datagrid-detailview.js"></script>
 <script type="text/javascript" src="<%=path%>/js/ajaxfileupload.js"></script>

<link rel="stylesheet" type="text/css" href="<%=path%>/js/jquery-easyui-1.4/themes/gray/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/js/jquery-easyui-1.4/themes/icon.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/css/style.css"/>
<script language="javascript">

$(document).ready(function(){

	//解决ie访问，ajax从缓存中读取数据的问题
	$.ajaxSetup({cache:false});
	
	dataload();
});
function dataload(){
$.post("<%=path%>/register/intProCity",
		   function(data){

	      $("#selProvince").append(data);
		   });
}

function doRegisterCompany() {
	var txt =  $('#txt').val();
	var company =  $('#company').val();
	var phone =  $('#phone').val();
	var selProvince =  $('#selProvince').val();
	var selCity =  $('#selCity').val();
	var address =  $('#address').val();
	if(company == ""){
		$.messager.alert('提示','请填写公司名称','info');
	}else if(txt == ""){
		$.messager.alert('提示','请选择营业执照','info');
	}else if(phone == ""){
		$.messager.alert('提示','请填写联系人电话','info');
	}else if(selProvince == ""||selCity == ""||address == ""){
		$.messager.alert('提示','请填写办公地址','info');
	}else{
	    				 var url = "<%=path%>/register/doRegisterCompany";
	    					$('#fm_registerTwo').form('submit', {
	    						url : url,
	    						onSubmit: function(){    
	    					        return true;
	    					    },  
	    						success : function(data) {
	    							
	    							
	    							var id = data;
	    					    	if ($("#fileToUpload").val().length > 0) {

	    					    		 ajaxFileUpload(id);
	    					    		 
	    					    		 $.messager.alert('提示','保存成功！','info',function () {
	    					    			 window.location=("<%=path%>/register/toPersonalCenter");
	    					    	        });
	    					    		
	    					        }
	    					        else {
	    					    		 $.messager.alert('提示','保存成功！','info',function () {
	    					    			 window.location=("<%=path%>/register/toPersonalCenter");
	    					    	        });
	    					        }

	    						} 
	    					});

	}
	
}

function selectProv(){
	$("#selCity").empty();
	var checkValue=$("#selProvince").val();
	$.post("<%=path%>/register/queryProCity",{provinceName:checkValue},
			   function(data){
		      $("#selCity").append(data);
		  	var checkCity=$("#selCity").val();
			if(checkValue==checkCity){
				$("#selCity").hide();
			}else{
				$("#selCity").show();
			}
			   });

}

function ajaxFileUpload(id) {
    $.ajaxFileUpload
    (
        {
            url: '<%=path%>/register/saveImg', //用于文件上传的服务器端请求地址
            data: {id: id},
            secureuri: false, //是否需要安全协议，一般设置为false
            fileElementId: 'fileToUpload', //文件上传域的ID
            dataType: 'text', //返回值类型 一般设置为json
            success: function (data, status)  //服务器成功响应处理函数
            {
            	//$.messager.alert('提示','上传成功！','info');
                if (typeof (data.error) != 'undefined') {
                    if (data.error != '') {
                        alert(data.error);
                    } else {
                        alert(data.msg);
                    }
                }
            },
            error: function (data, status, e)//服务器响应失败处理函数
            {
                alert(e);
            }
        }
    );
    return false;
}
</script>

</head>
<body >
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="80" align="center" valign="middle" bgcolor="#FDA80D"><img src="../images/gg_02.jpg" width="1440" height="80" /></td>
  </tr>
</table>
<table width="1874" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="1874" height="10"></td>
  </tr>
</table>
<table width="1100" border="0" align="center" cellpadding="0" cellspacing="0" style="margin:0 auto;">
  <tr>
    <td height="450" align="center" valign="top"><table width="1100" border="0" cellpadding="0" cellspacing="1" bgcolor="#dedede">
      <tr>
        <td width="1098" height="500" align="center" valign="top" bgcolor="#f6f6f6"><table width="1098" border="0" cellspacing="1" cellpadding="0">
            <tr>
              <td width="1096" height="40" align="center" valign="middle" background="../images/hy_03.jpg" class="STYLE4">填写会员信息</td>
            </tr>
          </table>
          <form id="fm_registerTwo" name="fm_registerTwo" action="<%=path%>/register/doRegisterCompany" method="post"> 
            <table width="902" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="902" height="500" align="center" valign="middle"><table width="830" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="800" height="450" align="center" valign="top"><table width="830" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="83" height="50" align="right" valign="middle">登陆邮箱：</td>
                            <td align="left" class="STYLE8"><table width="747" border="0" cellspacing="0" cellpadding="0">
                        <tr style="display:none;">
						<td width="30%" height="30" align="right" valign="middle">ID : &nbsp;</td>
						<td width="68%" height="30" align="left" valign="middle">
							<input id="id" name="id" class="easyui-validatebox textbox" data-options="required:true" style="width: 180px; height: 20px;" value ="${registerInfo.id}" />
							</td>
							</tr>	
                              <tr>
                                <td width="220" height="50" align="left" valign="middle"><input type="text" name="email" id="email" style="width:200px; height:25px; line-height:25px; padding-left:5px;" readonly="readonly" value ="${registerInfo.email}" /></td>
                                <td width="90" align="left" valign="middle" class="STYLE8">* 填写邮箱地址</td>
                                <td width="83" align="right" valign="middle">公司名称：</td>
                                <td width="220" align="left" valign="middle"><input type="text" name="company" id="company" style="width:200px; height:25px; line-height:25px; padding-left:5px;" /></td>
                                <td width="134" align="left" valign="middle" class="STYLE8">* 填写公司名称</td>
                              </tr>
                            </table></td>
                          </tr>
                          <tr>
                            <td height="50" align="right" valign="middle">昵称：</td>
                            <td align="left"><table width="747" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td width="220" height="50" align="left" valign="middle"><input type="text" name="username" id="username" style="width:200px; height:25px; line-height:25px; padding-left:5px;" /></td>
                                  <td width="90" align="left" valign="middle" class="STYLE8"></td>
                                  <td width="83" align="right" valign="middle">职务名称：</td>
                                  <td width="220" align="left" valign="middle"><input type="text" name="job" id="job" style="width:200px; height:25px; line-height:25px; padding-left:5px;" /></td>
                                  <td width="134" align="left" valign="middle" class="STYLE8"></td>
                                </tr>
                            </table></td>
                          </tr>
                          <tr>
                            <td height="50" align="right" valign="middle">微信号：</td>
                            <td align="left"><table width="747" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td width="220" height="50" align="left" valign="middle"><input type="text" name="wechat" id="wechat" style="width:200px; height:25px; line-height:25px; padding-left:5px;" /></td>
                                  <td width="90" align="left" valign="middle" class="STYLE8"></td>
									<td width="83" align="right" valign="middle">营业执照：</td>
                                  <td width="220" align="left" valign="middle"><input type="text" name="txt" id="txt" style="width:200px; height:25px; line-height:25px; padding-left:5px;" /></td>
                                  <td width="134" align="left" valign="middle" class="STYLE8"><a href="JavaScript:void(0);"  onmousemove="fileToUpload.style.pixelLeft=event.x-60;fileToUpload.style.pixelTop=this.offsetTop;" onclick="fileToUpload.click()"><img src="../images/an03.jpg" width="68" height="25" border="0" /></a>
                                  <input type="file" id="fileToUpload" name="fileToUpload" onchange="txt.value=this.value" style="position:absolute;filter:alpha(opacity=0);-moz-opacity:0;display:none;" size="1" hidefocus />
                                  </td>     
                                </tr>
                            </table></td>
                          </tr>
                          <tr>
                            <td height="50" align="right" valign="middle">QQ：</td>
                            <td align="left"><table width="747" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td width="220" height="50" align="left" valign="middle"><input type="text" name="oicq" id="oicq" style="width:200px; height:25px; line-height:25px; padding-left:5px;" /></td>
                                  <td width="90" align="left" valign="middle" class="STYLE8"></td>
                                  <td width="83" align="right" valign="middle">电话：</td>
                                  <td width="220" align="left" valign="middle"><input type="text" name="phone" id="phone" style="width:200px; height:25px; line-height:25px; padding-left:5px;" /></td>
                                  <td width="134" align="left" valign="middle" class="STYLE8">* 请填写联系人电话</td>
                                </tr>
                            </table></td>
                          </tr>
                        </table>
 							<table width="830" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="84" height="50" align="right" valign="middle">办公地址：</td>
                              <td align="left" valign="middle"><select id="selProvince" name="selProvince" onchange="selectProv()" style="width:190px; height:32px;line-height:25px; padding-left:5px;" name="select4" id="select4">
						<option value="">--请选择省份--</option>
                        </select></td>
                             <td align="left" valign="middle"><select id="selCity" name="selCity" style="width:190px; height:32px;" name="select4" id="select4">
						<option value="">--请选择城市--</option>
                        </select></td>
                        <td width="130" align="left" valign="middle"><input type="text" name="address" id="address" style="width:200px; height:25px; line-height:25px; padding-left:5px;" /></td>
                              <td width="134" align="left" valign="middle" class="STYLE8">* 现办公地址</td>
                            </tr>
                          </table>
                          <table width="830" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="83" height="150" align="right" valign="top" style="padding-top:15px;">公司描述：</td>
                              <td width="747" align="left" valign="top" style="padding-top:10px;"><label>
                              <textarea name="companyDesc" id="companyDesc" cols="45" rows="5" style="width:710px; height:130px;"></textarea>
                              </label></td>
                            </tr>
                          </table>
                        <table width="830" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="830" height="32" align="center" valign="middle"><a href="javascript:void(0);" onclick="doRegisterCompany();"><img src="../images/an07.jpg" width="123" height="32" border="0" /></a></td>
                            </tr>
                        </table></td>
                    </tr>
                </table></td>
              </tr>
          </table>
          </form></td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">

  <tr>
    <td width="1874" height="10"></td>
  </tr>
</table>
</body>
</html>
