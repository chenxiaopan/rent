<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath }" var="shop" />
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

<TITLE>96租房 - 用户管理</TITLE>
<META content="text/html; charset=utf-8" http-equiv=Content-Type>
<LINK rel=stylesheet type=text/css href="css/style.css">

<META name=GENERATOR>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<BODY>
	<DIV id=header class=wrap>
		<DIV id=logo>
			<IMG src="images/logo.gif">
		</DIV>
		<DIV class=search>
			<LABEL class="ui-green searchs"><a href="${shop }/page/fabu.jsp"
				title="">发布房屋信息</a> </LABEL> <LABEL class=ui-green><INPUT
				onclick='document.location="page/login.jsp"' value="退       出"
				type=button name=search> </LABEL>
		</DIV>
	</DIV>
	<DIV class="main wrap">
		<DIV id=houseArea>
			<TABLE class=house-list>
				<TBODY>
					<c:forEach var="house" items="${houseList}">
						<TR>
							<TD class=house-thumb><SPAN><A href="details.do?title=${house.title}"
									target="_blank"><img src="images/thumb_house.gif"
										width="100" height="75" alt=""> </A> </SPAN></TD>
							<TD>
								<DL>
									<DT>
										<A href="details.do?title=${house.title}" target="_blank">${house.title}</A>
									</DT>
									<DD>
										${house.street.district.name}区${house.street.name},${house.price}平米<BR>联系方式：${house.contact}
									</DD>
								</DL></TD>
							<TD class=house-type><LABEL class=ui-green><INPUT
									onclick=update(46) value="修    改" type=button name=search>
							</LABEL></TD>
							<TD class=house-price><LABEL class=ui-green><INPUT
									value="删    除" type=button name=search> </LABEL></TD>
						</TR>
					</c:forEach>
				</TBODY>
			</TABLE>
		</DIV>
		<DIV class=pager>
			<UL>
				<c:if test="${page.currPageNo>1}">
					<LI class=current><A href="page/guanli.do?pageIndex=1">首页</A>
					</LI>
					<LI><A href="page/guanli.do?pageIndex=${page.currPageNo - 1}">上一页</A>
					</LI>
				</c:if>
				<c:if test="${page.currPageNo<page.totalPageCount}">
					<LI><A href="page/guanli.do?pageIndex=${page.currPageNo + 1}">下一页</A>
					</LI>
					<LI><A href="page/guanli.do?pageIndex=${page.totalPageCount}">末页</A></LI>
				</c:if>
			</UL>
			<SPAN class=total>${page.currPageNo}/${page.totalPageCount}页</SPAN>
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
