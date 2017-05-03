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
	
	<link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui-1.4/themes/gray/easyui.css" />
	<link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui-1.4/themes/icon.css" />
	
	<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />
	<link href="<%=path%>/css/pages.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"> 

</script>
	
</head>
<body >
	<script type="text/javascript">
	function doAddSupply(id){
		$.post("<%=path%>/register/doSetSupplyUser",{id:id},
				   function(data){
			window.location = "<%=path%>/supplyDemandManager/addSupplyDemand?type=0";
			
				   });
	}
	function doAddDemand(){
		window.location = "<%=path%>/supplyDemandManager/addSupplyDemand?type=1";
	}

	$(function(){

		var listSupply = '${listSupply}';
		var listDemand = '${listDemand}'
		
		if(listSupply == "[]"){
			
			$('#userSupply').append("暂无供应单");
		}else{
			
			var ui = document.getElementById("userSupplyTable");
			ui.style.display="";
		
		}
		
		if(listDemand == "[]"){
			
			$('#userDemand').append("暂无需求单");
		}else{
			
			var ui = document.getElementById("userDemandTable");
			ui.style.display="";
		
		} 
	});


	function modifySupplyDemandInfo(id){
		window.location = "<%=path%>/supplyDemandManager/modifySupplyDemandInfo?id="+id;
	}

	function showOrHide(id){
		$.post("<%=path%>/register/doShowOrHide",{id:id},
				   function(data){
			window.location = "registerStepThree";
				   });

	}
	
	</script>
	
	
	<table width="904" border="0" cellpadding="0" cellspacing="1" bgcolor="#dedede">
      <tr>
        <td width="902" height="300" align="center" valign="top" bgcolor="#FFFFFF"><table width="902" border="0" cellspacing="1" cellpadding="0">
          <tr>
            <td width="902" height="40" align="left" valign="middle" background="../images/hy_03.jpg" class="STYLE4">创建供需</td>
          </tr>
        </table>
          <table width="900" border="0" cellpadding="0" cellspacing="1" bgcolor="#dedede">
            <tr>
              <td width="898" height="100" bgcolor="#FFFFFF"><table width="898" border="0" cellspacing="2" cellpadding="0">
                <tr>
                  <td width="447" height="100" align="center" valign="middle" bgcolor="#f5f5f5"><a href="javascript:void(0);" onclick="doAddSupply('${registerInfo.id}');"><img src="../images/hy_04.jpg" width="437" height="86" border="0" /></a></td>
                  <td width="448" align="center" valign="middle" bgcolor="#f5f5f5"><a href="javascript:void(0);" onclick="doAddDemand('${registerInfo.id}');" ><img src="../images/hy_05.jpg" width="437" height="86" border="0" /></a></td>
                </tr>
              </table></td>
              </tr>
          </table>
          <table width="902" border="0" cellspacing="1" cellpadding="0">
            <tr>
              <td width="902" height="300" align="left" valign="top"><table width="900" border="0" cellpadding="0" cellspacing="1" bgcolor="#dedede">
                <tr>
                  <td width="900" height="35" background="../images/hy_06.jpg" bgcolor="#F5F5F5" class="STYLE4">供应列表</td>
                </tr>
                <tr>
                  <td height="111" align="center" valign="top" bgcolor="#F5F5F5"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="100%" height="5" id="userSupply"></td>
                    </tr>   
                  </table>
                  <div style="display:none;" id ="userSupplyTable">
                   <c:forEach items="${listSupply}" var="item">
                    <table width="888" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="888" height="108"><table width="888" border="0" cellpadding="0" cellspacing="1" bgcolor="#dedede">
                          <tr>
                            <td width="888" height="106" align="center" valign="middle" bgcolor="#f9f9f9"><table width="878" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td width="98" height="98" align="center" valign="middle"><a href="#"><img alt="" src="<%=path%>/img/show?path=${item.img}" width="98" height="98" border="0" /></a></td>
                                  <td width="470" align="right" valign="middle"><table width="450" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td width="60" height="30" align="right" valign="middle" class="STYLE5">产品名：</td>
                                        <td width="390" align="left" valign="middle" class="STYLE7">${item["name"]==null?"&nbsp;":item["name"]}</td>
                                      </tr>
                                      <tr>
                                        <td height="25" align="right" valign="middle" class="STYLE6">城市：</td>
                                        <td height="25" align="left" valign="middle">${item["area"]==null?"&nbsp;":item["area"]}</td>
                                      </tr>
                                      <tr>
                                        <td height="25" align="right" valign="middle" class="STYLE6">经营范围：</td>
                                        <td height="25" align="left" valign="middle">${item["category"]==null?"&nbsp;":item["category"]}</td>
                                      </tr>
                                  </table></td>
                                  <td width="310"><table width="310" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td width="310" height="24" align="right" valign="middle" class="STYLE6">发布时间：<fmt:formatDate value='${item.ctreatetime }' pattern='yyyy-MM-dd'/></td>
                                      </tr>
                                      <tr>
                                        <td height="24" align="right" valign="middle"><span class="STYLE6">状态：</span><span class="STYLE9">	
                                        <c:if test="${item.status=='0'}">
											保存
										</c:if>
										<c:if test="${item.status=='1'}">
											未审核
										</c:if>
		      							<c:if test="${item.status=='2'}">
											驳回
										</c:if>
										<c:if test="${item.status=='3'}">
											审核通过
										</c:if></span>/<span class="STYLE9">
										<c:if test="${item.resolve=='0'}">
											下架
										</c:if>
										<c:if test="${item.resolve=='1'}">
											上架
										</c:if></span></td>
                                      </tr>
                                      <tr>
                                        <td height="32" align="right" valign="middle"><table width="252" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                              <td width="123" height="32"><a href="JavaScript:void(0)" onclick="modifySupplyDemandInfo('${item['id']}')"><img src="../images/hy_07.jpg" width="123" height="32" border="0" /></a></td>
                                              <td width="6">&nbsp;</td>
                                              <td width="123"><a href="JavaScript:void(0)" onclick="showOrHide('${item['id']}')" id="showsupply"><img src="../images/hy_08.jpg" width="123" height="32" border="0" /></a></td>
                                            </tr>
                                        </table></td>
                                      </tr>
                                  </table></td>
                                </tr>
                            </table></td>
                          </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td height="5"></td>
                    </tr>
                  </table>
                  </c:forEach> 
                  </div>
				</td>
                </tr>
                <tr>
                  <td height="35" background="../images/hy_06.jpg" bgcolor="#F5F5F5" class="STYLE4" >需求列表</td>
                </tr>
                <tr>
                  <td height="111" align="left" valign="middle" bgcolor="#F5F5F5"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="100%" height="5"  id="userDemand"></td>
                    </tr>
                  </table>
                  <div style="display:none" id ="userDemandTable">
                   <c:forEach items="${listDemand}" var="item">  
                    <table width="888" border="0" align="center" cellpadding="0" cellspacing="0">
               		 <tr>
                      <td width="888" height="108"><table width="888" border="0" cellpadding="0" cellspacing="1" bgcolor="#dedede">
                          <tr>
                            <td width="888" height="106" align="center" valign="middle" bgcolor="#f9f9f9"><table width="878" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td width="98" height="98" align="center" valign="middle"><a href="#"><img alt="" src="<%=path%>/img/show?path=${item.img}" width="98" height="98" border="0" /></a></td>
                                  <td width="470" align="right" valign="middle"><table width="450" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td width="60" height="30" align="right" valign="middle" class="STYLE5">产品名：</td>
                                        <td width="390" align="left" valign="middle" class="STYLE7">${item["name"]==null?"&nbsp;":item["name"]}</td>
                                      </tr>
                                      <tr>
                                        <td height="25" align="right" valign="middle" class="STYLE6">城市：</td>
                                        <td height="25" align="left" valign="middle">${item["area"]==null?"&nbsp;":item["area"]}</td>
                                      </tr>
                                      <tr>
                                        <td height="25" align="right" valign="middle" class="STYLE6">经营范围：</td>
                                        <td height="25" align="left" valign="middle">${item["category"]==null?"&nbsp;":item["category"]}</td>
                                      </tr>
                                  </table></td>
                                  <td width="310"><table width="310" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td width="310" height="24" align="right" valign="middle" class="STYLE6">发布时间：<fmt:formatDate value='${item.ctreatetime }' pattern='yyyy-MM-dd'/></td>
                                      </tr>
                                      <tr>
                                        <td height="24" align="right" valign="middle"><span class="STYLE6">状态：</span><span class="STYLE9">	
                                        <c:if test="${item.status=='0'}">
											保存
										</c:if>
										<c:if test="${item.status=='1'}">
											未审核
										</c:if>
		      							<c:if test="${item.status=='2'}">
											驳回
										</c:if>
										<c:if test="${item.status=='3'}">
											审核通过
										</c:if></span>/<span class="STYLE9">
										<c:if test="${item.resolve=='0'}">
											下架
										</c:if>
										<c:if test="${item.resolve=='1'}">
											上架
										</c:if></span></td>
                                      </tr>
                                      <tr>
                                        <td height="32" align="right" valign="middle"><table width="252" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                              <td width="123" height="32"><a href="JavaScript:void(0)" onclick="modifySupplyDemandInfo('${item['id']}')"><img src="../images/hy_07.jpg" width="123" height="32" border="0" /></a></td>
                                              <td width="6">&nbsp;</td>
                                              <td width="123"><a href="JavaScript:void(0)" onclick="showOrHide('${item['id']}')" id="showDemand"><img src="../images/hy_09.jpg" width="123" height="32" border="0" /></a></td>
                                            </tr>
                                        </table></td>
                                      </tr>
                                  </table></td>
                                </tr>
                            </table></td>
                          </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td height="5"></td>
                    </tr>
                  </table>
                  </c:forEach> 
                  </div>
				</td>
                </tr>
              </table></td>
            </tr>
          </table></td>
      </tr>
      
    </table> 
	
	
	
	
</body>
</html>
