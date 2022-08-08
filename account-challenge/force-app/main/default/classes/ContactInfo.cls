public with sharing class ContactInfo {
    public Id ContactId { get;set;}	
    public Date ContactBirthdate { get;set;}	

        public  ContactInfo(Contact contact) { 
           ContactId = contact.Id;
           ContactBirthdate = contact.Birthdate; 
        }
}
