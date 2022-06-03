trigger ContactTrigger on Contact (after insert,after update,after delete) {
    new ContactTriggerHandler().run();
    /*if(Trigger.isAfter && Trigger.isInsert || Trigger.isAfter && Trigger.isUpdate)
    {
        ContactTriggerHandler.contactsList(Trigger.New);  
    }

    if(Trigger.isAfter && Trigger.isDelete){
        ContactTriggerHandler.contactsList(Trigger.Old);  
        
    }*/
    
}