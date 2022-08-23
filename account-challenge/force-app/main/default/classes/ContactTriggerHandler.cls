public with sharing class ContactTriggerHandler extends TriggerHandler {

    

    public ContactsService contactService = new ContactsService();

    private List<Contact> newContact;
    private List<Contact> oldContact;

    public ContactTriggerHandler() {
        this.newContact = (List<Contact>) Trigger.new;
        this.oldContact = (List<Contact>) Trigger.old;
    }

    public override void afterInsert(){
        contactsList(this.newContact);
    }
    

    
    public override void afterUpdate(){
        contactsList(this.newContact);

    }

    public override void afterDelete(){
        contactsList(this.oldContact);
    }

    public void contactsList(List<Contact> contacts){

        contactService.updateDescriptionFieldToRelatedAccount(contacts);
    }
}