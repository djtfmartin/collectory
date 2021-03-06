<%@ page import="org.codehaus.groovy.grails.commons.ConfigurationHolder; java.text.DecimalFormat; java.text.SimpleDateFormat" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="${grailsApplication.config.ala.skin}" />
        <title>${fieldValue(bean: instance, field: "name")} | Data sets | Atlas of Living Australia</title>
    </head>
    <body class="two-column-right collectory-temp-dataresource">
      <div id="content">
        <div id="header" class="collectory heading-bar">
          <div id="breadcrumb">
            <ol class="breadcrumb">
                <li><cl:breadcrumbTrail/> <span class=" icon icon-arrow-right"></span></li>
                <li><cl:pageOptionsLink>${fieldValue(bean:instance,field:'name')}</cl:pageOptionsLink></li>
            </ol>
          </div>
        </div><!--close header-->
        <div id="column-one">
          <div class="section">
            <p><g:message code="public.stdr.co.des01" args="[name, instance.dateCreated]" />.</p>
            <p><g:message code="public.stdr.co.des02" args="[instance.numberOfRecords]" />.</p>
            <cl:lastUpdated date="${instance.lastUpdated}"/>
          </div>
        </div><!--close column-one-->
        <div id="column-two">
          <div class="section sidebar">
              <!-- contacts -->
              <g:set var="contacts" value="${instance.getPublicContactsPrimaryFirst()}"/>
              <g:render template="contacts" bean="${contacts}"/>
              <div class="section">
              <p>${fieldValue(bean: instance, field: "firstName")} ${fieldValue(bean: instance, field: "lastName")}</p>
              <g:if test="${instance.email}"><cl:emailLink>${fieldValue(bean: instance, field: "email")}</cl:emailLink><br/></g:if>
            </div>
          </div>
        </div>
      </div>
    </body>
</html>
