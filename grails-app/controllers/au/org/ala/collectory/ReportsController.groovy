package au.org.ala.collectory

import org.codehaus.groovy.grails.commons.ConfigurationHolder
import grails.converters.JSON
import org.codehaus.groovy.grails.plugins.orm.auditable.AuditLogEvent

class ReportsController {

    def index = {
        redirect action: list, params: params
    }

    def list = {
        render(view: "index")
    }

    def contactsForCouncilMembers = {
        def chafc = []
        Collection.findAllByNetworkMembershipIlike("%CHAFC%",[sort:'name']).each {
            def pc = it.getPrimaryContact()
            chafc << [id: it.uid, name: it.name, email: pc?.contact?.email, contact: pc?.contact?.buildName()]
        }
        def chaec = []
        Collection.findAllByNetworkMembershipIlike("%CHAEC%",[sort:'name']).each {
            def pc = it.getPrimaryContact()
            chaec << [id: it.uid, name: it.name, email: pc?.contact?.email, contact: pc?.contact?.buildName()]
        }
        def chacm = []
        Collection.findAllByNetworkMembershipIlike("%CHACM%",[sort:'name']).each {
            def pc = it.getPrimaryContact()
            chacm << [id: it.uid, name: it.name, email: pc?.contact?.email, contact: pc?.contact?.buildName()]
        }
        [chafc: chafc, chaec: chaec, chacm: chacm]
    }
    
    def data = {
        ActivityLog.log username(), isAdmin(), Action.REPORT, 'data'
        [reports: new ReportCommand('data')]
    }

    def activity = {
        //ActivityLog.log username(), isAdmin(), Action.REPORT, 'activity'
        [reports: new ReportCommand('activity')]
    }

    def membership = {
        ActivityLog.log username(), isAdmin(), Action.REPORT, 'membership'
        [reports: new ReportCommand('membership')]
    }

    def collections = {
        ActivityLog.log username(), isAdmin(), Action.REPORT, 'collections'
        [reports: new ReportCommand('collections')]
    }

    def institutions = {
        ActivityLog.log username(), isAdmin(), Action.REPORT, 'institutions'
    }

    def providers = {
        ActivityLog.log username(), isAdmin(), Action.REPORT, 'providers'
    }

    def contacts = {
        ActivityLog.log username(), isAdmin(), Action.REPORT, 'contacts'
    }

    def codes = {
        [codeSummaries: (ProviderMap.list().collect { it.collection.buildSummary() }).sort {it.name}]
    }

    def changes = {
        [changes: AuditLogEvent.list([sort:'lastUpdated',order:'desc',max:100])]
    }

    def classification = {
        ActivityLog.log username(), isAdmin(), Action.REPORT, 'classifications'
        [collections: Collection.list([sort:'name'])]
    }

    def attributions = {
        def collAttributions = []
        Collection.list([sort: 'name']).each {
            ProviderGroupSummary pgs = it.buildSummary()
            List<Attribution> attribs = it.getAttributionList()
            def ats = new Attributions(pgs, attribs)
            collAttributions << ats
        }
        def instAttributions = Institution.list([sort: 'name']).collect {
            ProviderGroupSummary pgs = it.buildSummary()
            List<Attribution> attribs = it.getAttributionList()
            new Attributions(pgs, attribs)
        }
        [collAttributions: collAttributions, instAttributions: instAttributions]
    }

    def missingRecords = {
        def mrs = []
        Collection.list([sort: 'name']).each {
            if (it.numRecordsDigitised > 0) {
                // find the number of biocache records
                def baseUrl = ConfigurationHolder.config.biocache.baseURL
                def url = baseUrl + "occurrences/searchForUID.JSON?pageSize=0&q=" + it.generatePermalink()

                def count = 0
                def conn = new URL(url).openConnection()
                conn.setConnectTimeout 3000
                try {
                    def json = conn.content.text
                    count = JSON.parse(json)?.searchResult?.totalRecords
                } catch (Exception e) {
                    log.error "Failed to lookup record count. ${e.getClass()} ${e.getMessage()} URL= ${url}."
                }
                // compare to num digistised
                if (count == 0 || count / it.numRecordsDigitised < 0.7) {
                    mrs << [collection:it.buildSummary(), biocacheCount: count, claimed: it.numRecordsDigitised]
                }
            }
        }
        [mrs: mrs]
    }
    
    class ReportCommand {
        int totalCollections
        int totalInstitutions
        int totalDataProviders
        int totalDataResources
        int totalDataHubs
        int totalContacts
        int totalLogons

        def collectionsWithType
        def collectionsWithFocus
        def collectionsWithKeywords
        def collectionsWithProviderCodes
        def collectionsWithGeoDescription
        def collectionsWithNumRecords
        def collectionsWithNumRecordsDigitised
        def collectionsWithDescriptions

        def collectionsWithoutContacts
        def collectionsWithoutEmailContacts
        def institutionsWithoutContacts
        def institutionsWithoutEmailContacts

        def collectionsWithInfosource

        def totalLogins
        def uniqueLogins
        def uniqueLoginList
        def supplierLogins
        def uniqueSupplierLogins
        def curatorViews
        def curatorPreviews
        def curatorEdits
        def adminViews
        def adminPreviews
        def adminEdits
        def lastLogin
        def latestActivity

        def partners
        def chahMembers
        def chaecMembers
        def chafcMembers
        def amrrnMembers
        def camdMembers

        def execQueryCollection = { query ->
            def answer = Collection.executeQuery(query)
            if (answer) {
                return answer[0]
            } else {
                return null
            }
        }

        def execQueryInstitution = { query ->
            def answer = Institution.executeQuery(query)
            if (answer) {
                return answer[0]
            } else {
                return null
            }
        }

        def countNotNull = { field ->
            def query = "select count(*) from Collection as pg where "
            if (field instanceof List) {
                field.eachWithIndex { it, i ->
                    if (i > 0) {query += " and "}
                    query += "pg.${it} <> NULL"
                }
            } else {
                query += "pg.${field} <> NULL"
            }
            def answer = execQueryCollection(query)
            if (!answer) answer = 0
            return answer
        }

        def countNotUnknown = { field ->
            def query = "select count(*) from Collection as pg where pg.${field} <> -1"
            def answer = execQueryCollection(query)
            if (!answer) answer = 0
            return answer
        }

        ReportCommand(String set) {
            switch (set) {
                case 'data':
                totalCollections = Collection.count()
                totalInstitutions = Institution.count()
                totalDataProviders = DataProvider.count()
                totalDataResources = DataResource.count()
                totalDataHubs = DataHub.count()
                totalContacts = Contact.count()

                /* sql: select count(*) from collectory.provider_group
                    where not exists (select * from collectory.contact_for
                    where contact_for.entity_id = provider_group.id)
                    and provider_group.group_type = 'Collection';*/
                collectionsWithoutContacts = execQueryCollection("select count(*) from Collection as pg \
                    where not exists (select id from ContactFor as cf \
                    where cf.entityUid = pg.uid)")

                institutionsWithoutContacts = execQueryInstitution("select count(*) from Institution as pg \
                    where not exists (select id from ContactFor as cf \
                    where cf.entityUid = pg.uid)")

                collectionsWithoutEmailContacts = execQueryCollection("select count(*) from Collection as pg \
                    where not exists (select id from ContactFor as cf \
                    where cf.entityUid = pg.uid \
                    and cf.contact.email <> '')")

                institutionsWithoutEmailContacts = execQueryInstitution("select count(*) from Institution as pg \
                    where not exists (select id from ContactFor as cf \
                    where cf.entityUid = pg.uid \
                    and cf.contact.email <> '')")

                collectionsWithType = countNotNull("collectionType")
                collectionsWithFocus = countNotNull("focus")
                collectionsWithKeywords = countNotNull("keywords")
                collectionsWithProviderCodes = ProviderMap.count()
                collectionsWithGeoDescription = countNotNull("geographicDescription")
                collectionsWithNumRecords = countNotUnknown("numRecords")
                collectionsWithNumRecordsDigitised = countNotUnknown("numRecordsDigitised")
                collectionsWithDescriptions = countNotNull(["pubDescription", "techDescription"])
                break

                case 'activity':
                curatorViews = ActivityLog.executeQuery("select count(*) from ActivityLog where action='${Action.VIEW.toString()}'" +
                        " and administratorForEntity = 1 and not admin = 1")[0]
                curatorPreviews = ActivityLog.executeQuery("select count(*) from ActivityLog where action='${Action.PREVIEW.toString()}'" +
                        " and administratorForEntity = 1 and not admin = 1")[0]
                curatorEdits = ActivityLog.executeQuery("select count(*) from ActivityLog where action='${Action.EDIT_SAVE.toString()}'" +
                        " and administratorForEntity = 1 and not admin = 1")[0]
                adminViews = ActivityLog.executeQuery("select count(*) from ActivityLog where action='${Action.VIEW.toString()}'" +
                        " and administratorForEntity = 1 and admin = 1")[0]
                adminPreviews = ActivityLog.executeQuery("select count(*) from ActivityLog where action='${Action.PREVIEW.toString()}'" +
                        " and administratorForEntity = 1 and admin = 1")[0]
                adminEdits = ActivityLog.executeQuery("select count(*) from ActivityLog where action='${Action.EDIT_SAVE.toString()}'" +
                        " and administratorForEntity = 1 and admin = 1")[0]
                latestActivity = ActivityLog.list([sort: 'timestamp', order:'desc', max:10])
                break
                
                case 'membership':
                partners = Institution.findAllByIsALAPartner(true)

                chahMembers = Collection.findAllByNetworkMembershipIlike("%CHAH%",[sort:'name']) +
                        Institution.findAllByNetworkMembershipIlike("%CHAH%",[sort:'name'])
                chaecMembers = Collection.findAllByNetworkMembershipIlike("%CHAEC%",[sort:'name']) +
                        Institution.findAllByNetworkMembershipIlike("%CHAEC%",[sort:'name'])
                chafcMembers = Collection.findAllByNetworkMembershipIlike("%CHAFC%",[sort:'name']) +
                        Institution.findAllByNetworkMembershipIlike("%CHAFC%",[sort:'name'])
                amrrnMembers = Collection.findAllByNetworkMembershipIlike("%CHACM%",[sort:'name']) +
                        Institution.findAllByNetworkMembershipIlike("%CHACM%",[sort:'name'])
                camdMembers = Collection.findAllByNetworkMembershipIlike("%CAMD%",[sort:'name']) +
                        Institution.findAllByNetworkMembershipIlike("%CAMD%",[sort:'name'])
                break

            }
        }
    }

    class Attributions {
        ProviderGroupSummary pgs
        List<Attribution> attribs

        Attributions(ProviderGroupSummary pgs, List<Attribution> attribs) {
            this.pgs = pgs
            this.attribs = attribs
        }
    }

    private String username() {
        return (request.getUserPrincipal()?.attributes?.email)?:'not available'
    }

    private boolean isAdmin() {
        return (request.isUserInRole(ProviderGroup.ROLE_ADMIN))
    }
}
