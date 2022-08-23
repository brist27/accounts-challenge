public with sharing class AccountsService {

    public AccountsSelector accountsSelector = new AccountsSelector();

    public void updateDescriptionBeforeInsertAccount(List<Account> accountsList){
       
        new AccountsDomain(accountsList).setDescription();
    }

    public void updateAccounts(List<Account> accountsList){
       
        Map<Id,AccountsSelector.AccountInfo> accounts = accountsSelector.getAccountsInfo(new Map<Id,Account>(accountsList).keySet());
        
        new AccountsDomain(accountsList).setDescription(accounts);
        
        update accountsList;

    }

    public void updateAccounts(Set<Id> accountsIds){
        updateAccounts(accountsSelector.selectByIds(accountsIds));
    }

}
