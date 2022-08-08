@IsTest
public with sharing class ContactsService_Test {

    @IsTest
    public static void validationMethod_Test()
    {
        Stub stub = new Stub(ContactsDomain.class);

        stub.setReturnValue('getAccountIds', TestDataFactory.acctids());

        ContactsService contactsService = new ContactsService();
	    contactsService.contactsDomain = (ContactsDomain) stub.instance;

        Test.startTest();
        contactsService.validationMethod(TestDataFactory.insertContacts());
        Test.stopTest();

        stub.assertInvoked('getAccountIds');
    }

      
}
