public with sharing class AccountsSelector {

    public   List<Account>  getAccountsWithContacts(Set<Id> ids){
       List<Account> accs =  Database.query('SELECT Id,Name, (SELECT Id,Birthdate from Contacts ORDER BY Birthdate ASC) from Account WHERE Id In :ids');
       return accs;
    }
}
