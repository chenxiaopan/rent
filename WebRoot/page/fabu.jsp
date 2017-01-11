<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<TITLE>96租房 -发布房屋信息</TITLE>
<META content="text/html; charset=utf-8" http-equiv=Content-Type>
<META name=GENERATOR content="MSHTML 8.00.7601.17514">
<LINK rel=stylesheet type=text/css href="css/style.css">

<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css"></link>
<script type="text/javascript" src="scripts/jquery.js"></script>
<script type="text/javascript" src="scripts/jquery-ui.min.js"></script>
<script type="text/javascript" src="scripts/fabu.js"></script>
<script type="text/javascript">
	function getstreets(id) {
		var did = $(id).val();
		$.ajax({
			url : "ajaxStreet.do",//向服务器发送请求
			cache : false,
			type : "post",
			data : {
				"id" : did
			//请求参数
			},
			success : function(data) {
				var tt = data;
				var jsonobj = eval('(' + tt + ')');//将json字符串解析为数组
				$("[name=street_id]").empty();//添加元素前先清空
				$("[name=street_id]").append('<option value=0 >--请选择街--</option>');
				if (jsonobj.length > 0) {
					$.each(jsonobj, function(i) {//循环处理json对象数组
						var info = '<OPTION value='+jsonobj[i].id+'>'
								+ jsonobj[i].name + '</OPTION>';
						$("[name=street_id]").append(info);
					});
				}
			}
		});
	}

	$(function() {
		$("[name=houseDate]")
				.datepicker(
						{
							dateFormat : "yy-mm-dd",
							changeYear : true,
							changeMonth : true,
							//这句没用，下面那句才有用
							monthNames : [ '一月', '二月', '三月', '四月', '五月', '六月',
									'七月', '八月', '九月', '十月', '十一月', '十二月' ],
							monthNamesShort : [ '一月', '二月', '三月', '四月', '五月',
									'六月', '七月', '八月', '九月', '十月', '十一月', '十二月' ],
							dayNames : [ '星期日', '星期一', '星期二', '星期三', '星期四',
									'星期五', '星期六' ],
							dayNamesShort : [ '周日', '周一', '周二', '周三', '周四',
									'周五', '周六' ],
							dayNamesMin : [ '日', '一', '二', '三', '四', '五', '六' ],

						});

		$(".buttons").click(
				function() {
					var submit = true;
					if (!checktitle() || !checkfloorage() || !checkprice()
							|| !checkmobile()) {
						submit = false;
					}
					if (submit) {
						$("#add_action").submit();
					}
				});

	});
</script>
</head>

<BODY>
	<jsp:useBean id="tList" class="com.cxp.service.impl.TypesServiceImpl" />
	<jsp:useBean id="dList"
		class="com.cxp.service.impl.DistrictsServiceImpl"></jsp:useBean>

	<%
		request.setCharacterEncoding("utf-8");
		request.setAttribute("typesList", tList.typeslist());
		request.setAttribute("disList", dList.disList());
	%>
	<DIV id=header class=wrap>
		<DIV id=logo>
			<IMG src="images/logo.gif">
		</DIV>
	</DIV>
	<DIV id=regLogin class=wrap>
		<DIV class=dialog>
			<DL class=clearfix>
				<DT>新房屋信息发布</DT>
				<DD class=past>填写房屋信息</DD>
			</DL>
			<DIV class=box>
				<FORM id=add_action method=post name=add.action action=addHouse.do>
					<DIV class=infos>
						<TABLE class=field>
							<TBODY>
								<TR>
									<TD class=field>标 题：</TD>
									<TD><INPUT id=add_action_title class=text type=text
										name=title><span style="font-size:12;color:orange"> *请输入中文</span>
									</TD>
								</TR>
								<TR>
									<TD class=field>户 型：</TD>
									<TD><SELECT class=text name=type_id>
											<c:forEach var="types" items="${typesList}">
												<OPTION value="${types.id}">${types.name}</OPTION>
											</c:forEach>
									</SELECT>
									</TD>
								</TR>
								<TR>
									<TD class=field>面 积：</TD>
									<TD><INPUT id=add_action_floorage class=text type=text
										name=floorage><span style="font-size:12;color:orange"> *请输入数字</span></TD>
								</TR>
								<TR>
									<TD class=field>价 格：</TD>
									<TD><INPUT id=add_action_price class=text type=text
										name=price><span style="font-size:12;color:orange"> *请输入数字</span>
									</TD>
								</TR>
								<TR>
									<TD class=field>房产证日期：</TD>
									<TD><INPUT class=text type=text name=houseDate
										readonly="readonly"></TD>
								</TR>
								<TR>
									<TD class=field>位 置：</TD>
									<TD>区：<SELECT class=text name=district_id
										onchange="getstreets(this)">
										<OPTION value="0" selected>--请选择区--</OPTION>
											<c:forEach var="districts" items="${disList}">
												<OPTION value="${districts.id}">${districts.name}</OPTION>
											</c:forEach>
									</SELECT> 街：<SELECT class=text name=street_id>
                                         <OPTION value="0" selected>--请选择街--</OPTION>
									</SELECT>
									</TD>
								</TR>
								<!-- 
						<tr>
							<td class="field">坐  标：</td>
							<td><input type="text" class="text" name="point" />
							</td>
						</tr>
						-->
								<!--  <tr>
							<td class="field">Y 坐  标：</td>
							<td><input type="text" class="text" name="point.y" /></td>
						</tr>-->
								<TR>
									<TD class=field>联系方式：</TD>
									<TD><INPUT id=add_action_contact class=text type=text
										name=contact maxlength=11>
									</TD>
								</TR>
								<TR>
									<TD class=field>详细信息：</TD>
									<TD><TEXTAREA name=description placeholder="请用中文描述" style="font-family:宋体;font-size:14;color:gray"></TEXTAREA></TD>
								</TR>
							</TBODY>
						</TABLE>
						<DIV class=buttons>
							<INPUT value=立即发布 type="button">
						</DIV>
					</DIV>
				</FORM>
			</DIV>
		</DIV>
	</DIV>
	<DIV id=footer class=wrap>
		<DL>
			<DT>96租房 ? 2010 京ICP证1000001号</DT>
			<DD>关于我们 · 联系方式 · 意见反馈 · 帮助中心</DD>
		</DL>
	</DIV>
</BODY>
</HTML>

