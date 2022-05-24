public with sharing class AccountTriggerHandler {


    public static boolean updateDescriptionAccount(Set<Id> accountsId){
        List<Account> accounts = new List<Account>();
        List<Account> ids= [SELECT Id, (SELECT Id from Contacts) from Account WHERE Id In :accountsId];
        
        for(Account acc: ids )
        { 
                acc.Description = 'There are '+ acc.Contacts.size() +' contacts related.\n The oldest Contact has ' + String.valueOf(ContactTriggerHandler.oldestContact(acc.Id)) + ' years. \n The youngest Contact has '+ String.valueOf(ContactTriggerHandler.youngestContact(acc.Id)) + ' years.';
                accounts.add(acc);
        }

        try{
            update accounts;
            return true;
        }catch(DmlException e) {
            return false;
        }
    }

    
}
