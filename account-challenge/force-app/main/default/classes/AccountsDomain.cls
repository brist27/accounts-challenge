public with sharing class AccountsDomain {

    public AccountsSelector accountsSelector = new AccountsSelector();

    /*public Set<Id> getIds(Map<Id,Account> accountsIds)
    {
        Set<Id> ids = new Set<Id>();
        for(Account a : accountsIds.values()){
            ids.add(a.Id);
        }
        return ids;
    }*/

    public List<Account> updateDescriptionField(Set<Id> ids){

      List<Account>   accountsWithContacts = accountsSelector.getAccountsWithContacts(ids);
       
      List<Contact> contactsWithBirthdate = new List<Contact>();
        List<Account> updatedRecords = new List<Account>();
        String[] fields = new String[]{'Birthdate','Id','AccountId'};

        string description;
        
        for(Account acc: accountsWithContacts )
        {
          
            for(Contact c:acc.Contacts )
            {
                Map<String, Object> acctMap = c.getPopulatedFieldsAsMap();
                for (String field : fields){
                    if (!acctMap.containsKey(field)){
                        c.put(field,null);
                    }
                }  

                if(c.Birthdate != null){
                    contactsWithBirthdate.add(c);
                } 
                description = 'There are '+ acc.Contacts.size() +' contacts related.\n';
                integer youngestYear;
                integer oldestYear;  
                
                if(contactsWithBirthdate.size() > 0) 
                {
                    Date oldBirthdate = Date.valueof(contactsWithBirthdate[0].Birthdate);
                    oldestYear = Date.today().year() - oldBirthdate.year();
                    description = description + 'The oldest Contact has ' + oldestYear + ' years. \n';

                    if(contactsWithBirthdate.size() > 1){
                        Date youngBirthdate = Date.valueof(contactsWithBirthdate[contactsWithBirthdate.size()-1].Birthdate);
                        youngestYear = Date.today().year() - youngBirthdate.year();
                        description = description +  'The youngest Contact has '+ youngestYear + ' years.';
                    }
                }
            } 
           
        acc.Description = description;
        updatedRecords.add(acc);
           
        }
        return updatedRecords;
    }
}
