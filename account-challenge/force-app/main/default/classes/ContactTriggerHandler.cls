public with sharing class ContactTriggerHandler {

    public static void contactsList(List<Contact> contacts){
        system.debug(contacts);
        Set<Id> accountsId = new Set<Id>();
        for(Contact c: contacts)
        {
            accountsId.add(c.accountId);
        }
        
        AccountTriggerHandler.updateDescriptionAccount(accountsId);
    }



    public static integer oldestContact(Id accId){
        AggregateResult[] groupedResults = [SELECT MIN(Birthdate)minBirth FROM Contact WHERE accountId =: accId];
        Date minBirthdate = Date.valueof(groupedResults[0].get('minBirth'));
        integer years = Date.today().year() - minBirthdate.year();
        return years;
    }

    public static integer youngestContact(Id accId){
        AggregateResult[] groupedResults = [SELECT MAX(Birthdate)maxBirth FROM Contact WHERE accountId =: accId];
        System.debug(groupedResults);
        Date maxBirthdate = Date.valueof(groupedResults[0].get('maxBirth'));
        integer years = Date.today().year() - maxBirthdate.year();
        return years;
    }

}
