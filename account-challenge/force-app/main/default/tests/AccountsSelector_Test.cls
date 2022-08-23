@IsTest
public with sharing class AccountsSelector_Test {
    @IsTest
    public static void selectByIdsAndGetAccountsInfo_Test(){
        Test.startTest();
        AccountsSelector accountSelector = new AccountsSelector();
        Set<Id> accs = TestDataFactory.acctids();
        List<Account> accList = accountSelector.selectByIds(accs);
        
        List<Contact> contacts = TestDataFactory.createAccountsWithContacts(accList);
        insert contacts;
        accountSelector.getAccountsInfo(accs);
        Test.stopTest(); 
        
    }
}
