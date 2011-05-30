<%@ page import="au.org.ala.collectory.Collection" %>
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
            <h1>Collections report</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>

            <div class="dialog">
                <g:if test="${simple != 'true'}">
                    <p><strong>View</strong> column links to the public page for the collection. You can copy this link to use as the permanent URL to the collection page.</p>
                    <p><strong>Edit</strong> column links to the admin page where this collection's metadata can be edited.</p>
                </g:if>
                <p>Showing ${collections.size()} collections.
                <g:if test="${simple == 'true'}">
                    <g:link controller="reports" action="collections" params="[simple:'false']">Show links.</g:link></p>
                </g:if>
                <g:else>
                    <g:link controller="reports" action="collections" params="[simple:'true']">Show collection names only.</g:link></p>
                </g:else>

              <table>
                <g:if test="${simple != 'true'}">
                    <colgroup><col width="60%"/><col width="20%"/><col width="10%"/><col width="10%"/></colgroup>
                </g:if>

                <g:each var='c' in="${collections}" status="i">
                  <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                    <td>${c.name}</td>
                    <g:if test="${simple != 'true'}">
                        <td>${c.acronym}</td>
                        <td><g:link controller="public" action="show" id="${c.uid}">View</g:link></td>
                        <td><g:link controller="collection" action="show" id="${c.uid}">Edit</g:link></td>
                    </g:if>
                  </tr>
                </g:each>

              </table>
            </div>
        </div>
    </body>
</html>
