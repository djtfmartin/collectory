<!-- location -->
<div class="show-section">
  <h2>Location</h2>
  <table>
    <colgroup><col width="10%"/><col width="45%"/><col width="45%"/></colgroup>
    <!-- Address -->
    <tr class="prop">
      <td valign="top" class="name"><g:message code="address.label" default="Address"/></td>

      <td valign="top" class="value">
        ${fieldValue(bean: instance, field: "address.street")}<br/>
        ${fieldValue(bean: instance, field: "address.city")}<br/>
        ${fieldValue(bean: instance, field: "address.state")}
        ${fieldValue(bean: instance, field: "address.postcode")}
        <g:if test="${fieldValue(bean: instance, field: 'address.country') != 'Australia'}">
          <br/>${fieldValue(bean: instance, field: "address.country")}
        </g:if>
      </td>

      <!-- map spans all rows -->
      <td rowspan="6">
        <div id="mapCanvas"></div>
      </td>

    </tr>

    <!-- Postal -->
    <tr class="prop">
      <td valign="top" class="name"><g:message code="providerGroup.address.postal.label" default="Postal"/></td>
      <td valign="top" class="value">${fieldValue(bean: instance, field: "address.postBox")}</td>
    </tr>

    <!-- Latitude -->
    <tr class="prop">
      <td valign="top" class="name"><g:message code="providerGroup.latitude.label" default="Latitude"/></td>
      <td valign="top" class="value"><cl:showDecimal value='${instance.latitude}' degree='true'/></td>
    </tr>

    <!-- Longitude -->
    <tr class="prop">
      <td valign="top" class="name"><g:message code="providerGroup.longitude.label" default="Longitude"/></td>
      <td valign="top" class="value"><cl:showDecimal value='${instance.longitude}' degree='true'/></td>
    </tr>

    <!-- State -->
    <tr class="prop">
      <td valign="top" class="name"><g:message code="providerGroup.state.label" default="State"/></td>
      <td valign="top" class="value">${fieldValue(bean: instance, field: "state")}</td>
    </tr>

    <!-- Email -->
    <tr class="prop">
      <td valign="top" class="name"><g:message code="providerGroup.email.label" default="Email"/></td>
      <td valign="top" class="value">${fieldValue(bean: instance, field: "email")}</td>
    </tr>

    <!-- Phone -->
    <tr class="prop">
      <td valign="top" class="name"><g:message code="providerGroup.phone.label" default="Phone"/></td>
      <td valign="top" class="value">${fieldValue(bean: instance, field: "phone")}</td>
    </tr>
  </table>
  <div style="clear:both;"><span class="buttons">
    <g:link class="edit" action='edit' params="[page:'/shared/location']" id="${instance.uid}">${message(code: 'default.button.edit.label', default: 'Edit')}</g:link>
  </span></div>
</div>

