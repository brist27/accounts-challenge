@IsTest
public with sharing class AccountTriggerHandler_Test {

    @IsTest
    public static void beforeInsert_Test(){
        
        Stub stub = new Stub(AccountsService.class);

        stub.setReturnValue('updateDescriptionBeforeInsertAccount', null);

        AccountTriggerHandler ath = new AccountTriggerHandler();
	    ath.accountService = (AccountsService) stub.instance;

        Test.startTest();
        ath.beforeInsert();
        Test.stopTest();

        stub.assertInvoked('updateDescriptionBeforeInsertAccount');
    }
}
