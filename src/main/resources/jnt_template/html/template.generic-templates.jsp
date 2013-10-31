<%@ page language="java" contentType="text/html;charset=UTF-8" %><!DOCTYPE html>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>

<html lang="${renderContext.mainResourceLocale.language}">
<head>

    <meta charset="utf-8">

    <title>${fn:escapeXml(renderContext.mainResource.node.displayableName)}</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%-- Description meta, truncate to 160 characters--%>
    <c:if test="${not empty renderContext.mainResource.node.properties['jcr:description'].string}">
        <c:set var="pageDescription"
               value="${fn:substring(renderContext.mainResource.node.properties['jcr:description'].string,0,160)}"/>
        <meta name="description" content="${pageDescription}"/>
    </c:if>

    <c:set var="keywordsI18n" value="${renderContext.mainResource.node.properties['j:keywordsI18n'].string}"/>
    <c:choose>
        <c:when test="${! empty keywordsI18n}">
            <meta name="keywords" content="${fn:trim(keywordsI18n)}"/>
        </c:when>
        <c:otherwise>
            <jcr:nodeProperty node="${renderContext.mainResource.node}" name="j:keywords"  var="keywords"/>
            <c:set var="keywordsStr" value=""/>
            <c:forEach items="${keywords}" var="keyword">
                <c:set var="keywordsStr">${keywordsStr}--${keyword.string}</c:set>
            </c:forEach>
            <c:if test="${!empty keywordsStr}">
                <meta name="keywords" content="${fn:trim(fn:replace(keywordsStr,'--',' '))}"/>
            </c:if>
        </c:otherwise>
    </c:choose>


    <%--<meta name="author" content="">--%>

    <%-- Modernizr --%>
    <template:addResources type="javascript" resources="modernizr.js"/>

    <%-- google-code-prettify --%>
    <template:addResources type="css" resources="prettify.css"/>
    <template:addResources type="javascript" resources="prettify.js,lang-css.js,"/>

<%-- HTML5 shim, for IE6-8 support of HTML5 elements --%>
    <template:addResources type="javascript" resources="html5shiv.js" condition="if lt IE 9"/>


    <%-- Fav and touch icons --%>
    <link rel="shortcut icon" href="<c:url value='${url.currentModule}/icon/favicon.ico'/>" type="image/x-icon">
    <link rel="icon" href="<c:url value='${url.currentModule}/icon/favicon.ico'/>" type="image/ico">
    <link rel="icon" type="image/png" href="<c:url value='${url.currentModule}/icon/favicon.png'/>"/>

    <link rel="apple-touch-icon" href="<c:url value='${url.currentModule}/icon/icon-iphone.png'/>"/>
    <link rel="apple-touch-icon" sizes="72x72" href="<c:url value='${url.currentModule}/icon/icon-ipad.png'/>"/>
    <link rel="apple-touch-icon" sizes="114x114"
          href="<c:url value='${url.currentModule}/icon/jahia-icon-iphone4.png'/>"/>


    <%--tablet and iphone meta--%>
    <meta name='HandheldFriendly' content='True'/>
    <meta name="viewport"
          content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, width=device-width, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">

    <%-- Google fonts--%>
    <c:set var="s" value="${renderContext.request.scheme=='https'?'s':''}"/>
    <link href='http${s}://fonts.googleapis.com/css?family=Scada' rel='stylesheet' type='text/css'>


    <template:addResources type="javascript" resources="jquery.min.js"/>

    <template:addResources type="javascript"
                           resources="bootstrap-transition.js,bootstrap-alert.js,bootstrap-modal.js,bootstrap-dropdown.js"/>
    <template:addResources type="javascript"
                           resources="bootstrap-scrollspy.js,bootstrap-tab.js,bootstrap-tooltip.js,bootstrap-popover.js"/>
    <template:addResources type="javascript"
                           resources="bootstrap-button.js,bootstrap-collapse.js,bootstrap-carousel.js,bootstrap-typeahead.js"/>

    <template:addResources type="javascript" resources="holder.js,twitter-bootstrap-hover-dropdown.js,generic.js"/>
</head>

<body>

<div class="wrapper bodywrapper">
    <template:area path="pagecontent" areaAsSubNode="true"/>
</div>

<%-- Les styles old--%>
<template:addResources type="css" resources="jahia-old-responsive.css,jahia-old.css"/>

<%-- Les styles modules --%>
<template:addResources type="css" resources="02mod.css"/>

<%-- Les styles--%>
<template:addResources type="css" resources="bootstrap.css,responsive.css,jahia.css"/>

<%-- animate CSS https://github.com/daneden/animate.css--%>
<template:addResources type="css" resources="animate.css"/>

<%-- font-awesome icons --%>
<template:addResources type="css" resources="font-awesome.css"/>

<template:addResources type="css" resources="ie7-ie8.css" condition="if lt IE 9"/>

<c:if test="${renderContext.editMode}">
    <template:addResources type="css" resources="edit.css"/>
</c:if>

<script type="text/javascript">
    // marquage GA asynchrone
    var _gaq = _gaq || [];
    // traitement de Google Image en amont du code standard
    var ref = document.referrer;
    if ((ref.search(/imgres\?imgurl/) !== -1) && (ref.search(/prev/) !== -1)) {
        var regex = RegExp("www.google.([^\/]+).*&prev=([^&]+)");
        var match = regex.exec(ref);
        _gaq.push(['_setReferrerOverride', 'http://images.google.' + match[1] + unescape(match[2])]);
    }
    _gaq.push(['_addOrganic', 'cuil', 'q', true],
            ['_addOrganic', 'cluuz', 'q', true],
            ['_addOrganic', 'myway', 'searchfor', true],
            ['_addOrganic', 'mywebsearch', 'searchfor', true],
            ['_addOrganic', 'gooofullsearch', 'Keywords', true],
            ['_addOrganic', 'lo.st', 'x_query', true],
            ['_addOrganic', 'news.google.fr', 'q', true],
            ['_addOrganic', 'voila', 'kw', false],
            ['_addOrganic', 'exalead', 'q', true],
            ['_addOrganic', 'yauba', 'q', true],
            ['_addOrganic', 'yougoo', 'q', true],
            ['_addOrganic', 'hooseek', 'recherche', true],
            ['_addOrganic', 'ecosia', 'q', true],
            ['_addOrganic', 'wibeez', 'q', true],
            ['_addOrganic', 'veosearch', 'q', true],
            ['_addOrganic', 'incredimail', 'q', true],
            ['_addOrganic', 'sweetim', 'q', true],
            ['_addOrganic', 'conduit', 'q', true],
            ['_addOrganic', 'searcheo', 'q', true],
            ['_addOrganic', 'babylon', 'q', true],
            ['_addOrganic', 'imesh', 'q', true],
            ['_addOrganic', 'fastbrowsersearch', 'q', true],
            ['_addOrganic', 'magentic', 'q', true],
            ['_addOrganic', 'search.free.fr', 'q', true],
            ['_addOrganic', 'vizzeo', 'q', true],
            ['_addOrganic', 'bluewin.ch', 'searchTerm', true],
            ['_addOrganic', 'google', 'as_q', true]);
    // parametres
    _gaq.push(['_setAllowAnchor', true]);
    _gaq.push(['_setAccount', 'UA-988740-1']); // mettre l'identifiant du compte - webproperty
    _gaq.push(['_trackPageview']);
    _gaq.push(['_trackPageLoadTime']);

    (function () {
        var ga = document.createElement('script');
        ga.type = 'text/javascript';
        ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0];
        s.parentNode.insertBefore(ga, s);
    })();
</script>
<script id="__maSrc" type="text/javascript" data-pid="4253">
    (function () {
        var d = document, t = 'script', c = d.createElement(t), s = (d.URL.indexOf('https:') == 0 ? 's' : ''), p;
        c.type = 'text/java' + t;
        c.src = 'http' + s + '://' + s + 'c.cdnma.com/apps/capture.js';
        p = d.getElementsByTagName(t)[0];
        p.parentNode.insertBefore(c, p);
    }());
</script>
<!-- START Net-Results Capture Code -->
<script src="https://nr7.us/apps/?p=4253"></script>
<!-- END Net-Results Capture Code -->
<c:if test="${renderContext.editMode}">
    <template:addResources type="javascript" resources="jquery.versioncompare.js"/>
    <script>
        if ($.versioncompare("1.9.1",jQuery.fn.jquery) == 1) {
            alert("Sorry dude, your version of jQuery is lower than 1.9.1. Your current version is " + $.fn.jquery + ".");
        }
    </script>
</c:if>
</body>
</html>
