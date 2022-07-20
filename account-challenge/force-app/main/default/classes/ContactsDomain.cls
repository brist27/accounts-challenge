public with sharing class ContactsDomain {

    public  Set<Id> getAccountIds(Map<Id,Contact> contacts){ 
        Set<Id> ids = new Set<Id>();
        for(Contact c: contacts.values())
        {
            if(c.AccountId != null)
            {
                ids.add(c.accountId);
            }
        }
        return ids;
    }
}
