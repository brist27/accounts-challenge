@isTest
public  class ContactTriggerHandlerTest {
    @isTest
    public static void contactsList_Test()
    {
        List<Contact> contacts = TestDataFactory.createAccountsWithContacts(1);
        Test.startTest();
        List<Database.SaveResult> result = Database.insert(contacts, false);
        Test.stopTest();

        for (Database.SaveResult sr : result) {
            System.assert(sr.isSuccess());
        }
    }
}