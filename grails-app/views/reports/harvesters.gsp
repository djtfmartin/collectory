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
            <h1>Data mobilisation settings</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
              <p>This list shows the metadata that controls data mobilisation.</p>
              <p>Click the twisty to show connection parameters. Click resource name to edit the resource.</p>
              <p>
                <span id="toggle"><a class="button" href='javascript:showEmpty();'>Show resources with no mobilisation values.</a></span>
                <span id="toggleAll"><a class="button" href='javascript:hideAll();'>Show all connection parameters.</a></span>
              </p>
              <table class="reports">
                <colgroup width="3"></colgroup>
                <colgroup width="250"></colgroup>
                <colgroup span="5" class="center"></colgroup>
                <thead>
                    <tr class="reportHeaderRow"><th></th></th><th>Resource</th><th>Status</th><th class="center">Freq (days)</th><th class="center">Last Checked</th><th class="center">Data Currency</th><th class="center">Connection</th></tr>
                </thead>
                <tbody>
                    <g:each var='r' in="${resources}">
                      <g:set var="pList" value="${r.connectionParameters ? JSON.parse(r.connectionParameters) : [:]}"/>
                      <g:if test="${r.harvestFrequency || r.lastChecked || r.dataCurrency || r.connectionParameters}">
                          <g:set var="hide" value=""/>
                      </g:if>
                      <g:else>
                          <g:set var="hide" value="class='noValues'"/>
                      </g:else>

                      <tr ${hide} class="ui-state-active">
                        <td><g:if test="${r.connectionParameters}">
                            <span onclick="toggleParams(this)" class="ui-icon ui-icon-triangle-1-e"> </span>
                        </g:if></td>
                        <td align="left">
                            <g:link controller="dataResource" action="show" id="${r.uid}">
                                ${r.acronym ?: r.name}
                            </g:link>
                        </td>
                        <td>${r.status}</td>
                        <td class="center">${r.harvestFrequency}</td>
                        <td class="center">${r.lastChecked}</td>
                        <td class="center">${r.dataCurrency}</td>
                        <td class="center">${pList.protocol}</td>
                      </tr>

                      <g:if test="${r.connectionParameters}">
                          <tr style="display:none;">
                              <td></td>
                              <td colspan="6">
                                  <table>
                                      <g:each in="${pList}" var="p">
                                          <g:if test="${p.key != 'protocol'}">
                                              <tr>
                                                  <td>${p.key} =</td>
                                                  <td>
                                                    <g:if test="${p.key == 'keywords'}">
                                                        ${p.value.tokenize(',').join(', ')}
                                                    </g:if>
                                                    <g:elseif test="${p.key == 'termsForUniqueKey'}">
                                                        ${p.value.join(', ')}
                                                    </g:elseif>
                                                    <g:else>
                                                        ${p.value}
                                                    </g:else>
                                                  </td>
                                              </tr>
                                          </g:if>
                                      </g:each>
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
                $('#toggle a span').html('Show resources with no mobilisation values.');
            }
            function showEmpty() {
                $('tr.noValues').removeAttr('style');
                $('#toggle a').attr('href',"javascript:hideEmpty();");
                $('#toggle a span').html('Hide resources with no mobilisation values. ');
            }
            function hideAll() {
                var all = $('span.ui-icon-triangle-1-s');
                for (var i = 0; i < all.length; i++) {
                    toggleParams(all[i]);
                }
                $('#toggleAll a').attr('href',"javascript:showAll();");
                $('#toggleAll a span').html('Show all connection parameters.');
            }
            function showAll() {
                var all = $('span.ui-icon-triangle-1-e');
                for (var i = 0; i < all.length; i++) {
                    toggleParams(all[i]);
                }
                $('#toggleAll a').attr('href',"javascript:hideAll();");
                $('#toggleAll a span').html('Hide all connection parameters.' );
            }
            hideEmpty();
            hideAll();
            $('a.button').button();
        </script>
    </body>
</html>
