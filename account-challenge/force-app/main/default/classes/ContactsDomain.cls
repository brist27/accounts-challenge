public with sharing class ContactsDomain {
    
    private List<Contact> contacts;

    public ContactsDomain(List<Contact> contacts) {
        this.contacts = contacts;
    }

    public  Set<Id> getAccountsIds(){
        Set<Id> accounts = new Set<Id>();
        for(Contact c: contacts){
            if(c.accountid != null){
                accounts.add(c.accountid);
            }
        }

        return accounts;
    }
    
}
