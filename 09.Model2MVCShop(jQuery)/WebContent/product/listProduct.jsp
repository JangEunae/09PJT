<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--<c:set var="menu" value="${menu}" scope="request"/>
${menu}
<%@ page import="java.util.*"  %> 
<%@ page import="com.model2.mvc.common.Search" %>
<%@page import="com.model2.mvc.common.Page"%>
<%@page import="com.model2.mvc.common.util.CommonUtil"%>
<%@ page import="com.model2.mvc.service.domain.*" %>

<%
List<Product> list= (List<Product>)request.getAttribute("list");
Page resultPage=(Page)request.getAttribute("resultPage");

Search searchVO = (Search)request.getAttribute("search");
//==> null 을 ""(nullString)으로 변경
String searchCondition = CommonUtil.null2str(searchVO.getSearchCondition());
String searchKeyword = CommonUtil.null2str(searchVO.getSearchKeyword());

%>

<%
	String menu = (String)request.getParameter("menu");
%>
--%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>상품 목록조회</title>
<link rel="stylesheet" href="/css/admin.css" type="text/css">
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">

function fncGetList(currentPage) {
	//document.getElementById("currentPage").value = currentPage;
   	//document.detailForm.submit();
   	$("#currentPage").val(currentPage);
   	$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=${param.menu}&searchOption=${search.searchOption}").submit();
}

	$(function() {
	 
		 $( "td.ct_btn01:contains('검색')" ).on("click" , function() {
			fncGetList(1);
		 });
		
		$( ".ct_list_pop td:nth-child(3)" ).on("click" , function() {
			if(${param.menu=='manage'}){
				self.location = "/product/updateProduct?prodNo="+$($('input:hidden[name="prodNo"]')[$(".ct_list_pop td:nth-child(3)").index(this)]).val()+"&menu=${param.menu}";
			}
			else if(${param.menu=='search'}){
				if($($('input[name="proTranCode"]')[$(".ct_list_pop td:nth-child(3)").index(this)]).val()==''){
					self.location = "/product/getProduct?prodNo="+$($('input:hidden[name="prodNo"]')[$(".ct_list_pop td:nth-child(3)").index(this)]).val()+"&menu=${param.menu}";
					}else {
				}
			}
			
		});
		
		$( "td.ct_condition:contains('배송하기')" ).on("click" , function() {
			 self.location = "/purchase/updateTranCodeByProd?prodNo="+$($('input:hidden[name="prodNo"]')[$(".ct_list_pop td:nth-child(7)").index(this)]).val()+
					 "&proTranCode="+$($('input:hidden[name="proTranCode"]')[$(".ct_list_pop td:nth-child(7)").index(this)]).val();
		});
		
		$( "td.ct_condition:contains('배송완료확인')" ).on("click" , function() {
			 self.location = "/purchase/updateTranCodeByProd?prodNo="+$($('input:hidden[name="prodNo"]')[$(".ct_list_pop td:nth-child(7)").index(this)]).val()+"&proTranCode="
					 +$($('input:hidden[name="proTranCode"]')[$(".ct_list_pop td:nth-child(7)").index(this)]).val();
			 
		});
		 
	});
	 
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">

<!-- <form name="detailForm" action="/product/listProduct?menu=${param.menu}&searchOption=${search.searchOption}" method="post" > -->
<form name="detailForm">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
				
			<%--	<% 
				System.out.println("list의 menu : "+menu);
				if(menu.equals("manage")) {%>
					<td width="93%" class="ct_ttl01">
					
							상품 관리
					
					</td>
					<%} else{ %>
						<td width="93%" class="ct_ttl01">
					
							상품 목록조회
					
					</td>
					<%} %>--%> 
					
					<c:if test = "${param.menu=='manage'}">
					<td width="93%" class="ct_ttl01">
					
							상품 관리
					
					</td>
					</c:if>
					<c:if test = "${param.menu=='search'}">
					<td width="93%" class="ct_ttl01">
					
							상품 목록조회
					
					</td>
					</c:if>
					
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
			<select name="searchCondition" id="searchCondition" class="ct_input_g" style="width:80px">
		<%-- <%
		if(searchVO.getSearchCondition() != null) {
		%>
		
		
			<%
				if(searchVO.getSearchCondition().equals("0")){
			%>
				<option value="0" selected>상품번호</option>
				<option value="1">상품명</option>
				<option value="2">상품가격</option>
			<%
				}else if(searchVO.getSearchCondition().equals("1")) {
			%>
				<option value="0">상품번호</option>
				<option value="1" selected>상품명</option>
				<option value="2">상품가격</option>
			<%
				}else if(searchVO.getSearchCondition().equals("2")) {
			%>
				<option value="0">상품번호</option>
				<option value="1">상품명</option>
				<option value="2" selected>상품가격</option>
				
			<%
				}
			%>--%>
			
			<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>전체</option>
			<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품명</option>
			<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>상품가격</option>
			
			</select>
			<input type="text" name="searchKeyword" id="searchkeyword" value="${ (!empty search.searchKeyword) ? search.searchKeyword : "" }" class="ct_input_g" style="width:200px; height:19px" />
		</td>
		
	<%--	<%
		}else{
		%>
		<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px">
				<option value="0">상품번호</option>
				<option value="1">상품명</option>
				<option value="2">상품가격</option>
			</select>
			<input type="text" name="searchKeyword" class="ct_input_g" style="width:200px; height:19px" />
		</td>
		
		<%
		}
		%>--%>
			
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<!--  <a href="javascript:fncGetList('1');">검색</a> -->
						검색
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
	<tr class="ct_price">
		<td colspan="3" >
		전체 ${resultPage.totalCount} 건수, 현재 ${resultPage.currentPage}  페이지 		
		</td>
		<td colspan="8" align="right" >

		<!--  <input type="hidden" name="searchOption" id="searchOption" >-->
		<a href="/product/listProduct?menu=${param.menu}&searchOption=0&searchCondition=${search.searchCondition}&searchKeyword=${search.searchKeyword}">높은 가격순▲ </a>
		<a href="/product/listProduct?menu=${param.menu}&searchOption=1&searchCondition=${search.searchCondition}&searchKeyword=${search.searchKeyword}">낮은 가격순▼ </a>
		</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">상품명</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">가격</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">현재상태</td>	
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	
<%--	<%
	for(int i=0; i<list.size(); i++) {
		Product vo = (Product)list.get(i);
	
	%>
	<tr class="ct_list_pop">
		<td align="center"><%= i + 1 %></td>
		<td></td>
				<% if(menu.equals("manage")) {%>
				<td align="left"><a href="/updateProductView.do?prodNo=<%=vo.getProdNo() %>"><%=vo.getProdName() %></a></td>
				<%} else{ %>
				<td align="left"><a href="/getProduct.do?prodNo=<%=vo.getProdNo() %>"><%=vo.getProdName() %></a></td>
				<%} %>
		<td></td>
		<td align="left"><%=vo.getPrice() %></td>
		<td></td>
		<td align="left"><%=vo.getRegDate() %></td>
		<td></td>
		<td align="left"><%=vo.getProTranCode() %></td>	
	</tr>
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>	
	<% } %>		--%>
	
<c:set var="i" value="0" />
	<c:forEach var="product" items="${list}">	
		<c:set var="i" value="${ i+1 }" />
		<tr class="ct_list_pop">
			<td align="center">${ i }</td>
			<td></td>
				<c:if test = "${param.menu=='manage'}">					
					<td align="left">
					<input type="hidden" name="prodNo" value="${product.prodNo}">
					<input type="hidden" name="proTranCode" value="${product.proTranCode}">
					<!--<a href="/product/updateProduct?prodNo=${product.prodNo}&menu=${param.menu}">${product.prodName}</a>-->
					<ins>${product.prodName}</ins>
					</td>		
				</c:if>
				<c:if test = "${param.menu=='search'}">
					<c:if test = "${product.proTranCode==null}">
				<td align="left">
				<input type="hidden" name="prodNo" value="${product.prodNo}">
				<input type="hidden" name="proTranCode" value="${product.proTranCode}">
				<!--<a href="/product/getProduct?prodNo=${product.prodNo}&menu=${param.menu}">${product.prodName}</a>-->
				<ins>${product.prodName}</ins>
				</td>
				</c:if>
				<c:if test = "${product.proTranCode=='0  '||product.proTranCode=='1  '||product.proTranCode=='2  '}">
				<td align="left">
				<font color="gray">${product.prodName}</font>
				<input type="hidden" name="proTranCode" value="${product.proTranCode}">
				<input type="hidden" name="prodNo" value="${product.prodNo}">
				</td>
				</c:if>
				</c:if>
			<td></td>
			<td align="left">${product.price}</td>
			<td></td>
			<td align="left" class="ct_condition">
			<!-- <input type="hidden" name="prodNo" value="${product.prodNo}">
			<input type="hidden" name="proTranCode" value="${product.proTranCode}"> -->
			<c:if test = "${product.proTranCode==null}">
				판매중
			</c:if>
			<c:if test = "${product.proTranCode=='0  '}">
				<c:if test = "${param.menu=='manage'}">
				구매완료
					<!-- <a href="/purchase/updateTranCodeByProd?prodNo=${product.prodNo}&proTranCode=${product.proTranCode}">배송하기</a> -->
					<ins>배송하기 </ins>
				</c:if>	
				<c:if test = "${param.menu=='search'}">
				재고없음
				</c:if>
			</c:if>
			<c:if test = "${product.proTranCode=='1  '}">
				배송중
				<c:if test = "${param.menu=='manage'}">
					<!--<a href="/purchase/updateTranCodeByProd?prodNo=${product.prodNo}&proTranCode=${product.proTranCode}">배송완료확인</a> -->
					<ins>배송완료확인</ins>
				</c:if>
			</c:if>
			<c:if test = "${product.proTranCode=='2  '}">
				배송완료
			</c:if>
			</td>		
		</tr>
		<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
		</tr>
	</c:forEach>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">
	 <input type="hidden" id="currentPage" name="currentPage" value=""/>
		<%--	<% if( resultPage.getCurrentPage() <= resultPage.getPageUnit() ){ %>
					◀ 이전
			<% }else{ %>
					<a href="javascript:fncGetProductList('<%=resultPage.getCurrentPage()-1%>')">◀ 이전</a>
			<% } %>

			<%	for(int i=resultPage.getBeginUnitPage();i<= resultPage.getEndUnitPage() ;i++){	%>
					<a href="javascript:fncGetProductList('<%=i %>');"><%=i %></a>
			<% 	}  %>
	
			<% if( resultPage.getEndUnitPage() >= resultPage.getMaxPage() ){ %>
					이후 ▶
			<% }else{ %>
					<a href="javascript:fncGetProductList('<%=resultPage.getEndUnitPage()+1%>')">이후 ▶</a>
			<% } %>--%>
			
			<jsp:include page="../common/pageNavigator.jsp"/>	
    	</td>
	</tr>
</table>

<!--  페이지 Navigator 끝 -->

</form>

</div>
</body>
</html>
