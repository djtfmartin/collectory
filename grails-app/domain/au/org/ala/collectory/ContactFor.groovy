package au.org.ala.collectory
/*  Represents a contact in the context of a specific group, eg institution,
 *  collection or dataset.
 *
 *  - based on collectory data model version 5
 */

class ContactFor implements Serializable {

    Contact contact
    long entityId
    String entityType
    String role
    boolean administrator = false

    Date dateCreated = new Date()
    Date dateLastModified = new Date()
    String userLastModified

    ContactFor () {}

    ContactFor (Contact contact, long entityId, String entityType, String role, boolean isAdministrator) {
        this.contact = contact
        this.entityId = entityId
        this.entityType = entityType
        this.role = role
        this.administrator = isAdministrator
        dateCreated()
        dateLastModified()
        userLastModified(maxSize:256)
    }
    
    static mapping = {
        contact index: 'contact_id_idx'
        entityId index: 'entity_id_idx'
    }

    static constraints = {
        contact()
        entityId()
        entityType(blank:false, inList: [ProviderGroup.ENTITY_TYPE, InfoSource.ENTITY_TYPE])
        role(nullable:true, maxSize:128)
    }

    def print() {
        ["Contact id: " + contact.id,
         "Entity id: " + entityId,
         "Entity type: " + entityType,
         "Role: " + role,
         "isAdmin: " + administrator]
    }

}