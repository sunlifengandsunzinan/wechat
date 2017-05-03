<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>供应单列表</title>
	<%-- <script type="text/javascript" src="<%=path %>/js/jquery-easyui-1.4/jquery.min.js"></script>
	<script type="text/javascript" src="<%=path %>/js/jquery-easyui-1.4/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=path %>/js/jquery-easyui-1.4/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="<%=path%>/js/jquery-easyui-1.4/datagrid-detailview.js"></script> --%>
	
	<script type="text/javascript" src="<%=path%>/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery.jslides.js"></script>
<script type="text/javascript" src="<%=path %>/js/koala.min.1.5.js"></script>
<script type="text/javascript" src="<%=path %>/dwr/engine.js"></script>
<script type="text/javascript" src="<%=path %>/dwr/util.js"></script>
<script type="text/javascript" src="<%=path %>/dwr/interface/reverseAjaxDwrService.js"></script>
<script type="text/javascript" src="<%=path %>/dwr/interface/loginDwrService.js"></script>
	
	
	
<link href="<%=path%>/css/base.css" rel="stylesheet" type="text/css" />
	<link href="<%=path%>/css/pages.css" rel="stylesheet" type="text/css" />
	<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />


</head>
<body >	

    <script>

$(function (){
	
	var c ='${city}';
	var cate = '${seccategory}';
	
	if(c ==""){
		 $('#c').empty();
		 $('#c').hide();
		 $('#deletecity').hide();
		 $('#alcity').hide();
		 $('#city').empty();
		 $('#city').val("");

	}
	if(cate ==""){
	 	 $('#s').empty();
	 	 $('#s').hide();
	 	$('#deletecategory').hide();
	 	$('#alsec').hide();
	 	 $('#seccategory').empty();
	 	 $('#seccategory').val("");

	}
	var list = '${list3}';
	if(list =="[]"){
		
		$('#resultTable').empty();
		$('#resultTable').append("暂无供应单数据");
	}
	
	eval('window.parent.iFrameHeight()'); 
	
});
function selectCity(id){
	$('#gg').empty();
	var text = $('#'+id).text();
	$.post("<%=path%>/supplyDemandManager/selectCity",{id:id},
			   function(data){

 		if(data =="[]"){
 			$('#c').empty();
 			$('#c').show();
 			$('#alcity').show();
 			$('#deletecity').show();
 			$('#city').empty();    //更新form中的查询城市条件
 			$('#c').append(text);
 			$('#city').val(text);   //更新form中的查询城市条件
 		}else{
 		  var jsonObj = JSON.parse(data);
 		   	for (var one in jsonObj){
 		   	$('#gg').append("<a href='javascript:void(0)' class='link2' onclick='alreadySelectCity(this.text);'><td align='center' valign='middle' id = '"+jsonObj[one].id+"'>"+jsonObj[one].regionname+"</td> </a>");
 		   	}
 		   $('#xx').show();
 		   $('#gg').show();
 		}
	 });	
}
function alreadySelectCity(str){
	$('#c').empty();
	$('#c').show();
	$('#alcity').show();
	$('#deletecity').show();
	$('#city').empty();    //更新form中的查询城市条件
	$('#c').append(str);
	$('#city').val(str);   //更新form中的查询城市条件
	$('#gg').empty();
	$('#gg').hide();
	$('#xx').hide();
}

/*
 * 删除已选城市按钮
 */
 function removeCity(){
	 $('#c').empty();
	 $('#c').hide();
	 $('#deletecity').hide();
	 $('#alcity').hide();
	 $('#city').empty();
	 $('#city').val("");
}
 /*
  * 删除已选二级品类按钮
  */
  function removeSec(){
 	 $('#s').empty();
 	 $('#s').hide();
 	$('#deletecategory').hide();
 	$('#alsec').hide();
 	 $('#seccategory').empty();
 	 $('#seccategory').val("");
 }
function alreadySelectSec(sec){
	$('#s').empty();
	$('#s').show();
	$('#alsec').show();
	$('#deletecategory').show();
	$('#seccategory').empty();    //更新form中的查询二级品类条件
	$('#s').append(sec);
	$('#seccategory').val(sec);   //更新form中的查询二级品类条件
}

function doSearch(){
	$('#str').val($('#search').val());
 	var oForm = document.getElementById("fm_selectSupplyOrder"); 
	 oForm.submit(); 

}
function toDetail(id){
	window.location="<%=path%>/supplyDemandManager/companyDetail?id="+id;
}
    </script>
    				
	
 <%-- <jsp:include page="/WEB-INF/views/top.jsp" flush="true" />	 --%>	

 
 	<form id="fm_selectSupplyOrder" action="<%=path %>/supplyDemandManager/doSearchSupplyOrder" name="fm_selectSupplyOrder" method="post">
		<input type="hidden" name="city" id="city" value="${city}" />
		<input type="hidden" name="seccategory" id="seccategory" value="${seccategory}" />
		<input type="hidden" value="${str}" id="str" name="str" value="" class="easyui-validatebox textbox"  style="width: 180px; height: 20px;" />
	</form>	
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="80" align="center" valign="middle" bgcolor="#FDA80D"><img src="<%=path%>/images/gg_02.jpg" width="1440" height="80" /></td>
  </tr>
</table>
<table width="1100" border="0" cellpadding="0" cellspacing="0" style="margin:0 auto;">
  <tr>
    <td width="1100" height="10"></td>
  </tr>
</table>
<table width="1100" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#dfdadc" style="margin:0 auto;">
  <tr>
    <td width="1098" height="200" bgcolor="#ffffff"><table width="1098" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="1098" height="50"><table width="1098" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="110" height="25"><table width="110" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="40" height="50" align="center" valign="middle"><img src="<%=path%>/images/biao_01.jpg" width="13" height="15" /></td>
                <td width="70" align="left" valign="middle" class="STYLE12">筛选条件：</td>
              </tr>
            </table></td>
            <td width="988" align="left" valign="middle"><table width="988" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="200" height="50" id ="alcity"><table width="180" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="152" height="27" align="center" valign="middle" background="<%=path%>/images/bj_04.jpg" class="STYLE10" id="c" name ="c">${city}</td>
                      <td width="28"><a id ="deletecity" href="javascript:void(0)" onclick="removeCity();"><img src="<%=path%>/images/biao_05.jpg" width="28" height="27" border="0" /></a></td>
                    </tr>
                </table></td>
                <td width="160" id ="alsec"><table width="140" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="112" height="27" align="center" valign="middle" background="<%=path%>/images/bj_04.jpg" class="STYLE10" id="s" name ="s">${seccategory}</td>
                      <td width="28"><a id ="deletecategory" href='javascript:void(0)' onclick='removeSec();'><img src="<%=path%>/images/biao_05.jpg" width="28" height="27" border="0" /></a></td>
                    </tr>
                </table></td>
                <td width="628" align="left" valign="middle"><a href="#" class="link1"></a></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="1" colspan="2" background="<%=path%>/images/dian01.jpg"></td>
            </tr>
        </table></td>
      </tr>
      <tr>
        <td height="50"><table width="1098" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="39" height="50" align="center" valign="top" style="padding-top:15px;"><img src="<%=path%>/images/biao_02.jpg" width="13" height="16" /></td>
            <td width="71" align="center" valign="top" class="STYLE12" style="padding-top:15px;">选择地区：</td>
            <td width="988" align="left" valign="top" class="STYLE12" style="padding-top:12px; padding-bottom:12px;"><table width="988" border="0" cellspacing="0" cellpadding="0">


 	<tr>
	 <c:forEach items="${list}" var="item" varStatus="status">  
	     

		      <td  style="display:none; align="center" valign="middle">${item["id"]==null?"&nbsp;":item["id"]}</td> 
		    <td width="82" height="25" align="center" valign="middle"><p ><a  class="link2" id='${item["id"]==null?"&nbsp;":item["id"]}' name= "activation" href="javascript:void(0)" onclick="selectCity(this.id);">${item["regionname"]==null?"&nbsp;":item["regionname"]}</a></p></td>  
		    
		   <c:if test="${status.count%12==0}">
		</tr>
		<tr>
		</c:if>
    </c:forEach>  
	</tr>


            </table>
              <table style="display:none;"  width="958" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#dfdadc" id="xx">
                <tr>
                  <td style="display:none;" id="gg" width="958" height="30" bgcolor="#F9F8F8" style="padding-left:10px; padding-right:10px; padding-top:5px; padding-bottom:5px; line-height:20px;"></td>
                </tr>
              </table></td>
          </tr>
          <tr>
            <td height="1" colspan="3" align="center" valign="top" background="<%=path%>/images/dian01.jpg"></td>
            </tr>
        </table></td>
      </tr>
      <tr>
        <td height="50"><table width="1098" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="39" height="50" align="center" valign="top" style="padding-top:15px;"><img src="<%=path%>/images/biao_02.jpg" width="13" height="16" /></td>
            <td width="71" align="center" valign="top" class="STYLE12" style="padding-top:15px;">选择品类：</td>
            <td width="988" align="left" valign="top" class="STYLE12" style="padding-top:12px; padding-bottom:12px;"><table width="988" border="0" cellspacing="0" cellpadding="0">
                      	<tr>
	 <c:forEach items="${list2}" var="item2" varStatus="status2">  
	     

		      <td  style="display:none; align="center" valign="middle">${item2["id"]==null?"&nbsp;":item2["id"]}</td> 
		    <td width="82"  align="center" valign="middle"><p ><a  class="link2" id='${item2["id"]==null?"&nbsp;":item2["id"]}' name= "category" href="javascript:void(0)" onclick ="alreadySelectSec(this.text);">${item2["seccategoryname"]==null?"&nbsp;":item2["seccategoryname"]}</a></p></td>  
		    
		   <c:if test="${status2.count%12==0}">
		</tr>
		<tr>
		</c:if>
    </c:forEach>  
	</tr>
            </table></td>
          </tr>
          <tr>
            <td height="1" colspan="3" align="center" valign="top" background="<%=path%>/images/dian01.jpg"></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="50"><table width="1098" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="110" height="50"><table width="110" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="40" height="50" align="center" valign="middle"><img src="<%=path%>/images/biao_04.jpg" width="14" height="14" /></td>
                <td width="70" align="left" valign="middle" class="STYLE12">搜索供应：</td>
              </tr>
            </table></td>
            <td width="410"><input value="${str}" name="search" type="text" id="search" style="width:410px; height:31px; line-height:31px; padding-left:5px;"  /></td>
            <td width="578" align="left" valign="middle"><a href="javascript:void(0)" onclick="doSearch();"><img src="<%=path%>/images/an09.jpg" width="80" height="35" border="0" /></a></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="1100" border="0" cellpadding="0" cellspacing="0" style="margin:0 auto;">
  <tr>
    <td width="1100" height="10"></td>
  </tr>
</table>
<table width="1100" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#dfdadc" style="margin:0 auto;">
  <tr>
    <td width="1098" height="34" background="<%=path%>/images/bj_02.jpg" bgcolor="#f3f3f3"><table width="1098" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="150" height="34" align="center" valign="middle" background="<%=path%>/images/hx_01.jpg" class="STYLE10">供货服务信息</td>
        <td width="948">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="33" bgcolor="#f3f3f3"><table width="1098" border="0" cellspacing="0" cellpadding="0">
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
    <td width="855" height="235" align="left" valign="top" id="resultTable">
    <c:forEach items="${list3}" var="item">
<div id= '${item.companyid}' onmouseover="this.style.cursor='pointer'" onclick="toDetail(this.id);">
    <table width="855" border="0" cellspacing="0" cellpadding="0" id="resultTable">
      <tr>
        <td width="235" height="117" align="center" valign="top" bgcolor="#f9f8f8"><table width="235" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="235" align="center" valign="middle">&nbsp;</td>
          </tr>
          <tr>
            <td height="120" align="center" valign="middle"><table width="120" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="120" height="120"><img src="<%=path%>/images/03.jpg" width="120" height="120" /></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="30" align="center" valign="middle" class="STYLE11">${item.companyname}</td>
          </tr>
          <tr>
           
          </tr>
          <tr>
            <td height="50" align="center" valign="middle"><table width="135" border="0" cellpadding="0" cellspacing="0" background="<%=path%>/images/bj_03.jpg">
              <tr>
                <td width="45" height="25" align="center" valign="middle">供应数</td>
                <td width="45" align="center" valign="middle">需求数</td>
                <td width="45" align="center" valign="middle">对话数</td>
              </tr>
              <tr>
                <td height="25" align="center" valign="middle" class="STYLE5">${item.supplynum}</td>
                <td align="center" valign="middle" class="STYLE5">${item.demandnum}</td>
                <td align="center" valign="middle" class="STYLE5">${item.dialognum}</td>
              </tr>
            </table></td>
          </tr>
          
        </table></td>
        <td width="620" height="117" align="left" valign="top" bgcolor="#FFFFFF"><table width="620" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="180" height="236" align="center" valign="middle"><table width="150" border="0" cellpadding="0" cellspacing="1" bgcolor="#dfdadc">
                <tr>
                  <td width="148" height="148" bgcolor="#FFFFFF" ><a href="#"><img alt="" src="<%=path%>/img/show?path=${item.img}" width="98" height="98" border="0" /></a></td>
                </tr>
            </table></td>
            <td width="440" valign="middle"><table width="440" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="35" colspan="2" class="STYLE11" style="padding-left:8px;">${item["name"]==null?"&nbsp;":item["name"]}</td>
                </tr>
                <tr>
                  <td width="70" height="30" align="right" valign="middle">供应省市：</td>
                  <td width="370" class="STYLE6">${item["area"]==null?"&nbsp;":item["area"]}</td>
                </tr>
                <tr>
                  <td height="30" align="right" valign="middle">供应品类：</td>
                  <td class="STYLE6">${item["category"]==null?"&nbsp;":item["category"]}</td>
                </tr>
                <tr>
                  <td height="60" align="right" valign="top" style="padding-top:5px;">公司描述：</td>
                  <td valign="top" style="line-height:25px;">${item.companydesc}</td>
                </tr>
            </table></td>
          </tr>
          <tr>
            <td height="1" colspan="2" align="center" valign="middle" bgcolor="#ededed"></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td width="235" height="10" align="center" valign="top"></td>
        <td height="10" align="left" valign="top"></td>
      </tr>
    </table>
     </div>
 </c:forEach>
</td>


    <td width="10" align="left" valign="top"></td>
    <td width="235" align="left" valign="top"><table width="235" border="0" cellpadding="0" cellspacing="1" bgcolor="#dfdadc">
      <tr>
        <td width="233" height="354" bordercolor="#F9F8F8" bgcolor="#F9F8F8"><table width="233" border="0" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF">
          <tr>
            <td width="231" height="352"><a href="#"><img src="<%=path%>/images/06.jpg" width="231" height="352" border="0" /></a></td>
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

 

          
    <div class="pagin">
    <p:pages totalCount="${pageInfo.count }" pageSize="${pageInfo.pageSize }" totalPage="${pageInfo.total }" curPage="${pageInfo.pageNo }" formId="fm_selectSupplyOrder"></p:pages>
  </div> 
  <%-- 
  <iframe runat="server" src="<%=path%>/bottom" width="100%" height="325" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes"></iframe>
   --%>
</body>
</html>
