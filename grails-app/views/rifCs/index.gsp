<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<registryObjects xmlns="http://ands.org.au/standards/rif-cs/registryObjects"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 xsi:schemaLocation="http://ands.org.au/standards/rif-cs/registryObjects http://services.ands.org.au/documentation/rifcs/schema/registryObjects.xsd">
    <g:each var='provider' in="${providers}">
        <registryObject group="Atlas of Living Australia">
            <key>ala.org.au/${provider.uid}</key>
            <originatingSource>${provider.name}</originatingSource>
            <party type="group">
                <name type="primary">
                    <namePart type="full">${provider.name}</namePart>
                </name>
                <location>
                    <address>
                        <electronic type="url">
                            <value>${provider.websiteUrl}</value>
                        </electronic>
                    </address>
                    <address>
                        <physical type="streetAddress">
                            <addressPart type="locationDescriptor">${provider.name}</addressPart>
                        </physical>
                    </address>
                </location>
            </party>
        </registryObject>
    </g:each>
    <g:each var='resource' in="${resources}">
        <registryObject group="Atlas of Living Australia">
            <key>ala.org.au/${resource.uid}</key>
            <g:if test="${resource.dataProvider}">
            <originatingSource>${resource.dataProvider.name}</originatingSource>
            </g:if>
            <g:else>
            <originatingSource>Atlas of Living Australia</originatingSource>
            </g:else>
            <collection type="dataset">
                <identifier type="local">ala.org.au/${resource.uid}</identifier>
                <name type="primary">
                    <namePart type="full">${resource.name}</namePart>
                </name>
                <location>
                    <address>
                        <electronic>
                            <value>${resource.websiteUrl}</value>
                        </electronic>
                    </address>
                </location>
                <g:if test="${resConnectionParameters[resource.uid]}">
                <relatedInfo type="website">
                    <identifier type="uri">${resConnectionParameters[resource.uid].getAt('url')}</identifier>
                    <title>${resConnectionParameters[resource.uid].getAt('resource')}</title>
                </relatedInfo>
                </g:if>
                <g:if test="${resource.dataProvider}">
                <relatedInfo type="website">
                    <identifier type="uri">${resource.websiteUrl}</identifier>
                    <title>See this Collection on the website of ${resource.dataProvider.name}</title>
                </relatedInfo>
                </g:if>
                <g:else>
                <relatedInfo type="website">
                    <identifier type="uri">http://collections.ala.org.au</identifier>
                    <title>See this Collection on the website of The Atlas of Living Australia</title>
                </relatedInfo>
                </g:else>
                <g:if test="${resource.dataProvider}">
                <relatedObject>
                    <key>ala.org.au/${resource.dataProvider.uid}</key>
                    <relation type="isManagedBy" />
                </relatedObject>
                </g:if>
                <relatedObject>
                    <key>Contributor:Atlas of Living Australia</key>
                    <relation type="hasCollector" />
                </relatedObject>
                <rights>
                    <licence type="${resource.licenseType}" />
                    <rightsStatement><![CDATA[${resource.rights}]]></rightsStatement>
                </rights>
                <description type="brief"><![CDATA[${resource.pubDescription}]]></description>
                <g:if test="${resContentTypes[resource.uid]}">
                <description type="notes">Includes: ${resContentTypes[resource.uid]}</description>
                </g:if>
                <g:if test="${resource.citation}">
                <citationInfo>
                    <fullCitation><![CDATA[${resource.citation}]]></fullCitation>
                </citationInfo>
                </g:if>
                <g:if test="${resBoundingBoxCoords.containsKey(resource.uid)}" >
                    <spatial type="iso19139dcmiBox">northlimit=${resBoundingBoxCoords[resource.uid][3]}; southlimit=${resBoundingBoxCoords[resource.uid][1]}; westlimit=${resBoundingBoxCoords[resource.uid][0]}; eastLimit=${resBoundingBoxCoords[resource.uid][2]}; projection=WGS84</spatial>
                </g:if>
            </collection>
        </registryObject>
    </g:each>
</registryObjects>