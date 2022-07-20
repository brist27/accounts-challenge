@IsTest
public with sharing class AccountsSelector_Test {

    @IsTest
    public static void getAccountsWithContacts_Test(){

        AccountsSelector accountsSelector = new AccountsSelector();

        Test.startTest();
        List<Account> accountList = accountsSelector.getAccountsWithContacts(TestDataFactory.acctids());
        Test.stopTest();

        System.assert(accountList.size() > 0 );
    }
}
