public with sharing class ContactsService {

    public AccountsService accountsService = new AccountsService();

    public void updateDescriptionFieldToRelatedAccount(List<Contact> contactsList){
        
        Set<Id> accountsIds = new ContactsDomain(contactsList).getAccountsIds();
        accountsService.updateAccounts(accountsIds);
    
    }
}
