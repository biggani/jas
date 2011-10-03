<%@ include file="/WEB-INF/template/include.jsp" %>

<openmrs:require privilege="manage JAS" otherwise="/login.htm" redirect="/module/jas/drugUnitList.form" />

<spring:message var="pageTitle" code="jas.drugUnit.manage" scope="page"/>

<%@ include file="/WEB-INF/template/header.jsp" %>

<%@ include file="nav.jsp" %>
<h2><spring:message code="jas.drugUnit.manage"/></h2>	

<br />
<c:forEach items="${errors.allErrors}" var="error">
	<span class="error"><spring:message code="${error.defaultMessage}" text="${error.defaultMessage}"/></span><
</c:forEach>
<input type="button" class="ui-button ui-widget ui-state-default ui-corner-all" value="<spring:message code='jas.drugUnit.add'/>" onclick="ACT.go('drugUnit.form');"/>

<br /><br />

<form method="post" onsubmit="return false" id="form">
<table cellpadding="5" cellspacing="0">
	<tr>
		<td><spring:message code="general.name"/></td>
		<td><input type="text" id="searchName" name="searchName" value="${searchName}" /></td>
		<td><input type="button" class="ui-button ui-widget ui-state-default ui-corner-all" value="Search" onclick="JAS.search('drugUnitList.form','searchName');"/></td>
	</tr>
</table>

<span class="boxHeader"><spring:message code="jas.drugUnit.list"/></span>
<div class="box">
<c:choose>
<c:when test="${not empty drugUnits}">
<input type="button" class="ui-button ui-widget ui-state-default ui-corner-all" onclick="JAS.checkValue();" value="<spring:message code='jas.deleteSelected'/>"/>
<table cellpadding="5" cellspacing="0" width="100%">
<tr>
	<th>#</th>
	<th><spring:message code="jas.drugUnit.name"/></th>
	<th><spring:message code="jas.drugUnit.description"/></th>
	<th><spring:message code="jas.drugUnit.createdDate"/></th>
	<th><spring:message code="jas.drugUnit.createdBy"/></th>
	<th></th>
</tr>
<c:forEach items="${drugUnits}" var="drugUnit" varStatus="varStatus">
	<tr class='${varStatus.index % 2 == 0 ? "oddRow" : "evenRow" } '>
		<td><c:out value="${(( pagingUtil.currentPage - 1  ) * pagingUtil.pageSize ) + varStatus.count }"/></td>	
		<td><a href="#" onclick="ACT.go('drugUnit.form?drugUnitId=${ drugUnit.id}');">${drugUnit.name}</a> </td>
		<td>${drugUnit.description}</td>
		<td><openmrs:formatDate date="${drugUnit.createdOn}" type="textbox"/></td>
		<td>${drugUnit.createdBy}</td>
		<td><input type="checkbox" name="ids" value="${drugUnit.id}"/></td>
	</tr>
</c:forEach>

<tr class="paging-container">
	<td colspan="6"><%@ include file="../paging.jsp" %></td>
</tr>
</table>
</c:when>
<c:otherwise>
	No drugUnit found.
</c:otherwise>
</c:choose>
</div>
</form>






<%@ include file="/WEB-INF/template/footer.jsp" %>