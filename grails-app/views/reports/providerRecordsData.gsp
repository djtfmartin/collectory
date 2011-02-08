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
            <h1>Specimen records statistics</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
              <h4>${statistics.size()} providers reported.</h4>
              <table>
                <colgroup><col width="50%"/><col width="30%"/><col width="20%"/></colgroup>
                <thead>
                  <th>Provider</th><th>Resource</th><th>No. in Atlas</th>
                </thead>

                <g:each var='m' in="${statistics}">
                  <tr>
                    <td><g:link controller="public" action="show" id="${m.uid}">${m.name}</g:link></td>
                    <td></td>
                    <td>${m.numBiocacheRecords > 0 ? m.numBiocacheRecords : '-'}</td>
                  </tr>
                </g:each>

              </table>
            </div>
        </div>
    </body>
</html>
