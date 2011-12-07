<%@ page import="org.codehaus.groovy.grails.commons.ConfigurationHolder; java.text.DecimalFormat; au.org.ala.collectory.Collection; au.org.ala.collectory.Institution" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="ala" />
        <title><cl:pageTitle>${fieldValue(bean: instance, field: "name")}</cl:pageTitle></title>
        <link rel="stylesheet" type="text/css" href="${resource(dir:'js/jquery.fancybox/fancybox',file:'jquery.fancybox-1.3.1.css')}" media="screen" />
        <link rel="stylesheet" href="${resource(dir:'css/smoothness',file:'jquery-ui-1.8.16.custom.css')}" type="text/css" media="screen"/>
        <g:javascript src="jquery.fancybox/fancybox/jquery.fancybox-1.3.1.pack.js" />
        <g:javascript library="jquery-ui-1.8.16.custom.min"/>
        <g:javascript library="change"/>
        %{--<g:javascript library="datadumper"/>--}%
        <g:javascript library="json2"/>
        <script type="text/javascript" src="${resource(dir:'js/tinymce/jscripts/tiny_mce', file:'jquery.tinymce.js')}" ></script >
        <script type="text/javascript" >
          $(document).ready(function() {
            greyInitialValues();
            $("a#lsidbox").fancybox({
                    'hideOnContentClick' : false,
                    'titleShow' : false,
                    'autoDimensions' : false,
                    'width' : 600,
                    'height' : 180
            });
            $("a.current").fancybox({
                    'hideOnContentClick' : false,
                    'titleShow' : false,
                        'titlePosition' : 'inside',
                    'autoDimensions' : true,
                    'width' : 300
            });
          });
        </script>
        <script type="text/javascript" language="javascript" src="http://www.google.com/jsapi"></script>
    </head>
    <body class="two-column-right">
      <div id="content">
        <div id="header" class="collectory">
          <!--Breadcrumbs-->
          <div id="breadcrumb"><cl:breadcrumbTrail/>
            <cl:pageOptionsLink>${fieldValue(bean:instance,field:'name')}</cl:pageOptionsLink>
          </div>
          <cl:pageOptionsPopup instance="${instance}"/>
          <div class="section full-width">
            <g:if test="${flash.message}"><div class="message">${flash.message}</div></g:if>
            <div class="hrgroup col-8">
              <h1><span id="name">${instance.name}</span><img id="nameLink" class="changeLink" src="${resource(dir:'images/admin',file:'change.png')}"/></h1>
              <g:set var="inst" value="${instance.getInstitution()}"/>
              <g:if test="${inst}">
                <h2 class="pseudoLink">${inst.name}</h2>
              </g:if>
              <span class="acronym">Acronym: <span id="acronym">${fieldValue(bean: instance, field: "acronym")}</span><cl:change id="acronymLink"/></span>
              <span class="lsid"><a href="#lsidText" id="lsidbox" class="local" title="Life Science Identifier (pop-up)">LSID</a></span><cl:change id="lsidLink"/>
              <div style="display:none; text-align: left;">
                  <div id="lsidText" style="text-align: left;">
                      <b><a class="external_icon" href="http://lsids.sourceforge.net/" target="_blank">Life Science Identifier (LSID):</a></b>
                      <p style="margin: 10px 0;" id="lsid"><cl:guid target="_blank" guid='${fieldValue(bean: instance, field: "guid")}'/></p>
                      <p style="font-size: 12px;">LSIDs are persistent, location-independent,resource identifiers for uniquely naming biologically
                           significant resources including species names, concepts, occurrences, genes or proteins,
                           or data objects that encode information about them. To put it simply,
                          LSIDs are a way to identify and locate pieces of biological information on the web. </p>
                  </div>
              </div>
            </div>
            <div class="aside col-4 center">
              <!-- institution logo -->
              <g:if test="${inst?.logoRef?.file}">
                <img class="institutionImage" src='${resource(absolute:"true", dir:"data/institution/",file:fieldValue(bean: inst, field: 'logoRef.file'))}' />
              </g:if>
            </div>
          </div>
        </div><!--close header-->
        <div>
          <div id="column-one">
            <div class="section">

              <h2>Description<cl:change id="descriptionLink"/></h2>
              <div id="description">
                  <cl:formattedText body="${instance.pubDescription}"/>
                  <cl:formattedText body="${instance.techDescription}"/>
              </div>
              <p><span id="temporalSpan"><cl:temporalSpanText start="${instance.startDate}" end="${instance.endDate}" change="true"/></span>
                  <cl:change id="temporalSpanLink"/></p>

              <h2>Taxonomic range<cl:change id="taxonomicRangeLink"/></h2>
              <g:if test="${fieldValue(bean: instance, field: 'focus')}">
                <cl:formattedText>${fieldValue(bean: instance, field: "focus")}</cl:formattedText>
              </g:if>
              <g:if test="${fieldValue(bean: instance, field: 'kingdomCoverage')}">
                <p>Kingdoms covered include: <cl:concatenateStrings values='${fieldValue(bean: instance, field: "kingdomCoverage")}'/>.</p>
              </g:if>
              <g:if test="${fieldValue(bean: instance, field: 'scientificNames')}">
                <p><cl:collectionName name="${instance.name}" prefix="The "/> includes members from the following taxa:<br/>
                <cl:JSONListAsStrings json='${fieldValue(bean: instance, field: "scientificNames")}'/>.</p>
              </g:if>

                <h2>Geographic range<cl:change id="geographicRange"/></h2>
                <g:if test="${fieldValue(bean: instance, field: 'geographicDescription')}">
                  <p>${fieldValue(bean: instance, field: "geographicDescription")}</p>
                </g:if>
                <g:if test="${fieldValue(bean: instance, field: 'states')}">
                  <p><cl:stateCoverage states='${fieldValue(bean: instance, field: "states")}'/></p>
                </g:if>
                <g:if test="${instance.westCoordinate != -1}">
                  <p>The western most extent of the collection is: <cl:showDecimal value='${instance.westCoordinate}' degree='true'/></p>
                </g:if>
                <g:if test="${instance.eastCoordinate != -1}">
                  <p>The eastern most extent of the collection is: <cl:showDecimal value='${instance.eastCoordinate}' degree='true'/></p>
                </g:if>
                <g:if test="${instance.northCoordinate != -1}">
                  <p>The northtern most extent of the collection is: <cl:showDecimal value='${instance.northCoordinate}' degree='true'/></p>
                </g:if>
                <g:if test="${instance.southCoordinate != -1}">
                  <p>The southern most extent of the collection is: <cl:showDecimal value='${instance.southCoordinate}' degree='true'/></p>
                </g:if>

              <g:set var="nouns" value="${cl.nounForTypes(types:instance.listCollectionTypes())}"/>
              <h2>Number of <cl:nounForTypes types="${instance.listCollectionTypes()}"/> in the collection<cl:change id="records"/></h2>
              <g:if test="${fieldValue(bean: instance, field: 'numRecords') != '-1'}">
                <p>The estimated number of ${nouns} in <cl:collectionName prefix="the " name="${instance.name}"/> is ${fieldValue(bean: instance, field: "numRecords")}.</p>
              </g:if>
              <g:if test="${fieldValue(bean: instance, field: 'numRecordsDigitised') != '-1'}">
                <p>Of these ${fieldValue(bean: instance, field: "numRecordsDigitised")} are databased.
                This represents <cl:percentIfKnown dividend='${instance.numRecordsDigitised}' divisor='${instance.numRecords}' /> of the collection.</p>
              </g:if>
              <p>Click the Records & Statistics tab to access those database records that are available through the atlas.</p>

                <h2>Sub-collections<cl:change id="subCollections"/></h2>
                <p><cl:collectionName prefix="The " name="${instance.name}"/> contains these significant collections:</p>
                <cl:subCollectionList list="${instance.subCollections}"/>

              <cl:lastUpdated date="${instance.lastUpdated}"/>
            </div><!--close section-->
          </div><!--close column-one-->

          <div id="column-two">
            <div class="section sidebar">
              <g:if test="${fieldValue(bean: instance, field: 'imageRef') && fieldValue(bean: instance, field: 'imageRef.file')}">
                <div class="section">
                  <img style="max-width:100%;max-height:350px;" alt="${fieldValue(bean: instance, field: "imageRef.file")}"
                          src="${resource(absolute:"true", dir:"data/collection/", file:instance.imageRef.file)}" />
                  <cl:formattedText pClass="caption">${fieldValue(bean: instance, field: "imageRef.caption")}</cl:formattedText>
                  <cl:valueOrOtherwise value="${instance.imageRef?.attribution}"><p class="caption">${fieldValue(bean: instance, field: "imageRef.attribution")}</p></cl:valueOrOtherwise>
                  <cl:valueOrOtherwise value="${instance.imageRef?.copyright}"><p class="caption">${fieldValue(bean: instance, field: "imageRef.copyright")}</p></cl:valueOrOtherwise>
                  <cl:change id="imageRef"/>
                </div>
              </g:if>

              <div class="section">
                <h3>Location<cl:change id="location"/></h3>
                <!-- use parent location if the collection is blank -->
                <g:set var="address" value="${instance.address}"/>
                <g:if test="${address == null || address.isEmpty()}">
                  <g:if test="${instance.getInstitution()}">
                    <g:set var="address" value="${instance.getInstitution().address}"/>
                  </g:if>
                </g:if>

                <g:if test="${!address?.isEmpty()}">
                  <p>
                    <cl:valueOrOtherwise value="${address?.street}">${address?.street}<br/></cl:valueOrOtherwise>
                    <cl:valueOrOtherwise value="${address?.city}">${address?.city}<br/></cl:valueOrOtherwise>
                    <cl:valueOrOtherwise value="${address?.state}">${address?.state}</cl:valueOrOtherwise>
                    <cl:valueOrOtherwise value="${address?.postcode}">${address?.postcode}<br/></cl:valueOrOtherwise>
                    <cl:valueOrOtherwise value="${address?.country}">${address?.country}<br/></cl:valueOrOtherwise>
                  </p>
                </g:if>

                <g:if test="${instance.email}"><cl:emailLink>${fieldValue(bean: instance, field: "email")}</cl:emailLink><br/></g:if>
                <cl:ifNotBlank value='${fieldValue(bean: instance, field: "phone")}'/>
              </div>

              <!-- contacts -->
              <g:render template="/public/contacts" bean="${instance.getPublicContactsPrimaryFirst()}"/>

              <!-- web site -->
              <g:if test="${instance.websiteUrl || instance.institution?.websiteUrl}">
                <div class="section">
                  <h3>Web site<cl:change id="websiteUrl"/></h3>
                  <g:if test="${instance.websiteUrl}">
                    <div class="webSite">
                      <a class='external' rel='nofollow' target="_blank" href="${instance.websiteUrl}">Visit the collection's website</a>
                    </div>
                  </g:if>
                  <g:if test="${instance.institution?.websiteUrl}">
                    <div class="webSite">
                      <a class='external' rel='nofollow' target="_blank" href="${instance.institution?.websiteUrl}">
                        Visit the <cl:institutionType inst="${instance.institution}"/>'s website</a>
                    </div>
                  </g:if>
                </div>
              </g:if>

              <!-- network membership -->
              <g:if test="${instance.networkMembership}">
                <div class="section">
                  <h3>Membership<cl:change id="networkMembership"/></h3>
                  <g:if test="${instance.isMemberOf('CHAEC')}">
                    <p>Council of Heads of Australian Entomological Collections</p>
                    <img src="${resource(absolute:"true", dir:"data/network/",file:"chaec-logo.png")}"/>
                  </g:if>
                  <g:if test="${instance.isMemberOf('CHAH')}">
                    <p>Council of Heads of Australasian Herbaria</p>
                    <a target="_blank" href="http://www.chah.gov.au"><img src="${resource(absolute:"true", dir:"data/network/",file:"CHAH_logo_col_70px_white.gif")}"/></a>
                  </g:if>
                  <g:if test="${instance.isMemberOf('CHAFC')}">
                    <p>Council of Heads of Australian Faunal Collections</p>
                    <img src="${resource(absolute:"true", dir:"data/network/",file:"chafc.png")}"/>
                  </g:if>
                  <g:if test="${instance.isMemberOf('CHACM')}">
                    <p>Council of Heads of Australian Collections of Microorganisms</p>
                    <img src="${resource(absolute:"true", dir:"data/network/",file:"chacm.png")}"/>
                  </g:if>
                </div>
              </g:if>

              <!-- attribution -->
              <g:set var='attribs' value='${instance.getAttributionList()}'/>
              <g:if test="${attribs.size() > 0}">
                <div class="section" id="infoSourceList">
                  <h4>Contributors to this page<cl:change id="attributions"/></h4>
                  <ul>
                    <g:each var="a" in="${attribs}">
                      <g:if test="${a.url}">
                        <li><cl:wrappedLink href="${a.url}">${a.name}</cl:wrappedLink></li>
                      </g:if>
                      <g:else>
                        <li>${a.name}</li>
                      </g:else>
                    </g:each>
                  </ul>
                </div>
              </g:if>
            </div>
          </div>
          </div><!--overview-->
        </div>
        <!-- dialog elements -->
        <div id="name-dialog">
            <p class="dialog-hints">The collection name should be the official name of the collection in the local
            language. Do not include the acronym or any unnecessary punctutaion.</p>
            <p class="validateTips"> </p>
            <input type="text" style="width:450px;" name="name" id="nameInput" value="${instance.name}" maxlength="100"/>
        </div>
        <div id="acronym-dialog">
            <p class="dialog-hints">Acronym, coden or initialism by which this collection is generally known. Do not include parentheses.</p>
            <p class="validateTips"> </p>
            <input type="text" style="width:350px;" name="acronym" id="acronymInput" value="${instance.acronym}" maxlength="45"/>
        </div>
        <div id="lsid-dialog">
            <p class="dialog-hints">Enter a valid lsid for the collection if one has been assigned.</p>
            <p class="validateTips"> </p>
            <input type="text" style="width:350px;" name="lsid" id="lsidInput" value="${instance.guid}" maxlength="45"/>
        </div>
        <div id="description-dialog">
            <p class="dialog-hints">This description is the main block of text that appears at the top of the page.</p>
            <p class="validateTips"> </p>
            <textarea name="description" id="descriptionInput" rows="20" cols="90" class="tinymce"> </textarea>
        </div>
        <div id="temporalSpan-dialog">
            <p class="dialog-hints">Start and end dates refer to when the collection was first established and when
            acquisition ceased. Both are optional but if present should be valid
            <a href="http://code.google.com/p/darwincore/wiki/Event" target="_blank" class="external">Darwin Core event dates</a>.</p>
            <p class="validateTips"> </p>
            <label for="startDateInput">Start date:</label>
            <input type="text" style="width:350px;" name="startDate" id="startDateInput" value="${instance.startDate}" maxlength="45"/>
            <label for="endDateInput">End date:</label>
            <input type="text" style="width:350px;" name="endDate" id="endDateInput" value="${instance.endDate}" maxlength="45"/>
        </div>
        <div id="taxonomicRange-dialog">
            <p class="dialog-hints">Describe the main taxonomic focus of the collection, such as 'Fungi of medical importance'.</p>
            <p class="validateTips"> </p>
            <textarea  name="focus" id="focusInput" rows=6 cols="80" >${instance.focus}</textarea>
            <p class="dialog-hints">Indicate which biological kingdoms are covered by your collection.</p>
            <cl:checkBoxList name="kingdomCoverage" from="${Collection.kingdoms}" value="${instance?.kingdomCoverage}" />
            <textarea  name="scientificNames" id="scientificNameInput" rows=6 cols="80" >${instance.scientificNames}</textarea>
        </div>

        <script type="text/javascript">
            originalValues.name = "${instance.name}";
            originalValues.acronym = "${instance.acronym}";
            originalValues.pubDescription = "";
            var baseUrl = "${ConfigurationHolder.config.grails.serverURL}",
                uid = "${instance.uid}",
                username = "<cl:loggedInUsername/>",
                startDate = "${instance.startDate}",
                endDate = "${instance.endDate}";
        </script>
    </body>
</html>
