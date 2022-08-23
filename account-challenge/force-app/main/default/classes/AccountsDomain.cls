public with sharing class AccountsDomain {

    public List<Account> accounts;
    

    public AccountsDomain(List<Account> accounts) {
        this.accounts = accounts;
    }

    public AccountsDomain setDescription(){
        for(Account a :accounts ){
            a.Description = 'There are not contacts related.';
         }
         return this;
    }

    public AccountsDomain setDescription(Map<Id,AccountsSelector.AccountInfo> accountsMap){

        string description;
        
        for(Account a: accounts){

            AccountsSelector.AccountInfo acc = accountsMap.get(a.Id);
            
            description = 'There are '+ acc.contactsTotal +' contacts related.\n';

            if(acc.oldestContact != null && acc.youngestContact != null){
                description = description + 'The oldest Contact has ' + (Date.today().year() - acc.oldestContact.year()) + ' years.\n';
                description = description +  'The youngest Contact has '+ (Date.today().year() - acc.youngestContact.year()) + ' years.';
            }
            
        a.Description = description;
        }
        return this;
    }
    
}
