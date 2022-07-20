public with sharing class ContactsService {

    public ContactsDomain contactsDomain = new ContactsDomain();
    public AccountsService accountsService = new AccountsService();

    public  void validationMethod(Map<Id,Contact> contacts)
    {
        
        Set<Id> ids =  contactsDomain.getAccountIds(contacts);
        if(ids.size() > 0){
            updateDescriptionFieldToRelatedAccount(ids);
        }

    }
    
    public void updateDescriptionFieldToRelatedAccount(Set<Id> ids){
        accountsService.updateAccountRecords(ids);
    
    }
}
