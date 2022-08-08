public  class AccountsSelector{
    public List<AccountInfo> wrapAccountList {get; set;}
    public List<ContactInfo> wrapContactList {get;set;}

    public List<AccountInfo> getAccountsWithContacts(Set<Id> ids){
        wrapAccountList = new List<AccountInfo>();
        wrapContactList = new List<ContactInfo>();

        for(Account account :[SELECT Id, Name,Description, (SELECT Id, Birthdate from Contacts ORDER BY Birthdate ASC) from Account WHERE Id In :ids]){
            
            for(Contact contact: account.Contacts){
                wrapContactList.add(new ContactInfo(contact));
            }
            wrapAccountList.add(new AccountInfo(account,wrapContactList));
        }
        
    return wrapAccountList;
    }

    public class AccountInfo {
        public Id AccountId {get;set;}
        public String AccountName {get;set;}
        public String AccountDescription {get;set;}
        public Integer ContactsTotal {get;set;}
        public List<ContactInfo> ContactsRelated {get;set;}

        public AccountInfo(Account account, List<ContactInfo> contacts) {
            AccountId = account.Id;
            AccountName = account.Name;
            AccountDescription = account.Description;
            ContactsTotal = account.Contacts.size();
            ContactsRelated = contacts;
        }		
    }
    
}
