<%@ page import="grails.converters.JSON; au.org.ala.collectory.Classification; au.org.ala.collectory.Collection" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>Registry database reports</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><cl:homeLink/></span>
            <span class="menuButton"><g:link class="list" action="list">Reports</g:link></span>
        </div>
        <div class="body">
            <h1>Collection taxonomic hints (used to constrain name matching)</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
              <table>
                <col width="55%"/><col width ="5%"/><col width="40%"/>

                <tr class="reportGroupTitle"><th>Collection</th><th>Acronym</th><th>Taxonomic hint</th></tr>
                <g:each var='c' in="${collections}" status="i">
                  <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                    <td>
                      <cl:showOrEdit entity="${c}"/>
                    </td>
                    <td style="text-align:center;color:gray;">${c.acronym}</td>
                    <td>
                      <g:if test="${c.taxonomyHints}">
                        <g:set var="hints" value="${JSON.parse(c.taxonomyHints)?.coverage}"/>
                          <g:each var="h" in="${hints}">
                            ${h.keySet().iterator().next()} = ${h[h.keySet().iterator().next()]}<br/>
                          </g:each>
                      </g:if>
                    </td>
                  </tr>
                </g:each>

              </table>
            </div>
        </div>
    </body>
</html>
