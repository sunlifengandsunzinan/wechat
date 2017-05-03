<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>经销商明细</title>
	<script type="text/javascript" src="<%=path %>/js/jquery-easyui-1.4/jquery.min.js"></script>
	<script type="text/javascript" src="<%=path %>/js/jquery-easyui-1.4/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=path %>/js/jquery-easyui-1.4/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="<%=path%>/js/jquery-easyui-1.4/datagrid-detailview.js"></script>
	
	<link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui-1.4/themes/gray/easyui.css" />
	<link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui-1.4/themes/icon.css" />
	<link href="<%=path%>/css/base.css" rel="stylesheet" type="text/css" />
	<link href="<%=path%>/css/pages.css" rel="stylesheet" type="text/css" />
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
<body >	
<!-- <iframe runat="server" src="../top" width="100%" height="50" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes"></iframe> -->

          
<table width="1100" border="0" cellpadding="0" cellspacing="0" style="margin:0 auto;">
  <tr>
    <td width="1100" height="10"></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#dfdadc" style="margin:0 auto;">
  <tr>
    <td width="100%" height="233" align="center" valign="middle" bgcolor="#ffffff"><table width="1100" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="240" height="233" align="center" valign="middle"><table width="184" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="184" height="184" align="center" valign="middle" background="../images/07.jpg"><table width="162" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="162" height="162"><img src="../images/08.jpg" width="162" height="162" /></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
        <td width="860"><table width="860" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="170" height="40" align="left" valign="middle" class="STYLE11">${companyInfo.companyname}</td>
            <td width="100" align="left" valign="middle"><table width="90" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="30" align="center" valign="middle"></td>
                <td width="30" align="center" valign="middle"></td>
                <td width="30" align="center" valign="middle"></td>
              </tr>
            </table></td>
            <td width="375" align="left" valign="middle" class="STYLE9"></td>
            <td width="215" align="left" valign="middle">&nbsp;</td>
          </tr>
          <tr>
            <td height="30" colspan="4" align="left" valign="middle" class="STYLE1">${companyInfo.companydesc}</td>
            </tr>
          <tr>
            <td height="30" colspan="4" align="left" valign="middle" class="STYLE1">公司地址：${companyInfo.address}</td>
            </tr>
          <tr>
            <td height="40" align="left" valign="middle"><table width="135" border="0" cellpadding="0" cellspacing="0" background="../images/bj_06.jpg">
              <tr>
                <td width="45" height="25" align="left" valign="middle">供应数</td>
                <td width="45" align="center" valign="middle">需求数</td>
                <td width="45" align="right" valign="middle">对话数</td>
              </tr>
              <tr>
                <td height="25" align="center" valign="middle" class="STYLE9">${companyInfo.supplynum}</td>
                <td align="center" valign="middle" class="STYLE9">${companyInfo.demandnum}</td>
                <td align="center" valign="middle" class="STYLE9">${companyInfo.dialognum}</td>
              </tr>
            </table></td>
            <td colspan="2" align="left" valign="middle">&nbsp;</td>
            <td align="right" valign="middle" style="padding-right:20px;"><a href="javascript:void(0);" onclick="contact();"><img src="../images/an12.jpg" width="48" height="49" border="0" /></a></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="1100" border="0" cellpadding="0" cellspacing="0" style="margin:0 auto;">
  <tr>
    <td width="1100" height="20"></td>
  </tr>
</table>
<table width="1100" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#dfdadc" style="margin:0 auto;">
  <tr>
    <td width="1098" height="34" background="../images/bj_02.jpg" bgcolor="#f3f3f3"><table width="1098" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="150" height="34" align="center" valign="middle" background="../images/hx_01.jpg" class="STYLE10">供货信息</td>
        <td width="948">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="33" bgcolor="#f3f3f3"  id="userSupply"><table width="1098" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="150" height="33" align="center" valign="middle">排 序：
          <select name="select" id="select">
            <option>发布时间</option>
          </select>
          </td>
        <td width="150" align="center" valign="middle"></td>
        <td width="798" align="left" valign="middle">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="1100" border="0" cellpadding="0" cellspacing="0" style="margin:0 auto;">
  <tr>
    <td width="1100" height="10"></td>
  </tr>
</table>
<table width="1100" border="0" align="center" cellpadding="0" cellspacing="0" style="margin:0 auto;">
  <tr>
    <td width="855" height="300" align="left" valign="top">
    
    
    <div style="display:none;" id ="userSupplyTable">
     <c:forEach items="${listSupply}" var="item">
    <table width="855" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="235" height="117" align="center" valign="top" bgcolor="#FFFFFF"><table width="620" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="180" height="229" align="center" valign="middle"><table width="150" border="0" cellpadding="0" cellspacing="1" bgcolor="#dfdadc">
                <tr>
                  <td width="148" height="148" bgcolor="#FFFFFF"><a href="#"><img alt="" src="<%=path%>/img/show?path=${item.img}" width="98" height="98" border="0" /></a></td>
                </tr>
            </table></td>
            <td width="440" valign="middle"><table width="440" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="35" colspan="2" align="left" class="STYLE11" style="padding-left:8px;">${item["name"]==null?"&nbsp;":item["name"]}</td>
                </tr>
                <tr>
                  <td width="70" height="30" align="right" valign="middle">供应省市：</td>
                  <td width="370" align="left" class="STYLE6">${item["area"]==null?"&nbsp;":item["area"]}</td>
                </tr>
                <tr>
                  <td height="30" align="right" valign="middle">供应品类：</td>
                  <td align="left" class="STYLE6">${item["category"]==null?"&nbsp;":item["category"]}</td>
                </tr>
                <tr>
                  <td height="60" align="right" valign="top" style="padding-top:5px;">主营产品：</td>
                  <td align="left" valign="top" style="line-height:25px;">${item["desc"]==null?"&nbsp;":item["desc"]}</td>
                </tr>
            </table></td>
          </tr>
          <tr>
            <td height="1" colspan="2" align="center" valign="middle" bgcolor="#ededed"></td>
          </tr>
        </table></td>
       
        <td width="620" height="229" align="center" valign="middle" bgcolor="#F9F8F8">
        <div name = "activation1" id = '${item.id}' style="display:none;"  bgcolor="#F9F8F8" class="STYLE6"> 
      
         </div></td>
       
      </tr>
      <tr>
        <td width="235" height="10" align="center" valign="top"></td>
        <td height="10" align="left" valign="top"></td>
      </tr>
    </table>
    
       </c:forEach> 
        </div>
</td>
    <td width="10" align="left" valign="top"></td>
    <td width="235" align="left" valign="top"><table width="235" border="0" cellpadding="0" cellspacing="1" bgcolor="#dfdadc">
      <tr>
        <td width="233" height="354" bordercolor="#F9F8F8" bgcolor="#F9F8F8"><table width="233" border="0" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF">
          <tr>
            <td width="231" height="352"><a href="#"><img src="../images/06.jpg" width="231" height="352" border="0" /></a></td>
          </tr>
        </table></td>
      </tr>
    </table>
      <table width="235" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="235" height="10"></td>
        </tr>
      </table>
 </td>
  </tr>
</table>
<table width="1100" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#dfdadc" style="margin:0 auto;">
  <tr>
    <td width="1098" height="34" background="../images/bj_05.jpg" bgcolor="#f3f3f3"><table width="1098" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="150" height="34" align="center" valign="middle" background="../images/hx_02.jpg" class="STYLE10">需求信息</td>
        <td width="948">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="33" bgcolor="#f3f3f3" id="userDemand"><table width="1098" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="150" height="33" align="center" valign="middle" >排 序：
          <select name="select2" id="select2">
                <option>发布时间</option>
              </select>
        </td>
        <td width="150" align="center" valign="middle"></td>
        <td width="798" align="left" valign="middle">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="1100" border="0" cellpadding="0" cellspacing="0" style="margin:0 auto;">
  <tr>
    <td width="1100" height="10"></td>
  </tr>
</table>
<table width="1100" border="0" align="center" cellpadding="0" cellspacing="0" style="margin:0 auto;">
  <tr>
    <td width="855" height="300" align="left" valign="top" >
    
    
        <div style="display:none;" id ="userDemandTable">
     <c:forEach items="${listDemand}" var="item" >
    <table width="855" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="235" height="117" align="center" valign="top" bgcolor="#FFFFFF"><table width="620" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="180" height="229" align="center" valign="middle"><table width="150" border="0" cellpadding="0" cellspacing="1" bgcolor="#dfdadc">
              <tr>
                <td width="148" height="148" bgcolor="#FFFFFF"><a href="#"><img alt="" src="<%=path%>/img/show?path=${item.img}" width="98" height="98" border="0" /></a></td>
              </tr>
            </table></td>
            <td width="440" valign="middle"><table width="440" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="35" colspan="2" align="left" class="STYLE11" style="padding-left:8px;">${item["name"]==null?"&nbsp;":item["name"]}</td>
              </tr>
              <tr>
                <td width="70" height="30" align="right" valign="middle">供应省市：</td>
                <td width="370" align="left" class="STYLE6">${item["area"]==null?"&nbsp;":item["area"]}</td>
              </tr>
              <tr>
                <td height="30" align="right" valign="middle">供应品类：</td>
                <td align="left" class="STYLE6">${item["category"]==null?"&nbsp;":item["category"]}</td>
              </tr>
              <tr>
                <td height="60" align="right" valign="top" style="padding-top:5px;">主营产品：</td>
                <td align="left" valign="top" style="line-height:25px;">${item["desc"]==null?"&nbsp;":item["desc"]}</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="1" colspan="2" align="center" valign="middle" bgcolor="#ededed"></td>
          </tr>
        </table></td>
        <td width="620" height="229" align="center" valign="middle" bgcolor="#F9F8F8">
        <div name = "activation2" id = '${item.id}' style="display:none;"  bgcolor="#F9F8F8" class="STYLE6"> 
       
         </div></td>
      </tr>
      <tr>
        <td width="235" height="10" align="center" valign="top"></td>
        <td height="10" align="left" valign="top"></td>
      </tr>
    </table>
       </c:forEach> 
        </div>
</td>
    <td width="10" align="left" valign="top"></td>
    <td width="235" align="left" valign="top"><table width="235" border="0" cellpadding="0" cellspacing="1" bgcolor="#dfdadc">
      <tr>
        <td width="233" height="354" bordercolor="#F9F8F8" bgcolor="#F9F8F8"><table width="233" border="0" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF">
          <tr>
            <td width="231" height="352"><a href="#"><img src="../images/06.jpg" width="231" height="352" border="0" /></a></td>
          </tr>
        </table></td>
      </tr>
    </table>
        <table width="235" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="235" height="10"></td>
          </tr>
        </table>
  </td>
  </tr>
</table>

<script language="javascript">
function contact(){
	var json='${user}';
	if(json == ""){
		window.parent.location.href = "<%=path%>/login";
	}else{
		window.parent.location.href = "<%=path%>/toPersonalCenter?defaultUrl=chat&&urlParam="+'${companyInfo.companyid}';
	}
}
function dataload(id){
	
	$.post("<%=path%>/supplyDemandManager/doSelectSupplyDemandUser",{id:id},
			   function(data){

				if(data=="false"){

					$('#'+id).show();
					$('#'+id).empty();
					$('#'+id).append("<center><a href='javascript:void(0);'  onclick='contact();' ><img src='../images/an11.jpg' width='100' height='35' border='0' /></a></center>");
					//ui.style.display="";
				}else{
					$('#'+id).show();
					$('#'+id).empty();
					$('#'+id).append(data);
				}
			   });
	
}
$(function(){
	
	var listSupply = '${listSupply}';
	var listDemand = '${listDemand}'
	
	if(listSupply == "[]"){
		$('#userSupply').empty();
		$('#userSupply').append("该经销商暂无供应单");
	}else{
		
		var ui = document.getElementById("userSupplyTable");
		ui.style.display="";
	
	}
	
	if(listDemand == "[]"){
		$('#userDemand').empty();
		$('#userDemand').append("该经销商暂无需求单");
	}else{
		
		var ui = document.getElementById("userDemandTable");
		ui.style.display="";
	
	} 
	//判断用户是否登陆，如果未登陆，则供需单联系人不可见
	var json='${user}';

	if(json == ""){
		
		var r=document.getElementsByName("activation1"); 

		for(var i=0;i<r.length;i++){
			var ui = document.getElementById(r[i].id);

			ui.style.display="";
			$('#'+r[i].id).empty();
			$('#'+r[i].id).append("您还没有登录，无法查看联系方式");
		}
		var x=document.getElementsByName("activation2"); 
		for(var i=0;i<x.length;i++){
			var ui = document.getElementById(x[i].id);
			$('#'+x[i].id).empty();
			$('#'+x[i].id).append("您还没有登录，无法查看联系方式");
			ui.style.display="";
		}
	}else if('${user.status}'== '3'){
		//判断用户是否审核通过，若未审核通过

	//判断用户是否审核通过，若审核通过，判断供需单联系人是否为空，如果为空，则显示按钮在线联系，如果不为空则显示联系人信息
		var r=document.getElementsByName("activation1");

		for(var i=0;i<r.length;i++){
			var s = r[i].id;
			dataload(s);
		}
		
		var x=document.getElementsByName("activation2"); 
		
		for(var i=0;i<x.length;i++){
			var d = r[i].id;
			dataload(d);
		}
	
	}else{
		var r=document.getElementsByName("activation1"); 
		for(var i=0;i<r.length;i++){
			var ui = document.getElementById(r[i].id);
			$('#'+r[i].id).empty();
			$('#'+r[i].id).append("您的账号审核通过后可以查看联系方式");
			ui.style.display="";
		}
		var x=document.getElementsByName("activation2"); 
		for(var i=0;i<x.length;i++){
			var ui = document.getElementById(x[i].id);
			$('#'+x[i].id).empty();
			$('#'+x[i].id).append("您的账号审核通过后可以查看联系方式");
			ui.style.display="";
		}
	}
	
	var listLikeSupply = '${listLikeSupply}';
	var listLikeDemand = '${listLikeDemand}'
	
	if(listLikeSupply == "[]"){
		
		$('#likeSupply').append("没有与该经销商相似的企业");
	}else{
		
		var ui = document.getElementById("likeSupplyTable");
		ui.style.display="";
	
	}
	
	if(listLikeDemand == "[]"){
		
		$('#likeDemand').append("没有与该经销商相似的企业");
	}else{
		
		var ui = document.getElementById("likeDemandTable");
		ui.style.display="";
	
	} 
});

</script>

</body>
</html>
