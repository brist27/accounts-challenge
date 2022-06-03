@isTest
public class TestDataFactory {
    public static List<Contact> createAccountsWithContacts(Integer numAccts) {
        List<Account> accts = new List<Account>();
        for(Integer i=0;i<numAccts;i++) {
            Account a = new Account(Name='TestAccount' + i);
            accts.add(a);
        }
        insert accts;

        List<Contact> contacts = new List<Contact>();
        for (Integer j=0;j<numAccts;j++) {
            Account acct = accts[j];
            contacts.add(new Contact(FirstName='Contact ', Lastname= '1',
                                       AccountId=acct.Id,
                                       Birthdate=Date.valueOf('1975-09-07')));
            contacts.add(new Contact(Firstname='Contact ', Lastname='2',
                                       AccountId=acct.Id,
                                       Birthdate= Date.valueOf('1998-01-27')));
        }
        return contacts;
    }

    public static set<Id> acctids(){
        List<Contact> contacts = TestDataFactory.createAccountsWithContacts(1); 
        insert contacts;
        Set<Id> accountsId = new Set<Id>();
        for(Contact c: contacts)
        {
            accountsId.add(c.accountId);
        }
        return accountsId;

    }
}