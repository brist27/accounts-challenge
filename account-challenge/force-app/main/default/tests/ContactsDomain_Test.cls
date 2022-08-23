@IsTest
public with sharing class ContactsDomain_Test {
    @IsTest
    public static void getAccountsIds_Test(){

        Test.startTest();
        List<Contact> contactsList = TestDataFactory.insertContacts();
        Set<Id> ids = new ContactsDomain(contactsList).getAccountsIds();
        Test.stopTest();

        System.assert(ids.size() > 0);
        
    }
}
