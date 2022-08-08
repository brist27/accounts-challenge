public with sharing class AccountsDomain {

    public AccountsSelector accountsSelector = new AccountsSelector();

    public List<Account> updateDescriptionField(Set<Id> ids){

        List<AccountsSelector.AccountInfo>   accountsWithContacts = accountsSelector.getAccountsWithContacts(ids);

        List<ContactInfo> contactsWithBirthdate = new List<ContactInfo>();
          List<Account> updatedRecords = new List<Account>();
          
  
          string description;
          
          for(AccountsSelector.AccountInfo acc: accountsWithContacts )
        {
          
            for(ContactInfo c:acc.ContactsRelated )
            {
                if(c.ContactBirthdate != null){
                    contactsWithBirthdate.add(c);
                } 
                description = 'There are '+ acc.ContactsTotal +' contacts related.\n';
                integer youngestYear;
                integer oldestYear;  
                
                if(contactsWithBirthdate.size() > 0) 
                {
                    Date oldBirthdate = Date.valueof(contactsWithBirthdate[0].ContactBirthdate);
                    oldestYear = Date.today().year() - oldBirthdate.year();
                    description = description + 'The oldest Contact has ' + oldestYear + ' years. \n';

                    if(contactsWithBirthdate.size() > 1){
                        Date youngBirthdate = Date.valueof(contactsWithBirthdate[contactsWithBirthdate.size()-1].ContactBirthdate);
                        youngestYear = Date.today().year() - youngBirthdate.year();
                        description = description +  'The youngest Contact has '+ youngestYear + ' years.';
                    }
                }
            } 
        
        Account a = new Account(Id = acc.AccountId, Name = acc.AccountName,Description = description);
        updatedRecords.add(a);
           
        }
          return updatedRecords;
      }
}
