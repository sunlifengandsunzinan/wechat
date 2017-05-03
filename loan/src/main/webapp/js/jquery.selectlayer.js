//职位，地区选择弹出层函数
function OpenCategoryLayer(objid,showid,input_cn,input,QSarr,strlen)
{
	$(objid).click(function()
	{
			$(this).blur();
			$(this).parent("div").before("<div class=\"menu_bg_layer\"></div>");
			$(".menu_bg_layer").height($(document).height());
			$(".menu_bg_layer").css({ width: $(document).width(), position: "absolute",left:"0", top:"0","z-index":"0","background-color":"#000000"});
			$(".menu_bg_layer").css("opacity",0);
			$(showid+" .OpenFloatBoxBg").css("opacity", 0.2);
			$(showid).show();			
			$(showid+" .OpenFloatBox").css({"left":($(document).width()-$(showid+" .OpenFloatBox").width())/2,"top":"120","z-index":"999"});
			SetBoxBg(showid);
			$(showid+" .item").unbind().hover(
				function(){
				$(this).find(".titem").addClass("titemhover");				
				var strclass=QSarr[$(this).attr("id")];
				var pid=$(this).attr("id");
				if (strclass)
				{
					$(this).find(".sitem").css("display","block");
					if ($(this).find(".sitem").html()=="")
					{
					$(this).find(".sitem").html(MakeLi(strclass,pid));//生成LI
					}
				}
					$(showid+" .OpenFloatBox label").unbind().click(function()
					{
						if ($(this).attr("title"))
						{
							if ($(this).find(":checkbox").attr('checked'))
							{
							$(this).next().find(":checkbox").attr('checked',true);
							}
							else
							{
							$(this).next().find(":checkbox").attr('checked',false);
							}
						}
						else
						{
							if ($(this).parent().find(":checkbox[checked]").length>0)
							{
								$(this).parent().prev().find(":checkbox").attr('checked',false);
							}
						}
						CopyItem(showid);
					});				
				},
				function(){
				$(this).find(".titem").removeClass("titemhover");
				$(this).find(".sitem").css("display","none");
				}
			);
			$(showid+" .OpenFloatBox .DialogClose").unbind().hover(function(){$(this).addClass("spanhover")},function(){$(this).removeClass("spanhover")});
			$(showid+" .DialogClose").click(function(){DialogClose(showid);});
			//确定选择
			$(showid+" .Set").unbind().click(function()
			{
					SetInput(showid,input_cn,input,strlen);
			});	
			//关闭
			function DialogClose(showid)
			{
				$(".menu_bg_layer").hide();
				$(showid).hide();
			}
			//设置表单
			function SetInput(showid,input_cn,input,strlen)
			{
					var a_cn=new Array();
					var a_id=new Array();
					var i=0;
					if ($(showid+" .OpenFloatBox .selecteditem :checkbox[checked]").length>8)
					{
						alert("不能超过8个选项");
						return false;
					}
					$(showid+" .OpenFloatBox .selecteditem :checkbox[checked]").each(function(index)
					{
					    a_cn[index]=$(this).attr("title");	
						if ($(this).attr("class")=="b")
						{
								a_id[i]=$(this).val()+".0";							
						}
						else
						{							
							a_id[i]=$(this).attr("id")+"."+$(this).val();
						}
							i++;
					});
					$(input_cn).val(limit(a_cn.join("+"),strlen));
					if ($(input_cn).val()=="")$(input_cn).val("未选择");
					$(input).val(a_id.join("-"));
					DialogClose(showid);
			}
		
	});	
}
//设置阴影
function SetBoxBg(showid)
{
	var FloatBoxWidth=$(showid+" .OpenFloatBox").width();
	var FloatBoxHeight=$(showid+" .OpenFloatBox").height();
	var FloatBoxLeft=$(showid+" .OpenFloatBox").offset().left;
	var FloatBoxTop=$(showid+" .OpenFloatBox").offset().top;
	$(showid+" .OpenFloatBoxBg").css({display:"block",width:(FloatBoxWidth+12)+"px",height:(FloatBoxHeight+12)+"px"});
	$(showid+" .OpenFloatBoxBg").css({left:(FloatBoxLeft-5)+"px",top:(FloatBoxTop-5)+"px"});
}
//生成小类
function MakeLi(val,pid){
	if (val=="")return false;
	arr=val.split("|");
	var htmlstr='';
		for (x in arr)
		{
		 var v=arr[x].split(",");
		htmlstr+="<label><input type=\"checkbox\" value=\""+v[0]+"\" title=\""+v[1]+"\" class=\"s\" id=\""+pid+"\"/>"+v[1]+"</label><br/>";
		}
	return htmlstr; 
}
//拷贝
function CopyItem(showid){
	var htmlstr='&nbsp;&nbsp;&nbsp;已经选择分类：<span class=\"empty\">[清空已选]</span><br/>';
	$(showid+" .item :checkbox[checked][class='b']").each(function(index){
	htmlstr+="<label><input class=\"b\"  type=\"checkbox\" value=\""+$(this).attr("value")+"\" title=\""+$(this).attr("title")+"\" checked/>"+$(this).attr("title")+"</label>";
	})
	$(showid+" .item :checkbox[checked][class='s']").each(function(index){
	 if ($(this).parent().parent().prev().find(":checkbox").attr('checked')==false)
	 {						 
	htmlstr+="<label><input class=\"s\"  type=\"checkbox\" id=\""+$(this).attr("id")+"\" value=\""+$(this).attr("value")+"\" title=\""+$(this).attr("title")+"\" checked/>"+$(this).attr("title")+"</label>";
	 }
	})
	htmlstr+="<div class=\"clear\"></div>";
	$(showid+" .selecteditem").html(htmlstr);
	if ($(showid+" .item :checkbox[checked]").length>0){
		$(showid+" .selecteditem").css("display","block");
	}else{
		$(showid+" .selecteditem").css("display","none");
	}
	//已选项目绑定click
	$(showid+" .selecteditem :checkbox").unbind().click(function(){
		var selval=$(this).val();
			$(showid+" .item :checkbox[checked]").each(function()
			{
				if ($(this).val()==selval)
				{
					$(this).attr("checked",false);
					if ($(this).attr("class")=="b")
					{
						$(this).parent().next().find(":checkbox").attr("checked",false);
					}									
					//重新克隆
					CopyItem(showid);
				}	
			})
	});
	$(showid+" .OpenFloatBox .item label :checkbox").parent().css("color","");
	$(showid+" .OpenFloatBox .item label :checkbox[checked]").parent().css("color","#FF6600");
	$(showid+" .OpenFloatBox .sitem :checkbox[checked]").each(function(index){
		$(this).parent().parent().prev().css("color","#FF6600");
	});
	SetBoxBg(showid);
	//清空
	$(showid+" .selecteditem .empty").unbind().click(function()
	{
			$(showid+" .selecteditem").css("display","none");
			$(showid+" .selecteditem").html("");
			$(showid+" :checkbox[checked]").parent().css("color","");
			$(showid+" :checkbox[checked]").parent().parent().prev().css("color","");
			$(showid+" :checkbox[checked]").attr('checked',false);							
			SetBoxBg(showid);
	});	
}
//截取字符
function limit(objString,num)
{
	var objLength =objString.length;
	if(objLength > num){ 
	return objString.substring(0,num) + "...";
	} 
	return objString;
}