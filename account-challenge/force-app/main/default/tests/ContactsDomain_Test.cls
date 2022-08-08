@IsTest
public with sharing class ContactsDomain_Test {
    @IsTest
    public static void getAccountIds_Test(){

        Test.startTest();
        ContactsDomain contactsDomain = new ContactsDomain();
        Set<Id> ids = ContactsDomain.getAccountIds(TestDataFactory.insertContacts());
        Test.stopTest();

        System.assert(ids.size() > 0);
        
    }
}
