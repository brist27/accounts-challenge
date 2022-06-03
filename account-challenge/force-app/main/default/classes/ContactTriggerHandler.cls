public with sharing class ContactTriggerHandler extends TriggerHandler {

    private Map<Id, Contact> newContactMap;
    private Map<Id, Contact> oldContactMap;

    public ContactTriggerHandler() {
        this.newContactMap = (Map<Id, Contact>) Trigger.newMap;
        this.oldContactMap = (Map<Id, Contact>) Trigger.oldMap;
    }

    public override void afterInsert(){
        contactsList(newContactMap);
    }
    

    public override void afterUpdate(){
        contactsList(newContactMap);

    }

    public override void afterDelete(){
        contactsList(oldContactMap);
    }

    public static void contactsList(Map<Id,Contact> contacts){
        
        Set<Id> accountsId = new Set<Id>();
        for(Contact c: contacts.values())
        {
            accountsId.add(c.accountId);
        }
        
        AccountTriggerHandler.updateDescriptionAccount(accountsId);
    }
}