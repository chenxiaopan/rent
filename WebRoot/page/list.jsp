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
<TITLE>96租房 - 首页</TITLE>
<META content="text/html; charset=utf-8" http-equiv=Content-Type>
<META name=GENERATOR content="MSHTML 8.00.7601.17514">
<LINK rel=stylesheet type=text/css href="css/style.css">
</head>

<BODY>
	<jsp:useBean id="hService"
		class="com.cxp.service.impl.HouseServiceImpl" />
	<%
		request.setCharacterEncoding("utf-8");
		request.setAttribute("houseList", hService.list());
	%>
	<DIV id=header class=wrap>
		<DIV id=logo>
			<IMG src="images/logo.gif">
		</DIV>
	</DIV>
	<DIV id=navbar class=wrap>
		<DL class="search clearfix">
			<FORM id=sform method=post action=search.action>
				<DT>
					<UL>
						<LI class=bold>房屋信息</LI>
						<LI>标题：<INPUT class=text type=text name=title> <LABEL
							class=ui-blue><INPUT onclick=doSearch() value=搜索房屋
								type=button name=search> </LABEL></LI>
					</UL>
				</DT>
				<DD>
					<UL>
						<LI class=first>价格</LI>
						<LI><SELECT name=price>
								<OPTION selected value="">不限</OPTION>
								<OPTION value=0-100>100元以下</OPTION>
								<OPTION value=100-200>100元—200元</OPTION>
								<OPTION value=200-1000000>200元以上</OPTION>
						</SELECT></LI>
					</UL>
				</DD>
				<DD>
					<UL>
						<LI class=first>房屋位置</LI>
						<LI><SELECT id=street name=street_id>
								<OPTION selected value="">不限</OPTION>
								<OPTION value=1000>知春路</OPTION>
								<OPTION value=1001>中关村大街</OPTION>
								<OPTION value=1002>学院路</OPTION>
								<OPTION value=1003>朝阳路</OPTION>
						</SELECT></LI>
					</UL>
				</DD>
				<DD>
					<UL>
						<LI class=first>房型</LI>
						<LI><SELECT name=type_id>
								<OPTION selected value="">不限</OPTION>
								<OPTION value=1000>一室一厅</OPTION>
								<OPTION value=1001>一室两厅</OPTION>
								<OPTION value=1002>两室一厅</OPTION>
								<OPTION value=1003>两室两厅</OPTION>
						</SELECT></LI>
					</UL>
				</DD>
				<DD>
					<UL>
						<LI class=first>面积</LI>
						<LI><SELECT name=floorage>
								<OPTION selected value="">不限</OPTION>
								<OPTION value=0-40>40以下</OPTION>
								<OPTION value=40-500>40-500</OPTION>
								<OPTION value=500-1000000>500以上</OPTION>
						</SELECT></LI>
					</UL>
				</DD>
			</FORM>
		</DL>
	</DIV>
	<DIV class="main wrap">
		<TABLE class=house-list>
			<TBODY>
				<!-- 开始遍历 -->
				<c:forEach var="house" items="${houseList}">
					<TR>
						<TD class=house-thumb><span><A href="page/details.htm"
								target="_blank"><img src="images/thumb_house.gif"
									width="100" height="75" alt=""> </a> </span>
						</TD>
						<TD>
							<DL>
								<DT>
									<A href="details.do?title=${house.title}" target="_blank">${house.title}</A>
								</DT>
								<DD>
									${house.disname}区${house.strname},${house.floorage}平米<BR>联系方式：${house.contact}
								</DD>
							</DL>
						</TD>
						<TD class=house-type>${house.tname}</TD>
						<TD class=house-price><SPAN>${house.price}</SPAN>元/月</TD>
					</TR>
				</c:forEach>
				<!-- 遍历结束 -->
			</TBODY>
		</TABLE>
		<DIV class=pager>
			<UL>
				<LI class=current><A href="#">首页</A>
				</LI>
				<LI><A href="#">上一页</A>
				</LI>
				<LI><A href="#">下一页</A>
				</LI>
				<LI><A href="#">末页</A>
				</LI>
			</UL>
			<SPAN class=total>1/2页</SPAN>
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