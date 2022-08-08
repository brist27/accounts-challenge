@IsTest
public with sharing class ContactTriggerHandler_Test {
    
    @IsTest
    public static void afterInsert_Test()
    {
        List<Contact> contactsList = TestDataFactory.createAccountsWithContacts();
        Test.startTest();
        insert contactsList;
        Test.stopTest();
    }

    @IsTest 
    public static void afterUpdate_Test()
    {
        List<Contact> contacts = TestDataFactory.contactUpdated();
        Test.startTest();
        update contacts;
        Test.stopTest();
    }

    @IsTest
    public static void afterDelete_Test(){
        List<Contact> contacts = TestDataFactory.contactToDelete();
        Test.startTest();
        delete contacts;
        Test.stopTest();
    }
    
    
    @IsTest
    public static void contactsList_Test(){
        Stub stub = new Stub(ContactsService.class);

        stub.setReturnValue('validationMethod', null);

        ContactTriggerHandler contactTrigger = new ContactTriggerHandler();
	    contactTrigger.contactService = (ContactsService) stub.instance;

        Test.startTest();
        contactTrigger.contactsList(TestDataFactory.insertContacts());
        Test.stopTest();

        stub.assertInvoked('validationMethod');
    }


}
