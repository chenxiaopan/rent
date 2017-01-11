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
<script type="text/javascript" src="scripts/jquery.js"></script>
<script type="text/javascript">
	function doSearch() {
		var title = $("[name=title]").val();
		var price = $("[name=price]").val();
		var street = $("[name=street_id]").val();
		var type = $("[name=type_id]").val();
		var floorage = $("[name=floorage]").val();
/* 		alert("title:" + title + "price:" + price + "street:" + street
				+ "type:" + type); */
		document.location.href = 'searchHouse.do?title=' + title + '&price='
				+ price + '&street=' + street + '&type=' + type + '&floorage='
				+ floorage;
	}
</script>

</head>

<BODY>
	<jsp:useBean id="hService"
		class="com.cxp.service.impl.HouseServiceImpl" />
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
						<LI>标题：<INPUT class=text type=text name=title value="${house.title}"> <LABEL
							class=ui-blue><INPUT onclick="javascript:doSearch()"
								value=搜索房屋 type=button name=search> </LABEL>
						</LI>
					</UL>
				</DT>
				<DD>
					<UL>
						<LI class=first>价格</LI>
						<LI><SELECT name=price>
								<OPTION <c:if test="${prices[0]==0&&prices[1]==10000000}"> selected</c:if> value="0-10000000">不限</OPTION>
								<OPTION <c:if test="${prices[0]==0&&prices[1]==100}"> selected</c:if> value=0-100>100元以下</OPTION>
								<OPTION <c:if test="${prices[0]==100&&prices[1]==200}"> selected</c:if> value=100-200>100元—200元</OPTION>
								<OPTION <c:if test="${prices[0]==200&&prices[1]==1000000}"> selected</c:if> value=200-1000000>200元以上</OPTION>
						</SELECT>
						</LI>
					</UL>
				</DD>
				<DD>
					<UL>
						<LI class=first>房屋位置</LI>
						<LI><SELECT id=street name=street_id>
								<OPTION value="" <c:if test="${house.street.name==null}">selected</c:if> >不限</OPTION>
								<OPTION value="知春路" <c:if test="${house.street.name=='知春路'}">selected</c:if> >知春路</OPTION>
								<OPTION value="中关村大街" <c:if test="${house.street.name=='中关村大街'}">selected</c:if> >中关村大街</OPTION>
								<OPTION value="学院路" <c:if test="${house.street.name=='学院路'}">selected</c:if> >学院路</OPTION>
								<OPTION value="朝阳路" <c:if test="${house.street.name=='朝阳路'}">selected</c:if> >朝阳路</OPTION>
						</SELECT>
						</LI>
					</UL>
				</DD>
				<DD>
					<UL>
						<LI class=first>房型</LI>
						<LI><SELECT name=type_id>
								<OPTION selected value="" <c:if test="${house.types.name==null}">selected</c:if> >不限</OPTION>
								<OPTION value="一室一厅" <c:if test="${house.types.name=='一室一厅'}">selected</c:if> >一室一厅</OPTION>
								<OPTION value="一室两厅" <c:if test="${house.types.name=='一室两厅'}">selected</c:if> >一室两厅</OPTION>
								<OPTION value="两室一厅" <c:if test="${house.types.name=='两室一厅'}">selected</c:if> >两室一厅</OPTION>
								<OPTION value="两室两厅" <c:if test="${house.types.name=='两室两厅'}">selected</c:if> >两室两厅</OPTION>
						</SELECT>
						</LI>
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
						</SELECT>
						</LI>
					</UL>
				</DD>
			</FORM>
		</DL>
	</DIV>
	<DIV class="main wrap">
		<TABLE class=house-list>
			<TBODY>
			<c:if test="${houseList.size()==0}">
			<br/>
			   <center><h2>没有匹配的数据 </h2></center>  
			   <br/>
			</c:if>
				<!-- 开始遍历 -->
				<c:forEach var="house" items="${houseList}">
					<TR>
						<TD class=house-thumb><span><A
								href="details.do?title=${house.title}" target="_blank"><img
									src="images/thumb_house.gif" width="100" height="75" alt="">
							</a> </span></TD>
						<TD>
							<DL>
								<DT>
									<A href="details.do?title=${house.title}" target="_blank">${house.title}</A>
								</DT>
								<DD>
									${house.street.district.name}区${house.street.name},${house.floorage}平米<BR>联系方式：${house.contact}
								</DD>
							</DL></TD>
						<TD class=house-type>${house.types.name}</TD>
						<TD class=house-price><SPAN>${house.price}</SPAN>元/月</TD>
					</TR>
				</c:forEach>
				<!-- 遍历结束 -->
			</TBODY>
		</TABLE>
		<DIV class=pager>
			<UL>
				<c:if test="${page.currPageNo>1}">
					<LI class=current><A href="page/listPage.do?pageIndex=1">首页</A>
					</LI>
					<LI><A
						href="page/listPage.do?pageIndex=${page.currPageNo - 1}">上一页</A></LI>
				</c:if>
				<c:if test="${page.currPageNo<page.totalPageCount}">
					<LI><A
						href="page/listPage.do?pageIndex=${page.currPageNo + 1}">下一页</A></LI>
					<LI><A
						href="page/listPage.do?pageIndex=${page.totalPageCount}">末页</A></LI>
				</c:if>
			</UL>
			<c:if test="${param.price==null}">
			<SPAN class=total>${page.currPageNo}/${page.totalPageCount}页</SPAN>
			</c:if>
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
