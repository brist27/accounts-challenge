@isTest
public class TestDataFactory {

    public static List<Account> createAccounts(){
        List<Account> accts = new List<Account>();
        
        Account a = new Account(Name='TestAccount');
        accts.add(a);
        
        return accts;
    }

    public static List<Account> insertAccounts(){
        List<Account> accts = createAccounts();
        insert accts;
        return accts;
    }
    public static List<Contact> createAccountsWithContacts(List<Account> accts) {
        //List<Account> accts = insertAccounts();
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
        //insert contacts;
        return contacts;
    }

    public static List<Contact> insertContacts(){
        List<Account> accList = insertAccounts();
        List<Contact> contacts =  createAccountsWithContacts(accList);
        insert contacts;
        return contacts;

    }

    public static Map<Id,AccountsSelector.AccountInfo> getMap( ){
        
        Map<Id,AccountsSelector.AccountInfo> accMap = new Map<Id,AccountsSelector.AccountInfo>();
        for(AggregateResult result: [SELECT AccountId , COUNT(Id) contactsTotal,  MIN(Birthdate) oldestContact, MAX(Birthdate) youngestContact from Contact  group by Accountid] ){
           
            accMap.put((Id) result.get('AccountId'), new AccountsSelector.AccountInfo(result));
        }
        
        return accMap;

    }

    public static List<Contact> contactUpdated(){
        List<Contact> contactsList = insertContacts();
        
        List<Contact> contacts = new List<Contact>();
        for(Contact c: contactsList ){
            contacts.add(c);
        }
        contacts[0].Birthdate = Date.valueOf('1974-09-07');
        return contacts;
    }

    public static List<Contact> contactToDelete(){
        
        List<Contact> contactsList = insertContacts();
        List<Contact> contacts = new List<Contact>();
        List<Contact> contactsToDelete = new List<Contact>();

        for(Contact c: contactsList ){
            contacts.add(c);
        }
        contactsToDelete.add(contacts[0]);
        return contactsToDelete;
    }



    public static  set<Id> acctids(){
        List<Account> accountList = insertAccounts(); 
        Set<Id> accountsId = new Set<Id>();
        for(Account a: accountList)
        {
            accountsId.add(a.Id);
        }
        return accountsId;
    }

    /*public static List<AccountsSelector.AccountInfo> returnAcc(){
        List<AccountsSelector.AccountInfo> accs = new List<AccountsSelector.AccountInfo>();
        List<ContactInfo> contacts = new List<ContactInfo>();

        for(Contact c: createAccountsWithContacts()){
            contacts.add(new ContactInfo(c));
        }
        
        for(Account a: createAccounts(1)){
            accs.add(new AccountsSelector.AccountInfo(a, contacts));
        }
        return accs;
    }*/

    /*public static List<Account> returnAccountListWithDescription(){
        List<Account> accs = new List<Account>();
        for(Account a: createAccounts(1)){
            a.Description = 'There are 3 contacts related.\n The oldest Contact has 47 years.\n The youngest Contact has 24 years.';
            accs.add(a);
        }
        return accs;
    }*/

    public static List<Account> accountsBeforeInsert(){
        List<Account> accList = createAccounts();

        for(Account a: accList){
            a.Description = 'There are 3 contacts related.\n';
            accList.add(a);
        }
        return accList;
    }
}