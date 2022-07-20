@IsTest
public with sharing class AccountsService_Test {
    
    @IsTest
    public static void updateAccountRecords_Test(){

        Stub stub = new Stub(AccountsDomain.class);

        stub.setReturnValue('updateDescriptionField', TestDataFactory.returnAccWithContacts());

        AccountsService accountsService = new AccountsService();
	    accountsService.accountsDomain = (AccountsDomain) stub.instance;
        
        Test.startTest();
        accountsService.updateAccountRecords(TestDataFactory.acctids());
        Test.stopTest();

        stub.assertInvoked('updateDescriptionField');
    }
}
