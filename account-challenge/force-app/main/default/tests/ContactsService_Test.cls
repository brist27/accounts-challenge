@IsTest
public with sharing class ContactsService_Test {

    @IsTest
    public static void updateDescriptionFieldToRelatedAccount_Test()
    {
        Stub stub = new Stub(AccountsService.class);

        stub.setReturnValue('updateAccounts', null);

        ContactsService contactsService = new ContactsService();
	    contactsService.accountsService = (AccountsService) stub.instance;

        Test.startTest();
        
        List<Contact> contactsList = TestDataFactory.insertContacts();
        contactsService.updateDescriptionFieldToRelatedAccount(contactsList);
        Test.stopTest();

        stub.assertInvoked('updateAccounts');
    }

      
}
