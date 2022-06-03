public with sharing class AccountTriggerHandler {


    public static boolean updateDescriptionAccount(Set<Id> accountsId){
        List<Account> accounts = new List<Account>();
        List<Account> ids= [SELECT Id, (SELECT Id,Birthdate from Contacts ORDER BY Birthdate ASC) from Account WHERE Id In :accountsId];
        
        for(Account acc: ids )
        { 
                Date oldBirthdate = Date.valueof(acc.Contacts[0].Birthdate);
                integer oldestYear = Date.today().year() - oldBirthdate.year();

                Date youngBirthdate = Date.valueof(acc.Contacts[acc.Contacts.size()-1].Birthdate);
                integer youngestYear = Date.today().year() - youngBirthdate.year();

                acc.Description = 'There are '+ acc.Contacts.size() +' contacts related.\n The oldest Contact has ' + oldestYear + ' years. \n The youngest Contact has '+ youngestYear + ' years.';
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