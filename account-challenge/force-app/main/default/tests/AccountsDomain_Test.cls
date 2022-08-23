@IsTest
public with sharing class AccountsDomain_Test {
    @IsTest
    public static void setDescriptionNoContactsRelated_Test(){

            Test.startTest();
            String[] description = new String[]{};
            AccountsDomain accsBeforeInsert = new AccountsDomain(TestDataFactory.createAccounts()).setDescription();
            
            for(Account a: (List<Account>) accsBeforeInsert.accounts){
                
                description.add(a.Description);
                
            }

            

            Test.stopTest();
            system.assertEquals('There are not contacts related.', description[0]);
    }

    @IsTest
    public static void setDescriptionWithContactsRelated_Test(){
        Test.startTest();
        String[] description = new String[]{};
        List<Account> accsList = TestDataFactory.insertAccounts();
        List<Contact> contacts = TestDataFactory.createAccountsWithContacts(accsList);
        insert contacts;
        Map<Id,AccountsSelector.AccountInfo> accMap = TestDataFactory.getMap();

        
        AccountsDomain accs = new AccountsDomain(accsList).setDescription(accMap);
        
        for(Account a: (List<Account>) accs.accounts){
                
            description.add(a.Description);
            
        }

        
        Test.stopTest();

        system.assertEquals('There are 3 contacts related.\nThe oldest Contact has 47 years.\nThe youngest Contact has 24 years.', description[0] );
    }
}
