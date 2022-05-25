public with sharing class ContactTriggerHandler {

    public static void contactsList(List<Contact> contacts){
        
        Set<Id> accountsId = new Set<Id>();
        for(Contact c: contacts)
        {
            accountsId.add(c.accountId);
        }
        
        AccountTriggerHandler.updateDescriptionAccount(accountsId);
    }
}
