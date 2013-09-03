<%@ page import="au.org.ala.collectory.CollectoryTagLib" %>
<div class="section">
    <g:set var="facet" value="${new CollectoryTagLib().getFacetForEntity(instance)}"/>
    <h3>Data access</h3>
    <div class="btn-group-vertical">
        <a href="${grailsApplication.config.biocache.baseURL}occurrences/search?q=${facet}:${instance.uid}" class="btn"><i class=""></i> View records</a>
        <a href="${grailsApplication.config.biocacheServicesUrl}/occurrences/download?q=${facet}:${instance.uid}" class="btn"><i class="icon icon-download"></i> Download records</a>
        <cl:createNewRecordsAlertsLink query="${facet}:${instance.uid}" displayName="${instance.name}"
            linkText="New data alert" altText="Create an email alert for new records for ${instance.name}"/>
        <cl:createNewAnnotationsAlertsLink query="${facet}:${instance.uid}" displayName="${instance.name}"
            linkText="Annotations alert" altText="Create an email alert for new annotations for ${instance.name}"/>
    </div>
</div>