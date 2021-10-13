<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="java.util.List"  %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>

<%@ page import="com.model2.mvc.service.domain.Product" %>
<%@ page import="com.model2.mvc.common.Search" %>
<%@ page import="com.model2.mvc.common.Page"%>


<%-- /////////////////////// EL / JSTL 적용으로 주석 처리 ////////////////////////
<%

	List<Product> list= (List<Product>)request.getAttribute("list");
	Page resultPage=(Page)request.getAttribute("resultPage");
	
	Search search = (Search)request.getAttribute("search");
	//==> null 을 ""(nullString)으로 변경
	String searchCondition = CommonUtil.null2str(search.getSearchCondition());
	String searchKeyword = CommonUtil.null2str(search.getSearchKeyword());
	
	System.out.println(":: listProduct의 searchCondition :: "+searchCondition);
	System.out.println(":: listProduct의 searchKeyword :: "+searchKeyword);
%>
/////////////////////// EL / JSTL 적용으로 주석 처리 //////////////////////// --%>

<html>
<head>
<title>상품목록조회</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">
<!--
	//검색 / page 두가지 경우 모두 Form 전송을 위해 JavaScrpt 이용  
	function fncGetProductList(currentPage) {
		console.log(currentPage);
		document.getElementById("currentPage").value = currentPage;
   		document.detailForm.submit();
}
-->

</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">

<form name="detailForm" action="/listProduct.do?menu=${param.menu}" method="post">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
				<%-- /////////////////////// EL / JSTL 적용으로 주석 처리 ////////////////////////
				<%
				if (request.getParameter("menu").equals("search")){
				%>
				/////////////////////// EL / JSTL 적용으로 주석 처리 //////////////////////// --%>
				<c:if test="${param.menu=='search'}">
					<td width="93%" class="ct_ttl01">상품 목록조회</td>
				</c:if>
				<%-- /////////////////////// EL / JSTL 적용으로 주석 처리 ////////////////////////
				<%
				}else{
				%>
				/////////////////////// EL / JSTL 적용으로 주석 처리 //////////////////////// --%>
				<c:if test="${param.menu=='manage'}">
					<td width="93%" class="ct_ttl01">상품 관리</td>
				</c:if>
				<%-- /////////////////////// EL / JSTL 적용으로 주석 처리 ////////////////////////
				<%
				}
				%>
				/////////////////////// EL / JSTL 적용으로 주석 처리 //////////////////////// --%>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px">
				<%-- /////////////////////// EL / JSTL 적용으로 주석 처리 ////////////////////////
				<option value="0" <%= (searchCondition.equals("0") ? "selected" : "")%>>상품번호</option>
				<option value="1" <%= (searchCondition.equals("1") ? "selected" : "")%>>상품명</option>
				<option value="2" <%= (searchCondition.equals("2") ? "selected" : "")%>>상품가격</option>
				/////////////////////// EL / JSTL 적용으로 주석 처리 //////////////////////// --%>
				<option value="0"><menu.searchCondition="0" ? "selected" : "" />상품번호</option>
				<option value="1"><menu.searchCondition="1" ? "selected" : "" />상품명</option>
				<option value="2"><menu.searchCondition="2" ? "selected" : "" />상품가격</option>
			</select>
			<input type="text" name="searchKeyword" value="${searchKeyword}" class="ct_input_g" style="width:200px; height:19px" />
		</td>
	
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<a href="javascript:fncGetProductList(1);">검색</a>
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="11" >전체  ${resultPage.totalCount} 건수, 현재 ${resultPage.currentPage} 페이지</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">상품명</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">가격</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">등록일</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b">현재상태</td>	
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	<%-- /////////////////////// EL / JSTL 적용으로 주석 처리 ////////////////////////
	<%
		for(int i=0; i<list.size(); i++) {
			Product product = list.get(i);
		%>
/////////////////////// EL / JSTL 적용으로 주석 처리 //////////////////////// --%>
	
	<c:set var="i" value="0" />
	<c:forEach var="product" items="${list}">
		<c:set var="i" value="${ i+1 }" />
		<tr class="ct_list_pop">
			<td align="center">${i}</td>
			<td></td>
			<td align="left">
			<a href="/getProduct.do?prodNo=${product.prodNo}&menu=${param.menu}">${product.prodName}</a>
			</td>
			
			<td></td>
			<td align="left">${product.price}</td>
			<td></td>
			<td align="left">${product.regDate}</td>
			<td></td>
			<td align="left"></td>	
		</tr>
	</c:forEach>
	<tr>
	<%-- /////////////////////// EL / JSTL 적용으로 주석 처리 ////////////////////////
	<% } %>	
/////////////////////// EL / JSTL 적용으로 주석 처리 //////////////////////// --%>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">
		<input type="hidden" id="currentPage" name="currentPage" value=""/>
		<%-- /////////////////////// EL / JSTL 적용으로 주석 처리 ////////////////////////
			<% if( resultPage.getCurrentPage() <= resultPage.getPageUnit() ){ %>
/////////////////////// EL / JSTL 적용으로 주석 처리 //////////////////////// --%>
			<c:if test="${ resultPage.currentPage <= resultPage.pageUnit }">
			◀ 이전
			</c:if>
			<%-- /////////////////////// EL / JSTL 적용으로 주석 처리 ////////////////////////
			<% }else{ %>
/////////////////////// EL / JSTL 적용으로 주석 처리 //////////////////////// --%>
			<c:if test="${ resultPage.currentPage > resultPage.pageUnit }">
				<a href="javascript:fncGetProductList('${ resultPage.currentPage-1}')">◀ 이전</a>
			</c:if>
			<%-- /////////////////////// EL / JSTL 적용으로 주석 처리 ////////////////////////
			<% } %>
/////////////////////// EL / JSTL 적용으로 주석 처리 //////////////////////// --%>
			<%-- /////////////////////// EL / JSTL 적용으로 주석 처리 ////////////////////////
			<%	for(int i=resultPage.getBeginUnitPage();i<= resultPage.getEndUnitPage() ;i++){	%>
/////////////////////// EL / JSTL 적용으로 주석 처리 //////////////////////// --%>
			<c:forEach var="i"  begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" step="1">
				<a href="javascript:fncGetProductList('${ i }');">${ i }</a>
			</c:forEach>
			<%-- /////////////////////// EL / JSTL 적용으로 주석 처리 ////////////////////////
			<% 	}  %>
/////////////////////// EL / JSTL 적용으로 주석 처리 //////////////////////// --%>
			<%-- /////////////////////// EL / JSTL 적용으로 주석 처리 ////////////////////////
			<% if( resultPage.getEndUnitPage() >= resultPage.getMaxPage() ){ %>
/////////////////////// EL / JSTL 적용으로 주석 처리 //////////////////////// --%>
			<c:if test="${ resultPage.endUnitPage >= resultPage.maxPage }">
			이후 ▶
			</c:if>
			<%-- /////////////////////// EL / JSTL 적용으로 주석 처리 ////////////////////////
			<% }else{ %>
/////////////////////// EL / JSTL 적용으로 주석 처리 //////////////////////// --%>	
			<c:if test="${ resultPage.endUnitPage < resultPage.maxPage }">
				<a href="javascript:fncGetProductList('${resultPage.endUnitPage+1}')">이후 ▶</a>
			</c:if>
			<%-- /////////////////////// EL / JSTL 적용으로 주석 처리 ////////////////////////
			<% } %>	
/////////////////////// EL / JSTL 적용으로 주석 처리 //////////////////////// --%>
		
			
    	</td>
	</tr>
</table>
<!--  페이지 Navigator 끝 -->

</form>

</div>
</body>
</html>