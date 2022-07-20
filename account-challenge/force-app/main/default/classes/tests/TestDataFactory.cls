@isTest
public class TestDataFactory {

    public static List<Account> createAccounts(Integer numAccts){
        List<Account> accts = new List<Account>();
        for(Integer i=0;i<numAccts;i++) {
            Account a = new Account(Name='TestAccount' + i);
            accts.add(a);
        }
        insert accts;
        //System.debug(accts);
        return accts;
    }
    public static List<Contact> createAccountsWithContacts() {
        List<Account> accts = createAccounts(1);
        List<Contact> contacts = new List<Contact>();
        for (Integer j=0;j<1;j++) {
            Account acct = accts[j];
            contacts.add(new Contact(FirstName='Contact ', Lastname= '1',
                                       AccountId=acct.Id,
                                       Birthdate=Date.valueOf('1975-09-07')));
            contacts.add(new Contact(Firstname='Contact ', Lastname='2',
                                       AccountId=acct.Id,
                                       Birthdate= Date.valueOf('1998-01-27')));
            contacts.add(new Contact(Firstname='Contact ', Lastname='3',
                                       AccountId=acct.Id));
        }
        return contacts;
    }

    public static Map<Id,Contact> insertContacts(){
        List<Contact> contacts = createAccountsWithContacts();
        insert contacts;
        Map<Id,Contact> contactMap = new Map<Id,Contact>(contacts);

        return contactMap;
    }

    public static List<Contact> contactUpdated(){
        Map<Id,Contact> mapContacts = insertContacts();
        List<Contact> contacts = new List<Contact>();
        for(Contact c:  mapContacts.values()){
            contacts.add(c);
        }
        contacts[0].Birthdate = Date.valueOf('1974-09-07');
        return contacts;
    }

    public static List<Contact> contactToDelete(){
        Map<Id,Contact> mapContacts = insertContacts();
        List<Contact> contacts = new List<Contact>();
        List<Contact> contactsToDelete = new List<Contact>();

        for(Contact c:  mapContacts.values()){
            contacts.add(c);
        }
        contactsToDelete.add(contacts[0]);
        return contactsToDelete;
    }



    public static  set<Id> acctids(){
        Map<Id,Contact> contacts = insertContacts(); 
        Set<Id> accountsId = new Set<Id>();
        for(Contact c: contacts.values())
        {
            accountsId.add(c.accountId);
        }
        return accountsId;
    }

    public static List<Account> returnAcc(){
        List<Account> accs = new List<Account>();
        for(Account a: createAccounts(1)){
            accs.add(a);
        }
        return accs;
    }

    public static List<Account> returnAccWithContacts(){
        List<Account> accs = new List<Account>();
        for(Account a: createAccounts(1)){
            a.Description = 'There are 3 contacts related.\n The oldest Contact has 47 years.\n The youngest Contact has 24 years.';
            accs.add(a);
        }
        return accs;
    }
}