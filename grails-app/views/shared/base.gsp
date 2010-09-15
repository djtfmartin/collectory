<%@ page import="au.org.ala.collectory.DataProvider; au.org.ala.collectory.ProviderGroup; au.org.ala.collectory.Institution" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="collection.base.label" default="Edit collection metadata" /></title>
    </head>
    <body>
        <div class="nav">
          <g:if test="${mode == 'create'}">
            <h1>Creating a new collection</h1>
          </g:if>
          <g:else>
            <h1>Editing: ${command.name}</h1>
          </g:else>
        </div>
        <div id="baseForm" class="body">
            <g:if test="${message}">
            <div class="message">${message}</div>
            </g:if>
            <g:hasErrors bean="${command}">
            <div class="errors">
                <g:renderErrors bean="${command}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" name="baseForm" action="base">
                <g:hiddenField name="id" value="${command?.id}" />
                <g:hiddenField name="version" value="${command.version}" />
                <div class="dialog">
                    <table>
                        <tbody>

                          <tr class="prop">
                              <td valign="top" class="name">
                                <label for="guid"><g:message code="collection.guid.label" default="Guid" /></label>
                              </td>
                              <td valign="top" class="value ${hasErrors(bean: command, field: 'guid', 'errors')}">
                                <g:textField name="guid" maxlength="45" value="${command?.guid}" />
                                <cl:helpText code="collection.guid"/>
                              </td>
                              <cl:helpTD/>
                          </tr>

                          <tr class="prop">
                              <td valign="top" class="name">
                                <label for="name"><g:message code="collection.name.label" default="Name" />
                                  <br/><span class=hint>* required field</span>
                                </label>
                              </td>
                              <td id="previous" valign="top" class="value ${hasErrors(bean: command, field: 'name', 'errors')}">
                                <g:textField name="name" maxlength="128" value="${command?.name}" />
                                <cl:helpText code="collection.name"/>
                              </td>
                            <cl:helpTD/>
                          </tr>

                          <tr class="prop">
                              <td valign="top" class="name">
                                <label for="acronym"><g:message code="collection.acronym.label" default="Acronym" /></label>
                              </td>
                              <td valign="top" class="value ${hasErrors(bean: command, field: 'acronym', 'errors')}">
                                  <g:textField name="acronym" maxlength="45" value="${command?.acronym}" />
                                  <cl:helpText code="collection.acronym"/>
                              </td>
                            <cl:helpTD/>
                          </tr>

                        <g:if test="${command.ENTITY_TYPE == 'Collection'}">
                          <tr class="prop">
                            <td valign="top" class="name">
                              <label for="institution.id"><g:message code="collection.institution.label" default="Institution"/></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: command, field: 'institution', 'errors')}">
                              <g:select name="institution.id"
                                      from="${Institution.list([sort:'name'])}" 
                                      optionKey="id"
                                      noSelection="${['null':'Select an institution']}"
                                      value="${command.institution?.id}"/>
                              <cl:helpText code="collection.institution"/>
                              <cl:helpTD/>
                            </td>
                          </tr>
                        </g:if>

                        <g:if test="${command.ENTITY_TYPE == 'DataResource'}">
                          <tr class="prop">
                            <td valign="top" class="name">
                              <label for="dataProvider.id"><g:message code="dataResource.dataProvider.label" default="Data provider"/></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: command, field: 'dataProvider', 'errors')}">
                              <g:select name="dataProvider.id"
                                      from="${DataProvider.list([sort:'name'])}"
                                      optionKey="id"
                                      noSelection="${['null':'Select an data provider']}"
                                      value="${command.dataProvider?.id}"/>
                              <cl:helpText code="dataResource.dataProvider"/>
                              <cl:helpTD/>
                            </td>
                          </tr>
                        </g:if>

                        <!-- ALA partner -->
                        <cl:ifGranted role="${ProviderGroup.ROLE_ADMIN}">
                          <tr class="prop">
                              <td valign="top" class="name">
                                <label for="isALAPartner"><g:message code="providerGroup.isALAPartner.label" default="Is ALA Partner" /></label>
                              </td>
                              <td valign="top" class="value ${hasErrors(bean: command, field: 'isALAPartner', 'errors')}">
                                  <g:checkBox name="isALAPartner" value="${command?.isALAPartner}" />
                              </td>
                          </tr>
                        </cl:ifGranted>

                        <!-- network membership -->
                        <tr class="prop">
                            <td valign="top" class="name">
                              <label for="networkMembership"><g:message code="providerGroup.networkMembership.label" default="Belongs to" /></label>
                            </td>
                            <td valign="top" class="checkbox ${hasErrors(bean: command, field: 'networkMembership', 'errors')}">
                                <cl:checkboxSelect name="networkMembership" from="${ProviderGroup.networkTypes}" value="${command?.networkMembership}" multiple="yes" valueMessagePrefix="providerGroup.networkMembership" noSelection="['': '']" />
                                <cl:helpText code="providerGroup.networkMembership"/>
                                <cl:helpTD/>
                            </td>
                        </tr>

                        <!-- web site url -->
                        <tr class="prop">
                            <td valign="top" class="name">
                              <label for="websiteUrl"><g:message code="providerGroup.websiteUrl.label" default="Website Url" /></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: command, field: 'websiteUrl', 'errors')}">
                                <g:textField name="websiteUrl" maxLength="256" value="${command?.websiteUrl}" />
                                <cl:helpText code="providerGroup.websiteUrl"/>
                                <cl:helpTD/>
                            </td>
                        </tr>

                        <!-- notes -->
                        <tr class="prop">
                            <td valign="top" class="name">
                              <label for="notes"><g:message code="providerGroup.notes.label" default="Notes" /></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: command, field: 'notes', 'errors')}">
                                <g:textArea name="notes" cols="40" rows="${cl.textAreaHeight(text:command.notes)}" value="${command?.notes}" />
                                <cl:helpText code="collection.notes"/>
                              </td>
                              <cl:helpTD/>
                        </tr>

                        </tbody>
                    </table>
                </div>

                <div class="buttons">
                    <span class="button"><input type="submit" name="_action_updateBase" value="Update" class="save"></span>
                    <span class="button"><input type="submit" name="_action_cancel" value="Cancel" class="cancel"></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
