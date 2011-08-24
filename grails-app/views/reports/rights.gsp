<%@ page import="grails.converters.JSON; au.org.ala.collectory.ProviderGroup" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>Registry database reports</title>
        <link rel="stylesheet" href="${resource(dir:'css/smoothness',file:'jquery-ui-1.8.14.custom.css')}" type="text/css" media="screen"/>
        <g:javascript library="jquery-1.5.1.min"/>
        <g:javascript library="jquery-ui-1.8.14.custom.min"/>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><cl:homeLink/></span>
            <span class="menuButton"><g:link class="list" action="list">Reports</g:link></span>
        </div>
        <div class="body">
            <h1>Data resource rights and licensing</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
              <p>This list shows the conditions of use for each data resource.</p>
              <p>Click the twisty to show the full rights text. Click resource name to edit the resource.</p>
              <p>
                <span id="toggle"><a class="button" href='javascript:showEmpty();'>Show resources with no license or permissions documents.</a></span>
                <span id="toggleAll"><a class="button" href='javascript:hideAll();'>Show all details.</a></span>
              </p>
              <table class="reports">
                <colgroup width="3"></colgroup>
                <colgroup width="240"></colgroup>
                <colgroup span="5" class="center"></colgroup>
                <thead>
                    <tr class="reportHeaderRow"><th></th></th><th>Resource</th><th>License type</th><th class="center">Version</th>
                        <th class="center">Permissions doc</th><th class="center">Doc type</th><th class="center">DPA flags</th></tr>
                </thead>
                <tbody>
                    <g:each var='r' in="${resources}">
                      <g:if test="${r.permissionsDocument || r.permissionsDocumentType || r.licenseType || r.licenseVersion}">
                          <g:set var="hide" value=""/>
                      </g:if>
                      <g:else>
                          <g:set var="hide" value="class='noValues'"/>
                      </g:else>

                      <tr ${hide} class="ui-state-active">
                        <td><g:if test="${r.rights || r.permissionsDocument}">
                            <span onclick="toggleParams(this)" class="ui-icon ui-icon-triangle-1-e"> </span>
                        </g:if></td>
                        <td align="left">
                            <g:link controller="dataResource" action="show" id="${r.uid}">
                                ${r.acronym ?: r.name}
                            </g:link>
                        </td>
                        <td>${r.licenseType}</td>
                        <td class="center">${r.licenseVersion}</td>
                        <td class="center"><cl:shortPermissionsDocument url="${r.permissionsDocument}"/></td>
                        <td class="center"><cl:shortPermissionsDocumentType type="${r.permissionsDocumentType}"/></td>
                        <td class="center"><cl:dpaStatus brief="true" filed="${r.filed}" risk="${r.riskAssessment}"/></td>
                      </tr>

                      <g:if test="${r.rights || r.permissionsDocument}">
                          <tr style="display:none;">
                              <td></td>
                              <td colspan="6">
                                <table class="shy">
                                  <g:if test="${r.rights}">
                                    <tr>
                                      <td>Rights:</td>
                                      <td>${r.rights}</td>
                                    </tr>
                                  </g:if>
                                  <g:if test="${r.permissionsDocument}">
                                    <tr>
                                      <td>Permissions Document:</td>
                                      <td>${r.permissionsDocument}</td>
                                    </tr>
                                  </g:if>
                                </table>
                              </td>
                          </tr>
                       </g:if>
                    </g:each>
                  </tbody>
              </table>
            </div>
        </div>
        <script type="text/javascript">
            function toggleParams(me) {
                if ($(me).hasClass('ui-icon-triangle-1-e')) {
                    $(me).switchClass('ui-icon-triangle-1-e','ui-icon-triangle-1-s',10);
                    $(me).parent().parent().next().css('display','table-row');
                } else {
                    $(me).switchClass('ui-icon-triangle-1-s','ui-icon-triangle-1-e',10);
                    $(me).parent().parent().next().css('display','none');
                }
            }
            function hideEmpty() {
                $('tr.noValues').css('display', 'none');
                $('#toggle a').attr('href',"javascript:showEmpty();");
                $('#toggle a span').html('Show resources with no license or permissions documents.');
            }
            function showEmpty() {
                $('tr.noValues').removeAttr('style');
                $('#toggle a').attr('href',"javascript:hideEmpty();");
                $('#toggle a span').html('Hide resources with no license or permissions documents. ');
            }
            function hideAll() {
                var all = $('span.ui-icon-triangle-1-s');
                for (var i = 0; i < all.length; i++) {
                    toggleParams(all[i]);
                }
                $('#toggleAll a').attr('href',"javascript:showAll();");
                $('#toggleAll a span').html('Show all details.');
            }
            function showAll() {
                var all = $('span.ui-icon-triangle-1-e');
                for (var i = 0; i < all.length; i++) {
                  var t = all[i];
                    // only if container is visible
                    if ($(t).parent().parent().css('display') != 'none') {
                      toggleParams(t);
                    }
                }
                $('#toggleAll a').attr('href',"javascript:hideAll();");
                $('#toggleAll a span').html('Hide all details.' );
            }
            hideEmpty();
            hideAll();
            $('a.button').button();
        </script>
    </body>
</html>
