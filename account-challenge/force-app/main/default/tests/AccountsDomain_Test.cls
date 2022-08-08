@IsTest
public with sharing class AccountsDomain_Test {

    @IsTest
    public static void updateDescriptionField_Test()
    {
       
        Stub stub = new Stub(AccountsSelector.class);

        stub.setReturnValue('getAccountsWithContacts', TestDataFactory.returnAcc());

        AccountsDomain accountsDomain = new AccountsDomain();
	    accountsDomain.accountsSelector = (AccountsSelector) stub.instance;

        Test.startTest();
        accountsDomain.updateDescriptionField(TestDataFactory.acctids());
        Test.stopTest();

        stub.assertInvoked('getAccountsWithContacts');
    }


}
