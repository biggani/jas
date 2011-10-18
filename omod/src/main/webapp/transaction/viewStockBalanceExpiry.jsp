<%@ include file="/WEB-INF/template/include.jsp" %>

<openmrs:require privilege="manage JAS" otherwise="/login.htm" redirect="/module/jas/main.form" />
<spring:message var="pageTitle" code="jas.viewStockBalance.manage" scope="page"/>
<%@ include file="/WEB-INF/template/header.jsp" %>
<%@ include file="nav.jsp" %>
<h2><spring:message code="jas.viewStockBalance.manage"/></h2>	
<br />
<c:forEach items="${errors.allErrors}" var="error">
	<span class="error"><spring:message code="${error.defaultMessage}" text="${error.defaultMessage}"/></span><
</c:forEach>
<br /><br />
<form method="get"  id="form">
<table >
	<tr >
		<td><spring:message code="jas.receiptDrug.category"/></td>
		<td>
			<select name="categoryId" id="categoryId"  style="width: 250px;">
      			<option value=""></option>
				<c:forEach items="${listCategory}" var="category">
					<option value="${category.id}" title="${category.name}"
					<c:if test="${category.id == categoryId }">selected</c:if>
					>${category.name}</option>
				</c:forEach>
	   		</select>
		</td>
		<td><spring:message code="jas.receiptDrug.drugName"/></td>
		<td>
			<input type="text" name="drugName" id="drugName" value="${drugName }"/>
		</td>
		<!--<td><spring:message code="jas.fromDate"/></td>
		<td><input type="text" id="fromDate" class="date-pick left" readonly="readonly" name="fromDate" value="${fromDate}" title="Double Click to Clear" ondblclick="this.value='';"/></td>
		<td><spring:message code="jas.toDate"/></td>
		<td><input type="text" id="toDate" class="date-pick left" readonly="readonly" name="toDate" value="${toDate}" title="Double Click to Clear" ondblclick="this.value='';"/></td>
		-->
		<td><input class="ui-button ui-widget ui-state-default ui-corner-all" type="submit" value="Search"/></td>
	</tr>
</table>
<span class="boxHeader"><spring:message code="jas.viewStockBalance.list"/></span>
<div class="box">
<table width="100%" cellpadding="5" cellspacing="0">
	<tr  align="center" >
	<th>#</th>
	<th><spring:message code="jas.viewStockBalance.name"/></th>
	<th><spring:message code="jas.viewStockBalance.formulation"/></th>
	<!--
		<th ><spring:message code="jas.viewStockBalance.receiptQty"/></th>
		<th><spring:message code="jas.viewStockBalance.STTSS"/></th>
	-->
	<th ><spring:message code="jas.receiptDrug.currentQuantity"/></th>
	</tr>
	<c:choose>
	<c:when test="${not empty stockBalances}">
	<c:forEach items="${stockBalances}" var="balance" varStatus="varStatus">
	<tr  align="center"  class='${varStatus.index % 2 == 0 ? "oddRow" : "evenRow" }' >
		<td><c:out value="${(( pagingUtil.currentPage - 1  ) * pagingUtil.pageSize ) + varStatus.count }"/></td>
		<td><a href="#" onclick="STOCKBALLANCE.detailExpiry('${balance.drug.id}', '${balance.formulation.id}');" title="Detail all transactions of this drug">${balance.drug.name}</td>
		<td>${balance.formulation.name}-${balance.formulation.dozage}</td>
		<!--
		<td>${balance.quantity}</td>
		<td>${balance.issueQuantity}</td>
		-->
		<td>${balance.currentQuantity}</td>
		</tr>
	</c:forEach>
	</c:when>
	</c:choose>
	
	<tr class="paging-container">
	<td colspan="6"><%@ include file="../paging.jsp" %></td>
</tr>
</table>
</div>

</form>




<%@ include file="/WEB-INF/template/footer.jsp" %>