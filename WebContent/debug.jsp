<%--
 Copyright (C) 2009  HungryHobo@mail.i2p
 
 The GPG fingerprint for HungryHobo@mail.i2p is:
 6DD3 EAA2 9990 29BC 4AD2 7486 1E2C 7B61 76DC DC12
 
 This file is part of I2P-Bote.
 I2P-Bote is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.
 
 I2P-Bote is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 
 You should have received a copy of the GNU General Public License
 along with I2P-Bote.  If not, see <http://www.gnu.org/licenses/>.
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ib" uri="I2pBoteTags" %>

<ib:message key="Debug" var="title" scope="request"/>
<jsp:include page="header.jsp"/>

<div class="main">
    <h2><ib:message key="Debug Page"/></h2>
    
    <c:if test="${empty param.action}">
        <form action="debug.jsp">
            <input type="hidden" name="action" value="checkFiles"/>
            <ib:message key="Test encrypted files" var="submitButtonText"/>
            <input type="submit" value="${submitButtonText}"/>
        </form>
    </c:if>
    
    <c:if test="${param.action eq 'checkFiles'}">
        <jsp:useBean id="jspHelperBean" class="i2p.bote.web.JSPHelper"/>
        <ib:requirePassword>
            <c:set var="undecryptableFiles" value="${jspHelperBean.undecryptableFiles}"/>
            <c:if test="${empty undecryptableFiles}">
                <b><ib:message key="No file encryption problems found."/></b>
            </c:if>
            <c:if test="${not empty undecryptableFiles}">
                <b><ib:message key="Undecryptable files:"/></b><br/>
                <ul>
                <c:forEach items="${undecryptableFiles}" var="file">
                    <li>${file}</li>
                </c:forEach>
                </ul>
            </c:if>
        </ib:requirePassword>
    </c:if>
</div>

<jsp:include page="footer.jsp"/>
