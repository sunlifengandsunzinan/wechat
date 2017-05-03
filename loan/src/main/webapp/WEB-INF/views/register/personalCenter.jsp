<?xml version="1.0" encoding="UTF-8" ?>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/WEB-INF/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>创建供需单</title>
	<script type="text/javascript" src="<%=path %>/js/jquery-easyui-1.4/jquery.min.js"></script>
	<script type="text/javascript" src="<%=path %>/js/jquery-easyui-1.4/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=path %>/js/jquery-easyui-1.4/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="<%=path%>/js/jquery-easyui-1.4/datagrid-detailview.js"></script>
	<script type="text/javascript" src="<%=path%>/js/jquery.jslides.js"></script>
	
	<link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui-1.4/themes/gray/easyui.css" />
	<link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui-1.4/themes/icon.css" />
	<link rel="stylesheet" type="text/css" href="<%=path%>/css/jquery.jslides.css" media="screen" />
	<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />
	<link href="<%=path%>/css/pages.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">

	/**
	 * 页面初始化
	 */
	$(function(){
		var defaultUrl = "${defaultUrl}";
		
		if(defaultUrl != null && defaultUrl != ""){
			$('#'+defaultUrl).click();
		}else{
			//默认点击供需管理
			$('#supplyAndDemand').click();
		}
		
	});

	/**
	 * 根据不同的url，载人panel页面
	 */
	function loadPanel(url,title,obj){
		//设置字体颜色
		$("a[name='a_left']").each(function(){
		    $(this).css('color','#8f8f8f');
		 });
		$(obj).css('color','red');
		var urlParam = $("#urlParam").val();
		//刷新中间部分
		$("#pn_personalCenter").attr("src",'<%=path%>/'+url+urlParam) 
		
	}

	function iFrameHeight() {
        var ifm= document.getElementById("pn_personalCenter");
        var subWeb = document.frames ? document.frames["pn_personalCenter"].document : ifm.contentDocument;
            if(ifm != null && subWeb != null) {
            ifm.height = subWeb.body.scrollHeight;
        }
        //alert($("#pn_personalCenter").css("height"));
        var h = ($("#pn_personalCenter").css("height")).replace("px","");
        var v = parseInt(h)+100;
         $('#center', window.parent.document).css('height',v);//($("#pn_personalCenter").css("height")+100) );
            
            
    }

</script>

</head>
<body >
<input type="hidden" id="urlParam" name="urlParam" value="${urlParam}" />
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="80" align="center" valign="middle" bgcolor="#FDA80D"><img src="../images/gg_02.jpg" width="1440" height="80" /></td>
  </tr>
</table>
<table width="1874" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="1874" height="10"></td>
  </tr>
</table>
<table width="1100" border="0" align="center" cellpadding="0" cellspacing="0" style="margin:0 auto;" >
  <tr>
    <td width="186" height="300" align="center" valign="top"><table width="186" border="0" cellpadding="0" cellspacing="1" bgcolor="#dedede">
      <tr>
        <td width="184" height="162" align="center" valign="top"><table width="184" border="0" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF">
          <tr>
            <td width="182" height="42" bgcolor="#ededed"><img src="../images/hy_01.jpg" width="182" height="40" /></td>
          </tr>
          <tr>
            <td height="30" align="center" valign="middle" background="../images/hy_02.jpg" bgcolor="#ededed"><a href="javascript:void(0);" id="supplyAndDemand" name="a_left" onclick="loadPanel('register/toRegisterStepThree','供需管理',this);" class="link1" >供需管理</a></td>
          </tr>
          <tr>
            <td height="30" align="center" valign="middle" background="../images/hy_02.jpg" bgcolor="#ededed"><a href="javascript:void(0);" id="chat" name="a_left" onclick="loadPanel('chat/chatInfo','对话管理',this);" class="link1">对话管理</a></td>
          </tr>
          <tr>
            <td height="30" align="center" valign="middle" background="../images/hy_02.jpg" bgcolor="#ededed"><a href="javascript:void(0);" id="edit" name="a_left" onclick="loadPanel('register/toModifyRegister','编辑信息',this);" class="link1">编辑信息</a></td>
          </tr>
          <tr>
            <td height="30" align="center" valign="middle" background="../images/hy_02.jpg" bgcolor="#ededed"><a href="javascript:void(0);" id="modifyPwd" name="a_left" onclick="loadPanel('register/toModifyPassword','修改密码',this);" class="link1">修改密码</a></td>
          </tr>
        </table></td>
      </tr>
    </table>
      <table width="186" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="186" height="10"></td>
        </tr>
      </table>
      <table width="186" border="0" cellpadding="0" cellspacing="1" bgcolor="#dedede">
        <tr>
          <td width="184" height="226" align="center" valign="middle" bgcolor="#FFFFFF"><table width="184" border="0" cellspacing="1" cellpadding="0">
            <tr>
              <td width="182" height="226" align="center" valign="middle"><a href="#"><img src="../images/gg_01.jpg" width="182" height="226" border="0" /></a></td>
            </tr>
          </table></td>
        </tr>
      </table></td>
    <td width="10"></td>
    <td width="904" align="left" valign="top">
    
    <!-- <div id="pn_personalCenter" > </div>   -->
	<iframe id="pn_personalCenter" name="pn_personalCenter" src="" marginheight="0" marginwidth="0" frameborder="0" scrolling="no" width="100%" height="100%" onLoad="iFrameHeight()" ></iframe>
    
    </td>
  </tr>
</table>
<table width="1874" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="1874" height="10"></td>
  </tr>
</table>
</body>
</html>
