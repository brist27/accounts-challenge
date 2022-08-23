@IsTest
public with sharing class AccountsService_Test {
    
    @IsTest
    public static void updateAccounts_Test(){

        Stub stub = new Stub(AccountsSelector.class);

        List<Account> accList = TestDataFactory.insertAccounts();
        List<Contact> contacts = TestDataFactory.createAccountsWithContacts(accList);
        insert contacts;

        stub.setReturnValue('selectByIds', accList);
        stub.setReturnValue('getAccountsInfo', TestDataFactory.getMap());

        AccountsService accountsService = new AccountsService();
	    accountsService.accountsSelector = (AccountsSelector) stub.instance;
        
        Test.startTest();
        accountsService.updateAccounts(TestDataFactory.acctids());

        Test.stopTest();

        stub.assertInvoked('selectByIds');
        stub.assertInvoked('getAccountsInfo');
    }
}
