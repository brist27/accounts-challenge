public with sharing class AccountsService {
  
    public AccountsDomain accountsDomain = new AccountsDomain();

    public void updateDescriptionBeforeInsertAccount(List<Account> accountsList){
       
        for(Account a :accountsList ){
           a.Description = 'There are not contacts related.';
        }
    }
    /*public void updateAccountsRecords(Map<Id,Account> accountsMap){
        Set<Id> ids = accountsDomain.getIds(accountsMap);
        updateAccountRecords(ids);
    }*/

    public void updateAccountRecords(Set<Id> accountsIds){

        List<Account> updatedRecords = accountsDomain.updateDescriptionField(accountsIds);

        
        update updatedRecords;

    }

}
