@isTest
public class AccountTriggerHandlerTest {
    
    @isTest
    public static void  updateDescriptionAccount_Test()
    {
        Test.startTest();
        boolean b = AccountTriggerHandler.updateDescriptionAccount(TestDataFactory.acctids());
        Test.stopTest();

        system.assert(b, true);
    }
}
