public with sharing class ContactTriggerHandler extends TriggerHandler {

    

    public ContactsService contactService = new ContactsService();

    private Map<Id, Contact> newContactMap;
    private Map<Id, Contact> oldContactMap;

    public ContactTriggerHandler() {
        this.newContactMap = (Map<Id, Contact>) Trigger.newMap;
        this.oldContactMap = (Map<Id, Contact>) Trigger.oldMap;
    }

    public override void afterInsert(){
        contactsList(this.newContactMap);
    }
    

    
    public override void afterUpdate(){
        contactsList(this.newContactMap);

    }

    public override void afterDelete(){
        contactsList(this.oldContactMap);
    }

    public void contactsList(Map<Id,Contact> contacts){

        contactService.validationMethod(contacts);
    }
}