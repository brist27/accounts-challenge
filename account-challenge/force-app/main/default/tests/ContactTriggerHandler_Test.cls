@IsTest
public with sharing class ContactTriggerHandler_Test {
    
    @IsTest
    public static void afterInsert_Test()
    {
        List<Account> acc = TestDataFactory.insertAccounts();
        List<Contact> contactsList = TestDataFactory.createAccountsWithContacts(acc);
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

        stub.setReturnValue('updateDescriptionFieldToRelatedAccount', null);

        ContactTriggerHandler contactTrigger = new ContactTriggerHandler();
	    contactTrigger.contactService = (ContactsService) stub.instance;

        Test.startTest();
        List<Contact> contactsList =TestDataFactory.insertContacts();
        contactTrigger.contactsList(contactsList);
        Test.stopTest();

        stub.assertInvoked('updateDescriptionFieldToRelatedAccount');
    }
    

}
